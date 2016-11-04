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
        [parameter(Mandatory)]
        [string] $SessionHost,
        [parameter(Mandatory)]
        [string] $ConnectionBroker,
        [parameter(Mandatory)]
        [string] $WebAccessServer
    )
    Write-Verbose "Getting list of RD Server roles."
        $Deployed = Get-RDServer -ErrorAction SilentlyContinue
        @{
        "SessionHost" = $Deployed | ? Roles -contains "RDS-RD-SERVER" | % Server;
        "ConnectionBroker" = $Deployed | ? Roles -contains "RDS-CONNECTION-BROKER" | % Server;
        "WebAccessServer" = $Deployed | ? Roles -contains "RDS-WEB-ACCESS" | % Server;
        }
}


######################################################################## 
# The Set-TargetResource cmdlet.
########################################################################
function Set-TargetResource

{
    [CmdletBinding()]
    param
    (    
        [parameter(Mandatory)]
        [string] $SessionHost,
        [parameter(Mandatory)]
        [string] $ConnectionBroker,
        [parameter(Mandatory)]
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
        [parameter(Mandatory)]
        [string] $SessionHost,
        [parameter(Mandatory)]
        [string] $ConnectionBroker,
        [parameter(Mandatory)]
        [string] $WebAccessServer
    )
    Write-Verbose "Checking RDSH role is deployed on this node."
    (Get-TargetResource @PSBoundParameters).SessionHost -ieq $SessionHost
}


Export-ModuleMember -Function *-TargetResource

