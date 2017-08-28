@{

ModuleVersion = '1.8.0.0'

GUID = '026e7fd8-06dd-41bc-b373-59366ab18679'

Author = 'Microsoft Corporation'

CompanyName = 'Microsoft Corporation'

Copyright = '(c) 2017 Microsoft Corporation. All rights reserved.'

Description = 'Module containing DSC resources used to configure Failover Clusters.'

# Minimum version of the Windows PowerShell engine required by this module
PowerShellVersion = '4.0'

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        Tags = @('DesiredStateConfiguration', 'DSC', 'DSCResourceKit', 'DSCResource')

        # A URL to the license for this module.
        LicenseUri = 'https://github.com/PowerShell/xFailOverCluster/blob/master/LICENSE'

        # A URL to the main website for this project.
        ProjectUri = 'https://github.com/PowerShell/xFailOverCluster'

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        ReleaseNotes = '- Changes to xFailOverCluster
  - Added a common resource helper module with helper functions for localization.
    - Added helper functions; Get-LocalizedData, New-InvalidResultException,
      New-ObjectNotFoundException, New-InvalidOperationException and
      New-InvalidArgumentException.
  - Fixed lint error MD034 and fixed typos in README.md.
  - Opt-in for module files common tests ([issue 119](https://github.com/PowerShell/xFailOverCluster/issues/119)).
    - Removed Byte Order Mark (BOM) from the files; CommonResourceHelper.psm1 and FailoverClusters.stubs.psm1.
  - Opt-in for script files common tests ([issue 121](https://github.com/PowerShell/xFailOverCluster/issues/121)).
    - Removed Byte Order Mark (BOM) from the files; CommonResourceHelper.Tests.ps1,
      MSFT\_xCluster.Tests.ps1, MSFT\_xClusterDisk.Tests.ps1,
      MSFT\_xClusterPreferredOwner.Tests.ps1, MSFT_xWaitForCluster.Tests.ps1.
  - Added common test helper functions to help test the throwing of localized error strings.
    - Get-InvalidArgumentRecord
    - Get-InvalidOperationRecord
    - Get-ObjectNotFoundException
    - Get-InvalidResultException.
  - Updated year to 2017 in license file and module manifest ([issue 131](https://github.com/PowerShell/xFailOverCluster/issues/131)).
- Changes to xClusterDisk
  - Enabled localization for all strings ([issue 84](https://github.com/PowerShell/xFailOverCluster/issues/84)).
  - Fixed the OutputType data type that was not fully qualified.
  - Minor style changes.
  - Fixed Script Analyzer warnings for Write-Verbose.
- Changes to xClusterNetwork
  - Replaced the URL for the parameter Role in README.md. The new URL is a more
    generic description of the possible settings for the Role parameter. The
    previous URL was still correct but focused on Hyper-V in particular.
  - Fixed typos in parameter descriptions in README.md, comment-based help and schema.mof.
  - Enabled localization for all strings ([issue 85](https://github.com/PowerShell/xFailOverCluster/issues/85)).
  - Minor style changes.
  - Fixed Script Analyzer warnings for Write-Verbose.
- Changes to xCluster
  - Resolved Script Analyzer rule warnings by changing Get-WmiObject to
    Get-CimInstance ([issue 49](https://github.com/PowerShell/xFailOverCluster/issues/49)).
  - Minor style change in tests. Removed "-" in front of "-Be", "-Not", "-Throw",
    etc.
  - Enabled localization for all strings ([issue 83](https://github.com/PowerShell/xFailOverCluster/issues/83)).
  - Added tests to improve code coverage.
    - Fixed random problem with tests failing with error "Invalid token for
      impersonation - it cannot be duplicated." ([issue 133](https://github.com/PowerShell/xFailOverCluster/issues/133)).
  - Minor style changes.
  - Fixed Script Analyzer warnings for Write-Verbose.
- Changes to xWaitForCluster
  - Refactored the unit test for this resource to use stubs and increase coverage
    ([issue 78](https://github.com/PowerShell/xFailOverCluster/issues/78)).
  - Now the Test-TargetResource correctly returns false if the domain name cannot
    be evaluated  ([issue 107](https://github.com/PowerShell/xFailOverCluster/issues/107)).
  - Changed the code to be more aligned with the style guideline.
  - Updated parameter description in the schema.mof.
  - Resolved Script Analyzer warnings ([issue 54](https://github.com/PowerShell/xFailOverCluster/issues/54)).
  - Enabled localization for all strings ([issue 88](https://github.com/PowerShell/xFailOverCluster/issues/88)).
  - Minor style changes.
- Changes to xClusterQuorum
  - Refactored the unit test for this resource to use stubs and increase coverage
    ([issue 77](https://github.com/PowerShell/xFailOverCluster/issues/77)).
  - Changed the code to be more aligned with the style guideline.
  - Updated parameter description in the schema.mof.
  - Added example ([issue 47](https://github.com/PowerShell/xFailOverCluster/issues/47))
    - 1-SetQuorumToNodeMajority.ps1
    - 2-SetQuorumToNodeAndDiskMajority.ps1
    - 3-SetQuorumToNodeAndFileShareMajority.ps1
    - 4-SetQuorumToDiskOnly.ps1
  - Added links to examples from README.md.
  - Minor style changes.
  - Enabled localization for all strings ([issue 87](https://github.com/PowerShell/xFailOverCluster/issues/87)).
- Changes to xClusterPreferredOwner
  - Enabled localization for all strings ([issue 86](https://github.com/PowerShell/xFailOverCluster/issues/86)).
  - Fixed typo in the returned hash table from Get-TargetResource.
  - Minor style changes.

'

    } # End of PSData hashtable

} # End of PrivateData hashtable
}



