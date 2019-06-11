Import-Module -Name "$PSScriptRoot\..\..\xRemoteDesktopSessionHostCommon.psm1"
if (!(Test-xRemoteDesktopSessionHostOsRequirement)) { Throw "The minimum OS requirement was not met."}
Import-Module RemoteDesktop

#######################################################################
# The Get-TargetResource cmdlet.
#######################################################################
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [string] $SessionHost,
        [Parameter(Mandatory = $true)]
        [string] $ConnectionBroker,
        [Parameter(Mandatory = $true)]
        [string] $WebAccessServer
    )

    Write-Verbose "Getting list of RD Server roles."

    # Start service RDMS is needed because otherwise a reboot loop could happen due to
    # the RDMS Service being on Delay-Start by default, and DSC kicks in too quickly after a reboot.
    if((Get-Service -Name RDMS | Select-Object -ExpandProperty Status) -ne 'Running') 
    {
        try
        {
            Start-Service -Name RDMS -ErrorAction Stop
        }
        catch
        {
            Write-Warning "Failed to start RDMS service. Error: $_"
        }
    }

    $Deployed = Get-RDServer -ErrorAction SilentlyContinue

    @{
        SessionHost = $Deployed | Where-Object Roles -contains "RDS-RD-SERVER" | ForEach-Object Server
        ConnectionBroker = $Deployed | Where-Object Roles -contains "RDS-CONNECTION-BROKER" | ForEach-Object Server
        WebAccessServer = $Deployed | Where-Object Roles -contains "RDS-WEB-ACCESS" | ForEach-Object Server
    }
}


########################################################################
# The Set-TargetResource cmdlet.
########################################################################
function Set-TargetResource

{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute("PSAvoidGlobalVars", "global:DSCMachineStatus")]
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [string] $SessionHost,
        [Parameter(Mandatory = $true)]
        [string] $ConnectionBroker,
        [Parameter(Mandatory = $true)]
        [string] $WebAccessServer
    )

    Write-Verbose "Initiating new RDSH deployment."
    New-RDSessionDeployment @PSBoundParameters
    $global:DSCMachineStatus = 1
}


#######################################################################
# The Test-TargetResource cmdlet.
#######################################################################
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [string] $SessionHost,
        [Parameter(Mandatory = $true)]
        [string] $ConnectionBroker,
        [Parameter(Mandatory = $true)]
        [string] $WebAccessServer
    )

    Write-Verbose "Checking RDSH role is deployed on this node."
    
    $get = Get-TargetResource @PSBoundParameters
    $get.ConnectionBroker -eq $ConnectionBroker
}


Export-ModuleMember -Function *-TargetResource

