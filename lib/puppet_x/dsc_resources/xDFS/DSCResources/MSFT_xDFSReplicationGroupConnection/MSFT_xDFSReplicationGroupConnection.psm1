data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData -StringData @'
GettingReplicationGroupMessage=Getting DFS Replication Group Connection "{0}" from "{1}" to "{2}".
ReplicationGroupConnectionExistsMessage=DFS Replication Group Connection "{0}" from "{1}" to "{2}" exists.
ReplicationGroupConnectionDoesNotExistMessage=DFS Replication Group Connection "{0}" from "{1}" to "{2}" does not exist.
SettingRegGroupConnectionMessage=Setting DFS Replication Group Connection "{0}" from "{1}" to "{2}".
EnsureReplicationGroupConnectionExistsMessage=Ensuring DFS Replication Group "{0}" from "{1}" to "{2}" exists.
EnsureReplicationGroupConnectionDoesNotExistMessage=Ensuring DFS Replication Group "{0}" from "{1}" to "{2}" does not exist.
ReplicationGroupConnectionCreatedMessage=DFS Replication Group Connection "{0}" from "{1}" to "{2}" has been created.
ReplicationGroupConnectionUpdatedMessage=DFS Replication Group Connection "{0}" from "{1}" to "{2}" description has been updated.
ReplicationGroupConnectionExistsRemovedMessage=DFS Replication Group Connection "{0}" from "{1}" to "{2}" existed, but has been removed.
TestingConnectionRegGroupMessage=Testing DFS Replication Group Connection "{0}" from "{1}" to "{2}".
ReplicationGroupConnectionNeedsUpdateMessage=DFS Replication Group Connection "{0}" from "{1}" to "{2}" {4} is different. Change required.
ReplicationGroupConnectionDoesNotExistButShouldMessage=DFS Replication Group Connection "{0}" from "{1}" to "{2}" does not exist but should. Change required.
ReplicationGroupConnectionExistsButShouldNotMessage=DFS Replication Group Connection "{0}" from "{1}" to "{2}" exists but should not. Change required.
ReplicationGroupConnectionDoesNotExistAndShouldNotMessage=DFS Replication Group Connection "{0}" from "{1}" to "{2}" does not exist and should not. Change not required.
'@
}


function Get-TargetResource
{
    [OutputType([Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $GroupName,

        [parameter(Mandatory = $true)]
        [String]
        $SourceComputerName,

        [parameter(Mandatory = $true)]
        [String]
        $DestinationComputerName,

        [parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure,

        [String]
        $DomainName
    )
    
    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.GettingReplicationGroupConnectionMessage) `
            -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
        ) -join '' )

    # Lookup the existing Replication Group Connection
    $Splat = @{
        GroupName = $GroupName
        SourceComputerName = $SourceComputerName 
        DestinationComputerName = $DestinationComputerName 
    }
    $returnValue = $splat.Clone()
    if ($PSBoundParameters.ContainsKey('DomainName'))
    {
        $Splat += @{ DomainName = $DomainName }
    }
    $ReplicationGroupConnection = Get-DfsrConnection @Splat `
        -ErrorAction Stop
    if ($ReplicationGroupConnection)
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupConnectionExistsMessage) `
                -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
            ) -join '' )
        $returnValue.SourceComputerName = $ReplicationGroupConnection.SourceComputerName 
        $returnValue.DestinationComputerName = $ReplicationGroupConnection.DestinationComputerName 
        if ($ReplicationGroupConnection.Enabled)
        {
            $EnsureEnabled = 'Enabled'
        }
        else
        {
            $EnsureEnabled = 'Disabled'
        } # if
        if ($ReplicationGroupConnection.RdcEnabled)
        {
            $EnsureRDCEnabled = 'Enabled'
        }
        else
        {
            $EnsureRDCEnabled = 'Disabled'
        } # if
        $returnValue += @{
            Ensure = 'Present'
            Description = $ReplicationGroupConnection.Description
            DomainName = $ReplicationGroupConnection.DomainName
            EnsureEnabled = $EnsureEnabled
            EnsureRDCEnabled = $EnsureRDCEnabled
        }
    }
    else
    {       
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupConnectionDoesNotExistMessage) `
                -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
            ) -join '' )
        $returnValue += @{ Ensure = 'Absent' }
    }

    $returnValue
} # Get-TargetResource

function Set-TargetResource
{
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $GroupName,

        [parameter(Mandatory = $true)]
        [String]
        $SourceComputerName,

        [parameter(Mandatory = $true)]
        [String]
        $DestinationComputerName,

        [parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure,

        [String]
        $Description,

        [ValidateSet('Enabled','Disabled')]
        [String]
        $EnsureEnabled = 'Enabled',

        [ValidateSet('Enabled','Disabled')]
        [String]
        $EnsureRDCEnabled = 'Enabled',

        [String]
        $DomainName
    )

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.SettingRegGroupConnectionMessage) `
            -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
        ) -join '' )

    # Remove Ensure so the PSBoundParameters can be used to splat
    $null = $PSBoundParameters.Remove('Ensure')
    $null = $PSBoundParameters.Remove('EnsureEnabled')
    $null = $PSBoundParameters.Remove('EnsureRDCEnabled')

    # Lookup the existing Replication Group Connection
    $Splat = @{
        GroupName = $GroupName
        SourceComputerName = $SourceComputerName 
        DestinationComputerName = $DestinationComputerName 
    }
    if ($PSBoundParameters.ContainsKey('DomainName'))
    {
        $Splat += @{ DomainName = $DomainName }
    }
    $ReplicationGroupConnection = Get-DfsrConnection @Splat -ErrorAction Stop

    if ($Ensure -eq 'Present')
    {
        # The rep group connection should exist
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.EnsureReplicationGroupConnectionExistsMessage) `
                -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
            ) -join '' )

        $null = $PSBoundParameters.Add('DisableConnection',($EnsureEnabled -eq 'Disabled'))
        $null = $PSBoundParameters.Add('DisableRDC',($EnsureRDCEnabled -eq 'Disabled'))

        if ($ReplicationGroupConnection)
        {
            # The RG connection exists already - update it
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupConnectionExistsMessage) `
                    -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
                ) -join '' )
            Set-DfsrConnection @PSBoundParameters `
                -ErrorAction Stop
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupConnectionUpdatedMessage) `
                    -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
                ) -join '' )

        }
        else
        {
            # Ths Rep Groups doesn't exist - Create it
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupConnectionDoesNotExistMessage) `
                    -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
                ) -join '' )
            Add-DfsrConnection @PSBoundParameters `
                -ErrorAction Stop
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupConnectionCreatedMessage) `
                    -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
                ) -join '' )

        }
    }
    else
    {
        # The Rep Group should not exist
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.EnsureReplicationGroupConnectionDoesNotExistMessage) `
                -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
            ) -join '' )
        if ($ReplicationGroup)
        {
            # Remove the replication group
            Remove-DfsrConnection @Splat -Force -ErrorAction Stop
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupConnectionExistsRemovedMessage) `
                    -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
                ) -join '' )
        }
    } # if
} # Set-TargetResource

function Test-TargetResource
{
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $GroupName,

        [parameter(Mandatory = $true)]
        [String]
        $SourceComputerName,

        [parameter(Mandatory = $true)]
        [String]
        $DestinationComputerName,

        [parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure,

        [String]
        $Description,

        [ValidateSet('Enabled','Disabled')]
        [String]
        $EnsureEnabled = 'Enabled',

        [ValidateSet('Enabled','Disabled')]
        [String]
        $EnsureRDCEnabled = 'Enabled',

        [String]
        $DomainName
    )

    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.TestingRegGroupConnectionMessage) `
            -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
        ) -join '' )

    # Remove Ensure so the PSBoundParameters can be used to splat
    $null = $PSBoundParameters.Remove('Ensure')

    # Lookup the existing Replication Group Connection
    $Splat = @{
        GroupName = $GroupName
        SourceComputerName = $SourceComputerName 
        DestinationComputerName = $DestinationComputerName 
    }
    if ($PSBoundParameters.ContainsKey('DomainName'))
    {
        $Splat += @{ DomainName = $DomainName }
    }
    $ReplicationGroupConnection = Get-DfsrConnection @Splat `
        -ErrorAction Stop

    if ($Ensure -eq 'Present')
    {
        # The RG should exist
        if ($ReplicationGroupConnection)
        {
            # The RG exists already
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupConnectionExistsMessage) `
                    -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
                ) -join '' )

            # Check if any of the non-key paramaters are different.
            if (($PSBoundParameters.ContainsKey('Description')) -and `
                ($ReplicationGroupConnection.Description -ne $Description))
            {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupConnectionNeedsUpdateMessage) `
                        -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName, `
                        'Description'
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }

            if (($EnsureEnabled -eq 'Enabled') `
                -and (-not $ReplicationGroupConnection.Enabled) `
                -or ($EnsureEnabled -eq 'Disabled') `
                -and ($ReplicationGroupConnection.Enabled))
            {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupConnectionNeedsUpdateMessage) `
                        -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName, `
                        'Enabled'
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }

            if (($EnsureRDCEnabled -eq 'Enabled') `
                -and (-not $ReplicationGroupConnection.RDCEnabled) `
                -or ($EnsureRDCEnabled -eq 'Disabled') `
                -and ($ReplicationGroupConnection.RDCEnabled))
            {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupConnectionNeedsUpdateMessage) `
                        -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName, `
                        'RDC Enabled'
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }
        }
        else
        {
            # Ths RG doesn't exist but should
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                 $($LocalizedData.ReplicationGroupConnectionDoesNotExistButShouldMessage) `
                    -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
    }
    else
    {
        # The RG should not exist
        if ($ReplicationGroupConnection)
        {
            # The RG exists but should not
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                 $($LocalizedData.ReplicationGroupConnectionExistsButShouldNotMessage) `
                    -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
        else
        {
            # The RG does not exist and should not
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupConnectionDoesNotExistAndShouldNotMessage) `
                    -f $GroupName,$SourceComputerName,$DestinationComputerName,$DomainName
                ) -join '' )
        }
    } # if
    return $desiredConfigurationMatch
} # Test-TargetResource

Export-ModuleMember -Function *-TargetResource
