Import-Module -Name "$PSScriptRoot\..\..\xRemoteDesktopSessionHostCommon.psm1"
if (!(Test-xRemoteDesktopSessionHostOsRequirement)) { Throw "The minimum OS requirement was not met."}
Import-Module RemoteDesktop
$localhost = [System.Net.Dns]::GetHostByName((hostname)).HostName

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
        [string] $CollectionName,
        [parameter(Mandatory)]
        [string] $SessionHost,
        [string] $CollectionDescription,
        [string] $ConnectionBroker
    )
    Write-Verbose "Getting information about RDSH collection."
        $Collection = Get-RDSessionCollection -ErrorAction SilentlyContinue
        @{
        "CollectionName" = $Collection.CollectionName;
        "CollectionDescription" = $Collection.CollectionDescription
        "SessionHost" = $localhost
        "ConnectionBroker" = $ConnectionBroker
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
        [string] $CollectionName,
        [parameter(Mandatory)]
        [string] $SessionHost,
        [string] $CollectionDescription,
        [string] $ConnectionBroker
    )
    Write-Verbose "Creating a new RDSH collection."
    if ($localhost -eq $ConnectionBroker) {
        New-RDSessionCollection @PSBoundParameters
        }
    else {
        $PSBoundParameters.Remove("Description")
        Add-RDSessionHost @PSBoundParameters
        }
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
        [string] $CollectionName,
        [parameter(Mandatory)]
        [string] $SessionHost,
        [string] $CollectionDescription,
        [string] $ConnectionBroker
    )
    Write-Verbose "Checking for existance of RDSH collection."
    (Get-TargetResource @PSBoundParameters).CollectionName -ne $null
}


Export-ModuleMember -Function *-TargetResource

