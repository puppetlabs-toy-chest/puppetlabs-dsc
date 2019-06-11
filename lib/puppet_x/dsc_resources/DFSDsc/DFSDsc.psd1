@{
    # Version number of this module.
    moduleVersion = '4.3.0.0'

    # ID used to uniquely identify this module
    GUID = '3bcb9c66-ea0b-4675-bd46-c390a382c388'

    # Author of this module
    Author = 'Microsoft Corporation'

    # Company or vendor of this module
    CompanyName = 'Microsoft Corporation'

    # Copyright statement for this module
    Copyright = '(c) 2018 Microsoft Corporation. All rights reserved.'

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

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @()

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = @()

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()

    # DSC resources to export from this module
    DscResourcesToExport = @(
        'DFSNamespaceFolder',
        'DFSNamespaceRoot',
        'DFSNamespaceServerConfiguration',
        'DFSReplicationGroup',
        'DFSReplicationGroupConnection',
        'DFSReplicationGroupFolder',
        'DFSReplicationGroupMembership'
        )

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{
        PSData = @{
            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @( 'DSC', 'DesiredStateConfiguration', 'DSCResourceKit', 'DSCResource', 'DFS', 'DistributedFileSystem' )

            # A URL to the license for this module.
            LicenseUri = 'https://github.com/PowerShell/DFSDsc/blob/master/LICENSE'

            # A URL to the main website for this project.
            ProjectUri = 'https://github.com/PowerShell/DFSDsc'

            # ReleaseNotes of this module
        ReleaseNotes = '- Fixes PSSA style violation issues resulting - fixes [Issue 84](https://github.com/PowerShell/DfsDsc/issues/84).
- Added "DscResourcesToExport" to manifest to improve information in
  PowerShell Gallery - fixes [Issue 86](https://github.com/PowerShell/DfsDsc/issues/86).
- Set FunctionsToExport, CmdletsToExport, VariablesToExport, AliasesToExport
  to empty list in manifest to meet best practice.
- Explicitly removed extra hidden files from release package

'
        } # End of PSData hashtable
    } # End of PrivateData hashtable
}






