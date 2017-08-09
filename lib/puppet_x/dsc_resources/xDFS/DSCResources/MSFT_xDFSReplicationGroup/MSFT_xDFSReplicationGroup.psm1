$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Certificate Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
                               -ChildPath (Join-Path -Path 'DFSDsc.ResourceHelper' `
                                                     -ChildPath 'DFSDsc.ResourceHelper.psm1'))

# Import Localization Strings
$localizedData = Get-LocalizedData `
    -ResourceName 'MSFT_xDFSReplicationGroup' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
    Returns the current state of a DFS Replication Group.

    .PARAMETER GroupName
    The name of the DFS Replication Group.

    .PARAMETER Ensure
    Specifies whether the DSF Replication Group should exist.

    .PARAMETER DomainName
    The AD domain the Replication Group should created in.
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
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure,

        [Parameter()]
        [System.String]
        $DomainName
    )

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.GettingReplicationGroupMessage) `
            -f $GroupName
        ) -join '' )

    # Lookup the existing Replication Group
    $replicationGroupParameters = @{
        GroupName = $GroupName
    }

    $returnValue = $replicationGroupParameters.Clone()

    if ($DomainName)
    {
        $replicationGroupParameters += @{
            DomainName = $DomainName
        }
    } # if

    $replicationGroup = Get-DfsReplicationGroup @replicationGroupParameters `
        -ErrorAction Stop

    if ($replicationGroup)
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupExistsMessage) `
                -f $GroupName
            ) -join '' )

        <#
            Array paramters are disabled until this issue is resolved:
            https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/11088807-get-dscconfiguration-fails-with-embedded-cim-type
            When resolved these parameters can be added into return value
            Members = @((Get-DfsrMember @replicationGroupParameters -ErrorAction Stop).ComputerName)
            Folders = @((Get-DfsReplicatedFolder @replicationGroupParameters -ErrorAction Stop).FolderName)
        #>
        $returnValue += @{
            Ensure = 'Present'
            Description = $replicationGroup.Description
            DomainName = $replicationGroup.DomainName
            Members = @()
            Folders = @()
            ContentPaths = @()
        }
    }
    else
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupDoesNotExistMessage) `
                -f $GroupName
            ) -join '' )

        $returnValue += @{
            Ensure = 'Absent'
        }
    } # if

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
    Sets the current state of a DFS Replication Group.

    .PARAMETER GroupName
    The name of the DFS Replication Group.

    .PARAMETER Ensure
    Specifies whether the DSF Replication Group should exist.

    .PARAMETER Description
    A description for the DFS Replication Group.

    .PARAMETER Members
    A list of computers that are members of this Replication Group.
    These can be specified using either the ComputerName or FQDN name
    for each member. If an FQDN name is used and the DomainName
    parameter is set, the FQDN domain name must match.

    .PARAMETER Folders
    A list of folders that are replicated in this Replication Group.

    .PARAMETER Topology
    This allows a replication topology to assign to the Replication Group.
    It defaults to Manual, which will not automatically create a topology.
    If set to Fullmesh, a full mesh topology between all members will be
    created.

    .PARAMETER ContentPaths
    An array of DFS Replication Group Content Paths to use for each of the
    Folders. This can have one entry for each Folder in the Folders
    parameter and should be set in th same order. If any entry is not blank
    then the Content Paths will need to be set manually by
    using the xDFSReplicationGroupMembership resource.

    .PARAMETER DomainName
    The AD domain the Replication Group should created in.
#>
function Set-TargetResource
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $GroupName,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $Members,

        [Parameter()]
        [System.String[]]
        $Folders,

        [Parameter()]
        [ValidateSet('Fullmesh','Manual')]
        [System.String]
        $Topology = 'Manual',

        [Parameter()]
        [System.String[]]
        $ContentPaths,

        [Parameter()]
        [System.String]
        $DomainName
    )

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.SettingRegGroupMessage) `
            -f $GroupName
        ) -join '' )

    # Lookup the existing Replication Group
    $replicationGroupParameters = @{
        GroupName = $GroupName
    }

    if ($DomainName)
    {
        $replicationGroupParameters += @{
            DomainName = $DomainName
        }
    } # if

    $replicationGroup = Get-DfsReplicationGroup @replicationGroupParameters `
        -ErrorAction Stop

    if ($Ensure -eq 'Present')
    {
        # The rep group should exist
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.EnsureReplicationGroupExistsMessage) `
                -f $GroupName
            ) -join '' )

        if ($Description)
        {
            $replicationGroupParameters += @{
                Description = $Description
            }
        } # if

        if ($replicationGroup)
        {
            # The RG exists already - Check the existing RG and members
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupExistsMessage) `
                    -f $GroupName
                ) -join '' )

            # Check the description
            if (($Description) -and ($replicationGroup.Description -ne $Description))
            {
                Set-DfsReplicationGroup @replicationGroupParameters -ErrorAction Stop

                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupDescriptionUpdatedMessage) `
                        -f $GroupName
                    ) -join '' )
            } # if
        }
        else
        {
            # Ths Rep Groups doesn't exist - Create it
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupDoesNotExistMessage) `
                    -f $GroupName
                ) -join '' )

            New-DfsReplicationGroup @replicationGroupParameters -ErrorAction Stop

            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupCreatedMessage) `
                    -f $GroupName
                ) -join '' )
        } # if

        # Clean up the splat so we can use it in the next cmdlets
        $replicationGroupParameters.Remove('Description')

        # Create an array of FQDN Members from the Members Array
        $replicationGroupParameters += @{
            ComputerName = ''
        }

        foreach ($member in $Members)
        {
            $replicationGroupParameters.ComputerName = $member
            $fqdnMembers += @(  
                Get-FQDNMemberName @replicationGroupParameters
            )
        } # foreach

        $replicationGroupParameters.Remove('ComputerName')

        # Get the existing members of this DFS Rep Group
        $existingMembers = (Get-DfsrMember @replicationGroupParameters -ErrorAction Stop).DnsName

        # Add any missing members
        foreach ($Member in $fqdnMembers)
        {
            if ($member -notin $existingMembers)
            {
                # Member is missing - add it
                Add-DfsrMember @replicationGroupParameters `
                    -ComputerName $member `
                    -ErrorAction Stop

                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupMemberAddedMessage) `
                        -f $GroupName,$member
                    ) -join '' )
            } # if
        } # foreach

        # Remove any members that shouldn't exist
        foreach ($existingMember in $existingMembers)
        {
            if ($existingMember -notin $fqdnMembers)
            {
                # Member exists but shouldn't - remove it
                Remove-DfsrMember @replicationGroupParameters `
                    -ComputerName $existingMember `
                    -Force `
                    -ErrorAction Stop

                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupMemberRemovedMessage) `
                        -f $GroupName,$existingMember
                    ) -join '' )
            } # if
        } # foreach

        # Get the existing folders of this DFS Rep Group
        $existingFolders = (Get-DfsReplicatedFolder @replicationGroupParameters -ErrorAction Stop).FolderName

        # Add any missing folders
        foreach ($folder in $Folders)
        {
            if ($folder -notin $existingFolders)
            {
                # Folder is missing - add it
                New-DfsReplicatedFolder @replicationGroupParameters `
                    -FolderName $folder `
                    -ErrorAction Stop

                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupFolderAddedMessage) `
                        -f $GroupName,$folder
                    ) -join '' )
            } # if
        } # foreach

        # Remove any folders that shouldn't exist
        foreach ($existingFolder in $existingFolders)
        {
            if ($existingFolder -notin $Folders)
            {
                # Folder exists but shouldn't - remove it
                Remove-DfsReplicatedFolder @replicationGroupParameters `
                    -Folder $existingFolder `
                    -Force `
                    -ErrorAction Stop

                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupFolderRemovedMessage) `
                        -f $GroupName,$existingFolder
                    ) -join '' )
            } # if
        } # foreach

        # Set the content paths (if any were passed in the array)
        if ($ContentPaths)
        {
            # Get the current memberships for this rep group
            $memberships = Get-DfsrMembership @replicationGroupParameters `
                -ErrorAction Stop

            # Scan through the content paths array
            for ($i=0; $i -lt $Folders.Count; $i++)
            {
                $contentPath = $ContentPaths[$i]
                if ($contentPath)
                {
                     foreach ($membership in $memberships)
                     {
                        [System.String] $fqdnMemberName = Get-FQDNMemberName `
                            @replicationGroupParameters `
                            -ComputerName $membership.ComputerName

                        [System.Boolean] $primaryMember = ($fqdnMemberName -eq $fqdnMembers[0])

                        if (($membership.FolderName -ne $Folders[$i]) `
                            -or (($membership.ContentPath -eq $ContentPath) `
                            -and ($membership.PrimaryMember -eq $primaryMember)))
                        {
                            # Don't update this membership
                            continue
                        }

                        # The Content Path for this member needs to be set
                        Set-DfsrMembership @replicationGroupParameters `
                            -FolderName $membership.FolderName `
                            -ComputerName $membership.ComputerName `
                            -PrimaryMember $primaryMember `
                            -ContentPath $ContentPath

                        Write-Verbose -Message ( @(
                            "$($MyInvocation.MyCommand): "
                            $($LocalizedData.ReplicationGroupContentPathUpdatedMessage) `
                                -f $GroupName,$membership.ComputerName
                            ) -join '' )
                    } # foreach
                } # if
            } # foreach
        } # if

        # If the topology is not manual, automatically configure the connections
        switch ($Topology)
        {
            'Fullmesh'
            {
                $replicationGroupParameters += @{
                    SourceComputerName = ''
                    DestinationComputerName = ''
                }

                # Scan through the combination of connections
                foreach ($source in $fqdnMembers)
                {
                    foreach ($destination in $fqdnMembers)
                    {
                        if ($source -eq $destination)
                        {
                            continue
                        } # if

                        $replicationGroupParameters.SourceComputerName = $source
                        $replicationGroupParameters.DestinationComputerName = $destination

                        $replicationGroupConnection = Get-DfsrConnection @replicationGroupParameters `
                            -ErrorAction Stop

                        if ($replicationGroupConnection) {
                            if (-not $replicationGroupConnection.Enabled) {
                                Set-DfsrConnection @replicationGroupParameters `
                                    -DisableConnection $false `
                                    -ErrorAction Stop

                                Write-Verbose -Message ( @(
                                    "$($MyInvocation.MyCommand): "
                                        $($LocalizedData.ReplicationGroupFullMeshConnectionUpdatedMessage) `
                                        -f  $GroupName,$source,$destination
                                    ) -join '' )
                            } # if
                        }
                        else
                        {
                            Add-DfsrConnection @replicationGroupParameters `
                                -ErrorAction Stop

                            Write-Verbose -Message ( @(
                                "$($MyInvocation.MyCommand): "
                                    $($LocalizedData.ReplicationGroupFullMeshConnectionAddedMessage) `
                                    -f  $GroupName,$source,$destination
                                ) -join '' )
                        } # if
                    } # foreach
                } # foreach
            } # 'Fullmesh'
        } # swtich
    }
    else
    {
        # The Rep Group should not exist
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.EnsureReplicationGroupDoesNotExistMessage) `
                -f $GroupName
            ) -join '' )

        if ($replicationGroup)
        {
            # Remove the replication group
            Remove-DfsReplicationGroup @replicationGroupParameters `
                -RemoveReplicatedFolders `
                -Force `
                -ErrorAction Stop

            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupExistsRemovedMessage) `
                    -f $GroupName
                ) -join '' )
        }
    } # if
} # Set-TargetResource

<#
    .SYNOPSIS
    Tests the current state of a DFS Replication Group.

    .PARAMETER GroupName
    The name of the DFS Replication Group.

    .PARAMETER Ensure
    Specifies whether the DSF Replication Group should exist.

    .PARAMETER Description
    A description for the DFS Replication Group.

    .PARAMETER Members
    A list of computers that are members of this Replication Group.
    These can be specified using either the ComputerName or FQDN name
    for each member. If an FQDN name is used and the DomainName
    parameter is set, the FQDN domain name must match.

    .PARAMETER Folders
    A list of folders that are replicated in this Replication Group.

    .PARAMETER Topology
    This allows a replication topology to assign to the Replication Group.
    It defaults to Manual, which will not automatically create a topology.
    If set to Fullmesh, a full mesh topology between all members will be
    created.

    .PARAMETER ContentPaths
    An array of DFS Replication Group Content Paths to use for each of the
    Folders. This can have one entry for each Folder in the Folders
    parameter and should be set in th same order. If any entry is not blank
    then the Content Paths will need to be set manually by
    using the xDFSReplicationGroupMembership resource.

    .PARAMETER DomainName
    The AD domain the Replication Group should created in.
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
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $Members,

        [Parameter()]
        [System.String[]]
        $Folders,

        [Parameter()]
        [ValidateSet('Fullmesh','Manual')]
        [System.String]
        $Topology = 'Manual',

        [Parameter()]
        [System.String[]]
        $ContentPaths,

        [Parameter()]
        [System.String]
        $DomainName
    )

    # Flag to signal whether settings are correct
    [System.Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.TestingRegGroupMessage) `
            -f $GroupName
        ) -join '' )

    # Lookup the existing Replication Group
    $replicationGroupParameters = @{
        GroupName = $GroupName
    }

    if ($DomainName)
    {
        $replicationGroupParameters += @{
            DomainName = $DomainName
        }
    } # if

    $replicationGroup = Get-DFSReplicationGroup @replicationGroupParameters `
        -ErrorAction Stop

    if ($Ensure -eq 'Present')
    {
        # The RG should exist
        if ($replicationGroup)
        {
            # The RG exists already
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupExistsMessage) `
                    -f $GroupName
                ) -join '' )

            # Check the description
            if (($Description) -and ($replicationGroup.Description -ne $Description))
            {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupDescriptionNeedsUpdateMessage) `
                        -f $GroupName
                    ) -join '' )

                $desiredConfigurationMatch = $false
            } # if

            # Create an array of FQDN Members from the Members Array
            $replicationGroupParameters += @{
                ComputerName = ''
            }

            foreach ($member in $Members)
            {
                $replicationGroupParameters.ComputerName = $member
                $fqdnMembers += @( Get-FQDNMemberName @replicationGroupParameters )
            } # foreach

            $replicationGroupParameters.Remove('ComputerName')

            # Compare the Members
            $existingMembers = @((Get-DfsrMember @replicationGroupParameters -ErrorAction Stop).DnsName)
            if ((Compare-Object `
                -ReferenceObject $fqdnMembers `
                -DifferenceObject $existingMembers).Count -ne 0)
            {
                # There is a member different of some kind.
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupMembersNeedUpdateMessage) `
                        -f $GroupName
                    ) -join '' )

                $desiredConfigurationMatch = $false
            } # if

            # Compare the Folders
            $existingFolders = @((Get-DfsReplicatedFolder @replicationGroupParameters -ErrorAction Stop).FolderName)

            if ((Compare-Object `
                -ReferenceObject $Folders `
                -DifferenceObject $existingFolders).Count -ne 0)
            {
                # There is a folder different of some kind.
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupFoldersNeedUpdateMessage) `
                        -f $GroupName
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            # Get the content paths (if any were passed in the array)
            if ($ContentPaths)
            {
                # Get the current memberships for this rep group
                $memberships = Get-DfsrMembership @replicationGroupParameters `
                    -ErrorAction Stop

                # Scan through the content paths array
                for ($i=0; $i -lt $Folders.Count; $i++)
                {
                    $contentPath = $ContentPaths[$i]

                    if ($contentPath)
                    {
                        foreach ($membership in $memberships)
                        {
                            [System.Boolean] $primaryMember = ($membership.ComputerName -eq $Members[0])

                            if (($membership.FolderName -ne $Folders[$i]) `
                                -or (($membership.ContentPath -eq $contentPath) `
                                -and ($membership.PrimaryMember -eq $primaryMember)))
                            {
                                # This membership is in the correct state.
                                continue
                            }

                            Write-Verbose -Message ( @(
                                "$($MyInvocation.MyCommand): "
                                $($LocalizedData.ReplicationGroupContentPathNeedUpdateMessage) `
                                    -f $GroupName,$membership.ComputerName
                                ) -join '' )

                            $desiredConfigurationMatch = $false
                        } # if
                    } # if
                } # foreach
            } # if

            # If the topology is not manual, check the connections are configured
            switch ($Topology)
            {
                'Fullmesh'
                {
                    $replicationGroupParameters += @{
                        SourceComputerName = ''
                        DestinationComputerName = ''
                    }

                    # Scan through the combination of connections
                    foreach ($source in $fqdnMembers)
                    {
                        foreach ($destination in $fqdnMembers)
                        {
                            if ($source -eq $destination)
                            {
                                continue
                            } # if

                            $replicationGroupParameters.SourceComputerName = $source
                            $replicationGroupParameters.DestinationComputerName = $destination

                            $replicationGroupConnection = Get-DfsrConnection @replicationGroupParameters `
                                -ErrorAction Stop

                            if ($replicationGroupConnection)
                            {
                                if (-not $replicationGroupConnection.Enabled)
                                {
                                    Write-Verbose -Message ( @(
                                        "$($MyInvocation.MyCommand): "
                                         $($LocalizedData.ReplicationGroupFullMeshDisabledConnectionMessage) `
                                            -f  $GroupName,$source,$destination
                                        ) -join '' )

                                    $desiredConfigurationMatch = $false
                                } # if
                            }
                            else
                            {
                                Write-Verbose -Message ( @(
                                    "$($MyInvocation.MyCommand): "
                                     $($LocalizedData.ReplicationGroupFullMeshMissingConnectionMessage) `
                                        -f  $GroupName,$source,$destination
                                    ) -join '' )

                                $desiredConfigurationMatch = $false
                            } # if
                        } # foreach
                    } # foreach
                } # 'fullmesh'
            } # switch
        }
        else
        {
            # Ths RG doesn't exist but should
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                 $($LocalizedData.ReplicationGroupDoesNotExistButShouldMessage) `
                    -f  $GroupName
                ) -join '' )

            $desiredConfigurationMatch = $false
        } # if
    }
    else
    {
        # The RG should not exist
        if ($replicationGroup)
        {
            # The RG exists but should not
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                 $($LocalizedData.ReplicationGroupExistsButShouldNotMessage) `
                    -f $GroupName
                ) -join '' )

            $desiredConfigurationMatch = $false
        }
        else
        {
            # The RG does not exist and should not
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupDoesNotExistAndShouldNotMessage) `
                    -f $GroupName
                ) -join '' )
        } # if
    } # if

    return $desiredConfigurationMatch
} # Test-TargetResource

<#
.SYNOPSIS
    Returns the FQDN Member name based on the ComputerName and DomainName that are provided.

    If the ComputerName is already an FQDN but the domain in the FQDN does not match the
    value passed in DomainName then throw an exception.

    If the ComputerName is already an FQDN and the domain in the FQDN does match the value
    passed in DomainName then the existing ComputerName is returned.

    If the ComputerName is not already an FQDN and the DomainName passed is not empty then
    the ComputerName and DomainName are combined and returned.

    If the ComputerName is not already an FQDN and the DomainName passed is empty then
    the ComputerName is returned.

    .PARAMETER GroupName
    The name of the DFS Replication Group.

    .PARAMETER ComputerName
    The computer name of the DFS Replication Group member.

    .PARAMETER DomainName
    The AD domain the Replication Group should created in.
#>
function Get-FQDNMemberName
{
    [OutputType([System.String])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $GroupName,

        [Parameter(Mandatory = $true)]
        [System.String]
        $ComputerName,

        [Parameter()]
        [System.String]
        $DomainName
    )

    if ($ComputerName.Contains('.'))
    {
        if (($null -ne $DomainName) -and ($DomainName -ne ''))
        {
            if ($ComputerName -like "*.$DomainName")
            {
                return $ComputerName.ToLower()
            }
            else
            {
                New-InvalidOperationException `
                    -Message ($($LocalizedData.ReplicationGroupDomainMismatchError `
                        -f $GroupName,$ComputerName,$DomainName))
            } # if
        }
        else
        {
            return $ComputerName.ToLower()
        }
    }
    else
    {
        if (($null -ne $DomainName) -and ($DomainName -ne ''))
        {
            return "$ComputerName.$DomainName".ToLower()
        }
        else
        {
            return $ComputerName.ToLower()
        } # if
    } # if
} # Get-FQDNMemberName

Export-ModuleMember -Function *-TargetResource
