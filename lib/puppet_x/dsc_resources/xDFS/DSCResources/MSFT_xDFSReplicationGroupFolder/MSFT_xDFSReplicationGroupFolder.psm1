data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData -StringData @'
GettingReplicationGroupFolderMessage=Getting DFS Replication Group "{0}" folder "{1}".
ReplicationGroupFolderExistsMessage=DFS Replication Group "{0}" folder "{1}" exists.
ReplicationGroupFolderMissingError=DFS Replication Group "{0}" folder "{1}" is missing.
SettingRegGroupFolderMessage=Setting DFS Replication Group "{0}" folder "{1}".
ReplicationGroupFolderUpdatedMessage=DFS Replication Group "{0}" folder "{1}" has has been updated.
TestingRegGroupFolderMessage=Testing DFS Replication Group "{0}" folder "{1}".
ReplicationGroupFolderDescriptionMismatchMessage=DFS Replication Group "{0}" folder "{1}" has incorrect Description. Change required.
ReplicationGroupFolderFileNameToExcludeMismatchMessage=DFS Replication Group "{0}" folder "{1}" has incorrect FileNameToExclude. Change required.
ReplicationGroupFolderDirectoryNameToExcludeMismatchMessage=DFS Replication Group "{0}" folder "{1}" has incorrect DirectoryNameToExclude. Change required.
ReplicationGroupFolderDfsnPathMismatchMessage=DFS Replication Group "{0}" folder "{1}" has incorrect DfsnPath. Change required.
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

        [String]
        $DomainName
    )
    
    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.GettingReplicationGroupFolderMessage) `
            -f $GroupName,$FolderName,$DomainName
        ) -join '' )

    # Lookup the existing Replication Group
    $Splat = @{
        GroupName = $GroupName
        FolderName = $FolderName
    }
    $returnValue = $splat.Clone()
    if ($DomainName)
    {
        $Splat += @{ DomainName = $DomainName }
    }
    $ReplicationGroupFolder = Get-DfsReplicatedFolder @Splat `
        -ErrorAction Stop
    if ($ReplicationGroupFolder)
    {
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupFolderExistsMessage) `
                -f $GroupName,$FolderName,$DomainName
            ) -join '' )
        # Array paramters are disabled until this issue is resolved:
        # https://windowsserver.uservoice.com/forums/301869-powershell/suggestions/11088807-get-dscconfiguration-fails-with-embedded-cim-type
        $returnValue += @{
            Description = $ReplicationGroupFolder.Description
            # FilenameToExclude = $ReplicationGroupFolder.FilenameToExclude
            # DirectoryNameToExclude = $ReplicationGroupFolder.DirectoryNameToExclude
            DfsnPath = $ReplicationGroupFolder.DfsnPath
            DomainName = $ReplicationGroupFolder.DomainName
        }
    }
    else
    {       
        # The Rep Group folder doesn't exist
        $errorId = 'RegGroupFolderMissingError'
        $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidOperation
        $errorMessage = $($LocalizedData.ReplicationGroupFolderMissingError) `
            -f $GroupName,$FolderName,$DomainName
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

        [String]
        $Description,

        [String[]]
        $FileNameToExclude,

        [String[]]
        $DirectoryNameToExclude,

        [String]
        $DfsnPath,

        [String]
        $DomainName
    )

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.SettingRegGroupFolderMessage) `
            -f $GroupName,$FolderName,$DomainName
        ) -join '' )

    # Now apply the changes
    Set-DfsReplicatedFolder @PSBoundParameters `
        -ErrorAction Stop

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.ReplicationGroupFolderUpdatedMessage) `
            -f $GroupName,$FolderName,$DomainName
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

        [String]
        $Description,

        [String[]]
        $FileNameToExclude,

        [String[]]
        $DirectoryNameToExclude,

        [String]
        $DfsnPath,

        [String]
        $DomainName
    )

    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
        "$($MyInvocation.MyCommand): "
        $($LocalizedData.TestingRegGroupFolderMessage) `
            -f $GroupName,$FolderName,$DomainName
        ) -join '' )

    # Lookup the existing Replication Group Folder
    $Splat = @{
        GroupName = $GroupName
        FolderName = $FolderName
    }
    if ($DomainName)
    {
        $Splat += @{ DomainName = $DomainName }
    }
    $ReplicationGroupFolder = Get-DfsReplicatedFolder @Splat `
        -ErrorAction Stop

    if ($ReplicationGroupFolder)
    {
        # The rep group folder is found
        Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ReplicationGroupFolderExistsMessage) `
                -f $GroupName,$FolderName,$DomainName
            ) -join '' )

        # Check the description
        if (($PSBoundParameters.ContainsKey('Description')) `
            -and ($ReplicationGroupFolder.Description -ne $Description))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupFolderDescriptionMismatchMessage) `
                    -f $GroupName,$FolderName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
        
        # Check the FileNameToExclude
        if (($PSBoundParameters.ContainsKey('FileNameToExclude')) `
            -and ((Compare-Object `
                -ReferenceObject  $ReplicationGroupFolder.FileNameToExclude `
                -DifferenceObject $FileNameToExclude).Count -ne 0))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupFolderFileNameToExcludeMismatchMessage) `
                    -f $GroupName,$FolderName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }

        # Check the DirectoryNameToExclude
        if (($PSBoundParameters.ContainsKey('DirectoryNameToExclude')) `
            -and ((Compare-Object `
                -ReferenceObject  $ReplicationGroupFolder.DirectoryNameToExclude `
                -DifferenceObject $DirectoryNameToExclude).Count -ne 0))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupFolderDirectoryNameToExcludeMismatchMessage) `
                    -f $GroupName,$FolderName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }

        if (($PSBoundParameters.ContainsKey('DfsnPath')) `
            -and ($ReplicationGroupFolder.DfsnPath -ne $DfsnPath))
        {
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ReplicationGroupFolderDfsnPathMismatchMessage) `
                    -f $GroupName,$FolderName,$DomainName
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
    }
    else
    {
        # The Rep Group folder doesn't exist
        $errorId = 'RegGroupFolderMissingError'
        $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidOperation
        $errorMessage = $($LocalizedData.ReplicationGroupFolderMissingError) `
            -f $GroupName,$FolderName,$DomainName
        $exception = New-Object -TypeName System.InvalidOperationException `
            -ArgumentList $errorMessage
        $errorRecord = New-Object -TypeName System.Management.Automation.ErrorRecord `
            -ArgumentList $exception, $errorId, $errorCategory, $null

        $PSCmdlet.ThrowTerminatingError($errorRecord)
    }

    return $desiredConfigurationMatch
} # Test-TargetResource

Export-ModuleMember -Function *-TargetResource
