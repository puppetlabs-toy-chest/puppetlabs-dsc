require 'puppet/util/windows'

module PuppetX
  module Dsc
    class CLRHost
      include Puppet::Util::Windows::String

      require 'ffi'
      extend FFI::Library

      # The error class raised if any CLR calls fail.
      class Error < Puppet::Util::Windows::Error; end

      private

      # TODO: this line didn't appear to take affect.. hmmm
      # com = Puppet::Util::Windows::COM

      class << self
        attr_accessor :com_initialized
      end

      # NOTE: a bunch of this stuff comes from the Windows SDK
      # C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include\mscoree.h
      # C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include\metahost.h
      # C:\Program Files (x86)\Microsoft SDKs\Windows\v7.1A\Include\ObjIdl.h

      # WIN32 API
      # https://msdn.microsoft.com/en-us/library/dd537633(v=vs.110).aspx
      # HRESULT CLRCreateInstance(
      #     [in]  REFCLSID  clsid,
      #     [in]  REFIID     riid,
      #     [out] LPVOID  * ppInterface
      # );
      ffi_lib :mscoree
      attach_function :CLRCreateInstance, [:pointer, :pointer, :pointer], :handle

      # COM
      CLSID_CLRMetaHost = FFI::WIN32::GUID['9280188d-0e8e-4867-b30c-7fa83884e8de']
      CLSID_CLRRuntimeHost = FFI::WIN32::GUID['90F1A06E-7712-4762-86B5-7A5EBA6BDB02']
      IID_IEnumUnknown = FFI::WIN32::GUID['00000100-0000-0000-C000-000000000046']
      IID_ICLRMetaHost = FFI::WIN32::GUID['D332DB9E-B9B3-4125-8207-A14884F53216']
      IID_ICLRRuntimeInfo = FFI::WIN32::GUID['BD39D1D2-BA2F-486a-89B0-B4B0CB466891']
      IID_ICLRRuntimeHost = FFI::WIN32::GUID['90F1A06C-7712-4762-86B5-7A5EBA6BDB02']
      IID_IHostControl = FFI::WIN32::GUID['02CA073C-7079-4860-880A-C2F7A449C991']
      IID_ICLRControl = FFI::WIN32::GUID['9065597E-D1A1-4fb2-B6BA-7E1FCE230F61']

      # # HRESULT error codes
      # # http://blogs.msdn.com/b/eldar/archive/2007/04/03/a-lot-of-hresult-codes.aspx
      # # in Ruby, an 0x8XXXXXXX style HRESULT can be resolved to 2s complement
      # # by using "0x8XXXXXXX".to_i(16) - - 0x100000000
      # SCHED_E_ACCOUNT_INFORMATION_NOT_SET   = -2147216625 # 0x8004130F
      # # No mapping between account names and security IDs was done.
      # ERROR_NONE_MAPPED                     = -2147023564 # 0x80070534  WIN32 Error CODE 1332 (0x534)

      public

      # Returns a new PowerShellHost object. If a work_item (and possibly the
      # the trigger) are passed as arguments then a new work item is created and
      # associated with that trigger, although you can still activate other tasks
      # with the same handle.
      #
      def initialize(version = 'v4.0.30319')
        @pMetaHost = nil
        @pRuntimeInfo = nil
        @pClrRuntimeHost = nil

        if ! self.class.com_initialized
          # TODO: see if we can shorten this to just com.
          Puppet::Util::Windows::COM.InitializeCom()
          self.class.com_initialized = true
        end

        # TODO: cleanup order important?
        # release pMetaHost, then pRuntimeInfo, then pClrRuntimeHost in that order
        at_exit do
          safe_release(@pMetaHost)
          safe_release(@pRuntimeInfo)
          safe_release(@pClrRuntimeHost)
        end

        start_clr(version)
      end

      def safe_release(ptr)
        begin
          ptr.Release if ptr && !ptr.null?
          ptr = nil
        rescue
        end
      end

      def FAILED(hr) hr < 0 end

      def hresult_msg(name, code)
        "#{name} failed (hresult #{format('%#08x', code)})."
      end

      def start_clr(version)
        # TODO: old line of code showing a simple CoCreateInstance call
        # @pITS = COM::TaskScheduler.new

        # simple functions can use existing helper
        # Load and start .NET runtime
        FFI::MemoryPointer.new(:pointer) do |ptr|
          if FAILED(result = CLRCreateInstance(CLSID_CLRMetaHost, IID_ICLRMetaHost, ptr))
            raise hresult_msg('CLRCreateInstance', result)
          end
          @pMetaHost = COM::CLRMetaHost.new(ptr.read_pointer)
        end

        # Get the ICLRRuntimeInfo corresponding to a particular CLR version. It
        # supersedes CorBindToRuntimeEx with STARTUP_LOADER_SAFEMODE.
        FFI::MemoryPointer.new(:pointer) do |ptr|
          @pMetaHost.GetRuntime(wide_string(version), IID_ICLRRuntimeInfo, ptr)
          @pRuntimeInfo = COM::CLRRuntimeInfo.new(ptr.read_pointer)
        end

        # Check if the specified runtime can be loaded into the process. This
        # method will take into account other runtimes that may already be
        # loaded into the process and set pbLoadable to TRUE if this runtime can
        # be loaded in an in-process side-by-side fashion.
        FFI::MemoryPointer.new(:win32_bool) do |loadable_ptr|
          @pRuntimeInfo.IsLoadable(loadable_ptr)
          loadable = loadable_ptr.read_win32_bool
          if !loadable
            # TODO: fix this error raising
            raise Puppet::Error(".NET runtime #{version} cannot be loaded!")
          end
        end

        # Load the CLR into the current process and return a runtime interface
        # pointer. ICorRuntimeHost and ICLRRuntimeHost are the two CLR hosting
        # interfaces supported by CLR 4.0. Here we demo the ICLRRuntimeHost
        # interface that was provided in .NET v2.0 to support CLR 2.0 new
        # features. ICLRRuntimeHost does not support loading the .NET v1.x
        # runtimes.
        FFI::MemoryPointer.new(:pointer) do |ptr|
          @pRuntimeInfo.GetInterface(CLSID_CLRRuntimeHost, IID_ICLRRuntimeHost, ptr)
          @pClrRuntimeHost = COM::CLRRuntimeHost.new(ptr.read_pointer)
        end

        @pClrRuntimeHost.Start()

        @pClrRuntimeHost
      end

      # TODO: demos used a custom C# class CSSimpleObject.GetStringLength
      # TODO: C# signature must be:
      # TODO: static int pwzMethodName (String pwzArgument)
      # TODO: but if we do that, we have to compile one on the fly somehow!
      def execute_method(assembly_path, type_name, static_method_name, argument)
        raise Error.new('No current CLR loaded. ICLRRuntimeHost is NULL.') if @pClrRuntimeHost.nil?

        result = 0

        # The invoked method of ExecuteInDefaultAppDomain must have the
        # following signature: static int pwzMethodName (String pwzArgument)
        # where pwzMethodName represents the name of the invoked method, and
        # pwzArgument represents the string value passed as a parameter to that
        # method. If the HRESULT return value of ExecuteInDefaultAppDomain is
        # set to S_OK, pReturnValue is set to the integer value returned by the
        # invoked method. Otherwise, pReturnValue is not set.
        FFI::MemoryPointer.new(:dword, 1) do |return_ptr|
          @pClrRuntimeHost.ExecuteInDefaultAppDomain(
            wide_string(assembly_path),
            wide_string(type_name),
            wide_string(static_method_name),
            wide_string(argument),
            return_ptr)

          result = return_ptr.read_dword()
        end

        result
      end

      # TODO: this shows how this works
      def execute_test
        require 'pry'; binding.pry
        # mscorlib.dll can't be loaded by ExecuteInDefaultAppDomain to test this :(
        execute_method('C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.dll', 'Int32', 'Parse', '1234')


        execute_method('C:\Windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.dll', 'Convert', 'ToInt32', '1234')
      end

      # def enum
      #   raise Error.new('No current task scheduler. ITaskScheduler is NULL.') if @pITS.nil?
      #   array = []

      #   @pITS.UseInstance(COM::EnumWorkItems, :Enum) do |pIEnum|
      #     FFI::MemoryPointer.new(:pointer) do |names_array_ptr_ptr|
      #       FFI::MemoryPointer.new(:win32_ulong) do |fetched_count_ptr|
      #         # awkward usage, if number requested is available, returns S_OK (0), or if less were returned returns S_FALSE (1)
      #         while (pIEnum.Next(TASKS_TO_RETRIEVE, names_array_ptr_ptr, fetched_count_ptr) >= Puppet::Util::Windows::COM::S_OK)
      #           count = fetched_count_ptr.read_win32_ulong
      #           break if count == 0

      #           names_array_ptr_ptr.read_com_memory_pointer do |names_array_ptr|
      #             # iterate over the array of pointers
      #             name_ptr_ptr = FFI::Pointer.new(:pointer, names_array_ptr)
      #             for i in 0 ... count
      #               name_ptr_ptr[i].read_com_memory_pointer do |name_ptr|
      #                 array << name_ptr.read_arbitrary_wide_string_up_to(256)
      #               end
      #             end
      #           end
      #         end
      #       end
      #     end
      #   end

      #   array
      # end

      #     @pITask.QueryInstance(COM::PersistFile) do |pIPersistFile|
      #       pIPersistFile.Save(wide_string(file), 1)
      #     end

      #     @pITask = COM::Task.new(ptr.read_pointer)
      #       @pITask.UseInstance(COM::TaskTrigger, :CreateTrigger, trigger_index_ptr) do |pITaskTrigger|
      #         populate_trigger(pITaskTrigger, trigger)

      private

      module COM
        extend FFI::Library
        private

        com = Puppet::Util::Windows::COM

        public

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms683764(v=vs.85).aspx
        IEnumUnknown = com::Interface[com::IUnknown,
          FFI::WIN32::GUID['00000100-0000-0000-C000-000000000046'],

          # virtual /* [local] */ HRESULT STDMETHODCALLTYPE Next(
          #     /* [annotation][in] */
          #     __in  ULONG celt,
          #     /* [annotation][out] */
          #     __out_ecount_part(celt,*pceltFetched)  IUnknown **rgelt,
          #     /* [annotation][out] */
          #     __out_opt  ULONG *pceltFetched) = 0;
          # ULONG, IUnknown **, ULONG *
          Next: [[:win32_ulong, :pointer, :pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE Skip(
          #     /* [in] */ ULONG celt) = 0;
          # ULONG
          Skip: [[:win32_ulong], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE Reset( void) = 0;
          # void
          Reset: [[], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE Clone(
          #     /* [out] */ __RPC__deref_out_opt IEnumUnknown **ppenum) = 0;
          # IEnumUnknown **
          Clone: [[:pointer], :hresult]
        ]

        EnumUnknown = com::Instance[IEnumUnknown]

        # https://msdn.microsoft.com/en-us/library/dd233134(v=vs.110).aspx
        ICLRMetaHost = com::Interface[com::IUnknown,
          FFI::WIN32::GUID['D332DB9E-B9B3-4125-8207-A14884F53216'],

          # virtual HRESULT STDMETHODCALLTYPE GetRuntime(
          #     /* [in] */ LPCWSTR pwzVersion,
          #     /* [in] */ REFIID riid,
          #     /* [retval][iid_is][out] */ LPVOID *ppRuntime) = 0;
          # LPCWSTR, REFIID, LPVOID *
          GetRuntime: [[:lpcwstr, :pointer, :pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE GetVersionFromFile(
          #     /* [in] */ LPCWSTR pwzFilePath,
          #     /* [size_is][out] */
          #     __out_ecount_full(*pcchBuffer)  LPWSTR pwzBuffer,
          #     /* [out][in] */ DWORD *pcchBuffer) = 0;
          # LPCWSTR, LPWSTR, DWORD *
          GetVersionFromFile: [[:lpcwstr, :lpwstr, :pdword], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE EnumerateInstalledRuntimes(
          #     /* [retval][out] */ IEnumUnknown **ppEnumerator) = 0;
          # IEnumUnknown **
          EnumerateInstalledRuntimes: [[:pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE EnumerateLoadedRuntimes(
          #     /* [in] */ HANDLE hndProcess,
          #     /* [retval][out] */ IEnumUnknown **ppEnumerator) = 0;
          # HANDLE, IEnumUnknown **
          EnumerateLoadedRuntimes: [[:handle, :pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE RequestRuntimeLoadedNotification(
          #     /* [in] */ RuntimeLoadedCallbackFnPtr pCallbackFunction) = 0;
          # RuntimeLoadedCallbackFnPtr
          # TODO: RuntimeLoadedCallbackFnPtr
          # typedef HRESULT ( __stdcall *CallbackThreadSetFnPtr )( void);
          # typedef HRESULT ( __stdcall *CallbackThreadUnsetFnPtr )( void);
          # typedef void ( __stdcall *RuntimeLoadedCallbackFnPtr )(
          #     ICLRRuntimeInfo *pRuntimeInfo,
          #     CallbackThreadSetFnPtr pfnCallbackThreadSet,
          #     CallbackThreadUnsetFnPtr pfnCallbackThreadUnset);
          RequestRuntimeLoadedNotification: [[:pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE QueryLegacyV2RuntimeBinding(
          #     /* [in] */ REFIID riid,
          #     /* [retval][iid_is][out] */ LPVOID *ppUnk) = 0;
          # REFIID, LPVOID *
          QueryLegacyV2RuntimeBinding: [[:pointer, :pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE ExitProcess(
          #     /* [in] */ INT32 iExitCode) = 0;
          # INT32
          # TODO: what the heck is an INT32 defined as ??  make sure it matches INT32
          ExitProcess: [[:int32], :hresult]
        ]

        CLRMetaHost = com::Instance[ICLRMetaHost]

        # https://msdn.microsoft.com/en-us/library/dd233121(v=vs.110).aspx
        ICLRRuntimeInfo = com::Interface[com::IUnknown,
          FFI::WIN32::GUID['BD39D1D2-BA2F-486a-89B0-B4B0CB466891'],

          # virtual HRESULT STDMETHODCALLTYPE GetVersionString(
          #     /* [size_is][out] */
          #     __out_ecount_full_opt(*pcchBuffer)  LPWSTR pwzBuffer,
          #     /* [out][in] */ DWORD *pcchBuffer) = 0;
          # LPWSTR, DWORD *
          GetVersionString: [[:lpwstr, :pdword], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE GetRuntimeDirectory(
          #     /* [size_is][out] */
          #     __out_ecount_full(*pcchBuffer)  LPWSTR pwzBuffer,
          #     /* [out][in] */ DWORD *pcchBuffer) = 0;
          # LPWSTR, DWORD *
          GetRuntimeDirectory: [[:lpwstr, :pdword], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE IsLoaded(
          #     /* [in] */ HANDLE hndProcess,
          #     /* [retval][out] */ BOOL *pbLoaded) = 0;
          # HANDLE, BOOL *
          IsLoaded: [[:handle, :pbool], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE LoadErrorString(
          #     /* [in] */ UINT iResourceID,
          #     /* [size_is][out] */
          #     __out_ecount_full(*pcchBuffer)  LPWSTR pwzBuffer,
          #     /* [out][in] */ DWORD *pcchBuffer,
          #     /* [lcid][in] */ LONG iLocaleID) = 0;
          # UINT, LPWSTR, DWORD *, LONG
          # UINT is same as UINT32 - https://msdn.microsoft.com/en-us/library/windows/desktop/aa383751(v=vs.85).aspx
          LoadErrorString: [[:uint32, :lpwstr, :pdword, :win32_long], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE LoadLibrary(
          #     /* [in] */ LPCWSTR pwzDllName,
          #     /* [retval][out] */ HMODULE *phndModule) = 0;
          # LPCWSTR, HMODULE *
          LoadLibrary: [[:lpcwstr, :pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE GetProcAddress(
          #     /* [in] */ LPCSTR pszProcName,
          #     /* [retval][out] */ LPVOID *ppProc) = 0;
          # LPCSTR, LPVOID *
          GetProcAddress: [[:lpcstr, :pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE GetInterface(
          #     /* [in] */ REFCLSID rclsid,
          #     /* [in] */ REFIID riid,
          #     /* [retval][iid_is][out] */ LPVOID *ppUnk) = 0;
          # REFCLSID, REFIID, LPVOID *
          GetInterface: [[:pointer, :pointer, :pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE IsLoadable(
          #     /* [retval][out] */ BOOL *pbLoadable) = 0;
          # BOOL *
          IsLoadable: [[:pbool], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE SetDefaultStartupFlags(
          #     /* [in] */ DWORD dwStartupFlags,
          #     /* [in] */ LPCWSTR pwzHostConfigFile) = 0;
          # DWORD, LPCWSTR
          SetDefaultStartupFlags: [[:dword, :lpcwstr], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE GetDefaultStartupFlags(
          #     /* [out] */ DWORD *pdwStartupFlags,
          #     /* [size_is][out] */
          #     __out_ecount_full_opt(*pcchHostConfigFile)  LPWSTR pwzHostConfigFile,
          #     /* [out][in] */ DWORD *pcchHostConfigFile) = 0;
          # DWORD *, LPWSTR, DWORD *
          GetDefaultStartupFlags: [[:pdword, :lpwstr, :pdword], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE BindAsLegacyV2Runtime( void) = 0;
          # void
          BindAsLegacyV2Runtime: [[], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE IsStarted(
          #     /* [out] */ BOOL *pbStarted,
          #     /* [out] */ DWORD *pdwStartupFlags) = 0;
          # BOOL *, DWORD *
          IsStarted: [[:pbool, :pdword], :hresult]
        ]

        CLRRuntimeInfo = com::Instance[ICLRRuntimeInfo]

        # https://msdn.microsoft.com/en-us/library/ms164408(v=vs.110).aspx
        ICLRRuntimeHost = com::Interface[com::IUnknown,
          FFI::WIN32::GUID['90F1A06C-7712-4762-86B5-7A5EBA6BDB02'],

          # virtual HRESULT STDMETHODCALLTYPE Start( void) = 0;
          # void
          Start: [[], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE Stop( void) = 0;
          # void
          Stop: [[], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE SetHostControl(
          #     /* [in] */ IHostControl *pHostControl) = 0;
          # IHostControl *
          SetHostControl: [[:pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE GetCLRControl(
          #     /* [out] */ ICLRControl **pCLRControl) = 0;
          # ICLRControl **
          GetCLRControl: [[:pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE UnloadAppDomain(
          #     /* [in] */ DWORD dwAppDomainId,
          #     /* [in] */ BOOL fWaitUntilDone) = 0;
          # DWORD, BOOL
          UnloadAppDomain: [[:dword, :win32_bool], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE ExecuteInAppDomain(
          #     /* [in] */ DWORD dwAppDomainId,
          #     /* [in] */ FExecuteInAppDomainCallback pCallback,
          #     /* [in] */ void *cookie) = 0;
          # TODO: double check on FExecuteInAppDomainCallback and void *
          # typedef HRESULT ( __stdcall *FExecuteInAppDomainCallback )(
          #     void *cookie);
          # DWORD, FExecuteInAppDomainCallback, void *
          ExecuteInAppDomain: [[:dword, :pointer, :pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE GetCurrentAppDomainId(
          #     /* [out] */ DWORD *pdwAppDomainId) = 0;
          # DWORD *
          GetCurrentAppDomainId: [[:pdword], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE ExecuteApplication(
          #     /* [in] */ LPCWSTR pwzAppFullName,
          #     /* [in] */ DWORD dwManifestPaths,
          #     /* [in] */ LPCWSTR *ppwzManifestPaths,
          #     /* [in] */ DWORD dwActivationData,
          #     /* [in] */ LPCWSTR *ppwzActivationData,
          #     /* [out] */ int *pReturnValue) = 0;
          # LPCWSTR, DWORD, LPCWSTR *, DWORD, LPCWSTR *, int *
          ExecuteApplication: [[:lpcwstr, :dword, :pointer, :dword, :pointer, :pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE ExecuteInDefaultAppDomain(
          #     /* [in] */ LPCWSTR pwzAssemblyPath,
          #     /* [in] */ LPCWSTR pwzTypeName,
          #     /* [in] */ LPCWSTR pwzMethodName,
          #     /* [in] */ LPCWSTR pwzArgument,
          #     /* [out] */ DWORD *pReturnValue) = 0;
          # LPCWSTR, LPCWSTR, LPCWSTR, LPCWSTR, DWORD *
          ExecuteInDefaultAppDomain: [[:lpcwstr, :lpcwstr, :lpcwstr, :lpcwstr, :pdword], :hresult]
        ]

        CLRRuntimeHost = com::Instance[ICLRRuntimeHost]

        # https://msdn.microsoft.com/en-us/library/ms164470(v=vs.110).aspx
        IHostControl = com::Interface[com::IUnknown,
          FFI::WIN32::GUID['02CA073C-7079-4860-880A-C2F7A449C991'],

          # virtual HRESULT STDMETHODCALLTYPE GetHostManager(
          #     /* [in] */ REFIID riid,
          #     /* [out] */ void **ppObject) = 0;
          # REFIID, void **
          GetHostManager: [[:pointer, :pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE SetAppDomainManager(
          #     /* [in] */ DWORD dwAppDomainID,
          #     /* [in] */ IUnknown *pUnkAppDomainManager) = 0;
          # DWORD, IUnknown *
          SetAppDomainManager: [[:dword, :pointer], :hresult],
        ]

        HostControl = com::Instance[IHostControl]

        # https://msdn.microsoft.com/en-us/library/ms164353(v=vs.110).aspx
        ICLRControl = com::Interface[com::IUnknown,
          FFI::WIN32::GUID['9065597E-D1A1-4fb2-B6BA-7E1FCE230F61'],

          # virtual HRESULT STDMETHODCALLTYPE GetCLRManager(
          #     /* [in] */ REFIID riid,
          #     /* [out] */ void **ppObject) = 0;
          # REFIID, void **
          GetCLRManager: [[:pointer, :pointer], :hresult],

          # virtual HRESULT STDMETHODCALLTYPE SetAppDomainManagerType(
          #     /* [in] */ LPCWSTR pwzAppDomainManagerAssembly,
          #     /* [in] */ LPCWSTR pwzAppDomainManagerType) = 0;
          # LPCWSTR, LPCWSTR
          SetAppDomainManagerType: [[:lpcwstr, :lpcwstr], :hresult]
        ]

        CLRControl = com::Instance[ICLRControl]
      end
    end
  end
end
