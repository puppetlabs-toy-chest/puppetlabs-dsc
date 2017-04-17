require 'ffi'

module Puppet::Util::Dsc::ManagementInterface
  if Puppet::Util::Platform.windows?

    require 'puppet/util/dsc/api_types'
    extend FFI::Libary

    def send_configuration(mof_configuration)
       operation_callbacks = MI_OperationCallbacks
    end

    # LCM_NAMESPACE
    # LCM_CLASSNAME
    # FILE
    # MI_MainFunction

    # mi.h
    # # define MI_MAIN_CALL __cdecl


    # MI_CALL
    # mi.h
    # # define MI_CALL __stdcall


    # MI_FLAG_NULL
    # mi.h
    # #define MI_FLAG_NULL            (1 << 29)
    MI_FLAG_NULL = 0x1000000

    # MI_APPLICATION_NULL
    # mi.h
    # #define MI_APPLICATION_NULL {  0, 0, NULL }


    # MI_SESSION_NULL
    # mi.h
    # #define MI_SESSION_NULL { 0, 0, NULL }


    # MI_OPERATION_NULL
    # mi.h
    # #define MI_OPERATION_NULL { 0, 0, NULL }


    # MI_OPERATIONCALLBACKS_NULL
    # mi.h
    # #define MI_OPERATIONCALLBACKS_NULL {NULL}


    # MI_Session
    # https://msdn.microsoft.com/en-us/library/hh437509.aspx
    # typedef struct _MI_Session {
    #   MI_Uint64          reserved1;
    #   ptrdiff_t          reserved2;
    #   const MI_SessionFT *ft;
    # } MI_Session;
    class MI_Session < FFI::Struct
      layout  :reserved1,   :mi_uint64,
              :reserved2,   :ptrdiff_t,
              :ft,          MI_SessionFT
    end

    # https://msdn.microsoft.com/en-us/library/mt300887.aspx
    # typedef struct _MI_SessionFT {
    #   MI_Result (MI_CALL *Close)(
    #       MI_Session *session,
    #       _In_opt_ void *completionContext,
    #       _In_opt_ void *(MI_CALL *completionCallback)(_In_opt_ void *completionContext)));
    #   MI_Result (MI_CALL *GetApplication)(
    #       MI_Session *session,
    #       MI_Application *application);
    #   MI_Result (MI_CALL *GetInstance)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_ const MI_Instance *inboundInstance,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *ModifyInstance)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_ const MI_Instance *inboundInstance,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *CreateInstance)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_ const MI_Instance *inboundInstance,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *DeleteInstance)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_ const MI_Instance *inboundInstance,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *Invoke)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_opt_ const MI_Char *className,
    #       _In_ const MI_Char *methodName,
    #       _In_opt_ const MI_Instance *inboundInstance,
    #       _In_opt_ const MI_Instance *inboundProperties,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *EnumerateInstances)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_opt_ const MI_Char *className,
    #       MI_Boolean keysOnly,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *QueryInstances)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_opt_ const MI_Char *queryDialect,
    #       _In_opt_ const MI_Char *queryExpression,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *AssociatorInstances)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_ const MI_Instance *instanceKeys,
    #       _In_opt_ const MI_Char *assocClass,
    #       _In_opt_ const MI_Char *resultClass,
    #       _In_opt_ const MI_Char *role,
    #       _In_opt_ const MI_Char *resultRole,
    #       MI_Boolean keysOnly,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *ReferenceInstances)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_ const MI_Instance *instanceKeys,
    #       _In_opt_ const MI_Char *resultClass,
    #       _In_opt_ const MI_Char *role,
    #       MI_Boolean keysOnly,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *Subscribe)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_opt_ const MI_Instance *queryDialect,
    #       _In_opt_ const MI_Char *queryExpression,
    #       _In_opt_ const MI_SubscriptionDeliveryOptions *deliverOptions,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *GetClass)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_opt_ const MI_Char *className,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *EnumerateClasses)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationOptions *options,
    #       _In_opt_ const MI_Char *namespaceName,
    #       _In_opt_ const MI_Char *className,
    #       MI_Boolean *classNamesOnly,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    #   MI_Result (MI_CALL *TestConnection)(
    #       _In_ MI_Session *session,
    #       MI_Uint32 flags,
    #       _In_opt_ MI_OperationCallbacks *callbacks,
    #       _Out_ MI_Operation *operation);
    # } MI_SessionFT;


    # https://msdn.microsoft.com/en-us/library/hh832971.aspx
    # typedef struct _MI_SessionCallbacks {
    #   void *callbackContext;
    #   void (MI_CALL *writeMessage)(
    #       _In_ MI_Application *application,
    #       _In_opt_ void *callbackContext,
    #       MI_Uint32 channel,
    #       _In_z_ const MI_Char *message);
    #   void (MI_CALL *writeError)(
    #       _In_ MI_Application *application,
    #       _In_opt_ void *callbackContext,
    #       _In_ MI_Instance instance);
    # } MI_SessionCallbacks;


    # https://msdn.microsoft.com/en-us/library/hh707697.aspx
    # typedef struct _MI_Operation {
    #   MI_Uint64            reserved1;
    #   ptrdiff_t            reserved2;
    #   const MI_OperationFT *ft;
    # } MI_Operation;
    class MI_Operation < FFI::Struct
      layout  :reserved1,   :mi_uint64,
              :reserved2,   :ptrdiff_t,
              :ft,          MI_OperationFT
    end

    # https://msdn.microsoft.com/en-us/library/hh707698.aspx
    #typedef struct _MI_OperationFT {
    #  MI_Result (MI_CALL *Close)(_Inout_ MI_Operation *operation);
    #  MI_Result (MI_CALL *Cancel)(
    #      _Inout_ MI_Operation *operation,
    #      MI_CancellationReason reason);
    #  MI_Result (MI_CALL *GetSession)(
    #      _In_ MI_Operation *operation,
    #      _Out_ MI_Session *session);
    #  MI_Result (MI_CALL *GetInstance)(
    #      _In_ MI_Operation *operation,
    #      _Out_ const MI_Instance **instance,
    #      _Out_opt_ MI_Boolean *moreResults,
    #      _Out_opt_ MI_Result *result,
    #      _Out_opt_ const MI_Char **errorMessage,
    #      _Out_opt_ const MI_Instance **completionDetails);
    #  MI_Result (MI_CALL *GetIndication)(
    #      _In_ MI_Operation *operation,
    #      _Out_ const MI_Instance **instance,
    #      _Out_opt_ const MI_Char **bookmark,
    #      _Out_opt_ const MI_Char **machineID,
    #      _Out_opt_ MI_Boolean *moreResults,
    #      _Out_opt_ MI_Result *result,
    #      _Out_opt_ const MI_Char **errorMessage,
    #      _Out_opt_ const MI_Instance **completionDetails);
    #  MI_Result (MI_CALL *GetClass)(
    #      _In_ MI_Operation *operation,
    #      _Out_ const MI_Class **classResult,
    #      _Out_opt_ MI_Boolean *moreResults,
    #      _Out_opt_ MI_Result *result,
    #      _Out_opt_ const MI_Char **errorMessage,
    #      _Out_opt_ const MI_Instance **completionDetails);
    #} MI_OperationFT;


    # https://msdn.microsoft.com/en-us/library/hh449223.aspx
    #typedef struct _MI_OperationOptions {
    #  MI_Uint64                   reserved1;
    #  ptrdiff_t                   reserved2;
    #  const MI_OperationOptionsFT *ft;
    #} MI_OperationOptions;
    class MI_OperationOptions < FFI::Struct
      layout  :reserved1,   :mi_uint64,
              :reserved2,   :ptrdiff_t,
              :ft,          MI_OperationOptionsFT
    end

    # https://msdn.microsoft.com/en-us/library/hh707699.aspx
    #typedef struct _MI_OperationOptionsFT {
    #  MI_Result (MI_CALL *Delete)(_Inout_ MI_OperationOptions *options);
    #  MI_Result (MI_CALL *SetString)(
    #      _Inout_ MI_OperationOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _In_ const MI_Char *value,
    #      MI_Uint32 flags);
    #  MI_Result (MI_CALL *SetNumber)(
    #      _Inout_ MI_OperationOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _In_ MI_Uint32 value,
    #      MI_Uint32 flags);
    #  MI_Result (MI_CALL *SetCustomOption)(
    #      _Inout_ MI_OperationOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _In_ MI_Type valueType,
    #      _In_ const MI_Value *value,
    #      MI_Boolean mustComply,
    #      MI_Uint32 flags);
    #  MI_Result (MI_CALL *GetString)(
    #      _In_ MI_OperationOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _Out_ const MI_Char **value,
    #      _Out_opt_ MI_Uint32 *index,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *GetNumber)(
    #      _In_ MI_OperationOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _Out_ MI_Uint32 *value,
    #      _Out_opt_ MI_Uint32 *index,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *GetOptionCount)(
    #      _In_ MI_OperationOptions *options,
    #      _Out_ MI_Uint32 *count);
    #  MI_Result (MI_CALL *GetOptionAt)(
    #      _In_ MI_OperationOptions *options,
    #      MI_Uint32 index,
    #      _Out_ const MI_Char **optionName,
    #      _Out_ const MI_Value *value,
    #      _Out_ MI_Type *type,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *GetOption)(
    #      _In_ MI_OperationOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _Out_ const MI_Value *value,
    #      _Out_ MI_Type *type,
    #      _Out_opt_ MI_Uint32 *index,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *GetEnabledChannels)(
    #      _In_ MI_OperationOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _Out_opt_ MI_Uint32 *channels,
    #      _In_ MI_Uint32 *bufferLength,
    #      _Out_ MI_Uint32 *channelCount,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *Clone)(
    #      _In_ const MI_OperationOptions *self,
    #      _Out_ MI_OperationOptions *newOperationOptions);
    #} MI_OperationOptionsFT;


    # https://msdn.microsoft.com/en-us/library/hh449218.aspx
    #typedef struct _MI_OperationCallbacks {
    #  void                                   *callbackContext;
    #  MI_OperationCallback_PromptUser        promptUser;
    #  MI_OperationCallback_WriteError        writeError;
    #  MI_OperationCallback_WriteMessage      writeMessage;
    #  MI_OperationCallback_WriteProgress     writeProgress;
    #  MI_OperationCallback_Instance          instanceResult;
    #  MI_OperationCallback_Indication        indicationResult;
    #  MI_OperationCallback_Class             classResult;
    #  MI_OperationCallback_StreamedParameter streamedParameterResult;
    #} MI_OperationCallbacks;
    class  MI_OperationCallbacks < FFI::Struct
      layout  :callbackContext,         :void,
              :promptUser,              :MI_OperationCallback_PromptUser,
              :writeError,              :MI_OperationCallback_WriteError,
              :writeMessage,            :MI_OperationCallback_WriteMessage,
              :writeProgress,           :MI_OperationCallback_WriteProgress,
              :instanceResult,          :MI_OperationCallback_Instance,
              :indicationResult,        :MI_OperationCallback_Indication,
              :classResult,             :MI_OperationCallback_Class,
              :streamedParameterResult, :MI_OperationCallback_StreamedParameter
    end

    # https://msdn.microsoft.com/en-us/library/hh449162.aspx
    # typedef struct _MI_Instance {
    #   const MI_InstanceFT *ft;
    #   const MI_ClassDecl  *classDecl;
    #   const MI_Char       *serverName;
    #   const MI_Char       *nameSpace;
    #   ptrdiff_t           reserved[4];
    # } MI_Instance;
    class MI_Instance < FFI::Struct
      layout  :ft,          MI_InstanceFT,
              :classDecl,   MI_ClassDecl,
              :serverName,  :mi_char,
              :nameSpace,   :mi_char,
              :reserved,    [:ptrdiff_t, 4]
    end

    # https://msdn.microsoft.com/en-us/library/hh707696.aspx
    #typedef struct _MI_InstanceFT {
    #  MI_Result (MI_CALL *Clone)(
    #      _In_ const MI_Instance *self,
    #      _Outptr_ MI_Instance **newInstance);
    #  MI_Result (MI_CALL *Destruct)(_Inout_ MI_Instance *self);
    #  MI_Result (MI_CALL *Delete)(_Inout_ MI_Instance *self);
    #  MI_Result (MI_CALL *IsA)(
    #      _In_ const MI_Instance *self,
    #      _In_ const MI_ClassDecl *classDecl,
    #      _Out_ MI_Boolean *flag);
    #  MI_Result (MI_CALL *GetClassName)(
    #      _In_ const MI_Instance *self,
    #      _Out_ const MI_Char **className);
    #  MI_Result (MI_CALL *SetNameSpace)(
    #      _Inout_ MI_Instance *self,
    #      _In_ const MI_Char *nameSpace);
    #  MI_Result (MI_CALL *GetNameSpace)(
    #      _In_ const MI_Instance *self,
    #      _Out_ const MI_Char **nameSpace);
    #  MI_Result (MI_CALL *GetElementCount)(
    #      _In_ const MI_Instance *self,
    #      _Out_ MI_Uint32 *count);
    #  MI_Result (MI_CALL *AddElement)(
    #      _Inout_ MI_Instance *self,
    #      _In_ const MI_Char *name,
    #      _In_opt_ const MI_Value *value,
    #      MI_Type type,
    #      MI_Uint32 flags);
    #  MI_Result (MI_CALL *SetElement)(
    #      _Inout_ MI_Instance *self,
    #      _In_ const MI_Char *name,
    #      _In_ const MI_Value *value,
    #      MI_Type type,
    #      MI_Uint32 flags);
    #  MI_Result (MI_CALL *SetElementAt)(
    #      _Inout_ MI_Instance *self,
    #      MI_Uint32 index,
    #      _In_ const MI_Value *value,
    #      MI_Type type,
    #      MI_Uint32 flags);
    #  MI_Result (MI_CALL *GetElement)(
    #      _In_ const MI_Instance *self,
    #      _In_ const MI_Char *name,
    #      _Out_opt_ MI_Value *value,
    #      _Out_opt_ MI_Type *type,
    #      _Out_opt_ MI_Uint32 *flags,
    #      _Out_opt_ MI_Uint32 *index);
    #  MI_Result (MI_CALL *GetElementAt)(
    #      _In_ const MI_Instance *self,
    #      MI_Uint32 index,
    #      _Out_ const MI_Char **name,
    #      _Out_opt_ MI_Value *value,
    #      _Out_opt_ MI_Type *type,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *ClearElement)(
    #      _Inout_ MI_Instance *self,
    #      _In_ const MI_Char *name);
    #  MI_Result (MI_CALL *ClearElementAt)(
    #      _Inout_ MI_Instance *self,
    #      MI_Uint32 index);
    #  MI_Result (MI_CALL *GetServerName)(
    #      _In_ const MI_Instance *self,
    #      _Out_ const MI_Char **name);
    #  MI_Result (MI_CALL *SetServerName)(
    #      _Inout_ MI_Instance *self,
    #      _In_ const MI_Char *name);
    #  MI_Result (MI_CALL *GetClass)(
    #      const MI_Instance *self,
    #      _Out_ MI_Class **instanceClass);
    #} MI_InstanceFT;


    # https://msdn.microsoft.com/en-us/library/hh707691.aspx
    # typedef struct _MI_DestinationOptions {
    #   MI_Uint64                     reserved1;
    #   ptrdiff_t                     reserved2;
    #   const MI_DestinationOptionsFT *ft;
    # } MI_DestinationOptions;
    class MI_DestinationOptions < FFI::Struct
      layout  :reserved1,   :mi_uint64,
              :reserved2,   :ptrdiff_t,
              :ft,          MI_DestinationOptionsFT
    end

    # https://msdn.microsoft.com/en-us/library/hh707692.aspx
    # typedef struct _MI_DestinationOptionsFT {
    #   MI_Result (MI_CALL *Delete)(_Inout_ MI_DestinationOptions *options);
    #   MI_Result (MI_CALL *SetString)(
    #       _Inout_ MI_DestinationOptions *options,
    #       _In_ const MI_Char *optionName,
    #       _In_ const MI_Char *value,
    #       MI_Uint32 *flags);
    #   MI_Result (MI_CALL *SetNumber)(
    #       _Inout_ MI_DestinationOptions *options,
    #       _In_ const MI_Char *optionName,
    #       _In_ MI_Uint32 *value,
    #       MI_Uint32 *flags);
    #   MI_Result (MI_CALL *AddCredentials)(
    #       _Inout_ MI_DestinationOptions *options,
    #       _In_ const MI_Char *optionName,
    #       _In_ const MI_UserCredentials *credentials,
    #       MI_Uint32 *flags);
    #   MI_Result (MI_CALL *GetString)(
    #       _Inout_ MI_DestinationOptions *options,
    #       _In_ const MI_Char *optionName,
    #       _Out_ const MI_Char **value,
    #       _Out_opt_ MI_Uint32 *index,
    #       _Out_opt_ MI_Uint32 *flags);
    #   MI_Result (MI_CALL *GetNumber)(
    #       _Inout_ MI_DestinationOptions *options,
    #       _In_ const MI_Char *optionName,
    #       _Out_ MI_Uint32 *value,
    #       _Out_opt_ MI_Uint32 *index,
    #       _Out_opt_ MI_Uint32 *flags);
    #   MI_Result (MI_CALL *GetOptionCount)(
    #       _Inout_ MI_DestinationOptions *options,
    #       _Out_ MI_Uint32 *count);
    #   MI_Result (MI_CALL *GetOptionAt)(
    #       _Inout_ MI_DestinationOptions *options,
    #       MI_Uint32 index,
    #       _Out_ const MI_Char *optionName,
    #       _Out_ const MI_Value *value,
    #       _Out_ MI_Type *type,
    #       _Out_opt_ MI_Uint32 *flags);
    #   MI_Result (MI_CALL *GetOption)(
    #       _Inout_ MI_DestinationOptions *options,
    #       _In_ const MI_Char *optionName,
    #       _Out_ const MI_Value *value,
    #       _Out_ MI_Type *type,
    #       _Out_opt_ MI_Uint32 *index,
    #       _Out_opt_ MI_Uint32 *flags);
    #   MI_Result (MI_CALL *GetCredentialsCount)(
    #       _Inout_ MI_DestinationOptions *options,
    #       _Out_ MI_Uint32 *count);
    #   MI_Result (MI_CALL *GetCredentialsAt)(
    #       _Inout_ MI_DestinationOptions *options,
    #       MI_Uint32  index,
    #       _Out_ const MI_Char **optionName,
    #       _Out_ const MI_UserCredentials *credentials,
    #       _Out_opt_ MI_Uint32 *flags);
    #   MI_Result (MI_CALL *GetCredentialsPasswordAt)(
    #       _Inout_ MI_DestinationOptions *options,
    #       MI_Uint32  index,
    #       _Out_ const MI_Char **optionName,
    #       _Out_opt_ MI_Char *password,
    #       _In_ MI_Uint32  bufferLength,
    #       _Out_ MI_Uint32 *passwordLength,
    #       _Out_opt_ MI_Uint32 *flags);
    #   MI_Result (MI_CALL *Clone)(
    #       _In_ const MI_DestinationOptions *self,
    #       _Out_ MI_DestinationOptions *newDestinationOptions);
    # } MI_DestinationOptionsFT;


    # https://msdn.microsoft.com/en-us/library/hh707695.aspx
    # typedef struct _MI_HostedProvider {
    #   MI_Uint64                 reserved1;
    #   ptrdiff_t                 reserved2;
    #   const MI_HostedProviderFT *ft;
    # } MI_HostedProvider;
    class MI_HostedProvider < FFI::Struct
      layout  :reserved1,       :mi_uint64,
              :reserved2,       :ptrdiff_t,
              :ft,              MI_HostedProviderFT
    end

    # https://msdn.microsoft.com/en-us/library/dn792319.aspx
    # typedef struct _MI_HostedProviderFT {
    #   MI_Result (MI_CALL *Close)(_Inout_ MI_HostedProvider *hostedProvider);
    #   MI_Result (MI_CALL *GetApplication)(
    #       _In_ MI_HostedProvider *hostedProvider,
    #       _Out_ MI_Application *application);
    # } MI_HostedProviderFT;


    # https://msdn.microsoft.com/en-us/library/hh448873.aspx
    # typedef struct _MI_Class {
    #   const MI_ClassFT *ft;
    #   MI_ClassDecl     *classDecl;
    #   MI_Char          *namespaceName;
    #   MI_Char          *serverName;
    #   ptrdiff_t        reserved[4];
    # } MI_Class;
    class MI_Class < FFI::Struct
      layout  :ft,          MI_ClassFT,
              :classDecl,   MI_ClassDecl,
              :serverName,  :mi_char,
              :nameSpace,   :mi_char,
              :reserved,    [:ptrdiff_t, 4]
    end

    # https://msdn.microsoft.com/en-us/library/hh707686.aspx
    # typedef struct _MI_ClassFT {
    #   MI_Result (MI_CALL *GetClassName)(
    #       _In_ const MI_Class *self,
    #       _Out_ const MI_Char **className);
    #   MI_Result (MI_CALL *GetNameSpace)(
    #       _In_ const MI_Class *self,
    #       _Out_ const MI_Char **nameSpace);
    #   MI_Result (MI_CALL *GetServerName)(
    #       _In_ const MI_Class *self,
    #       _Out_ const MI_Char **serverName);
    #   MI_Result (MI_CALL *GetElementCount)(
    #       _In_ const MI_Class *self,
    #       _Out_ MI_Uint32 *count);
    #   MI_Result (MI_CALL *GetElement)(
    #       _In_ const MI_Class *self,
    #       _In_ const MI_Char *name,
    #       _Out_opt_ MI_Value *value,
    #       _Out_opt_ MI_Boolean *valueExists,
    #       _Out_opt_ MI_Type *type,
    #       _Out_opt_ MI_QualifierSet *qualifierSet,
    #       _Out_opt_ MI_Uint32 *flags,
    #       _Out_opt_ MI_Uint32 *index);
    #   MI_Result (MI_CALL *GetElementAt)(
    #       _In_ const MI_Class *self,
    #       MI_Uint32 index,
    #       _Out_opt_ const MI_Char **name,
    #       _Out_opt_ MI_Value *value,
    #       _Out_opt_ MI_Boolean *valueExists,
    #       _Out_opt_ MI_Type *type,
    #       _Out_opt_ MI_QualifierSet *qualifierSet,
    #       _Out_opt_ MI_Uint32 *flags);
    #   MI_Result (MI_CALL *GetClassQualifierSet)(
    #       _In_ const MI_Class *self,
    #       _Out_opt_ MI_QualifierSet *qualifierSet);
    #   MI_Result (MI_CALL *GetMethodCount)(
    #       _In_ const MI_Class *self,
    #       _Out_ MI_Uint32 *count);
    #   MI_Result (MI_CALL *GetMethodAt)(
    #       _In_ const MI_Class *self,
    #       MI_Uint32 index,
    #       _Out_ const MI_Char **name,
    #       _Out_opt_ MI_QualifierSet *qualifierSet,
    #       _Out_opt_ MI_ParameterSet *parameterSet);
    #   MI_Result (MI_CALL *GetMethod)(
    #       _In_ const MI_Class *self,
    #       _In_ const MI_Char name,
    #       _Out_opt_ MI_QualifierSet **qualifierSet,
    #       _Out_opt_ MI_ParameterSet *parameterSet,
    #       _Out_opt_ MI_Uint32 *index);
    #   MI_Result (MI_CALL *GetParentClassName)(
    #       _In_ const MI_Class *self,
    #       _Out_ const MI_Char **name);
    #   MI_Result (MI_CALL *GetParentClass)(
    #       _In_ const MI_Class *self,
    #       _Out_ MI_Class **parentClass);
    #   MI_Result (MI_CALL *Delete)(_Inout_ MI_Class *self);
    #   MI_Result (MI_CALL *Clone)(
    #       _In_ const MI_Class *self,
    #       _Out_ MI_Class **newClass);
    # } MI_ClassFT;


    # https://msdn.microsoft.com/en-us/library/hh707685.aspx
    # typedef struct _MI_ClassDecl {
    #   MI_Uint32                                  flags;
    #   MI_Uint32                                  code;
    #   const MI_Char                              *name;
    #   struct _MI_Qualifier MI_CONST* MI_CONST    *qualifiers;
    #   MI_Uint32                                  numQualifiers;
    #   struct _MI_PropertyDecl MI_CONST* MI_CONST *properties;
    #   MI_Uint32                                  numProperties;
    #   MI_Uint32                                  size;
    #   const MI_Char                              *superClass;
    #   MI_ClassDecl MI_CONST                      *superClassDecl;
    #   struct _MI_MethodDecl MI_CONST* MI_CONST   *methods;
    #   MI_Uint32                                  numMethods;
    #   struct _MI_SchemaDecl MI_CONST             *schema;
    #   const MI_ProviderFT                        *providerFT;
    #   MI_Class                                   *owningClass;
    # } MI_ClassDecl;
    class MI_ClassDecl < FFI::Struct
      layout  :flags,           :mi_uint32,
              :code,            :mi_uint32,
              :name,            :mi_char,
              :qualifiers,      :pointer,
              :numQualifiers,   :mi_uint32,
              :properties,      :MI_CONST, #todo struct
              :numProperties,   :mi_uint32,
              :size,            :mi_uint32,
              :superClass,      :mi_char,
              :superClassDecl,  :MI_ClassDecl,
              :methods,         :MI_CONST, #todo struct
              :numMethods,      :mi_uint32,
              :schema,          :MI_CONST, #todo struct
              :providerFT,      :MI_ProviderFT,
              :owningClass,     :MI_Class
    end

    # https://msdn.microsoft.com/en-us/library/hh707704.aspx
    # typedef struct _MI_ProviderFT {
    #   MI_ProviderFT_Load                Load;
    #   MI_ProviderFT_Unload              Unload;
    #   MI_ProviderFT_GetInstance         GetInstance;
    #   MI_ProviderFT_EnumerateInstances  EnumerateInstances;
    #   MI_ProviderFT_CreateInstance      CreateInstance;
    #   MI_ProviderFT_ModifyInstance      ModifyInstance;
    #   MI_ProviderFT_DeleteInstance      DeleteInstance;
    #   MI_ProviderFT_AssociatorInstances AssociatorInstances;
    #   MI_ProviderFT_ReferenceInstances  ReferenceInstances;
    #   MI_ProviderFT_EnableIndications   EnableIndications;
    #   MI_ProviderFT_DisableIndications  DisableIndications;
    #   MI_ProviderFT_Subscribe           Subscribe;
    #   MI_ProviderFT_Unsubscribe         Unsubscribe;
    #   MI_ProviderFT_Invoke              Invoke;
    # } MI_ProviderFT;


    # https://msdn.microsoft.com/en-us/library/dn759661.aspx
    # typedef struct _MI_Qualifier {
    #   MI_CONST MI_Char *name;
    #   MI_Uint32        type;
    #   MI_Uint32        flavor;
    #   MI_CONST void    *value;
    # } MI_Qualifier;
    class MI_Qualifier < FFI::Struct
      layout  :name,            :MI_CONST,
              :type,            :mi_uint32,
              :flavor,          :mi_uint32,
              :value,           :MI_CONST
    end

    # https://msdn.microsoft.com/en-us/library/hh437618.aspx
    # typedef struct _MI_SubscriptionDeliveryOptions {
    #   MI_Uint64                              reserved1;
    #   ptrdiff_t                              reserved2;
    #   const MI_SubscriptionDeliveryOptionsFT *ft;
    # } MI_SubscriptionDeliveryOptions;
    class MI_SubscriptionDeliveryOptions < FFI::Struct
      layout  :reserved1,       :mi_uint64,
              :reserved2,       :ptrdiff_t,
              :ft,              MI_SubscriptionDeliveryOptionsFT
    end

    # https://msdn.microsoft.com/en-us/library/hh707712.aspx
    # typedef struct _MI_SubscriptionDeliveryOptionsFT {
    #  MI_Result (MI_CALL *SetString)(
    #      _Inout_ MI_SubscriptionDeliveryOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _In_ const MI_Char *value,
    #      MI_Uint32 flags);
    #  MI_Result (MI_CALL *SetNumber)(
    #      _Inout_ MI_SubscriptionDeliveryOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _In_ MI_Uint32 value,
    #      MI_Uint32 flags);
    #  MI_Result (MI_CALL *SetDateTime)(
    #      _Inout_ MI_SubscriptionDeliveryOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _In_ const MI_Datetime *value,
    #      MI_Uint32 flags);
    #  MI_Result (MI_CALL *SetInterval)(
    #      _Inout_ MI_SubscriptionDeliveryOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _In_ const MI_Interval *value,
    #      MI_Uint32 flags);
    #  MI_Result (MI_CALL *AddCredentials)(
    #      _Inout_ MI_SubscriptionDeliveryOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _In_ const MI_UserCredentials *credentials,
    #      MI_Uint32 flags);
    #  MI_Result (MI_CALL *Delete)(_Inout_ MI_SubscriptionDeliveryOptions *self);
    #  MI_Result (MI_CALL *GetString)(
    #      _In_ MI_SubscriptionDeliveryOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _Out_ const MI_Char **value,
    #      _Out_opt_ MI_Uint32 *index,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *GetNumber)(
    #      _In_ MI_SubscriptionDeliveryOptions *options,
    #      _In_z_ const MI_Char *optionName,
    #      _Out_ MI_Uint32 *value,
    #      _Out_opt_ MI_Uint32 *index,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *GetDateTime)(
    #      _In_ MI_SubscriptionDeliveryOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _Out_ const MI_Datetime *value,
    #      _Out_opt_ MI_Uint32 *index,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *GetInterval)(
    #      _In_ MI_SubscriptionDeliveryOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _Out_ const MI_Interval *value,
    #      _Out_opt_ MI_Uint32 *index,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *GetOptionCount)(
    #      _In_ MI_SubscriptionDeliveryOptions *options,
    #      _Out_opt_ MI_Uint32 *count);
    #  MI_Result (MI_CALL *GetOptionAt)(
    #      _In_ MI_SubscriptionDeliveryOptions *options,
    #      MI_Uint32 index,
    #      _Out_ const MI_Char **optionName,
    #      _Out_ const MI_Value *value,
    #      _Out_ MI_Type *type,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *GetOption)(
    #      _In_ MI_SubscriptionDeliveryOptions *options,
    #      _In_ const MI_Char *optionName,
    #      _Out_ const MI_Value *value,
    #      _Out_ MI_Type *type,
    #      _Out_opt_ MI_Uint32 *index,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *GetCredentialsCount)(
    #      _In_ MI_SubscriptionDeliveryOptions *options,
    #      _Out_ MI_Uint32 *count);
    #  MI_Result (MI_CALL *GetCredentialsAt)(
    #      _In_ MI_SubscriptionDeliveryOptions *options,
    #      MI_Uint32 index,
    #      _Out_ const MI_Char **optionName,
    #      _Out_ const MI_UserCredentials *credentials,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *GetCredentialsPasswordAt)(
    #      _In_ MI_SubscriptionDeliveryOptions *options,
    #      MI_Uint32 index,
    #      _Out_ const MI_Char **optionName,
    #      _Out_opt_ MI_Char *password,
    #      _In_ MI_Uint32 *bufferLength,
    #      _Out_ MI_Uint32 *passwordLength,
    #      _Out_opt_ MI_Uint32 *flags);
    #  MI_Result (MI_CALL *Clone)(
    #      _In_ const MI_SubscriptionDeliveryOptions *options,
    #      _Out_ MI_SubscriptionDeliveryOptions *newSubscriptionDeliveryOptions);
    # } MI_SubscriptionDeliveryOptionsFT;


    # https://msdn.microsoft.com/en-us/library/hh707707.aspx
    # typedef struct _MI_Serializer {
    #   MI_Uint64 reserved1;
    #   ptrdiff_t reserved2;
    # } MI_Serializer;
    class MI_Serializer < FFI::Struct
      layout  :reserved1,       :mi_uint64,
              :reserved2,       :ptrdiff_t
    end

    # https://msdn.microsoft.com/en-us/library/hh707689.aspx
    # typedef struct _MI_Deserializer {
    #   MI_Uint64 reserved1;
    #   ptrdiff_t reserved2;
    # } MI_Deserializer;
    class MI_Deserializer < FFI::Struct
      layout  :reserved1,       :mi_uint64,
              :reserved2,       :ptrdiff_t
    end

    # https://msdn.microsoft.com/en-us/library/Hh707683.aspx
    # typedef struct _MI_Application {
    #   MI_Uint64              reserved1;
    #   ptrdiff_t              reserved2;
    #   const MI_ApplicationFT *ft;
    # } MI_Application;
    class MI_Application < FFI::Struct
      layout  :reserved1,       :mi_uint64,
              :reserved2,       :ptrdiff_t,
              :ft,              MI_ApplicationFT
    end

    # https://msdn.microsoft.com/en-us/library/hh707684.aspx
    # typedef struct _MI_ApplicationFT {
    #   MI_Result (MI_CALL *Close)(_Inout_ MI_Application *application);
    #   MI_Result (MI_CALL *NewSession)(
    #       _In_ MI_Application *application,
    #       _In_opt_ const MI_Char *protocol,
    #       _In_opt_ const MI_Char *destination,
    #       _In_opt_ MI_DestinationOptions *options,
    #       _In_opt_ MI_SessionCallbacks *callbacks,
    #       _Out_opt_ MI_Instance **extendedError,
    #       _Out_ MI_Session *session);
    #   MI_Result (MI_CALL *NewHostedProvider)(
    #       _In_ MI_Application *application,
    #       _In_ const MI_Char *namespaceName,
    #       _In_ const MI_Char *providerName,
    #       _In_ MI_MainFunction mi_Main,
    #       _Out_opt_ MI_Instance **extendedError,
    #       _Out_ MI_HostedProvider *provider);
    #   MI_Result (MI_CALL *NewInstance)(
    #       _In_ MI_Application *application,
    #       _In_ const MI_Char *className,
    #       _In_opt_ const MI_ClassDecl *classRTTI,
    #       _Out_ MI_Instance **instance);
    #   MI_Result (MI_CALL *NewDestinationOptions)(
    #       _In_ MI_Application *application,
    #       _Out_ MI_DestinationOptions *options);
    #   MI_Result (MI_CALL *NewOperationOptions)(
    #       _In_ MI_Application *application,
    #       _In_ MI_Boolean customOptionsMustUnderstand,
    #       _Out_ MI_OperationOptions *options);
    #   MI_Result (MI_CALL *NewSubscriptionDeliveryOptions)(
    #       _In_ MI_Application *application,
    #       _In_ MI_SubscriptionDeliveryType deliveryType,
    #       _Out_ MI_SubscriptionDeliveryOptions *deliveryOptions);
    #   MI_Result (MI_CALL *NewSerializer)(
    #       _Inout_ MI_Application *application,
    #       MI_Uint32 flags,
    #       _In_ MI_Char *format,
    #       _Out_ MI_Serializer *serializer);
    #   MI_Result (MI_CALL *NewDeserializer)(
    #       _Inout_ MI_Application *application,
    #       MI_Uint32 *flags,
    #       _In_z_ MI_Char *format,
    #       _Out_ MI_Deserializer *deserializer);
    # } MI_ApplicationFT;
    # class MI_ApplicationFT < FFI::Struct
    #   layout
    # end


    # typedef struct _PSSemanticsProgress
    # {
    #     unsigned int wait;
    #     MI_Uint32 writeMessageCount;
    #     BOOL writeProgressCount;
    # } PSSemanticsProgress;
    class PSSemanticsProgress < FFI::Struct
      layout :wait,                 :uint32,
             :writeMessageCount,    :mi_unit32,
             :writeProgressCount,   :win32_bool
    end

    ffi_convention :stdcall

    # https://msdn.microsoft.com/en-us/library/hh437439.aspx
    # MI_Result MI_Application_InitializeV1(
    #                   MI_Uint32      flags,
    #   _In_opt_  const MI_Char        *applicationID,
    #   _Out_opt_       MI_Instance    **extendedError,
    #   _Out_           MI_Application *application
    # );
    # #define MI_Application_Initialize MI_Application_InitializeV1
    ffi_lib :mi
    attach_function :MI_Application_Initialize,
        [:mi_uint32, :mi_char, MI_Instance, MI_Application], MI_Application

    # https://msdn.microsoft.com/en-us/library/hh448848.aspx
    # MI_INLINE MI_Result MI_Application_NewInstance(
    #   _In_           MI_Application       *application,
    #                  _In_z_ const MI_Char *className,
    #   _In_opt_ const MI_ClassDecl         *classRTTI,
    #                  _Outptr_ MI_Instance **instance
    # );
    ffi_lib :mi
    attach_function :MI_Application_NewInstance,
        [MI_Application, :mi_char, MI_ClassDecl, MI_Instance], MI_Result

    # https://msdn.microsoft.com/en-us/library/hh448856.aspx
    # MI_INLINE MI_Result MI_Application_NewSession(
    #   _In_           MI_Application                            *application,
    #   _In_opt_ const MI_Char                                   *protocol,
    #   _In_opt_ const MI_Char                                   *destination,
    #   _In_opt_       MI_DestinationOptions                     *options,
    #   _In_opt_       MI_SessionCallbacks                       *callbacks,
    #                  _Outptr_opt_result_maybenull_ MI_Instance **extendedError,
    #   _Out_          MI_Session                                *session
    # );
    ffi_lib :mi
    attach_function :MI_Application_NewSession,
        [MI_Application, :mi_char, :mi_char, MI_DestinationOptions, MI_SessionCallbacks, MI_Instance, MI_Session], MI_Result

    # https://msdn.microsoft.com/en-us/library/hh437437.aspx
    # MI_INLINE MI_Result MI_Application_Close(
    #   _Inout_ MI_Application *application
    # );
    ffi_lib :mi
    attach_function :MI_Application_Close,
        [MI_Application], MI_Result

    # MI_Instance_GetElement
    # https://msdn.microsoft.com/en-us/library/hh449186.aspx
    # MI_INLINE MI_Result MI_Instance_GetElement(
    #   _In_      const MI_Instance          *self,
    #                   _In_z_ const MI_Char *name,
    #   _Out_opt_       MI_Value             *value,
    #   _Out_opt_       MI_Type              *type,
    #   _Out_opt_       MI_Uint32            *flags,
    #   _Out_opt_       MI_Uint32            *index
    # );
    ffi_lib :mi
    attach_function :MI_Instance_GetElement,
        [MI_Instance, :mi_char, :mi_value, MI_Type, :mi_unit32, :mi_unit32], MI_Result

    # https://msdn.microsoft.com/en-us/library/hh449179.aspx
    # MI_INLINE MI_Result MI_Instance_Delete(
    #   _Inout_ MI_Instance *self
    # );
    ffi_lib :mi
    attach_function :MI_Instance_Delete,
        [MI_Instance], MI_Result

    # https://msdn.microsoft.com/en-us/library/hh449277.aspx
    # MI_INLINE MI_Result MI_Operation_GetInstance(
    #   _In_            MI_Operation                              *operation,
    #             const _Outptr_result_maybenull_ MI_Instance     **instance,
    #   _Out_opt_       MI_Boolean                                *moreResults,
    #   _Out_opt_       MI_Result                                 *result,
    #             const _Outptr_opt_result_maybenull_z_ MI_Char   **errorMessage,
    #             const _Outptr_opt_result_maybenull_ MI_Instance **completionDetails
    # );
    ffi_lib :mi
    attach_function :MI_Operation_GetInstance,
        [MI_Operation, MI_Instance, :mi_boolean, MI_Result, :mi_char, MI_Instance], MI_Result

    # https://msdn.microsoft.com/en-us/library/hh449271.aspx
    #  MI_INLINE MI_Result MI_Operation_Close(
    #   _Inout_ MI_Operation *operation
    # );
    ffi_lib :mi
    attach_function :MI_Operation_Close,
        [MI_Operation], MI_Result

    # https://msdn.microsoft.com/en-us/library/hh437537.aspx
    # MI_INLINE void MI_Session_Invoke(
    #   _In_           MI_Session            *session,
    #                  MI_Uint32             flags,
    #   _In_opt_       MI_OperationOptions   *options,
    #   _In_opt_ const MI_Char               *namespaceName,
    #   _In_opt_ const MI_Char               *className,
    #   _In_     const MI_Char               *methodName,
    #   _In_opt_ const MI_Instance           *inboundInstance,
    #   _In_opt_ const MI_Instance           *inboundProperties,
    #   _In_opt_       MI_OperationCallbacks *callbacks,
    #   _Out_          MI_Operation          *operation
    # );
    ffi_lib :mi
    attach_function :MI_Session_Invoke,
        [MI_Session, :mi_unit32, MI_OperationOptions, :mi_char, :mi_char, :mi_char, MI_Instance, MI_Instance, MI_OperationCallbacks, MI_Operation], :void

    # https://msdn.microsoft.com/en-us/library/hh437515.aspx
    # MI_INLINE MI_Result MI_Session_Close(
    #   _Inout_  MI_Session *session,
    #   _In_opt_ void       *completionContext,
    #   _Inout_  void (MI_CALL *completionCallback)(_In_opt_ void *completionContext)
    # );
    ffi_lib :mi
    attach_function :MI_Session_Close,
        [MI_Session, :void, :void], MI_Result

    # https://msdn.microsoft.com/en-us/library/Hh449170.aspx
    # MI_INLINE MI_Result MI_Instance_AddElement(
    #   _Inout_        MI_Instance          *self,
    #                  _In_z_ const MI_Char *name,
    #   _In_opt_ const MI_Value             *value,
    #                  MI_Type              type,
    #                  MI_Uint32            flags
    # );
    ffi_lib :mi
    attach_function :MI_Instance_AddElement,
        [MI_Instance, :mi_char, MI_VALUE, MI_Type, :mi_unit32], MI_Result

  end
end
