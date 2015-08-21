require 'ffi'

module Puppet::Util::Dsc::ApiTypes
  if Puppet::Util::Platform.windows?
    require 'puppet/util/windows/api_types'
    #extend FFI::Libary
    extend Puppet::Util::Windows::APITypes

    # FFI Types
    # https://github.com/ffi/ffi/wiki/Types

    # Windows - Common Data Types
    # http://msdn.microsoft.com/en-us/library/cc230309.aspx

    # Windows Data Types
    # http://msdn.microsoft.com/en-us/library/windows/desktop/aa383751.aspx

    # MI API
    # https://msdn.microsoft.com/en-us/library/hh404805.aspx

    # MSFT_DSCLocalConfigurationManager Class
    # https://msdn.microsoft.com/en-us/library/dn469253.aspx

    # MI Instance - How to: Get a specific instance of a Class (C/C++)
    # https://msdn.microsoft.com/en-us/library/dn314434.aspx

    # Implementing MI Provider
    # http://blogs.msdn.com/b/wmi/archive/2013/05/16/introducing-new-management-infrastructure-mi-api.aspx
    # http://blogs.msdn.com/b/wmi/archive/2013/05/08/implementing-mi-provider-1.aspx
    # http://blogs.msdn.com/b/wmi/archive/2013/05/08/implementing-mi-provider-2.aspx
    # http://blogs.msdn.com/b/wmi/archive/2013/05/11/implementing-mi-provider-3-generate-provider-skeleton.aspx
    # http://blogs.msdn.com/b/wmi/archive/2013/12/28/implementing-mi-provider-4-generate-code-continute.aspx
    # http://blogs.msdn.com/b/wmi/archive/2013/12/28/implementing-mi-provider-5-implementation.aspx
    # http://blogs.msdn.com/b/wmi/archive/2013/12/28/implementing-mi-provider-6-build-register-and-debug.aspx

    # http://blogs.msdn.com/b/david_leblanc/archive/2008/09/02/ptrdiff-t-is-evil.aspx
    # signed number that is same number of bytes as a pointer
    # x64 == __int64
    # x86 == int32
    FFI.typedef :pointer, :ptrdiff_t

    # https://msdn.microsoft.com/en-us/library/cc441980.aspx
    # typedef ULONG_PTR SIZE_T;
    # this is in Puppet api types - FFI.typedef :pointer, :ulong_ptr
    FFI.typedef :ulong_ptr, :size_t

    # https://msdn.microsoft.com/en-us/library/cc230399.aspx
    # typedef wchar_t WCHAR, *PWCHAR;
    FFI.typedef :uint16, :wchar_t

    # MI types
    # https://msdn.microsoft.com/en-us/library/mt300881.aspx
    # typedef unsigned char MI_Boolean;
    FFI.typedef :uchar, :mi_boolean
    # typedef wchar_t MI_Char;
    FFI.typedef :uint16, :mi_char
    # typedef unsigned short MI_Char16;
    FFI.typdef :ushort, :mi_char16
    # typedef signed char MI_Sint8;
    FFI.typdef :char, :mi_sint8
    # typedef unsigned char MI_Uint8;
    FFI.typdef :uchar, :mi_uint8
    # typedef signed short MI_Sint16;
    FFI.typdef :short, :mi_sint16
    # typedef unsigned short MI_Uint16;
    FFI.typdef :ushort, :mi_uint16
    # typedef signed int MI_Sint32;
    FFI.typdef :int32, :mi_sint32
    # typedef unsigned int MI_Uint32;
    FFI.typedef :uint32, :mi_uint32
    # typedef signed __int64 MI_Sint64;
    FFI.typedef :int64, :mi_sint64
    # typedef unsigned __int64 MI_Uint64;
    FFI.typedef :uint64, :mi_uint64
    # typedef float MI_Real32;
    FFI.typedef :float, :mi_real32
    # typedef double MI_Real64;
    FFI.typedef :double, :mi_real64
    # typedef _Null_terminated_ MI_Char* MI_StringPtr;
    FFI.typedef :pointer, :mi_stringptr
    # typedef _Null_terminated_ const MI_Char* MI_ConstStringPtr;
    FFI.typedef :pointer, :mi_conststringptr

    # https://msdn.microsoft.com/en-us/library/hh449021.aspx
    # typedef struct _MI_Datetime {
    #   MI_Uint32 isTimestamp;
    #   union {
    #     MI_Timestamp timestamp;
    #     MI_Interval  interval;
    #   } u;
    # } MI_Datetime;

    # MI_T
    # mi.h
    # /*
    # **==============================================================================
    # **
    # ** MI_T()
    # **
    # **     This macro conditionally places the 'L' character in front of a string
    # **     literal (when using wide-character strings).
    # **
    # **==============================================================================
    # */
    # # if (MI_CHAR_TYPE == 1)
    # # define MI_T(STR) STR
    # # else
    # # define MI_T(STR) L##STR
    # # endif

    #  MI_BooleanA   booleana;
    #  MI_Uint8A     uint8a;
    #  MI_UINT8A
    #  MI_Sint8A     sint8a;
    #  MI_Uint16A    uint16a;
    #  MI_Sint16A    sint16a;
    #  MI_Uint32A    uint32a;
    #  MI_Sint32A    sint32a;
    #  MI_Uint64A    uint64a;
    #  MI_Sint64A    sint64a;
    #  MI_Real32A    real32a;
    #  MI_Real64A    real64a;
    #  MI_Char16A    char16a;
    #  MI_DatetimeA  datetimea;
    #  MI_StringA    stringa;
    #  MI_ReferenceA referencea;
    #  MI_InstanceA  instancea;
    #  MI_Array      array;

    # https://msdn.microsoft.com/en-us/library/dn792328.aspx
    # typedef void ( MI_CALL *MI_OperationCallback_PromptUser)(
    #   _In_opt_       MI_Operation *operation,
    #   _In_           void         *callbackContext,
    #   _In_opt_ const MI_Char      *message,
    #   _In_opt_       MI_Result    (MI_CALL * promptUserResult)(_In_ MI_Operation *operation, MI_OperationCallback_ResponseType response)
    # );
    callback :MI_OperationCallback_PromptUser,
      [MI_Operation, :void, :mi_char, MI_Result], :void

    # https://msdn.microsoft.com/en-us/library/dn792330.aspx
    # typedef void ( MI_CALL *MI_OperationCallback_WriteError)(
    #   _In_     MI_Operation *operation,
    #   _In_opt_ void         *callbackContext,
    #   _In_     MI_Instance  *instance,
    #   _In_opt_ MI_Result    (MI_CALL * writeErrorResult)(_In_ MI_Operation *operation, MI_OperationCallback_ResponseType response)
    # );
    callback :MI_OperationCallback_WriteError,
      [MI_Operation, :void, MI_Instance, MI_Result], :void


    # https://msdn.microsoft.com/en-us/library/dn759645.aspx
    # typedef void ( MI_CALL *MI_OperationCallback_WriteMessage)(
    #   _In_           MI_Operation *operation,
    #   _In_opt_       void         *callbackContext,
    #                  MI_Uint32    channel,
    #   _In_     const MI_Char      *message
    # );
    callback :MI_OperationCallback_WriteMessage,
      [MI_Operation, :void, :mi_uint32, :mi_char], :void

    # https://msdn.microsoft.com/en-us/library/dn759646.aspx
    # typedef void ( MI_CALL *MI_OperationCallback_WriteProgress)(
    #   _In_           MI_Operation *operation,
    #   _In_opt_       void         *callbackContext,
    #   _In_     const MI_Char      *activity,
    #   _In_     const MI_Char      *currentOperation,
    #   _In_     const MI_Char      *statusDescription,
    #                  MI_Uint32    percentageComplete,
    #                  MI_Uint32    secondsRemaining
    # );
    callback :MI_OperationCallback_WriteProgress,
      [MI_Operation, :void, :mi_char, :mi_char, :mi_char, :mi_uint32, :mi_uint32], :void

    # https://msdn.microsoft.com/en-us/library/dn792327.aspx
    # typedef void ( MI_CALL *MI_OperationCallback_Instance)(
    #   _In_opt_       MI_Operation *operation,
    #   _In_           void         *callbackContext,
    #   _In_opt_ const MI_Instance  *instance,
    #                  MI_Boolean   moreResults,
    #   _In_           MI_Result    *resultCode,
    #   _In_opt_ const MI_Char      *errorString,
    #   _In_opt_ const MI_Instance  *errorDetails,
    #   _In_opt_       MI_Result    (MI_CALL * resultAcknowledgement)(_In_ MI_Operation *operation)
    # );
    callback :MI_OperationCallback_Instance,
      [MI_Operation, :void, MI_Instance, :mi_boolean, MI_Result, :mi_char, MI_Instance, MI_Result], :void

    # https://msdn.microsoft.com/en-us/library/dn792326.aspx
    # typedef void ( MI_CALL *MI_OperationCallback_Indication)(
    #   _In_opt_       MI_Operation *operation,
    #   _In_           void         *callbackContext,
    #   _In_opt_ const MI_Instance  *instance,
    #   _In_opt_ const MI_Char      *bookmark,
    #   _In_opt_ const MI_Char      *machineID,
    #                  MI_Boolean   moreResults,
    #   _In_           MI_Result    *resultCode,
    #   _In_opt_ const MI_Char      *errorString,
    #   _In_opt_ const MI_Instance  *errorDetails,
    #   _In_opt_       MI_Result    (MI_CALL * resultAcknowledgement)(_In_ MI_Operation *operation)
    # );
    callback :MI_OperationCallback_Indication,
      [MI_Operation, :void, MI_Instance, :mi_char, :mi_char, :mi_boolean, MI_Result, :mi_char, MI_Instance, MI_Result], :void

    # https://msdn.microsoft.com/en-us/library/dn792325.aspx
    # typedef void ( MI_CALL *MI_OperationCallback_Class)(
    #   _In_opt_       MI_Operation *operation,
    #   _In_           void         *callbackContext,
    #   _In_opt_ const MI_Class     *classResult,
    #                  MI_Boolean   moreResults,
    #   _In_           MI_Result    *resultCode,
    #   _In_opt_ const MI_Char      *errorString,
    #   _In_opt_ const MI_Instance  *errorDetails,
    #   _In_opt_       MI_Result    (MI_CALL * resultAcknowledgement)(_In_ MI_Operation *operation)
    # );
    callback :MI_OperationCallback_Class,
      [MI_Operation, :void, MI_Class, :mi_boolean, MI_Result, :mi_char, MI_Instance, MI_Result], :void

    # https://msdn.microsoft.com/en-us/library/dn792329.aspx
    # typedef void ( MI_CALL *MI_OperationCallback_StreamedParameter)(
    #   _In_           MI_Operation *operation,
    #   _In_           void         *callbackContext,
    #   _In_     const MI_Char      *parameterName,
    #   _In_           MI_Type      resultType,
    #   _In_     const MI_Value     *result,
    #   _In_opt_       MI_Result    (MI_CALL * resultAcknowledgement)(_In_ MI_Operation *operation)
    # );
    callback :MI_OperationCallback_StreamedParameter,
      [MI_Operation, :void, :mi_char, MI_Type, MI_Value, MI_Result], :void


    # https://msdn.microsoft.com/en-us/library/mt300889.aspx
    # typedef union _MI_Value {
    #  MI_Boolean    boolean;
    #  MI_Uint8      uint8;
    #  MI_Sint8      sint8;
    #  MI_Uint16     uint16;
    #  MI_Sint16     sint16;
    #  MI_Uint32     uint32;
    #  MI_Sint32     sint32;
    #  MI_Uint64     uint64;
    #  MI_Sint64     sint64;
    #  MI_Real32     real32;
    #  MI_Real64     real64;
    #  MI_Char16     char16;
    #  MI_Datetime   datetime;
    #  MI_Char       *string;
    #  MI_Instance   *instance;
    #  MI_Instance   *reference;
    #  MI_BooleanA   booleana;
    #  MI_Uint8A     uint8a;
    #  MI_Sint8A     sint8a;
    #  MI_Uint16A    uint16a;
    #  MI_Sint16A    sint16a;
    #  MI_Uint32A    uint32a;
    #  MI_Sint32A    sint32a;
    #  MI_Uint64A    uint64a;
    #  MI_Sint64A    sint64a;
    #  MI_Real32A    real32a;
    #  MI_Real64A    real64a;
    #  MI_Char16A    char16a;
    #  MI_DatetimeA  datetimea;
    #  MI_StringA    stringa;
    #  MI_ReferenceA referencea;
    #  MI_InstanceA  instancea;
    #  MI_Array      array;
    # } MI_Value;
    class MI_VALUE < FFI::Union
      layout  :boolean,   :mi_boolean,
              :uint8,     :mi_uint8,
              :sint8,     :mi_sint8,
              :uint16,    :mi_uint16,
              :sint16,    :mi_sint16,
              :uint32,    :mi_uint32,
              :sint32,    :mi_sint32,
              :uint64,    :mi_uint64,
              :sint64,    :mi_sint64,
              :real32,    :mi_real32,
              :real64,    :mi_real64,
              :char16,    :mi_char16,
              :datetime,  :mi_datetime,
              :string,    :mi_char,
              :instance,  :mi_instance,
              :reference, :mi_instance,
              :booleana,  :mi_booleana,
              :uint8a,    :mi_uint8a,
              :sint8a,    :mi_sint8a,
              :uint16a,   :mi_uint16a,
              :sint16a,   :mi_sint16a,
              :uint32a,   :mi_uint32a,
              :sint32a,   :mi_sint32a,
              :uint64a,   :mi_uint64a,
              :sint64a,   :mi_sint64a,
              :real32a,   :mi_real32a,
              :real64a,   :mi_real64a,
              :char16a,   :mi_char16a,
              :datetimea, :mi_datetimea,
              :stringa,   :mi_stringa,
              :referencea,:mi_referencea,
              :instancea, :mi_instancea,
              :array,     :mi_array
    end

    # https://msdn.microsoft.com/en-us/library/hh437699.aspx
    # typedef enum _MI_Type {
    #  MI_BOOLEAN     = 0,
    #      MI_UINT8       = 1,
    #      MI_SINT8       = 2,
    #      MI_UINT16      = 3,
    #      MI_SINT16      = 4,
    #      MI_UINT32      = 5,
    #      MI_SINT32      = 6,
    #      MI_UINT64      = 7,
    #      MI_SINT64      = 8,
    #      MI_REAL32      = 9,
    #      MI_REAL64      = 10,
    #      MI_CHAR16      = 11,
    #      MI_DATETIME    = 12,
    #      MI_STRING      = 13,
    #      MI_REFERENCE   = 14,
    #      MI_INSTANCE    = 15,
    #      MI_BOOLEANA    = 16,
    #      MI_UINT8A      = 17,
    #      MI_SINT8A      = 18,
    #      MI_UINT16A     = 19,
    #      MI_SINT16A     = 20,
    #      MI_UINT32A     = 21,
    #      MI_SINT32A     = 22,
    #      MI_UINT64A     = 23,
    #      MI_SINT64A     = 24,
    #      MI_REAL32A     = 25,
    #      MI_REAL64A     = 26,
    #      MI_CHAR16A     = 27,
    #      MI_DATETIMEA   = 28,
    #      MI_STRINGA     = 29,
    #      MI_REFERENCEA  = 30,
    #      MI_INSTANCEA   = 31,
    #      MI_ARRAY       = 16
    # } MI_Type;
    MI_Type = enum(
      :MI_BOOLEAN, 0,
      :MI_UINT8, 1,
      :MI_SINT8, 2,
      :MI_UINT16, 3,
      :MI_SINT16, 4,
      :MI_UINT32, 5,
      :MI_SINT32, 6,
      :MI_UINT64, 7,
      :MI_SINT64, 8,
      :MI_REAL32, 9,
      :MI_REAL64, 10,
      :MI_CHAR16, 11,
      :MI_DATETIME, 12,
      :MI_STRING, 13,
      :MI_REFERENCE, 14,
      :MI_INSTANCE, 15,
      :MI_BOOLEANA, 16,
      :MI_UINT8A, 17,
      :MI_SINT8A, 18,
      :MI_UINT16A, 19,
      :MI_SINT16A, 20,
      :MI_UINT32A, 21,
      :MI_SINT32A, 22,
      :MI_UINT64A, 23,
      :MI_SINT64A, 24,
      :MI_REAL32A, 25,
      :MI_REAL64A, 26,
      :MI_CHAR16A, 27,
      :MI_DATETIMEA, 28,
      :MI_STRINGA, 29,
      :MI_REFERENCEA, 30,
      :MI_INSTANCEA, 31,
      :MI_ARRAY, 16
    )

    # https://msdn.microsoft.com/en-us/library/hh437490.aspx
    # typedef enum _MI_Result {
    #  MI_RESULT_OK                                   = 0,
    #  MI_RESULT_FAILED                               = 1,
    #  MI_RESULT_ACCESS_DENIED                        = 2,
    #  MI_RESULT_INVALID_NAMESPACE                    = 3,
    #  MI_RESULT_INVALID_PARAMETER                    = 4,
    #  MI_RESULT_INVALID_CLASS                        = 5,
    #  MI_RESULT_NOT_FOUND                            = 6,
    #  MI_RESULT_NOT_SUPPORTED                        = 7,
    #  MI_RESULT_CLASS_HAS_CHILDREN                   = 8,
    #  MI_RESULT_CLASS_HAS_INSTANCES                  = 9,
    #  MI_RESULT_INVALID_SUPERCLASS                   = 10,
    #  MI_RESULT_ALREADY_EXISTS                       = 11,
    #  MI_RESULT_NO_SUCH_PROPERTY                     = 12,
    #  MI_RESULT_TYPE_MISMATCH                        = 13,
    #  MI_RESULT_QUERY_LANGUAGE_NOT_SUPPORTED         = 14,
    #  MI_RESULT_INVALID_QUERY                        = 15,
    #  MI_RESULT_METHOD_NOT_AVAILABLE                 = 16,
    #  MI_RESULT_METHOD_NOT_FOUND                     = 17,
    #  MI_RESULT_NAMESPACE_NOT_EMPTY                  = 20,
    #  MI_RESULT_INVALID_ENUMERATION_CONTEXT          = 21,
    #  MI_RESULT_INVALID_OPERATION_TIMEOUT            = 22,
    #  MI_RESULT_PULL_HAS_BEEN_ABANDONED              = 23,
    #  MI_RESULT_PULL_CANNOT_BE_ABANDONED             = 24,
    #  MI_RESULT_FILTERED_ENUMERATION_NOT_SUPPORTED   = 25,
    #  MI_RESULT_CONTINUATION_ON_ERROR_NOT_SUPPORTED  = 26,
    #  MI_RESULT_SERVER_LIMITS_EXCEEDED               = 27,
    #  MI_RESULT_SERVER_IS_SHUTTING_DOWN              = 28
    # } _MI_Result;
    MI_Result = enum(
      :MI_RESULT_OK                                 , 0,
      :MI_RESULT_FAILED                             , 1,
      :MI_RESULT_ACCESS_DENIED                      , 2,
      :MI_RESULT_INVALID_NAMESPACE                  , 3,
      :MI_RESULT_INVALID_PARAMETER                  , 4,
      :MI_RESULT_INVALID_CLASS                      , 5,
      :MI_RESULT_NOT_FOUND                          , 6,
      :MI_RESULT_NOT_SUPPORTED                      , 7,
      :MI_RESULT_CLASS_HAS_CHILDREN                 , 8,
      :MI_RESULT_CLASS_HAS_INSTANCES                , 9,
      :MI_RESULT_INVALID_SUPERCLASS                 , 10,
      :MI_RESULT_ALREADY_EXISTS                     , 11,
      :MI_RESULT_NO_SUCH_PROPERTY                   , 12,
      :MI_RESULT_TYPE_MISMATCH                      , 13,
      :MI_RESULT_QUERY_LANGUAGE_NOT_SUPPORTED       , 14,
      :MI_RESULT_INVALID_QUERY                      , 15,
      :MI_RESULT_METHOD_NOT_AVAILABLE               , 16,
      :MI_RESULT_METHOD_NOT_FOUND                   , 17,
      :MI_RESULT_NAMESPACE_NOT_EMPTY                , 20,
      :MI_RESULT_INVALID_ENUMERATION_CONTEXT        , 21,
      :MI_RESULT_INVALID_OPERATION_TIMEOUT          , 22,
      :MI_RESULT_PULL_HAS_BEEN_ABANDONED            , 23,
      :MI_RESULT_PULL_CANNOT_BE_ABANDONED           , 24,
      :MI_RESULT_FILTERED_ENUMERATION_NOT_SUPPORTED , 25,
      :MI_RESULT_CONTINUATION_ON_ERROR_NOT_SUPPORTED, 26,
      :MI_RESULT_SERVER_LIMITS_EXCEEDED             , 27,
      :MI_RESULT_SERVER_IS_SHUTTING_DOWN            , 28
    )

    # https://msdn.microsoft.com/en-us/library/hh437696.aspx
    # typedef enum _MI_SubscriptionDeliveryType {
    #   MI_SubscriptionDeliveryType_Pull  = 1,
    #   MI_SubscriptionDeliveryType_Push  = 2
    # } MI_SubscriptionDeliveryType;
    MI_SubscriptionDeliveryType = enum(
        :MI_SubscriptionDeliveryType_Pull, 1,
        :MI_SubscriptionDeliveryType_Push, 2
    )

    # https://msdn.microsoft.com/en-us/library/hh449220.aspx
    # typedef enum _MI_OperationCallback_ResponseType {
    #   MI_OperationCallback_ResponseType_No        = 0,
    #   MI_OperationCallback_ResponseType_Yes       = 1,
    #   MI_OperationCallback_ResponseType_NoToAll   = 2,
    #   MI_OperationCallback_ResponseType_YesToAll  = 3
    # } MI_OperationCallback_ResponseType;
    MI_OperationCallback_ResponseType = enum(
      :MI_OperationCallback_ResponseType_No       , 0,
      :MI_OperationCallback_ResponseType_Yes      , 1,
      :MI_OperationCallback_ResponseType_NoToAll  , 2,
      :MI_OperationCallback_ResponseType_YesToAll , 3
    )

  end
end

