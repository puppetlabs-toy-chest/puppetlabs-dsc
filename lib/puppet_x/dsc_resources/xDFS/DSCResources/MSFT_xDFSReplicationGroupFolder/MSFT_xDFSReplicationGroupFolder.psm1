$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Certificate Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
                               -ChildPath (Join-Path -Path 'DFSDsc.ResourceHelper' `
                                                     -ChildPath 'DFSDsc.ResourceHelper.psm1'))

# Import Localization Strings
$localizedData = Get-LocalizedData `
    -ResourceName 'MSFT_xDFSReplicationGroupFolder' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
    Returns the current state of a DFS Replication Group Folder.

    .PARAMETER GroupName
    The name of the DFS Replication Group.

    .PARAMETER FolderName
    The name of the DFS Replication Group Folder.

    .PARAMETER DomainName
    The name of the AD Domain the DFS Replication Group Folder will be in.
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

        [Parameter()]
        [System.String]
        $DomainName
    )

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.GettingReplicationGroupFolderMessage) `
            -f $GroupName,$FolderName
        ) -join '' )

    # Lookup the existing Replication Group
    $replicatedFolderParameters = @{
        GroupName = $GroupName
        FolderName = $FolderName
    }

    $returnValue = $replicatedFolderParameters.Clone()

    if ($DomainName)
    {
        $replicatedFolderParameters += @{
            DomainName = $DomainName
        }
    } # if

    $replicationGroupFolder = Get-DfsReplicatedFolder @replicatedFolderParameters `
        -ErrorAction Stop

    if ($replicationGroupFolder)
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupFolderExistsMessage) `
                -f $GroupName,$FolderName
            ) -join '' )

        <#
            Array paramters are disabled until this issue is resolved:
            https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/11088807-get-dscconfiguration-fails-with-embedded-cim-type
            FilenameToExclude = $ReplicationGroupFolder.FilenameToExclude
            DirectoryNameToExclude = $ReplicationGroupFolder.DirectoryNameToExclude
        #>
        $returnValue += @{
            Description = $replicationGroupFolder.Description
            FilenameToExclude = ''
            DirectoryNameToExclude = ''
            DfsnPath = $replicationGroupFolder.DfsnPath
            DomainName = $replicationGroupFolder.DomainName
        }
    }
    else
    {
        # The Rep Group folder doesn't exist
        New-InvalidOperationException `
            -Message ($($LocalizedData.ReplicationGroupFolderMissingError) `
                -f $GroupName,$FolderName)
    }

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
    Sets the current state of a DFS Replication Group Folder.

    .PARAMETER GroupName
    The name of the DFS Replication Group.

    .PARAMETER FolderName
    The name of the DFS Replication Group Folder.

    .PARAMETER Description
    A description for the DFS Replication Group Folder.

    .PARAMETER FileNameToExclude
    An array of file names to exclude from replication.

    .PARAMETER DirectoryNameToExclude
    An array of directory names to exclude from replication.

    .PARAMETER DfsnPath
    The DFS Namespace Path to this Replication Group folder is mapped to.
    This does NOT create the Namespace folders, it only sets the name in
    the folder object.

    .PARAMETER DomainName
    The name of the AD Domain the DFS Replication Group Folder will be in.
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

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $FileNameToExclude,

        [Parameter()]
        [System.String[]]
        $DirectoryNameToExclude,

        [Parameter()]
        [System.String]
        $DfsnPath,

        [Parameter()]
        [System.String]
        $DomainName
    )

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.SettingReplicationGroupFolderMessage) `
            -f $GroupName,$FolderName
        ) -join '' )

    # Now apply the changes
    Set-DfsReplicatedFolder @PSBoundParameters `
        -ErrorAction Stop

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.ReplicationGroupFolderUpdatedMessage) `
            -f $GroupName,$FolderName
        ) -join '' )
} # Set-TargetResource

<#
    .SYNOPSIS
    Tests the current state of a DFS Replication Group Folder.

    .PARAMETER GroupName
    The name of the DFS Replication Group.

    .PARAMETER FolderName
    The name of the DFS Replication Group Folder.

    .PARAMETER Description
    A description for the DFS Replication Group Folder.

    .PARAMETER FileNameToExclude
    An array of file names to exclude from replication.

    .PARAMETER DirectoryNameToExclude
    An array of directory names to exclude from replication.

    .PARAMETER DfsnPath
    The DFS Namespace Path to this Replication Group folder is mapped to.
    This does NOT create the Namespace folders, it only sets the name in
    the folder object.

    .PARAMETER DomainName
    The name of the AD Domain the DFS Replication Group Folder will be in.
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

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String[]]
        $FileNameToExclude,

        [Parameter()]
        [System.String[]]
        $DirectoryNameToExclude,

        [Parameter()]
        [System.String]
        $DfsnPath,

        [Parameter()]
        [System.String]
        $DomainName
    )

    # Flag to signal whether settings are correct
    [System.Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.TestingReplicationGroupFolderMessage) `
            -f $GroupName,$FolderName
        ) -join '' )

    # Lookup the existing Replication Group Folder
    $replicatedFolderParameters = @{
        GroupName = $GroupName
        FolderName = $FolderName
    }

    if ($DomainName)
    {
        $replicatedFolderParameters += @{
            DomainName = $DomainName
        }
    } # if

    $replicationGroupFolder = Get-DfsReplicatedFolder @replicatedFolderParameters `
        -ErrorAction Stop

    if ($replicationGroupFolder)
    {
        # The rep group folder is found
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupFolderExistsMessage) `
                -f $GroupName,$FolderName
            ) -join '' )

        # Check the description
        if (($PSBoundParameters.ContainsKey('Description')) `
            -and ($replicationGroupFolder.Description -ne $Description))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupFolderDescriptionMismatchMessage) `
                    -f $GroupName,$FolderName
                ) -join '' )

            $desiredConfigurationMatch = $false
        } # if

        # Check the FileNameToExclude
        if (($PSBoundParameters.ContainsKey('FileNameToExclude')) `
            -and ((Compare-Object `
                -ReferenceObject  $replicationGroupFolder.FileNameToExclude `
                -DifferenceObject $FileNameToExclude).Count -ne 0))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupFolderFileNameToExcludeMismatchMessage) `
                    -f $GroupName,$FolderName
                ) -join '' )

            $desiredConfigurationMatch = $false
        } # if

        # Check the DirectoryNameToExclude
        if (($PSBoundParameters.ContainsKey('DirectoryNameToExclude')) `
            -and ((Compare-Object `
                -ReferenceObject  $replicationGroupFolder.DirectoryNameToExclude `
                -DifferenceObject $DirectoryNameToExclude).Count -ne 0))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupFolderDirectoryNameToExcludeMismatchMessage) `
                    -f $GroupName,$FolderName
                ) -join '' )

            $desiredConfigurationMatch = $false
        } # if

        if (($PSBoundParameters.ContainsKey('DfsnPath')) `
            -and ($replicationGroupFolder.DfsnPath -ne $DfsnPath))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupFolderDfsnPathMismatchMessage) `
                    -f $GroupName,$FolderName
                ) -join '' )

            $desiredConfigurationMatch = $false
        } # if
    }
    else
    {
        # The Rep Group folder doesn't exist
        New-InvalidOperationException `
            -Message ($($LocalizedData.ReplicationGroupFolderMissingError) `
                -f $GroupName,$FolderName)
    } # if

    return $desiredConfigurationMatch
} # Test-TargetResource

Export-ModuleMember -Function *-TargetResource
