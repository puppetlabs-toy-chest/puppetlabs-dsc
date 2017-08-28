$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Certificate Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
                               -ChildPath (Join-Path -Path 'DFSDsc.ResourceHelper' `
                                                     -ChildPath 'DFSDsc.ResourceHelper.psm1'))

# Import Localization Strings
$localizedData = Get-LocalizedData `
    -ResourceName 'MSFT_xDFSReplicationGroupMembership' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
    Returns the current state of a DFS Replication Group Membership.

    .PARAMETER GroupName
    The name of the DFS Replication Group.

    .PARAMETER FolderName
    The name of the DFS Replication Group Folder.

    .PARAMETER ComputerName
    The computer name of the Replication Group member. This can be
    specified using either the ComputerName or FQDN name for the member.
    If an FQDN name is used and the DomainName parameter is set, the FQDN
    domain name must match.

    .PARAMETER DomainName
    The name of the AD Domain the DFS Replication Group this replication
    group is in.
#>
function Get-TargetResource
{
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $GroupName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $FolderName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ComputerName,

        [Parameter()]
        [System.String]
        $DomainName
    )

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.GettingReplicationGroupMembershipMessage) `
            -f $GroupName,$FolderName,$ComputerName
        ) -join '' )

    # Lookup the existing Replication Group
    $membershipParameters = @{
        GroupName = $GroupName
        ComputerName = $ComputerName
    }

    $returnValue = $membershipParameters

    if ($DomainName)
    {
        $membershipParameters += @{
            DomainName = $DomainName
        }
    }

    $returnValue += @{
        FolderName = $FolderName
    }

    $replicationGroupMembership = Get-DfsrMembership @membershipParameters `
        -ErrorAction Stop `
        | Where-Object { $_.FolderName -eq $FolderName }

    if ($replicationGroupMembership)
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupMembershipExistsMessage) `
                -f $GroupName,$FolderName,$ComputerName
            ) -join '' )

        $returnValue.ComputerName = $replicationGroupMembership.ComputerName

        $returnValue += @{
            ContentPath = $replicationGroupMembership.ContentPath
            StagingPath = $replicationGroupMembership.StagingPath
            ConflictAndDeletedPath = $replicationGroupMembership.ConflictAndDeletedPath
            ReadOnly = $replicationGroupMembership.ReadOnly
            PrimaryMember = $replicationGroupMembership.PrimaryMember
            DomainName = $replicationGroupMembership.DomainName
        }
    }
    else
    {
        # The Rep Group membership doesn't exist
        New-InvalidOperationException `
            -Message ($($LocalizedData.ReplicationGroupMembershipMissingError) `
                -f $GroupName,$FolderName,$ComputerName)
    }

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
    Sets DFS Replication Group Membership.

    .PARAMETER GroupName
    The name of the DFS Replication Group.

    .PARAMETER FolderName
    The name of the DFS Replication Group Folder.

    .PARAMETER ComputerName
    The computer name of the Replication Group member. This can be
    specified using either the ComputerName or FQDN name for the member.
    If an FQDN name is used and the DomainName parameter is set, the FQDN
    domain name must match.

    .PARAMETER ContentPath
    The local content path for the DFS Replication Group Folder.

    .PARAMETER StagingPath
    The local staging path for the DFS Replication Group Folder.

    .PARAMETER ReadOnly
    Specify if this content path should be read only.

    .PARAMETER PrimaryMember
    Used to configure this as the Primary Member. Every folder must
    have at least one primary member for initial replication to take
    place.

    .PARAMETER DomainName
    The name of the AD Domain the DFS Replication Group this replication
    group is in.
#>
function Set-TargetResource
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $GroupName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $FolderName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ComputerName,

        [Parameter()]
        [System.String]
        $ContentPath,

        [Parameter()]
        [System.String]
        $StagingPath,

        [Parameter()]
        [System.Boolean]
        $ReadOnly,

        [Parameter()]
        [System.Boolean]
        $PrimaryMember,

        [Parameter()]
        [System.String]
        $DomainName
    )

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.SettingRegGroupMembershipMessage) `
            -f $GroupName,$FolderName,$ComputerName
        ) -join '' )

    # Now apply the changes
    Set-DfsrMembership @PSBoundParameters `
        -ErrorAction Stop

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.ReplicationGroupMembershipUpdatedMessage) `
            -f $GroupName,$FolderName,$ComputerName
        ) -join '' )
} # Set-TargetResource

<#
    .SYNOPSIS
    Tests DFS Replication Group Membership.

    .PARAMETER GroupName
    The name of the DFS Replication Group.

    .PARAMETER FolderName
    The name of the DFS Replication Group Folder.

    .PARAMETER ComputerName
    The computer name of the Replication Group member. This can be
    specified using either the ComputerName or FQDN name for the member.
    If an FQDN name is used and the DomainName parameter is set, the FQDN
    domain name must match.

    .PARAMETER ContentPath
    The local content path for the DFS Replication Group Folder.

    .PARAMETER StagingPath
    The local staging path for the DFS Replication Group Folder.

    .PARAMETER ReadOnly
    Specify if this content path should be read only.

    .PARAMETER PrimaryMember
    Used to configure this as the Primary Member. Every folder must
    have at least one primary member for initial replication to take
    place.

    .PARAMETER DomainName
    The name of the AD Domain the DFS Replication Group this replication
    group is in.
#>
function Test-TargetResource
{
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $GroupName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $FolderName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ComputerName,

        [Parameter()]
        [System.String]
        $ContentPath,

        [Parameter()]
        [System.String]
        $StagingPath,

        [Parameter()]
        [System.Boolean]
        $ReadOnly,

        [Parameter()]
        [System.Boolean]
        $PrimaryMember,

        [Parameter()]
        [System.String]
        $DomainName
    )

    # Flag to signal whether settings are correct
    [System.Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.TestingRegGroupMembershipMessage) `
            -f $GroupName,$FolderName,$ComputerName
        ) -join '' )

    # Lookup the existing Replication Group
    $membershipParameters = @{
        GroupName = $GroupName
        ComputerName = $ComputerName
    }

    if ($DomainName)
    {
        $membershipParameters += @{
            DomainName = $DomainName
        }
    }

    $replicationGroupMembership = Get-DfsrMembership @membershipParameters `
        -ErrorAction Stop `
        | Where-Object { $_.FolderName -eq $FolderName }

    if ($replicationGroupMembership)
    {
        # The rep group folder is found
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupMembershipExistsMessage) `
                -f $GroupName,$FolderName,$ComputerName
            ) -join '' )

        # Check the ContentPath
        if (($PSBoundParameters.ContainsKey('ContentPath')) `
            -and ($replicationGroupMembership.ContentPath -ne $ContentPath))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupMembershipContentPathMismatchMessage) `
                    -f $GroupName,$FolderName,$ComputerName
                ) -join '' )

            $desiredConfigurationMatch = $false
        } # if

        # Check the StagingPath
        if (($PSBoundParameters.ContainsKey('StagingPath')) `
            -and ($replicationGroupMembership.StagingPath -ne $StagingPath))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupMembershipStagingPathMismatchMessage) `
                    -f $GroupName,$FolderName,$ComputerName
                ) -join '' )

            $desiredConfigurationMatch = $false
        } # if

        # Check the ReadOnly
        if (($PSBoundParameters.ContainsKey('ReadOnly')) `
            -and ($replicationGroupMembership.ReadOnly -ne $ReadOnly))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupMembershipReadOnlyMismatchMessage) `
                    -f $GroupName,$FolderName,$ComputerName
                ) -join '' )

            $desiredConfigurationMatch = $false
        } # if

        # Check the PrimaryMember
        if (($PSBoundParameters.ContainsKey('PrimaryMember')) `
            -and ($replicationGroupMembership.PrimaryMember -ne $PrimaryMember))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupMembershipPrimaryMemberMismatchMessage) `
                    -f $GroupName,$FolderName,$ComputerName
                ) -join '' )

            $desiredConfigurationMatch = $false
        } # if
    }
    else
    {
        # The Rep Group membership doesn't exist
        New-InvalidOperationException `
            -Message ($($LocalizedData.ReplicationGroupMembershipMissingError) `
                -f $GroupName,$FolderName,$ComputerName)
    } # if

    return $desiredConfigurationMatch
} # Test-TargetResource

Export-ModuleMember -Function *-TargetResource
