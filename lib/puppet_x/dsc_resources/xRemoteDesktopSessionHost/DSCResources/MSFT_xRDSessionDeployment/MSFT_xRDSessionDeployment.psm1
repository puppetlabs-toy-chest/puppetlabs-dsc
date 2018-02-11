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
        Start-Service -Name RDMS -ErrorAction SilentlyContinue

        $Deployed = Get-RDServer -ErrorAction SilentlyContinue
        @{
        "SessionHost" = $Deployed | Where-Object Roles -contains "RDS-RD-SERVER" | ForEach-Object Server;
        "ConnectionBroker" = $Deployed | Where-Object Roles -contains "RDS-CONNECTION-BROKER" | ForEach-Object Server;
        "WebAccessServer" = $Deployed | Where-Object Roles -contains "RDS-WEB-ACCESS" | ForEach-Object Server;
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
    # We need to perform the following check case insensitive because in some
    # cases the SessionHost of Get-TargetResource is uppercase while the
    # $sessionHost parameter is lowercase causing a reboot loop to happen.
    (Get-TargetResource @PSBoundParameters).SessionHost.ToLower() -ieq $SessionHost.ToLower()
}


Export-ModuleMember -Function *-TargetResource

