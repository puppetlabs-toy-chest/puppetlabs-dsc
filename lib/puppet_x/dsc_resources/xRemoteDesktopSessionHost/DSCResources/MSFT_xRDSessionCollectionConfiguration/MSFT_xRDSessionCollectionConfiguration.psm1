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
        [Parameter()]
        [uint32] $ActiveSessionLimitMin,
        [Parameter()]
        [boolean] $AuthenticateUsingNLA,
        [Parameter()]
        [boolean] $AutomaticReconnectionEnabled,
        [Parameter()]
        [string] $BrokenConnectionAction,
        [Parameter()]
        [string] $ClientDeviceRedirectionOptions,
        [Parameter()]
        [boolean] $ClientPrinterAsDefault,
        [Parameter()]
        [boolean] $ClientPrinterRedirected,
        [Parameter()]
        [string] $CollectionDescription,
        [Parameter()]
        [string] $ConnectionBroker,
        [Parameter()]
        [string] $CustomRdpProperty,
        [Parameter()]
        [uint32] $DisconnectedSessionLimitMin,
        [Parameter()]
        [string] $EncryptionLevel,
        [Parameter()]
        [uint32] $IdleSessionLimitMin,
        [Parameter()]
        [uint32] $MaxRedirectedMonitors,
        [Parameter()]
        [boolean] $RDEasyPrintDriverEnabled,
        [Parameter()]
        [string] $SecurityLayer,
        [Parameter()]
        [boolean] $TemporaryFoldersDeletedOnExit,
        [Parameter()]
        [string] $UserGroup
    )
        Write-Verbose "Getting currently configured RDSH Collection properties"
        $collectionName = Get-RDSessionCollection | ForEach-Object {Get-RDSessionHost $_.CollectionName} | Where-Object {$_.SessionHost -ieq $localhost} | ForEach-Object {$_.CollectionName}

        $collectionGeneral = Get-RDSessionCollectionConfiguration -CollectionName $CollectionName
        $collectionClient = Get-RDSessionCollectionConfiguration -CollectionName $CollectionName -Client
        $collectionConnection = Get-RDSessionCollectionConfiguration -CollectionName $CollectionName -Connection
        $collectionSecurity = Get-RDSessionCollectionConfiguration -CollectionName $CollectionName -Security
        $collectionUserGroup = Get-RDSessionCollectionConfiguration -CollectionName $CollectionName -UserGroup
        @{
        "CollectionName" = $collectionGeneral.CollectionName;
        "ActiveSessionLimitMin" = $collectionConnection.ActiveSessionLimitMin;
        "AuthenticateUsingNLA" = $collectionSecurity.AuthenticateUsingNLA;
        "AutomaticReconnectionEnabled" = $collectionConnection.AutomaticReconnectionEnabled;
        "BrokenConnectionAction" = $collectionConnection.BrokenConnectionAction;
        "ClientDeviceRedirectionOptions" = $collectionClient.ClientDeviceRedirectionOptions;
        "ClientPrinterAsDefault" = $collectionClient.ClientPrinterAsDefault;
        "ClientPrinterRedirected" = $collectionClient.ClientPrinterRedirected;
        "CollectionDescription" = $collectionGeneral.CollectionDescription;
        "CustomRdpProperty" = $collectionGeneral.CustomRdpProperty;
        "DisconnectedSessionLimitMin" = $collectionGeneral.DisconnectedSessionLimitMin;
        "EncryptionLevel" = $collectionSecurity.EncryptionLevel;
        "IdleSessionLimitMin" = $collectionConnection.IdleSessionLimitMin;
        "MaxRedirectedMonitors" = $collectionClient.MaxRedirectedMonitors;
        "RDEasyPrintDriverEnabled" = $collectionClient.RDEasyPrintDriverEnabled;
        "SecurityLayer" = $collectionSecurity.SecurityLayer;
        "TemporaryFoldersDeletedOnExit" = $collectionConnection.TemporaryFoldersDeletedOnExit;
        "UserGroup" = $collectionUserGroup.UserGroup;
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
        [Parameter()]
        [uint32] $ActiveSessionLimitMin,
        [Parameter()]
        [boolean] $AuthenticateUsingNLA,
        [Parameter()]
        [boolean] $AutomaticReconnectionEnabled,
        [Parameter()]
        [string] $BrokenConnectionAction,
        [Parameter()]
        [string] $ClientDeviceRedirectionOptions,
        [Parameter()]
        [boolean] $ClientPrinterAsDefault,
        [Parameter()]
        [boolean] $ClientPrinterRedirected,
        [Parameter()]
        [string] $CollectionDescription,
        [Parameter()]
        [string] $ConnectionBroker,
        [Parameter()]
        [string] $CustomRdpProperty,
        [Parameter()]
        [uint32] $DisconnectedSessionLimitMin,
        [Parameter()]
        [string] $EncryptionLevel,
        [Parameter()]
        [uint32] $IdleSessionLimitMin,
        [Parameter()]
        [uint32] $MaxRedirectedMonitors,
        [Parameter()]
        [boolean] $RDEasyPrintDriverEnabled,
        [Parameter()]
        [string] $SecurityLayer,
        [Parameter()]
        [boolean] $TemporaryFoldersDeletedOnExit,
        [Parameter()]
        [string] $UserGroup
    )
    Write-Verbose "Setting DSC collection properties"
    $discoveredCollectionName = Get-RDSessionCollection | ForEach-Object {Get-RDSessionHost $_.CollectionName} | Where-Object {$_.SessionHost -ieq $localhost} | ForEach-Object {$_.CollectionName}
    if ($collectionName -ne $discoveredCollectionName) {$PSBoundParameters.collectionName = $discoveredCollectionName}
    Set-RDSessionCollectionConfiguration @PSBoundParameters
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
        [Parameter()]
        [uint32] $ActiveSessionLimitMin,
        [Parameter()]
        [boolean] $AuthenticateUsingNLA,
        [Parameter()]
        [boolean] $AutomaticReconnectionEnabled,
        [Parameter()]
        [string] $BrokenConnectionAction,
        [Parameter()]
        [string] $ClientDeviceRedirectionOptions,
        [Parameter()]
        [boolean] $ClientPrinterAsDefault,
        [Parameter()]
        [boolean] $ClientPrinterRedirected,
        [Parameter()]
        [string] $CollectionDescription,
        [Parameter()]
        [string] $ConnectionBroker,
        [Parameter()]
        [string] $CustomRdpProperty,
        [Parameter()]
        [uint32] $DisconnectedSessionLimitMin,
        [Parameter()]
        [string] $EncryptionLevel,
        [Parameter()]
        [uint32] $IdleSessionLimitMin,
        [Parameter()]
        [uint32] $MaxRedirectedMonitors,
        [Parameter()]
        [boolean] $RDEasyPrintDriverEnabled,
        [Parameter()]
        [string] $SecurityLayer,
        [Parameter()]
        [boolean] $TemporaryFoldersDeletedOnExit,
        [Parameter()]
        [string] $UserGroup
    )
    
    Write-Verbose "Testing DSC collection properties"
    $collectionName = Get-RDSessionCollection | ForEach-Object {Get-RDSessionHost $_.CollectionName} | Where-Object {$_.SessionHost -ieq $localhost} | ForEach-Object {$_.CollectionName}
    $PSBoundParameters.Remove("Verbose") | out-null
    $PSBoundParameters.Remove("Debug") | out-null
    $PSBoundParameters.Remove("ConnectionBroker") | out-null
    $Check = $true

    $Get = Get-TargetResource -CollectionName $CollectionName
    $PSBoundParameters.keys | ForEach-Object {if ($PSBoundParameters[$_] -ne $Get[$_]) {$Check = $false} }
    $Check
}

Export-ModuleMember -Function *-TargetResource

