<# 
.summary
    Test suite for ExportToHtml.psm1
#>
[CmdletBinding()]
param()

$xPhpModuleRoot = "${env:ProgramFiles}\WindowsPowerShell\Modules\xPhp"

if(!(test-path $xPhpModuleRoot))
{
    md $xPhpModuleRoot > $null
}
Copy-Item -Recurse  $PSScriptRoot\..\* $xPhpModuleRoot -force -exclude '.git'

$ErrorActionPreference = 'stop'
Set-StrictMode -Version latest

function Suite.BeforeAll {
    # Remove any leftovers from previous test runs
    Suite.AfterAll 

} 

function Suite.AfterAll {
}

function Suite.BeforeEach {
}

try
{
    Describe 'xPhpProvision' {
        BeforeEach {
            Suite.BeforeEach
        }

        AfterEach {
        }

            It 'Should import without error' {
                {
                import-module "$xPhpModuleRoot\DscResources\xPhpProvision\xPhpProvision.Schema.psm1"
                }|  should not throw
            }

            It 'Should return from Get-DscResource' {
                $xphp = Get-DscResource -Name xPhpProvision
                $xphp.ResourceType | should be 'xPhpProvision'
                $xphp.Module | should be 'xPhp'
                $xphp.FriendlyName | should BeNullOrEmpty
                $xphp.ImplementedAs | should be 'Composite'
            }
    }


}
finally
{
    Suite.AfterAll
}

