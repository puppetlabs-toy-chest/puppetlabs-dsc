data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData -StringData @'
GettingReplicationGroupMembershipMessage=Getting DFS Replication Group "{0}" folder "{1}" on "{2}".
ReplicationGroupMembershipExistsMessage=DFS Replication Group "{0}" folder "{1}" on "{2}" exists.
ReplicationGroupMembershipMissingError=DFS Replication Group "{0}" folder "{1}" on "{2}" is missing.
SettingRegGroupMembershipMessage=Setting DFS Replication Group "{0}" folder "{1}" on "{2}".
ReplicationGroupMembershipUpdatedMessage=DFS Replication Group "{0}" folder "{1}" on "{2}" has has been updated.
TestingRegGroupMembershipMessage=Testing DFS Replication Group "{0}" folder "{1}" on "{2}".
ReplicationGroupMembershipContentPathMismatchMessage=DFS Replication Group "{0}" folder "{1}" on "{2}" has incorrect ContentPath. Change required.
ReplicationGroupMembershipStagingPathMismatchMessage=DFS Replication Group "{0}" folder "{1}" on "{2}" has incorrect StagingPath. Change required.
ReplicationGroupMembershipReadOnlyMismatchMessage=DFS Replication Group "{0}" folder "{1}" on "{2}" has incorrect ReadOnly. Change required.
ReplicationGroupMembershipPrimaryMemberismatchMessage=DFS Replication Group "{0}" folder "{1}" on "{2}" has incorrect PrimaryMember. Change required.
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
        $FolderName,

        [parameter(Mandatory = $true)]
        [String]
        $ComputerName,

        [String]
        $DomainName
    )
    
    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.GettingReplicationGroupMembershipMessage) `
            -f $GroupName,$FolderName,$ComputerName,$DomainName
        ) -join '' )

    # Lookup the existing Replication Group
    $Splat = @{
        GroupName = $GroupName
        ComputerName = $ComputerName
    }
    $returnValue = $Splat
    if ($DomainName)
    {
        $Splat += @{ DomainName = $DomainName }
    }
    $returnValue += @{ FolderName = $FolderName }
    $ReplicationGroupMembership = Get-DfsrMembership @Splat `
        -ErrorAction Stop `
        | Where-Object { $_.FolderName -eq $FolderName }
    if ($ReplicationGroupMembership)
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupMembershipExistsMessage) `
                -f $GroupName,$FolderName,$ComputerName,$DomainName
            ) -join '' )
        $ReturnValue.ComputerName = $ReplicationGroupMembership.ComputerName
        $returnValue += @{
            ContentPath = $ReplicationGroupMembership.ContentPath
            StagingPath = $ReplicationGroupMembership.StagingPath
            ConflictAndDeletedPath = $ReplicationGroupMembership.ConflictAndDeletedPath
            ReadOnly = $ReplicationGroupMembership.ReadOnly
            PrimaryMember = $ReplicationGroupMembership.PrimaryMember
            DomainName = $ReplicationGroupMembership.DomainName
        }
    }
    else
    {       
        # The Rep Group membership doesn't exist
        $errorId = 'RegGroupMembershipMissingError'
        $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidOperation
        $errorMessage = $($LocalizedData.ReplicationGroupMembershipMissingError) `
            -f $GroupName,$FolderName,$ComputerName,$DomainName
        $exception = New-Object -TypeName System.InvalidOperationException `
            -ArgumentList $errorMessage
        $errorRecord = New-Object -TypeName System.Management.Automation.ErrorRecord `
            -ArgumentList $exception, $errorId, $errorCategory, $null

        $PSCmdlet.ThrowTerminatingError($errorRecord)
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
        $FolderName,

        [parameter(Mandatory = $true)]
        [String]
        $ComputerName,

        [String]
        $ContentPath,

        [String]
        $StagingPath,

        [Boolean]
        $ReadOnly,

        [Boolean]
        $PrimaryMember,

        [String]
        $DomainName
    )

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.SettingRegGroupMembershipMessage) `
            -f $GroupName,$FolderName,$ComputerName,$DomainName
        ) -join '' )

    # Now apply the changes
    Set-DfsrMembership @PSBoundParameters `
        -ErrorAction Stop

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.ReplicationGroupMembershipUpdatedMessage) `
            -f $GroupName,$FolderName,$ComputerName,$DomainName
        ) -join '' )
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
        $FolderName,

        [parameter(Mandatory = $true)]
        [String]
        $ComputerName,

        [String]
        $ContentPath,

        [String]
        $StagingPath,

        [Boolean]
        $ReadOnly,

        [Boolean]
        $PrimaryMember,

        [String]
        $DomainName
    )

    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.TestingRegGroupMembershipMessage) `
            -f $GroupName,$FolderName,$ComputerName,$DomainName
        ) -join '' )

    # Lookup the existing Replication Group
    $Splat = @{
        GroupName = $GroupName
        ComputerName = $ComputerName
    }
    if ($DomainName)
    {
        $Splat += @{ DomainName = $DomainName }
    }
    $ReplicationGroupMembership = Get-DfsrMembership @Splat `
        -ErrorAction Stop `
        | Where-Object { $_.FolderName -eq $FolderName }
    if ($ReplicationGroupMembership)
    {
        # The rep group folder is found
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupMembershipExistsMessage) `
                -f $GroupName,$FolderName,$ComputerName,$DomainName
            ) -join '' )

        # Check the ContentPath
        if (($PSBoundParameters.ContainsKey('ContentPath')) `
            -and ($ReplicationGroupMembership.ContentPath -ne $ContentPath))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupMembershipContentPathMismatchMessage) `
                    -f $GroupName,$FolderName,$ComputerName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
        
        # Check the StagingPath
        if (($PSBoundParameters.ContainsKey('StagingPath')) `
            -and ($ReplicationGroupMembership.StagingPath -ne $StagingPath))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupMembershipStagingPathMismatchMessage) `
                    -f $GroupName,$FolderName,$ComputerName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }

        # Check the ReadOnly
        if (($PSBoundParameters.ContainsKey('ReadOnly')) `
            -and ($ReplicationGroupMembership.ReadOnly -ne $ReadOnly))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupMembershipReadOnlyMismatchMessage) `
                    -f $GroupName,$FolderName,$ComputerName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }

        # Check the PrimaryMember
        if (($PSBoundParameters.ContainsKey('PrimaryMember')) `
            -and ($ReplicationGroupMembership.PrimaryMember -ne $PrimaryMember))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupMembershipPrimaryMemberMismatchMessage) `
                    -f $GroupName,$FolderName,$ComputerName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }

    }
    else
    {
        # The Rep Group membership doesn't exist
        $errorId = 'RegGroupMembershipMissingError'
        $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidOperation
        $errorMessage = $($LocalizedData.ReplicationGroupMembershipMissingError) `
            -f $GroupName,$FolderName,$ComputerName,$DomainName
        $exception = New-Object -TypeName System.InvalidOperationException `
            -ArgumentList $errorMessage
        $errorRecord = New-Object -TypeName System.Management.Automation.ErrorRecord `
            -ArgumentList $exception, $errorId, $errorCategory, $null

        $PSCmdlet.ThrowTerminatingError($errorRecord)
    }

    return $desiredConfigurationMatch
} # Test-TargetResource

Export-ModuleMember -Function *-TargetResource
