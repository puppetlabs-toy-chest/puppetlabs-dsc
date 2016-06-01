@{
# Version number of this module.
ModuleVersion = '2.1.0.0'

# ID used to uniquely identify this module
GUID = '7c3fee65-807c-4c25-8f60-0dbece96d1bb'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = '(c) 2014 Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'Module for installing an instance of mySQL'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Minimum version of the common language runtime (CLR) required by this module
CLRVersion = '4.0'

# Script module or binary module file associated with this manifest.
#RootModule = 'PSWSIISEndpoint.psm1'

# Modules to import as nested modules of the module specified in ModuleToProcess
NestedModules = 'MSFT_xMySqlUtilities.psm1'

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
        LicenseUri = 'https://github.com/PowerShell/xMySql/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/PowerShell/xMySql'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable
}


