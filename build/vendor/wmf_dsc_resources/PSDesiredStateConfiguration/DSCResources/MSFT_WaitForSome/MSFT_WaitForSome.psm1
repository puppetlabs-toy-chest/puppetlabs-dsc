#
# WaitForSome
#

#
# The Get-TargetResource cmdlet.
#
function Get-TargetResource
{
    param
    (
        [parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $ResourceName,

        [parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $NodeName,

        [parameter(Mandatory)]
        [Uint32] $NodeCount,
        
        [ValidateRange(1,[Uint64]::MaxValue)]
        [Uint64] $RetryIntervalSec = 1, 

        [Uint32] $RetryCount = 0,

        [Uint32] $ThrottleLimit = 32 #Powershell New-CimSession default throttle value
    )

    Import-Module $PSScriptRoot\..\..\PSDSCxMachine.psm1 -Verbose:$false

    $result = PSDSCxMachine\Get-_InternalPSDscXMachineTR `
               -RemoteResourceId $ResourceName `
               -RemoteMachine $NodeName `
               -MinimalNumberOfMachineInState $NodeCount `
               -RetryIntervalSec $RetryIntervalSec `
               -RetryCount $RetryCount `
               -ThrottleLimit $ThrottleLimit
    $result.NodeCount = $NodeCount

    $result
}

#
# The Set-TargetResource cmdlet.
#
function Set-TargetResource
{
    param
    (
        [parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $ResourceName,

        [parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $NodeName,

        [parameter(Mandatory)]
        [Uint32] $NodeCount,

        [ValidateRange(1,[Uint64]::MaxValue)]
        [Uint64] $RetryIntervalSec = 1, 

        [Uint32] $RetryCount = 0,

        [Uint32] $ThrottleLimit = 32 #Powershell New-CimSession default throttle value
    )

    Import-Module $PSScriptRoot\..\..\PSDSCxMachine.psm1 -Verbose:$false

    PSDSCxMachine\Set-_InternalPSDscXMachineTR `
               -RemoteResourceId $ResourceName `
               -RemoteMachine $NodeName `
               -MinimalNumberOfMachineInState $NodeCount `
               -RetryIntervalSec $RetryIntervalSec `
               -RetryCount $RetryCount `
               -ThrottleLimit $ThrottleLimit `
               -Verbose:$($PSBoundParameters["Verbose"] -eq $true)
}

# 
# Test-TargetResource
#
# 
function Test-TargetResource  
{
    param
    (
        [parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string] $ResourceName,

        [parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string[]] $NodeName,

        [parameter(Mandatory)]
        [Uint32] $NodeCount,
        
        [ValidateRange(1,[Uint64]::MaxValue)]
        [Uint64] $RetryIntervalSec = 1, 

        [Uint32] $RetryCount = 0,

        [Uint32] $ThrottleLimit = 32 #Powershell New-CimSession default throttle value
    )

    if ($NodeCount -gt $NodeName.Count)
    {
        throw "Invalid input NodeCount!"
    }

    Import-Module $PSScriptRoot\..\..\PSDSCxMachine.psm1 -Verbose:$false

    return PSDSCxMachine\Test-_InternalPSDscXMachineTR `
               -RemoteResourceId $ResourceName `
               -RemoteMachine $NodeName `
               -MinimalNumberOfMachineInState $NodeCount `
               -RetryIntervalSec $RetryIntervalSec `
               -RetryCount $RetryCount `
               -ThrottleLimit $ThrottleLimit `
               -Verbose:$($PSBoundParameters["Verbose"] -eq $true)
}



Export-ModuleMember -Function *-TargetResource