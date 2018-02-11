@{

# Version number of this module.
ModuleVersion = '1.7.0.0'

# ID used to uniquely identify this module
GUID = 'd75e53f2-47fc-4ee7-97af-8d257d3e0151'

# Author of this module
Author = 'Microsoft Corporation'

# Company or vendor of this module
CompanyName = 'Microsoft Corporation'

# Copyright statement for this module
Copyright = '(c) 2017 Microsoft Corporation. All rights reserved.'

# Description of the functionality provided by this module
Description = 'This DSC Resources can easily set the System Time Zone.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Functions to export from this module
# FunctionsToExport = ''

# Cmdlets to export from this module
CmdletsToExport = '*'

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module
AliasesToExport = '*'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/PowerShell/xTimeZone/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/PowerShell/xTimeZone'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '* Added resource helper module.
* Changed resource file names to include MSFT_*.
* Added MSFT_ to MOF file classname.
* Change examples to meet HQRM standards and optin to Example validation
  tests.
* Replaced examples in README.MD to links to Example files.
* Added the VS Code PowerShell extension formatting settings that cause PowerShell
  files to be formatted as per the DSC Resource kit style guidelines.
* Opted into Common Tests "Validate Module Files" and "Validate Script Files".
* Converted files with UTF8 with BOM over to UTF8.
* Updated Year to 2017 in License and Manifest.
* Added .github support files:
  * CONTRIBUTING.md
  * ISSUE_TEMPLATE.md
  * PULL_REQUEST_TEMPLATE.md
* Resolved all PSScriptAnalyzer warnings and style guide warnings.

'

    } # End of PSData hashtable

} # End of PrivateData hashtable
}




