data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData -StringData @'
GettingReplicationGroupMessage=Getting DFS Replication Group "{0}".
ReplicationGroupExistsMessage=DFS Replication Group "{0}" exists.
ReplicationGroupDoesNotExistMessage=DFS Replication Group "{0}" does not exist.
SettingRegGroupMessage=Setting DFS Replication Group "{0}".
EnsureReplicationGroupExistsMessage=Ensuring DFS Replication Group "{0}" exists.
EnsureReplicationGroupDoesNotExistMessage=Ensuring DFS Replication Group "{0}" does not exist.
ReplicationGroupCreatedMessage=DFS Replication Group "{0}" has been created.
ReplicationGroupDescriptionUpdatedMessage=DFS Replication Group "{0}" description has been updated.
ReplicationGroupMemberAddedMessage=DFS Replication Group "{0}" added member "{2}".
ReplicationGroupMemberRemovedMessage=DFS Replication Group "{0}" removed member "{2}".
ReplicationGroupFolderAddedMessage=DFS Replication Group "{0}" added folder "{2}".
ReplicationGroupFolderRemovedMessage=DFS Replication Group "{0}" removed folder "{2}".
ReplicationGroupContentPathUpdatedMessage=DFS Replication Group "{0}" Content Path for "{2}" updated.
ReplicationGroupExistsRemovedMessage=DFS Replication Group "{0}" existed, but has been removed.
ReplicationGroupFullMeshConnectionAddedMessage=DFS Replication Group "{0}" Fullmesh Connection from "{2}" to "{3}" added.
ReplicationGroupFullMeshConnectionUpdatedMessage=DFS Replication Group "{0}" Fullmesh Connection from "{2}" to "{3}" updated.
TestingRegGroupMessage=Testing DFS Replication Group "{0}".
ReplicationGroupDescriptionNeedsUpdateMessage=DFS Replication Group "{0}" description is different. Change required.
ReplicationGroupMembersNeedUpdateMessage=DFS Replication Group "{0}" members are different. Change required.
ReplicationGroupFoldersNeedUpdateMessage=DFS Replication Group "{0}" folders are different. Change required.
ReplicationGroupContentPathNeedUpdateMessage=DFS Replication Group "{0}" Content Path for "{2}" is different. Change required.
ReplicationGroupDoesNotExistButShouldMessage=DFS Replication Group "{0}" does not exist but should. Change required.
ReplicationGroupExistsButShouldNotMessage=DFS Replication Group "{0}" exists but should not. Change required.
ReplicationGroupDoesNotExistAndShouldNotMessage=DFS Replication Group "{0}" does not exist and should not. Change not required.
ReplicationGroupFullMeshMissingConnectionMessage=DFS Replication Group "{0}" Fullmesh Connection from "{2}" to "{3}" does not exist. Change required.
ReplicationGroupFullMeshDisabledConnectionMessage=DFS Replication Group "{0}" Fullmesh Connection from "{2}" to "{3}" is disabled. Change required.
ReplicationGroupDomainMismatchError=DFS Replication Group "{0}" Domain name in Member "{1}" does not match DomainName "{2}". Configuration correction required.
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
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure,

        [String]
        $DomainName
    )
    
    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.GettingReplicationGroupMessage) `
            -f $GroupName,$DomainName
        ) -join '' )

    # Lookup the existing Replication Group
    $Splat = @{ GroupName = $GroupName }
    $returnValue = $splat.Clone()
    if ($DomainName)
    {
        $Splat += @{ DomainName = $DomainName }
    }
    $ReplicationGroup = Get-DfsReplicationGroup @Splat `
        -ErrorAction Stop
    if ($ReplicationGroup)
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupExistsMessage) `
                -f $GroupName,$DomainName
            ) -join '' )
          
        # Array paramters are disabled until this issue is resolved:
        # https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/11088807-get-dscconfiguration-fails-with-embedded-cim-type
        $returnValue += @{
            Ensure = 'Present'
            Description = $ReplicationGroup.Description
            DomainName = $ReplicationGroup.DomainName
            # Members = @((Get-DfsrMember @Splat -ErrorAction Stop).ComputerName)
            # Folders = @((Get-DfsReplicatedFolder @Splat -ErrorAction Stop).FolderName)
            # ContentPaths = @()
        }
    }
    else
    {       
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupDoesNotExistMessage) `
                -f $GroupName,$DomainName
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
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure,

        [String]
        $Description,

        [String[]]
        $Members,

        [String[]]
        $Folders,

        [ValidateSet('Fullmesh','Manual')]
        [String]
        $Topology = 'Manual',

        [String[]]
        $ContentPaths,

        [String]
        $DomainName
    )

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.SettingRegGroupMessage) `
            -f $GroupName,$DomainName
        ) -join '' )

    # Lookup the existing Replication Group
    $Splat = @{ GroupName = $GroupName }
    if ($DomainName)
    {
        $Splat += @{ DomainName = $DomainName }
    }
    $ReplicationGroup = Get-DfsReplicationGroup @Splat `
        -ErrorAction Stop

    if ($Ensure -eq 'Present')
    {
        # The rep group should exist
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.EnsureReplicationGroupExistsMessage) `
                -f $GroupName,$DomainName
            ) -join '' )

        if ($Description)
        {
            $Splat += @{ Description = $Description }
        } # if

        if ($ReplicationGroup)
        {
            # The RG exists already - Check the existing RG and members
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupExistsMessage) `
                    -f $GroupName,$DomainName
                ) -join '' )
            # Check the description
            if (($Description) -and ($ReplicationGroup.Description -ne $Description))
            {
                Set-DfsReplicationGroup @Splat -ErrorAction Stop
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupDescriptionUpdatedMessage) `
                        -f $GroupName,$DomainName
                    ) -join '' )
            } # if
        }
        else
        {
            # Ths Rep Groups doesn't exist - Create it
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupDoesNotExistMessage) `
                    -f $GroupName,$DomainName
                ) -join '' )
            New-DfsReplicationGroup @Splat -ErrorAction Stop
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupCreatedMessage) `
                    -f $GroupName,$DomainName
                ) -join '' )

        } # if

        # Clean up the splat so we can use it in the next cmdlets
        $Splat.Remove('Description')
        
        # Create an array of FQDN Members from the Members Array
        $Splat += @{ ComputerName = '' }
        foreach ($Member in $Members)
        {
            $Splat.ComputerName = $Member
            $FQDNMembers += @( Get-FQDNMemberName @Splat )
        }
        $Splat.Remove('ComputerName')
        
        # Get the existing members of this DFS Rep Group
        $ExistingMembers = (Get-DfsrMember @Splat -ErrorAction Stop).DnsName

        # Add any missing members
        foreach ($Member in $FQDNMembers) 
        {
            if ($Member -notin $ExistingMembers)
            {
                # Member is missing - add it
                Add-DfsrMember @Splat `
                    -ComputerName $Member `
                    -ErrorAction Stop
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupMemberAddedMessage) `
                        -f $GroupName,$DomainName,$Member
                    ) -join '' )
            } # if
        } # foreach

        # Remove any members that shouldn't exist
        foreach ($ExistingMember in $ExistingMembers)
        {
            if ($ExistingMember -notin $FQDNMembers)
            {
                # Member exists but shouldn't - remove it
                Remove-DfsrMember @Splat `
                    -ComputerName $ExistingMember `
                    -Force `
                    -ErrorAction Stop
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupMemberRemovedMessage) `
                        -f $GroupName,$DomainName,$ExistingMember
                    ) -join '' )
            } # if
        } # foreach

        # Get the existing folders of this DFS Rep Group
        $ExistingFolders = (Get-DfsReplicatedFolder @Splat -ErrorAction Stop).FolderName

        # Add any missing folders
        foreach ($Folder in $Folders)
        {
            if ($Folder -notin $ExistingFolders)
            {
                # Folder is missing - add it
                New-DfsReplicatedFolder @Splat `
                    -FolderName $Folder `
                    -ErrorAction Stop
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupFolderAddedMessage) `
                        -f $GroupName,$DomainName,$Folder
                    ) -join '' )
            } # if
        } # foreach

        # Remove any folders that shouldn't exist
        foreach ($ExistingFolder in $ExistingFolders)
        {
            if ($ExistingFolder -notin $Folders)
            {
                # Folder exists but shouldn't - remove it
                Remove-DfsReplicatedFolder @Splat `
                    -Folder $ExistingFolder `
                    -Force `
                    -ErrorAction Stop
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupFolderRemovedMessage) `
                        -f $GroupName,$DomainName,$ExistingFolder
                    ) -join '' )
            } # if
        } # foreach

        # Set the content paths (if any were passed in the array)
        if ($ContentPaths)
        {
            # Get the current memberships for this rep group
            $memberships = Get-DfsrMembership @Splat `
                -ErrorAction Stop
            # Scan through the content paths array
            for ($i=0; $i -lt $Folders.Count; $i++)
            {
                $ContentPath = $ContentPaths[$i]
                if ($ContentPath)
                {
                     foreach ($membership in $memberships) 
                     {
                        
                        [String] $FQDNMemberName = Get-FQDNMemberName `
                            @Splat `
                            -ComputerName $membership.ComputerName
                        [Boolean] $primarymember = ($FQDNMemberName -eq $FQDNMembers[0])
                        if (($membership.FolderName -ne $Folders[$i]) `
                            -or (($membership.ContentPath -eq $ContentPath) `
                            -and ($membership.PrimaryMember -eq $primarymember)))
                        {
                            # Don't update this membership
                            continue
                        }
                        # The Content Path for this member needs to be set
                        Set-DfsrMembership @Splat `
                            -FolderName $membership.FolderName `
                            -ComputerName $membership.ComputerName `
                            -PrimaryMember $primarymember `
                            -ContentPath $ContentPath
                        Write-Verbose -Message ( @(
                            "$($MyInvocation.MyCommand): "
                            $($LocalizedData.ReplicationGroupContentPathUpdatedMessage) `
                                -f $GroupName,$DomainName,$membership.ComputerName
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
                $Splat += @{
                    SourceComputerName = ''
                    DestinationComputerName = ''
                }
                # Scan through the combination of connections
                foreach ($source in $FQDNMembers)
                {
                    foreach ($dest in $FQDNMembers)
                    {
                        if ($source -eq $dest)
                        {
                            continue
                        }
                        $Splat.SourceComputerName = $source
                        $Splat.DestinationComputerName = $dest
                        $ReplicationGroupConnection = Get-DfsrConnection @Splat `
                            -ErrorAction Stop
                        if ($ReplicationGroupConnection) {
                            if (-not $ReplicationGroupConnection.Enabled) {
                                Set-DfsrConnection @Splat `
                                    -DisableConnection $false `
                                    -ErrorAction Stop
                                Write-Verbose -Message ( @(
                                    "$($MyInvocation.MyCommand): "
                                        $($LocalizedData.ReplicationGroupFullMeshConnectionUpdatedMessage) `
                                        -f  $GroupName,$DomainName,$source,$dest
                                    ) -join '' )
                            }
                        }
                        else
                        {
                            Add-DfsrConnection @Splat `
                                -ErrorAction Stop
                            Write-Verbose -Message ( @(
                                "$($MyInvocation.MyCommand): "
                                    $($LocalizedData.ReplicationGroupFullMeshConnectionAddedMessage) `
                                    -f  $GroupName,$DomainName,$source,$dest
                                ) -join '' )
                        } # if
                    } # foreach
                } # foreach
            }
        } # swtich
    }
    else
    {
        # The Rep Group should not exist
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.EnsureReplicationGroupDoesNotExistMessage) `
                -f $GroupName,$DomainName
            ) -join '' )
        if ($ReplicationGroup)
        {
            # Remove the replication group
            Remove-DfsReplicationGroup @Splat `
                -RemoveReplicatedFolders `
                -Force `
                -ErrorAction Stop
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupExistsRemovedMessage) `
                    -f $GroupName,$DomainName
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
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure,

        [String]
        $Description,

        [String[]]
        $Members,

        [String[]]
        $Folders,

        [ValidateSet('Fullmesh','Manual')]
        [String]
        $Topology = 'Manual',

        [String[]]
        $ContentPaths,

        [String]
        $DomainName
    )

    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.TestingRegGroupMessage) `
            -f $GroupName,$DomainName
        ) -join '' )

    # Lookup the existing Replication Group
    $Splat = @{ GroupName = $GroupName }
    if ($DomainName)
    {
        $Splat += @{ DomainName = $DomainName }
    }
    $ReplicationGroup = Get-DFSReplicationGroup @Splat `
        -ErrorAction Stop

    if ($Ensure -eq 'Present')
    {
        # The RG should exist
        if ($ReplicationGroup)
        {
            # The RG exists already
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupExistsMessage) `
                    -f $GroupName,$DomainName
                ) -join '' )

            # Check the description
            if (($Description) -and ($ReplicationGroup.Description -ne $Description))
            {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupDescriptionNeedsUpdateMessage) `
                        -f $GroupName,$DomainName
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }

            # Create an array of FQDN Members from the Members Array
            $Splat += @{ ComputerName = '' }
            foreach ($Member in $Members)
            {
                $Splat.ComputerName = $Member
                $FQDNMembers += @( Get-FQDNMemberName @Splat )
            }
            $Splat.Remove('ComputerName')

            # Compare the Members
            $ExistingMembers = @((Get-DfsrMember @Splat -ErrorAction Stop).DnsName)
            if ((Compare-Object `
                -ReferenceObject $FQDNMembers `
                -DifferenceObject $ExistingMembers).Count -ne 0)
            {
                # There is a member different of some kind.
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupMembersNeedUpdateMessage) `
                        -f $GroupName,$DomainName
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }

            # Compare the Folders
            $ExistingFolders = @((Get-DfsReplicatedFolder @Splat -ErrorAction Stop).FolderName)
            if ((Compare-Object `
                -ReferenceObject $Folders `
                -DifferenceObject $ExistingFolders).Count -ne 0)
            {
                # There is a folder different of some kind.
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ReplicationGroupFoldersNeedUpdateMessage) `
                        -f $GroupName,$DomainName
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }

            # Get the content paths (if any were passed in the array)
            if ($ContentPaths)
            {
                # Get the current memberships for this rep group
                $memberships = Get-DfsrMembership @Splat `
                    -ErrorAction Stop
                # Scan through the content paths array
                for ($i=0; $i -lt $Folders.Count; $i++)
                {
                    $ContentPath = $ContentPaths[$i]
                    if ($ContentPath)
                    {
                        Foreach ($membership in $memberships)
                        {
                            [Boolean]$primarymember = ($membership.ComputerName -eq $Members[0])
                            if (($membership.FolderName -ne $Folders[$i]) `
                                -or (($membership.ContentPath -eq $ContentPath) `
                                -and ($membership.PrimaryMember -eq $primarymember)))
                            {
                                # This membership is in the correct state.
                                continue
                            }
                            Write-Verbose -Message ( @(
                                "$($MyInvocation.MyCommand): "
                                $($LocalizedData.ReplicationGroupContentPathNeedUpdateMessage) `
                                    -f $GroupName,$DomainName,$membership.ComputerName
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
                    $Splat += @{
                        SourceComputerName = ''
                        DestinationComputerName = ''
                    }
                    # Scan through the combination of connections
                    foreach ($source in $FQDNMembers)
                    {
                        foreach ($dest in $FQDNMembers)
                        {
                            if ($source -eq $dest)
                            {
                                continue
                            }
                            $Splat.SourceComputerName = $source
                            $Splat.DestinationComputerName = $dest
                            $ReplicationGroupConnection = Get-DfsrConnection @Splat `
                                -ErrorAction Stop
                            if ($ReplicationGroupConnection)
                            {
                                if (-not $ReplicationGroupConnection.Enabled)
                                {
                                    Write-Verbose -Message ( @(
                                        "$($MyInvocation.MyCommand): "
                                         $($LocalizedData.ReplicationGroupFullMeshDisabledConnectionMessage) `
                                            -f  $GroupName,$DomainName,$source,$dest
                                        ) -join '' )
                                    $desiredConfigurationMatch = $false
                                }
                            }
                            else
                            {
                                Write-Verbose -Message ( @(
                                    "$($MyInvocation.MyCommand): "
                                     $($LocalizedData.ReplicationGroupFullMeshMissingConnectionMessage) `
                                        -f  $GroupName,$DomainName,$source,$dest
                                    ) -join '' )
                                $desiredConfigurationMatch = $false
                            }
                        }
                    }
                }
            }
        }
        else
        {
            # Ths RG doesn't exist but should
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                 $($LocalizedData.ReplicationGroupDoesNotExistButShouldMessage) `
                    -f  $GroupName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
    }
    else
    {
        # The RG should not exist
        if ($ReplicationGroup)
        {
            # The RG exists but should not
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                 $($LocalizedData.ReplicationGroupExistsButShouldNotMessage) `
                    -f $GroupName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
        else
        {
            # The RG does not exist and should not
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupDoesNotExistAndShouldNotMessage) `
                    -f $GroupName,$DomainName
                ) -join '' )
        }
    } # if
    return $desiredConfigurationMatch
} # Test-TargetResource


# Helper functions
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
#>
function Get-FQDNMemberName
{
    [OutputType([System.String])]
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $GroupName,

        [parameter(Mandatory = $true)]
        [String]
        $ComputerName,

        [String]
        $DomainName
    )
    
    if ($ComputerName.Contains('.'))
    {
        if (($DomainName -ne $null) -and ($DomainName -ne ''))
        {
            if ($ComputerName -like "*.$DomainName")
            {
                return $ComputerName.ToLower()
            }
            else
            {
                $ExceptionParameters = @{
                    errorId = 'ReplicationGroupDomainMismatchError'
                    errorCategory = 'InvalidArgument'
                    errorMessage = $($LocalizedData.ReplicationGroupDomainMismatchError `
                        -f $GroupName,$ComputerName,$DomainName)
                }
                New-Exception @ExceptionParameters
            }
        }
        else
        {
            Return $ComputerName.ToLower()
        }
    }
    else
    {
        if (($DomainName -ne $null) -and ($DomainName -ne ''))
        {
            Return "$ComputerName.$DomainName".ToLower()
        }
        else
        {
            Return $ComputerName.ToLower()
        }
    }

} # Get-FQDNMemberName

<#
.SYNOPSIS
    Throw a custom exception.
#>
function New-Exception
{
    [CmdLetBinding()]
    param
    (
        [Parameter(Mandatory)]
        [String] $errorId,

        [Parameter(Mandatory)]
        [System.Management.Automation.ErrorCategory] $errorCategory,

        [Parameter(Mandatory)]
        [String] $errorMessage
    )

    $exception = New-Object -TypeName System.Exception `
        -ArgumentList $errorMessage
    $errorRecord = New-Object -TypeName System.Management.Automation.ErrorRecord `
        -ArgumentList $exception, $errorId, $errorCategory, $null

    throw $errorRecord
} # New-Exception

Export-ModuleMember -Function *-TargetResource
