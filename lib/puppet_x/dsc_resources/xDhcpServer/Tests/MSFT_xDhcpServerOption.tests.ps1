<# 
.summary
    Test suite for MSFT_xDhcpServerOption.psm1
    These tests require RSAT on client.
    On 8.1 it's found here: http://www.microsoft.com/en-us/download/confirmation.aspx?id=39296&6B49FDFB-8E5B-4B07-BC31-15695C5A2143=1
#>
[CmdletBinding()]
param()

$global:DhpcOptionTest=$true
Import-Module $PSScriptRoot\..\DSCResources\MSFT_xDhcpServerOption\MSFT_xDhcpServerOption.psm1

$ErrorActionPreference = 'stop'
Set-StrictMode -Version latest

# should check for the server OS
if($env:APPVEYOR_BUILD_VERSION)
{
  Add-WindowsFeature RSAT-DHCP -verbose
}

function Suite.BeforeAll {
    # Remove any leftovers from previous test runs
    Suite.AfterAll 

}

function Suite.AfterAll {
    Remove-Module MSFT_xDhcpServerOption
    $global:DhpcOptionTest=$null
}

function Suite.BeforeEach {
}

try
{
    Describe 'Validate-ResourceProperties' {
        BeforeEach {
            Suite.BeforeEach
        }

        AfterEach {
        }
            Mock -CommandName Set-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
            }
            It 'Return true when DNS Server scalar match' {
                Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                    return (new-object psobject -property @{name='DNS Servers';Value='1.1.1.2'})
                }

                MSFT_xDhcpServerOption\Validate-ResourceProperties -scopeId '1.1.1.0' -DnsServerIPAddress @('1.1.1.2') -Verbose | should be $true
                Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue  
                Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue -Exactly 0
            }
            It 'Return true when DNS Server array match' {
                $global:ipAddress = @('1.1.1.2','1.1.1.3')
                Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                    return (new-object psobject -property @{name='DNS Servers';Value=$ipAddress})
                }

                MSFT_xDhcpServerOption\Validate-ResourceProperties -scopeId '1.1.1.0' -DnsServerIPAddress $ipAddress -Verbose | should be $true
                Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue 
                Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue -Exactly 0
            }

            # Absent removes the whole option, so this is not new to this issue.
            # So not currently testing Absent and Apply = $true
            foreach($params in @(@{Ensure='Present';Apply=$false},@{Ensure='Absent';Apply=$false},@{Ensure='Present';Apply=$true}))
            {
                It "Return true when Router scalar match, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    $global:dnsIpAddress = @('2.1.1.2','2.1.1.3')
                    $global:routeripAddress = '1.1.1.2'
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress}
                            new-object psobject -property @{name='DNS Servers';Value=$dnsIpAddress}
                        )
                    } 

                    $expectedReturn = $true
                    if($params.Ensure -eq 'Absent')
                    {
                        $expectedReturn = $false
                    }            
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    MSFT_xDhcpServerOption\Validate-ResourceProperties @params -scopeId '1.1.1.0' -DnsServerIPAddress $dnsIpAddress -Router $routeripAddress -Verbose | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue 
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue -Exactly 0
                }

                It "Return true when Router array match, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    $global:dnsIpAddress = @('2.1.1.2','2.1.1.3')
                    $global:routeripAddress = @('1.1.1.2','1.1.1.3')
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress}
                            new-object psobject -property @{name='DNS Servers';Value=$dnsIpAddress}
                        )
                    } 

                    $expectedReturn = $true
                    if($params.Ensure -eq 'Absent')
                    {
                        $expectedReturn = $false
                    }            
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    MSFT_xDhcpServerOption\Validate-ResourceProperties @params -scopeId '1.1.1.0' -DnsServerIPAddress $dnsIpAddress -Router $routeripAddress -Verbose | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue -Exactly 0
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue             
                }
                It "Return false when Router scalar mismatch, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    $global:dnsIpAddress = @('2.1.1.2','2.1.1.3')
                    $global:routeripAddress = '1.1.1.2'
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress}
                            new-object psobject -property @{name='DNS Servers';Value=$dnsIpAddress}
                        )
                    } 

                    $expectedReturn = $false
                    $setMockCalledParams = @{}
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    else
                    {
                        $setMockCalledParams.Add('Exactly',$true)
                        $setMockCalledParams.Add('Times',0)
                    }  
                    MSFT_xDhcpServerOption\Validate-ResourceProperties @params -scopeId '1.1.1.0' -DnsServerIPAddress $dnsIpAddress -Router '1.1.1.3' -Verbose | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue             
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue @setMockCalledParams
                }

                It "Return false when Router array mismatch, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    $global:dnsIpAddress = @('2.1.1.2','2.1.1.3')
                    $global:routeripAddress = @('1.1.1.2','1.1.1.3')
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress}
                            new-object psobject -property @{name='DNS Servers';Value=$dnsIpAddress}
                        )
                    } 

                    $expectedReturn = $false
                    $setMockCalledParams = @{}
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    else
                    {
                        $setMockCalledParams.Add('Exactly',$true)
                        $setMockCalledParams.Add('Times',0)
                    }  
                    MSFT_xDhcpServerOption\Validate-ResourceProperties @params -scopeId '1.1.1.0' -DnsServerIPAddress $dnsIpAddress -Router  @('1.1.1.2','1.1.1.4') -Verbose | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue             
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue @setMockCalledParams
                }
                It "Return false when Router array extra element, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    $global:dnsIpAddress = @('2.1.1.2','2.1.1.3')
                    $global:routeripAddress = @('1.1.1.2','1.1.1.3')
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress}
                            new-object psobject -property @{name='DNS Servers';Value=$dnsIpAddress}
                        )
                    } 

                    $expectedReturn = $false
                    $setMockCalledParams = @{}
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    else
                    {
                        $setMockCalledParams.Add('Exactly',$true)
                        $setMockCalledParams.Add('Times',0)
                    }  
                    MSFT_xDhcpServerOption\Validate-ResourceProperties @params -scopeId '1.1.1.0' -DnsServerIPAddress $dnsIpAddress -Router  @('1.1.1.2','1.1.1.3', '1.1.1.4') -Verbose | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue             
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue @setMockCalledParams
                }
                It "Return false when Router array missing element, apply: $($params.Apply), Ensure: $($params.Ensure)" {
                    $global:dnsIpAddress = @('2.1.1.2','2.1.1.3')
                    $global:routeripAddress = @('1.1.1.2','1.1.1.3','1.1.1.4')
                    Mock -CommandName Get-DhcpServerv4OptionValue -ModuleName MSFT_xDhcpServerOption -MockWith {
                        return @(new-object psobject -property @{OptionId=3;Value=$routeripAddress}
                            new-object psobject -property @{name='DNS Servers';Value=$dnsIpAddress}
                        )
                    } 

                    $expectedReturn = $false
                    $setMockCalledParams = @{}
                    if($params.Apply)
                    {
                        $expectedReturn = $null
                    }          
                    else
                    {
                        $setMockCalledParams.Add('Exactly',$true)
                        $setMockCalledParams.Add('Times',0)
                    }  
                    MSFT_xDhcpServerOption\Validate-ResourceProperties @params -scopeId '1.1.1.0' -DnsServerIPAddress $dnsIpAddress -Router  @('1.1.1.2','1.1.1.3') -Verbose | should be $expectedReturn
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName Get-DhcpServerv4OptionValue             
                    Assert-MockCalled -ModuleName MSFT_xDhcpServerOption -commandName set-DhcpServerv4OptionValue @setMockCalledParams
                }
            }
    }


}
finally
{
    Suite.AfterAll
}

