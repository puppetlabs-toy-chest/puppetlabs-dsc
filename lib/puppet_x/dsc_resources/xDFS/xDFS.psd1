@{
    # Version number of this module.
    ModuleVersion = '3.2.0.0'

    # ID used to uniquely identify this module
    GUID = '3bcb9c66-ea0b-4675-bd46-c390a382c388'

    # Author of this module
    Author = 'Microsoft Corporation'

    # Company or vendor of this module
    CompanyName = 'Microsoft Corporation'

    # Copyright statement for this module
    Copyright = '(c) 2015 Microsoft Corporation. All rights reserved.'

    # Description of the functionality provided by this module
    Description = 'DSC resources for configuring Distributed File System Replication and Namespaces.'

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion = '5.0'

    # Minimum version of the common language runtime (CLR) required by this module
    CLRVersion = '4.0'

    # Processor architecture (None, X86, Amd64) required by this module
    ProcessorArchitecture = 'None'

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module
    FunctionsToExport = '*'

    # Cmdlets to export from this module
    CmdletsToExport = '*'

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{
        PSData = @{
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @( 'DSC','DesiredStateConfiguration','DSCResourceKit','DSCResource','DFS','DistributedFileSystem' )

            # A URL to the license for this module.
            LicenseUri = 'https://github.com/PowerShell/xDFS/blob/master/LICENSE'

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/PowerShell/xDFS'

            # ReleaseNotes of this module
        ReleaseNotes = '- Converted AppVeyor.yml to pull Pester from PSGallery instead of Chocolatey.
- Changed AppVeyor.yml to use default image.
- Converted AppVeyor build process to use AppVeyor.psm1.
- Resolved PSSA violations.
- Resolved Readme.md style violations.
- Converted Integration Tests to use Test Drive and stop using Invoke-Pester.
- Move strings into separate language files.
- Added CodeCov support.
- Clean up manifest file by removing commented out sections.
- Convert Examples to pass tests and meet minimum standards.
- Convert to Wiki and auto-documentation generation.
- Convert to TestHarness test execution method.
- Correct parameter block format to meet guidelines.
- Replaced all type accelerators with full type names.
- Updated Readme.md to contain resource list.
- Fixed xDFSNamespaceServerConfiguration by converting LocalHost to ComputerName
  instead.
- Added integration test to test for conflicts with other common resource kit modules.
- Prevented ResourceHelper and Common module cmdlets from being exported to resolve
  conflicts with other resource modules.
'
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}

