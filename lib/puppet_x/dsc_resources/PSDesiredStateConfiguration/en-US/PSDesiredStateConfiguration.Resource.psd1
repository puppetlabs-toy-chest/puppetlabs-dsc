# Localized	07/10/2015 05:33 AM (GMT)	303:4.80.0411 	PSDesiredStateConfiguration.Resource.psd1
# Localized	04/21/2015 09:07 AM (GMT)	303:4.80.0411 	PSDesiredStateConfiguration.Resource.psd1
# Localized PSDesiredStateConfigurationResource.psd1

ConvertFrom-StringData @'
###PSLOC
CheckSumFileExists=File '{0}' already exists. Please specify -Force parameter to overwrite existing checksum files.
CreateChecksumFile=Create checksum file '{0}'
OverwriteChecksumFile=Overwrite checksum file '{0}'
OutpathConflict=(ERROR) Cannot create directory '{0}'. A file exists with the same name.
InvalidConfigPath=(ERROR) Invalid configuration path '{0}' specified.
InvalidOutpath=(ERROR) Invalid OutPath '{0}' specified.
InvalidConfigurationName=Invalid Configuration Name '{0}' is specified. Standard names may only contain letters (a-z, A-Z), numbers (0-9), and underscore (_). The name may not be null or empty, and should start with a letter.
NoValidConfigFileFound=No valid config files (mof,zip) were found.
InputFileNotExist=File {0} doesn't exist.
FileReadError=Error Reading file {0}.
MatchingFileNotFound=No matching file found.
CertificateFileReadError=Error Reading certificate file {0}.
CertificateStoreReadError=Error Reading certificate store for {0}.
CannotCreateOutputPath=Invalid Configuration name and output path combination :{0}. Please make sure output parameter is a valid path segment.
ConflictingDuplicateResource=A conflict was detected between resources '{0}' and '{1}' in node '{2}'. Resources have identical key properties but there are differences in the following non-key properties: '{3}'. Values '{4}' don't match values '{5}'. Please update these property values so that they are identical in both cases.
ConfiguratonDataNeedAllNodes=ConfigurationData parameter need to have property AllNodes.
ConfiguratonDataAllNodesNeedHashtable=ConfigurationData parameter property AllNodes needs to be a collection.
AllNodeNeedToBeHashtable=all elements of AllNodes need to be hashtable and has a property 'NodeName'.
DuplicatedNodeInConfigurationData=There are duplicated NodeNames '{0}' in the configurationData passed in.
EncryptedToPlaintextNotAllowed=Converting and storing encrypted passwords as plain text is not recommended. For more information on securing credentials in MOF file, please refer to MSDN blog: http://go.microsoft.com/fwlink/?LinkId=393729
DomainCredentialNotAllowed=It is not recommended to use domain credential for node '{0}'. In order to suppress the warning, you can add a property named 'PSDscAllowDomainUser' with a value of $true to your DSC configuration data for node '{0}'.
NestedNodeNotAllowed=Defining node '{0}' inside the current node '{1}' is not allowed since node definitions cannot be nested. Please move the definition for node '{0}' to the top level of the configuration '{2}'.
FailToProcessNode=An exception was raised while processing Node '{0}': {1}
LocalHostNodeNotAllowed=Defining a 'localhost' node in the configuration '{0}' is not allowed since the configuration already contains one or more resource definitions that are not associated with any nodes.
InvalidMOFDefinition=Invalid MOF definition for node '{0}': {1}
RequiredResourceNotFound=Resource '{0}' required by '{1}' does not exist. Please ensure that the required resource exists and the name is properly formed.
ReferencedManagerNotFound=Download Manager '{0}' referenced by '{1}' does not exist. Please ensure that the referenced download manager exists and the name is properly formed.
DependsOnLinkTooDeep=DependsOn link exceeded max depth limitation '{0}'.
DependsOnLoopDetected=Circular DependsOn exists '{0}'. Please make sure there are no circular reference.
FailToProcessConfiguration=Errors occurred while processing configuration '{0}'.
FailToProcessProperty={0} error processing property '{1}' OF TYPE '{2}': {3}
NodeNameIsRequired=Node processing is skipped since the node name is empty.
ConvertValueToPropertyFailed=Cannot convert '{0}' to type '{1}' for property '{2}'.
ResourceNotFound=The term '{0}' is not recognized as the name of a {1}.
GetDscResourceInputName=The Get-DscResource input '{0}' parameter value is '{1}'.
ResourceNotMatched=Skipping resource '{0}' as it does not match the requested name.
InitializingClassCache=Initializing class cache
LoadingDefaultCimKeywords=Loading default CIM keywords
GettingModuleList=Getting module list
CreatingResourceList=Creating resource list
CreatingResource=Creating resource '{0}'.
SchemaFileForResource=Schema file name for resource {0}
UnsupportedReservedKeyword=The '{0}' keyword is not supported in this version of the language.
UnsupportedReservedProperty=The '{0}' property is not supported in this version of the language.
MetaConfigurationHasMoreThanOneLocalConfigurationManager=The meta configuration for node '{0}' contain more than one definitions for LocalConfigurationManager which is not allowed.
MetaConfigurationSettingsMissing=The settings definition for node '{0}' is missing. A default empty settings definition is added for the node.
ConflictInExclusiveResources=The partial configuration '{0}' and '{1}' have coflicting exclusive resource declarations.
ReferencedModuleNotExist=The referenced module '{0}' does not exist on the machine. Please use Get-DscResource to find out what exists on the machine.
ReferencedResourceNotExist=The referenced resource '{0}' does not exist on the machine. Please use Get-DscResource to find out what exists on the machine.
ReferencedModuleResourceNotExist=The referenced module\\resource '{0}' does not exist on the machine. Please use Get-DscResource to find out what exists on the machine.
DuplicatedResourceInModules=The referenced resource '{0}' exists in module {1} and module {2} on the machine. Please make sure it exists in only one module.
CannotConvertStringToBool=Cannot convert value "System.String" to type "System.Boolean". Boolean parameters accept only Boolean values and numbers, such as $True, $False, 1 or 0.
NoModulesPresent=There are no modules present in the system with the given module specification.
ImportDscResourceWarningForInbuiltResource=The configuration '{0}' is loading one or more built-in resources without explicitly importing associated modules. Add Import-DscResource –ModuleName ’PSDesiredStateConfiguration’ to your configuration to avoid this message.
PasswordTooLong=An error occurred during encryption of a password in node '{0}'. Most likely the password entered is too long to be encrypted using the selected certificate.  Please either use a shorter password or select a certificate with a larger key.
###PSLOC
'@
