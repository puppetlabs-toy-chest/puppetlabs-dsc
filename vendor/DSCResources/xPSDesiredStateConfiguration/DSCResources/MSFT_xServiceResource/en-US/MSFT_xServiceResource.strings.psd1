# Localized    09/04/2013 09:54 AM (GMT)    303:4.80.0411     MSFT_ServiceResource.strings.psd1
# Localized resources for MSFT_UserResource

ConvertFrom-StringData @'
###PSLOC
ServiceNotFound=Service '{0}' not found.
CannotStartAndDisable=Cannot start and disable a service.
CannotStopServiceSetToStartAutomatically=Cannot stop a service and set it to start automatically.
ServiceAlreadyStarted=Service '{0}' already started, no action required.
ServiceStarted=Service '{0}' started.
ServiceStopped=Service '{0}' stopped.
ErrorStartingService=Failure starting service '{0}'. Message: '{1}'
OnlyOneParameterCanBeSpecified=Only one of the following parameters can be specified: '{0}', '{1}'.
StartServiceWhatIf=Start Service
ServiceAlreadyStopped=Service '{0}' already stopped, no action required.
ErrorStoppingService=Failure stopping service '{0}'. Message: '{1}'
ErrorRetrievingServiceInformation=Failure retrieving information for service '{0}'. Message: '{1}'
ErrorSettingServiceCredential=Failure setting credentials for service '{0}'. Message: '{1}'
SetCredentialWhatIf=Set Credential
SetStartupTypeWhatIf=Set Start Type
ErrorSettingServiceStartupType=Failure setting start type for service '{0}'. Message: '{1}'
TestUserNameMismatch=User name for service '{0}' is '{1}'. It does not match '{2}.
TestStartupTypeMismatch=Startup type for service '{0}' is '{1}'. It does not match '{2}'.
MethodFailed=The '{0}' method of '{1}' failed with error code: '{2}'.
ErrorChangingProperty=Failed to change '{0}' property. Message: '{1}'
ErrorSetingLogOnAsServiceRightsForUser=Error granting '{0}' the right to log on as a service. Message: '{1}'.
CannotOpenPolicyErrorMessage=Cannot open policy manager
UserNameTooLongErrorMessage=User name is too long
CannotLookupNamesErrorMessage=Failed to lookup user name
CannotOpenAccountErrorMessage=Failed to open policy for user
CannotCreateAccountAccessErrorMessage=Failed to create policy for user
CannotGetAccountAccessErrorMessage=Failed to get user policy rights
CannotSetAccountAccessErrorMessage=Failed to set user policy rights
###PSLOC

'@



