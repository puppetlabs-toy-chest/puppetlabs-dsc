$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Certificate Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
                               -ChildPath (Join-Path -Path 'DFSDsc.ResourceHelper' `
                                                     -ChildPath 'DFSDsc.ResourceHelper.psm1'))

# Import Localization Strings
$localizedData = Get-LocalizedData `
    -ResourceName 'MSFT_xDFSNamespaceServerConfiguration' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    This is an array of all the parameters used by this resource.
    If the property Restart is true then when this property is updated the service
    will be restarted.
#>
data parameterList
{
    @(
        @{
            Name = 'LdapTimeoutSec'
            Type = 'Uint32'
        },
        @{
            Name = 'SyncIntervalSec'
            Type = 'String'
        },
        @{
            Name = 'UseFQDN'
            Type = 'Uint32'
            Restart = $True
        }
    )
}

<#
    .SYNOPSIS
    Returns the current state of a DFS Namespace Server Configuration.

    .PARAMETER IsSingleInstance
    Specifies the resource is a single instance, the value must be 'Yes'
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingNamespaceServerConfigurationMessage)
        ) -join '' )

    # Get the current DFSN Server Configuration
    $serverConfiguration = Get-DfsnServerConfiguration `
        -ComputerName $env:COMPUTERNAME `
        -ErrorAction Stop

    # Generate the return object.
    $returnValue = @{
        IsSingleInstance = 'Yes'
    }

    foreach ($parameter in $parameterList)
    {
        $returnValue += @{
            $parameter.Name = $serverConfiguration.$($parameter.name)
        }
    } # foreach

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
    Sets the DFS Namespace Server Configuration.

    .PARAMETER IsSingleInstance
    Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER LdapTimeoutSec
    Specifies a time-out value, in seconds, for Lightweight Directory
    Access Protocol (LDAP) requests for the DFS namespace server.

    .PARAMETER SyncIntervalSec
    This interval controls how often domain-based DFS namespace root
    servers and domain controllers connect to the PDC emulator to get
    updates of DFS namespace metadata.

    .PARAMETER UseFQDN
    Indicates whether a DFS namespace server uses FQDNs in referrals.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter()]
        [System.UInt32]
        $LdapTimeoutSec,

        [Parameter()]
        [System.UInt32]
        $SyncIntervalSec,

        [Parameter()]
        [System.Boolean]
        $UseFQDN
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingNamespaceServerConfigurationMessage)
        ) -join '' )

    # Get the current DFSN Server Configuration
    $serverConfiguration = Get-DfsnServerConfiguration `
        -ComputerName $env:COMPUTERNAME `
        -ErrorAction Stop

    # Generate a list of parameters that will need to be changed.
    $changeParameters = @{}
    $restart = $False

    foreach ($parameter in $parameterList)
    {
        $parameterSource = $serverConfiguration.$($parameter.name)
        $parameterNew = (Get-Variable -Name ($parameter.name)).Value
        if ($PSBoundParameters.ContainsKey($parameter.Name) `
            -and ($parameterSource -ne $parameterNew))
        {
            $changeParameters += @{
                $($parameter.name) = $parameterNew
            }

            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceServerConfigurationUpdateParameterMessage) `
                    -f $parameter.Name,$parameterNew
                ) -join '' )

            if ($parameter.Restart)
            {
                $restart = $True
            } # if
        } # if
    } # foreach

    if ($changeParameters.Count -gt 0)
    {
        # Update any parameters that were identified as different
        $null = Set-DfsnServerConfiguration `
            -ComputerName $env:COMPUTERNAME `
            @changeParameters `
            -ErrorAction Stop

        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.NamespaceServerConfigurationUpdatedMessage)
            ) -join '' )

        if ($restart)
        {
            # Restart the DFS Service
            $null = Restart-Service `
                -Name DFS `
                -Force `
                -ErrorAction Stop

            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceServerConfigurationServiceRestartedMessage)
                ) -join '' )
        }
    } # if
} # Set-TargetResource

<#
    .SYNOPSIS
    Tests the DFS Namespace Server Configuration.

    .PARAMETER IsSingleInstance
    Specifies the resource is a single instance, the value must be 'Yes'.

    .PARAMETER LdapTimeoutSec
    Specifies a time-out value, in seconds, for Lightweight Directory
    Access Protocol (LDAP) requests for the DFS namespace server.

    .PARAMETER SyncIntervalSec
    This interval controls how often domain-based DFS namespace root
    servers and domain controllers connect to the PDC emulator to get
    updates of DFS namespace metadata.

    .PARAMETER UseFQDN
    Indicates whether a DFS namespace server uses FQDNs in referrals.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [System.String]
        $IsSingleInstance,

        [Parameter()]
        [System.UInt32]
        $LdapTimeoutSec,

        [Parameter()]
        [System.UInt32]
        $SyncIntervalSec,

        [Parameter()]
        [System.Boolean]
        $UseFQDN
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingNamespaceServerConfigurationMessage)
        ) -join '' )

    # Flag to signal whether settings are correct
    [System.Boolean] $desiredConfigurationMatch = $true

    # Get the current DFSN Server Configuration
    $serverConfiguration = Get-DfsnServerConfiguration `
        -ComputerName $env:COMPUTERNAME `
        -ErrorAction Stop

    # Check each parameter
    foreach ($parameter in $parameterList)
    {
        $parameterSource = $serverConfiguration.$($parameter.name)
        $parameterNew = (Get-Variable -Name ($parameter.name)).Value

        if ($PSBoundParameters.ContainsKey($parameter.Name) `
            -and ($parameterSource -ne $parameterNew)) {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceServerConfigurationParameterNeedsUpdateMessage) `
                    -f $parameter.Name,$parameterSource,$parameterNew
                ) -join '' )

            $desiredConfigurationMatch = $false
        } # if
    } # foreach

    return $desiredConfigurationMatch
} # Test-TargetResource

Export-ModuleMember -Function *-TargetResource
