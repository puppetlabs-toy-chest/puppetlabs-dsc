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
        [string] $CollectionName, #eg Tenant
        [Parameter(Mandatory = $true)]
        [string] $DisplayName, #eg Calculator
        [Parameter(Mandatory = $true)]
        [string] $FilePath, #eg C:\Windows\System32\calc.exe
        [Parameter(Mandatory = $true)]
        [string] $Alias, #eg calc
        [Parameter()]
        [string] $FileVirtualPath,
        [Parameter()]
        [string] $FolderName,
        [Parameter()]
        [string] $CommandLineSetting,
        [Parameter()]
        [string] $RequiredCommandLine,
        [Parameter()]
        [uint32] $IconIndex,
        [Parameter()]
        [string] $IconPath,
        [Parameter()]
        [string] $UserGroups,
        [Parameter()]
        [boolean] $ShowInWebAccess
    )
        Write-Verbose "Getting published RemoteApp program $DisplayName, if one exists."
        $CollectionName = Get-RDSessionCollection | ForEach-Object {Get-RDSessionHost $_.CollectionName} | Where-Object {$_.SessionHost -ieq $localhost} | ForEach-Object {$_.CollectionName}
        $remoteApp = Get-RDRemoteApp -CollectionName $CollectionName -DisplayName $DisplayName -Alias $Alias

        @{
        "CollectionName" = $remoteApp.CollectionName;
        "DisplayName" = $remoteApp.DisplayName;
        "FilePath" = $remoteApp.FilePath;
        "Alias" = $remoteApp.Alias;
        "FileVirtualPath" = $remoteApp.FileVirtualPath;
        "FolderName" = $remoteApp.FolderName;
        "CommandLineSetting" = $remoteApp.CommandLineSetting;
        "RequiredCommandLine" = $remoteApp.RequiredCommandLine;
        "IconIndex" = $remoteApp.IconIndex;
        "IconPath" = $remoteApp.IconPath;
        "UserGroups" = $remoteApp.UserGroups;
        "ShowInWebAccess" = $remoteApp.ShowInWebAccess;
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
        [string] $DisplayName,
        [Parameter(Mandatory = $true)]
        [string] $FilePath,
        [Parameter(Mandatory = $true)]
        [string] $Alias,
        [Parameter()]
        [string] $FileVirtualPath,
        [Parameter()]
        [string] $FolderName,
        [Parameter()]
        [string] $CommandLineSetting,
        [Parameter()]
        [string] $RequiredCommandLine,
        [Parameter()]
        [uint32] $IconIndex,
        [Parameter()]
        [string] $IconPath,
        [Parameter()]
        [string] $UserGroups,
        [Parameter()]
        [boolean] $ShowInWebAccess
    )
    Write-Verbose "Making updates to RemoteApp."
    $CollectionName = Get-RDSessionCollection | ForEach-Object {Get-RDSessionHost $_.CollectionName} | Where-Object {$_.SessionHost -ieq $localhost} | ForEach-Object {$_.CollectionName}
    $PSBoundParameters.collectionName = $CollectionName
    if (!$(Get-RDRemoteApp -Alias $Alias)) 
    {
        New-RDRemoteApp @PSBoundParameters
    }
    else 
    {
        Set-RDRemoteApp @PSBoundParameters
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
        [string] $DisplayName,
        [Parameter(Mandatory = $true)]
        [string] $FilePath,
        [Parameter(Mandatory = $true)]
        [string] $Alias,
        [Parameter()]
        [string] $FileVirtualPath,
        [Parameter()]
        [string] $FolderName,
        [Parameter()]
        [string] $CommandLineSetting,
        [Parameter()]
        [string] $RequiredCommandLine,
        [Parameter()]
        [uint32] $IconIndex,
        [Parameter()]
        [string] $IconPath,
        [Parameter()]
        [string] $UserGroups,
        [Parameter()]
        [boolean] $ShowInWebAccess
    )
    Write-Verbose "Testing if RemoteApp is published."
    $collectionName = Get-RDSessionCollection | ForEach-Object {Get-RDSessionHost $_.CollectionName} | Where-Object {$_.SessionHost -ieq $localhost} | ForEach-Object {$_.CollectionName}
    $PSBoundParameters.Remove("Verbose") | out-null
    $PSBoundParameters.Remove("Debug") | out-null
    $PSBoundParameters.Remove("ConnectionBroker") | out-null
    $Check = $true
    
    $Get = Get-TargetResource -CollectionName $CollectionName -DisplayName $DisplayName -FilePath $FilePath -Alias $Alias
    $PSBoundParameters.keys | ForEach-Object {if ($PSBoundParameters[$_] -ne $Get[$_]) {$Check = $false} }
    $Check
}

Export-ModuleMember -Function *-TargetResource

