# Localized	07/10/2015 05:32 AM (GMT)	303:4.80.0411 	PackageProvider.psd1
# Localized PackageProvider.psd1

ConvertFrom-StringData @'
###PSLOC
InvalidIdentifyingNumber=The specified IdentifyingNumber ({0}) is not a valid Guid
InvalidPath=The specified Path ({0}) is not in a valid format. Valid formats are local paths, UNC, and HTTP
InvalidNameOrId=The specified Name ({0}) and IdentifyingNumber ({1}) do not match Name ({2}) and IdentifyingNumber ({3}) in the MSI file
NeedsMoreInfo=Either Name or ProductId is required
InvalidBinaryType=The specified Path ({0}) does not appear to specify an EXE or MSI file and as such is not supported
CouldNotOpenLog=The specified LogPath ({0}) could not be opened
CouldNotStartProcess=The process {0} could not be started
UnexpectedReturnCode=The return code {0} was not expected. Configuration is likely not correct
PathDoesNotExist=The given Path ({0}) could not be found
CouldNotOpenDestFile=Could not open the file {0} for writing
CouldNotGetHttpStream=Could not get the {0} stream for file {1}
ErrorCopyingDataToFile=Encountered error while writing the contents of {0} to {1}
PackageConfigurationComplete=Package configuration finished
PackageConfigurationStarting=Package configuration starting
InstalledPackage=Installed package
UninstalledPackage=Uninstalled package
NoChangeRequired=Package found in desired state, no action required
RemoveExistingLogFile=Remove existing log file
CreateLogFile=Create log file
MountSharePath=Mount share to get media
DownloadHTTPFile=Download the media over HTTP or HTTPS
StartingProcessMessage=Starting process {0} with arguments {1}
RemoveDownloadedFile=Remove the downloaded file
PackageInstalled=Package has been installed
PackageUninstalled=Package has been uninstalled
MachineRequiresReboot=The machine requires a reboot
PackageDoesNotAppearInstalled=The package {0} is not installed
PackageAppearsInstalled=The package {0} is installed
PostValidationError=Package from {0} was installed, but the specified ProductId and/or Name does not match package details
ValidateStandardArgumentsPathwasPath=Validate-StandardArguments, Path was {0}
TheurischemewasuriScheme=The uri scheme was {0}
ThepathextensionwaspathExt=The path extension was {0}
ParsingProductIdasanidentifyingNumber=Parsing {0} as an identifyingNumber
ParsedProductIdasidentifyingNumber=Parsed {0} as {1}
EnsureisEnsure=Ensure is {0}
productisproduct=product {0} found
productasbooleanis=product as boolean is {0}
Creatingcachelocation=Creating cache location
NeedtodownloadfilefromschemedestinationwillbedestName=Need to download file from {0}, destination will be {1}
Creatingthedestinationcachefile=Creating the destination cache file
Creatingtheschemestream=Creating the {0} stream
Settingdefaultcredential=Setting default credential
Settingauthenticationlevel=Setting authentication level
Ignoringbadcertificates=Ignoring bad certificates
Gettingtheschemeresponsestream=Getting the {0} response stream
ErrorOutString=Error: {0}
Copyingtheschemestreambytestothediskcache=Copying the {0} stream bytes to the disk cache
Redirectingpackagepathtocachefilelocation=Redirecting package path to cache file location
ThebinaryisanEXE=The binary is an EXE
Userhasrequestedloggingneedtoattacheventhandlerstotheprocess=User has requested logging, need to attach event handlers to the process
StartingwithstartInfoFileNamestartInfoArguments=Starting {0} with {1}
###PSLOC

'@
