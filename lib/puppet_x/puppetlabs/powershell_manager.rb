require 'securerandom'
require 'open3'
require 'ffi' if Puppet::Util::Platform.windows?

module PuppetX
  module Dsc
    class PowerShellManager
      if Puppet::Util::Platform.windows?
        extend Puppet::Util::Windows::String
        extend FFI::Library
      end

      @@instances = {}

      def self.instance(cmd)
        @@instances[:cmd] ||= PowerShellManager.new(cmd)
      end

      def initialize(cmd)
        @output_ready_event_name =  "Global\\#{SecureRandom.uuid}"
        @output_ready_event = self.class.create_event(@output_ready_event_name)

        @stdin, @stdout, @ps_process = Open3.popen2(cmd)
        @stdin.sync = true
        @stdout.sync = true

        Puppet.debug "#{Time.now} #{cmd} is running as pid: #{@ps_process[:pid]}"

        at_exit { exit }
      end

      def execute(powershell_code)
        # always need a trailing newline to ensure PowerShell parses code
        out = exec_read_result(<<-CODE
        $event = [Threading.EventWaitHandle]::OpenExisting("#{@output_ready_event_name}")

        $Error.Clear()
        $LASTEXITCODE = 0

        #{powershell_code}

        [Void]$event.Set()

        CODE
        )

        { :stdout => out }
      end

      def exit
        Puppet.debug "PowerShellManager exiting..."
        @stdin.puts "\nexit\n"
        @stdin.close
        @stdout.close

        if Puppet::Util::Platform.windows?
          FFI::WIN32.CloseHandle(@output_ready_event) if @output_ready_event
        end

        exit_msg = "PowerShell process did not terminate in reasonable time"
        Timeout.timeout(3) do
          Puppet.debug "Awaiting PowerShell process termination..."
          @exit_status = @ps_process.value
        end

        exit_msg = "PowerShell process exited: #{@exit_status}" if @exit_status
        Puppet.debug(exit_msg)
        @ps_process.terminate if @ps_process.alive?
      end

      private

      def self.is_readable?(stream, timeout = 0.5)
        read_ready = IO.select([stream], [], [], timeout)
        read_ready && stream == read_ready[0][0]
      end

      def self.create_event(name, manual_reset = false, initial_state = false)
        if Puppet::Util::Platform.windows?
          handle = FFI::Pointer::NULL_HANDLE

          FFI::Pointer.from_string_to_wide_string(name) do |name_ptr|
            handle = CreateEventW(FFI::Pointer::NULL,
              manual_reset ? 1 : FFI::WIN32_FALSE,
              initial_state ? 1 : FFI::WIN32_FALSE,
              name_ptr)

            if handle == FFI::Pointer::NULL_HANDLE
              msg = "Failed to create new event #{name}"
              raise Puppet::Util::Windows::Error.new(msg)
            end
          end
        end

        handle
      end

      WAIT_ABANDONED = 0x00000080
      WAIT_OBJECT_0 = 0x00000000
      WAIT_TIMEOUT = 0x00000102
      WAIT_FAILED = 0xFFFFFFFF

      def self.wait_on(wait_object, timeout = 120 * 1000, wait_interval = 50)
        waited = 0
        while true
          wait_result = Puppet::Util::Windows::Process::WaitForSingleObject(wait_object, wait_interval)
          case wait_result
          when WAIT_OBJECT_0
            Puppet.debug "Wait object signaled"
            return
          when WAIT_TIMEOUT
            waited += wait_interval
            Puppet.debug "Waiting #{wait_interval} milliseconds (total #{waited})..."
            if (waited > timeout)
              msg = 'Catastropic failure: wait object timeout exceeded'
              raise Puppet::Util::Windows::Error.new(msg)
            end
          # only applicable to mutexes - should never happen here
          when WAIT_ABANDONED
            msg = 'Catastropic failure: wait object in inconsistent state'
            raise Puppet::Util::Windows::Error.new(msg)
          when WAIT_FAILED
            msg = 'Catastropic failure: waiting on object to be signaled'
            raise Puppet::Util::Windows::Error.new(msg)
          end
        end
      end

      def write_stdin(input)
        @stdin.puts(input)
      rescue => e
        msg = "Error writing STDIN / reading STDOUT: #{e}"
        raise Puppet::Util::Windows::Error.new(msg)
      end

      def read_stdout
        output = []
        self.class.wait_on(@output_ready_event)

        initially_readable = false
        while self.class.is_readable?(@stdout, 0.1) do
          initially_readable = true

          l = @stdout.gets
          Puppet.debug "#{Time.now} STDOUT> #{l}"
          output << l
        end

        Puppet.debug "STDOUT was not readable" if !initially_readable

        return output.join('')
      rescue => e
        msg = "Error reading STDOUT: #{e}"
        raise Puppet::Util::Windows::Error.new(msg)
      end

      def exec_read_result(powershell_code)
        write_stdin(powershell_code)
        read_stdout
      end
      
      if Puppet::Util::Platform.windows?
        ffi_convention :stdcall

        # https://msdn.microsoft.com/en-us/library/windows/desktop/ms682396(v=vs.85).aspx
        # HANDLE WINAPI CreateEvent(
        #   _In_opt_ LPSECURITY_ATTRIBUTES lpEventAttributes,
        #   _In_     BOOL                  bManualReset,
        #   _In_     BOOL                  bInitialState,
        #   _In_opt_ LPCTSTR               lpName
        # );
        ffi_lib :kernel32
        attach_function_private :CreateEventW, [:pointer, :win32_bool, :win32_bool, :lpcwstr], :handle
      end
    end
  end
end
