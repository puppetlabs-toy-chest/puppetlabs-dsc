@{

ModuleVersion = '1.7.0.0'

GUID = '026e7fd8-06dd-41bc-b373-59366ab18679'

Author = 'Microsoft Corporation'

CompanyName = 'Microsoft Corporation'

Copyright = '(c) 2014 Microsoft Corporation. All rights reserved.'

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
        ReleaseNotes = '- Changes to xClusterPreferredOwner
  - Script Analyzer warnings have been fixed (issue 50). This also failed the
    tests for the resource.
- Changes to xClusterDisk
  - Fixed test that was failing in  AppVeyor (issue 55).
- Changes to xFailOverCluster
  - Added "Code of Conduct" text to the README.md (issue 44).
  - Added TOC for all resources in the README.md (issue 43).
  - Fixed typos and lint errors in README.md.
  - Fixed style issue in example in README.md.
  - Removed "Unreleased" "tag" from the resources xClusterQuorum and
    xClusterDisk (issue 36)
  - Added new sections to each resource (Requirements, Parameters and Examples)
    in the README.md. Some does not yet have any examples, so they are set to
    "None.".
  - Added GitHub templates PULL\_REQUEST\_TEMPLATE, ISSUE_TEMPLATE and
    CONTRIBUTING.md (issue 45).
  - Split the change log from README.md to a separate file CHANGELOG.md
    (issue 48).
  - Added the resource xClusterPreferredOwner to README.md (issue 51).
  - Added the resource xClusterNetwork to README.md (issue 56).
  - Removed Credential parameter from parameter list for xWaitForCluster.
    Parameter Credential does not exist in the schema.mof of the resource
    (issue 62).
  - Now all parameters in the README.md list their data type and type qualifier
    (issue 58.)
  - Added Import-DscResource to example in README.md.
  - Added CodeCov and opt-in for all common tests (issue 41).
  - Added CodeCov badge to README.md
    - Fixed CodeCov badge links so they now can be clicked on.
  - Fixed lint rule MD013 in CHANGELOG.md.
  - Fixed lint rule MD013 in README.md.
  - Fixed lint rule MD024 in README.md.
  - Fixed lint rule MD032 in README.md.
  - Removed example from README.md (issue 42).
  - Fixed typo in filename for ISSUE\_TEMPLATE. Was "ISSUE\_TEMPLATE", now it is
    correctly "ISSUE\_TEMPLATE.md".
  - Changed appveyor.yml to use the new default test framework in the AppVeyor
    module in DscResource.Tests (AppVeyor.psm1).
  - Added VS Code workspace settings file with formatting settings matching the
    Style Guideline (issue 67). That will make it possible inside VS Code to
    press SHIFT+ALT+F, or press F1 and choose "Format document" in the list. The
    PowerShell code will then be formatted according to the Style Guideline
    (although maybe not complete, but would help a long way).
  - Added new stubs for FailoverClusters module
    (Tests\Unit\Stubs\FailoverClusters.stubs.psm1) to be able to run unit tests
    on a computer that does not have or can install Failover Clustering
    PowerShell module.
  - Added a script file (Tests\Unit\Stubs\Write-ModuleStubFile.ps1) to be able
    to rebuild the stub file (FailoverClusters.stubs.psm1) whenever needed.
  - Added code block around types in README.md.
- Changes to xCluster
  - Added examples
    - 1-CreateFirstNodeOfAFailoverCluster.ps1
    - 2-JoinAdditionalNodeToFailoverCluster.ps1
    - 3-CreateFailoverClusterWithTwoNodes.ps1 (this is the example from README.md)
  - Fixed typo in xCluster parameter description.
  - Added links to examples from README.md
  - Refactored the unit test for this resource to use stubs and increase coverage
    (issue 73).
    - Removed the password file (MSFT_xCluster.password.txt) which seemed unnecessary.
  - Test-TargetResource now throws and error if domain name cannot be evaluated
    (issue 72).
  - Set-TargetResource now correctly throws and error if domain name cannot be
    evaluated (issue 71).
- Changes to xWaitForCluster
  - Added example
    - 1-WaitForFailoverClusterToBePresent.ps1
  - Added link to example from README.md
- Changes to xClusterDisk
  - Refactored the unit test for this resource to use stubs and increase coverage
    (issue 74).
  - Removed an evaluation that called Test-TargetResource in Set-TargetResource
    method and instead added logic so that Set-TargetResource evaluates if it
    should remove a disk (issue 90).
  - Changed the code to be more aligned with the style guideline.
  - Added examples (issue 46)
    - 1-AddClusterDisk.ps1
    - 2-RemoveClusterDisk.ps1
  - Added links to examples from README.md.
- Changes to xClusterPreferredOwner
  - Refactored the unit test for this resource to use stubs and increase coverage
    (issue 76).
  - Changed the code to be more aligned with the style guideline.
  - Added examples (issue 52)
    - 1-AddPreferredOwner.ps1
    - 2-RemovePreferredOwner.ps1
  - Added links to examples from README.md.
- Changes to xClusterNetwork
  - Refactored the unit test for this resource to use stubs and increase coverage
    (issue 75).
  - Changed the code to be more aligned with the style guideline.
  - Updated resource and parameter description in README.md and schema.mof.
  - Added example (issue 57)
    - 1-ChangeClusterNetwork.ps1
  - Added links to examples from README.md.

'

    } # End of PSData hashtable

} # End of PrivateData hashtable
}


