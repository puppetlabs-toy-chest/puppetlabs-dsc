@{
# Version number of this module.
moduleVersion = '2.0.0.0'

# ID used to uniquely identify this module
GUID = 'dada748e-cf1e-43ed-a4ff-3530c01afd53'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = '(c) 2014 Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Module with DSC Resources for deployment and configuration of Microsoft System Center Service Management Automation.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = '4.0'

# Functions to export from this module
FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = '*'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/PowerShell/xSCSMA/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/PowerShell/xSCSMA'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Added MSI install logging for MSFT_xSCSMARunbookWorkerServerSetup and MSFT_xSCSMARunbookWorkerServerSetup
* Added missing -Port parameter argument for New-SmaRunbookWorkerDeployment in MSFT_xSCSMARunbookWorkerServerSetup
* Fixed MSFT\_xSCSMARunbookWorkerServerSetup and MSFT\_xSCSMAWebServiceServerSetup using incorrect executable for version checking
* Remove System Center Technical Preview 5 support. Close issue 18
* Close issue 19 (always install self-signed certificate)
* BREAKING CHANGE: change SendCEIPReports parameter to SendTelemetryReports. Close issue 20
* Added description for new parameters at README.md
* Fix return state of the current SendTelemetryReports
* Fix syntax at source code

'

    } # End of PSData hashtable

} # End of PrivateData hashtable
}




