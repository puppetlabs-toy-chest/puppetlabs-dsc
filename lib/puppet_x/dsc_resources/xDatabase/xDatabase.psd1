@{

# Script module or binary module file associated with this manifest.
# RootModule = ''

# Version number of this module.
ModuleVersion = '1.6.0.0'

# ID used to uniquely identify this module
GUID = '8ad956dd-4a36-4767-9725-ed0466893edb'

# Author of this module
Author = 'Microsoft'

# Company or vendor of this module
CompanyName = 'Microsoft'

# Copyright statement for this module
Copyright = '(c) 2014 Microsoft. All rights reserved.'

# Description of the functionality provided by this module
Description = 'This module contains 2 resources. xDatabase allows to create and deploy databases using DAC or connection string, restore a database using BACPAC and delete a database. The xDBPackage resource allows extracting a database to a DACPAC or exporting to a BACPAC'

# Functions to export from this module
FunctionsToExport = '*'

# Cmdlets to export from this module
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = '*'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/PowerShell/xDatabase/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/PowerShell/xDatabase'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Moved internal functions to a common helper module

'

    } # End of PSData hashtable

} # End of PrivateData hashtable
}




