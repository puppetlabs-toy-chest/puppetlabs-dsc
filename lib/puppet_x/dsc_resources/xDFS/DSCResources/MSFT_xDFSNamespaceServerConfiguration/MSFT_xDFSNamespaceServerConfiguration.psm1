data LocalizedData
{
# culture="en-US"
ConvertFrom-StringData -StringData @'
GettingNamespaceServerConfigurationMessage=Getting DFS Namespace Server Configuration.
SettingNamespaceServerConfigurationMessage=Setting DFS Namespace Server Configuration.
NamespaceServerConfigurationUpdateParameterMessage=Setting DFS Namespace Server Configuration parameter {0} to "{1}".
NamespaceServerConfigurationUpdatedMessage=Setting DFS Namespace Server Configuration updated.
NamespaceServerConfigurationServiceRestartedMessage=DFS Namespace Server restarted.
TestingNamespaceServerConfigurationMessage=Testing DFS Namespace Server Configuration.
NamespaceServerConfigurationParameterNeedsUpdateMessage=DFS Namespace Server Configuration parameter "{0}" is "{1}" but should be "{2}". Change required.
'@
}

<#
    This is an array of all the parameters used by this resource
    If the property Restart is true then when this property is updated the service
    Will be restarted.
#>
data ParameterList
{
    @(
        @{ Name = 'LdapTimeoutSec';            Type = 'Uint32'  },
        @{ Name = 'SyncIntervalSec';           Type = 'String'  },
        @{ Name = 'UseFQDN';                   Type = 'Uint32'; Restart = $True }
    )
}

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [String]
        $IsSingleInstance
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingNamespaceServerConfigurationMessage)
        ) -join '' )

    # The ComputerName will always be LocalHost unless a good reason can be provided to
    # enable it as a parameter.
    $ComputerName = 'LocalHost'

    # Get the current DFSN Server Configuration
    $ServerConfiguration = Get-DfsnServerConfiguration `
        -ComputerName $ComputerName `
        -ErrorAction Stop

    # Generate the return object.
    $ReturnValue = @{
        IsSingleInstance = 'Yes'
    }
    foreach ($parameter in $ParameterList)
    {
        $ReturnValue += @{ $parameter.Name = $ServerConfiguration.$($parameter.name) }
    } # foreach

    return $ReturnValue
} # Get-TargetResource

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [String]
        $IsSingleInstance,

        [Uint32]
        $LdapTimeoutSec,

        [Uint32]
        $SyncIntervalSec,

        [Boolean]
        $UseFQDN
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingNamespaceServerConfigurationMessage)
        ) -join '' )

    # The ComputerName will always be LocalHost unless a good reason can be provided to
    # enable it as a parameter.
    $ComputerName = 'LocalHost'

    # Get the current DFSN Server Configuration
    $ServerConfiguration = Get-DfsnServerConfiguration `
        -ComputerName $ComputerName `
        -ErrorAction Stop

    # Generate a list of parameters that will need to be changed.
    $ChangeParameters = @{}
    $Restart = $False
    foreach ($parameter in $ParameterList)
    {
        $ParameterSource = $ServerConfiguration.$($parameter.name)
        $ParameterNew = (Invoke-Expression -Command "`$$($parameter.name)")
        if ($PSBoundParameters.ContainsKey($parameter.Name) `
            -and ($ParameterSource -ne $ParameterNew))
        {
            $ChangeParameters += @{
                $($parameter.name) = $ParameterNew
            }
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceServerConfigurationUpdateParameterMessage) `
                    -f $parameter.Name,$ParameterNew
                ) -join '' )
            if ($parameter.Restart)
            {
                $Restart = $True
            } # if
        } # if
    } # foreach
    if ($ChangeParameters.Count -gt 0)
    {
        # Update any parameters that were identified as different
        $null = Set-DfsnServerConfiguration `
            -ComputerName $ComputerName `
            @ChangeParameters `
            -ErrorAction Stop

        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.NamespaceServerConfigurationUpdatedMessage)
            ) -join '' )

        if ($Restart)
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

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet('Yes')]
        [String]
        $IsSingleInstance,

        [Uint32]
        $LdapTimeoutSec,

        [Uint32]
        $SyncIntervalSec,

        [Boolean]
        $UseFQDN
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingNamespaceServerConfigurationMessage)
        ) -join '' )

    # The ComputerName will always be LocalHost unless a good reason can be provided to
    # enable it as a parameter.
    $ComputerName = 'LocalHost'

    # Flag to signal whether settings are correct
    [Boolean] $DesiredConfigurationMatch = $true

    # Get the current DFSN Server Configuration
    $ServerConfiguration = Get-DfsnServerConfiguration `
        -ComputerName $ComputerName `
        -ErrorAction Stop

    # Check each parameter
    foreach ($parameter in $ParameterList)
    {
        $ParameterSource = $ServerConfiguration.$($parameter.name)
        $ParameterNew = (Invoke-Expression -Command "`$$($parameter.name)")
        if ($PSBoundParameters.ContainsKey($parameter.Name) `
            -and ($ParameterSource -ne $ParameterNew)) {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceServerConfigurationParameterNeedsUpdateMessage) `
                    -f $parameter.Name,$ParameterSource,$ParameterNew
                ) -join '' )
            $desiredConfigurationMatch = $false
        } # if
    } # foreach

    return $DesiredConfigurationMatch
} # Test-TargetResource

# Helper Functions
function New-TerminatingError
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [String] $ErrorId,

        [Parameter(Mandatory)]
        [String] $ErrorMessage,

        [Parameter(Mandatory)]
        [System.Management.Automation.ErrorCategory] $ErrorCategory
    )

    $exception = New-Object `
        -TypeName System.InvalidOperationException `
        -ArgumentList $errorMessage
    $errorRecord = New-Object `
        -TypeName System.Management.Automation.ErrorRecord `
        -ArgumentList $exception, $errorId, $errorCategory, $null
    $PSCmdlet.ThrowTerminatingError($errorRecord)
}

Export-ModuleMember -Function *-TargetResource
