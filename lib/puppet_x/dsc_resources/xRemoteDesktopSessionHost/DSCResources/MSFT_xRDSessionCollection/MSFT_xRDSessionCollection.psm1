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
        [Parameter(Mandatory = $true)]
        [ValidateLength(1,15)]
        [string] $CollectionName,
        [Parameter(Mandatory = $true)]
        [string] $SessionHost,
        [Parameter()]
        [string] $CollectionDescription,
        [Parameter()]
        [string] $ConnectionBroker
    )
    Write-Verbose "Getting information about RDSH collection."
    $Collection = Get-RDSessionCollection -CollectionName $CollectionName -ConnectionBroker $ConnectionBroker -ErrorAction SilentlyContinue
    @{
        "CollectionName" = $Collection.CollectionName 
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
        [Parameter(Mandatory = $true)]
        [ValidateLength(1,15)]
        [string] $CollectionName,
        [Parameter(Mandatory = $true)]
        [string] $SessionHost,
        [Parameter()]
        [string] $CollectionDescription,
        [Parameter()]
        [string] $ConnectionBroker
    )
    Write-Verbose "Creating a new RDSH collection."
    if ($localhost -eq $ConnectionBroker) 
    {
        New-RDSessionCollection @PSBoundParameters
    }
    else 
    {
        $PSBoundParameters.Remove('CollectionDescription')
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
        [Parameter(Mandatory = $true)]
        [ValidateLength(1,15)]
        [string] $CollectionName,
        [Parameter(Mandatory = $true)]
        [string] $SessionHost,
        [Parameter()]
        [string] $CollectionDescription,
        [Parameter()]
        [string] $ConnectionBroker
    )
    Write-Verbose "Checking for existence of RDSH collection."
    $null -ne (Get-TargetResource @PSBoundParameters).CollectionName
}


Export-ModuleMember -Function *-TargetResource
