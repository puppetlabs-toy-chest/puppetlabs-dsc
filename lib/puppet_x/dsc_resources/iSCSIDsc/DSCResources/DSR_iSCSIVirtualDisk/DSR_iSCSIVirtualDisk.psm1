$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Networking Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
    -ChildPath (Join-Path -Path 'iSCSIDsc.ResourceHelper' `
        -ChildPath 'iSCSIDsc.ResourceHelper.psm1'))

# Import Localization Strings
$LocalizedData = Get-LocalizedData `
    -ResourceName 'DSR_iSCSIVirtualDisk' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Returns the current state of the specified iSCSI Virtual Disk.

    .PARAMETER Path
        Specifies the path of the VHDX file that is associated with the iSCSI virtual disk.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Path
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingiSCSIVirtualDiskMessage) `
                -f $Path
        ) -join '' )

    $virtualDisk = Get-VirtualDisk -Path $Path

    $returnValue = @{
        Path = $Path
    }
    if ($virtualDisk)
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.iSCSIVirtualDiskExistsMessage) `
                    -f $Path
            ) -join '' )

        $returnValue += @{
            Ensure      = 'Present'
            SizeBytes   = $virtualDisk.Size
            DiskType    = $virtualDisk.DiskType
            Description = $virtualDisk.Description
            ParentPath  = $virtualDisk.ParentPath
        }
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.iSCSIVirtualDiskDoesNotExistMessage) `
                    -f $Path
            ) -join '' )

        $returnValue += @{
            Ensure = 'Absent'
        }
    }

    $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
        Creates, updates or removes an iSCSI Virtual Disk.

    .PARAMETER Ensure
        Ensures that Virtual Disk is either Absent or Present.

    .PARAMETER Path
        Specifies the path of the VHDX file that is associated with the iSCSI virtual disk.

    .PARAMETER SizeBytes
        Specifies the size, in bytes, of the iSCSI virtual disk.

    .PARAMETER BlockSizeBytes
        Specifies the block size, in bytes, for the VHDX. For fixed VHDX, if the value of the SizeBytes
        parameter is less than 32 MB, the default size is 2 MB. Otherwise, the default value is 32 MB.
        For dynamic VHDX, the default size is 2 MB. For differencing VHDX, the default size is the
        parent BlockSize.

    .PARAMETER DiskType
        Specifies the type of the VHDX.

    .PARAMETER LogicalSectorSizeBytes
        Specifies the logical sector size, in bytes, for the VHDX.

    .PARAMETER PhysicalSectorSizeBytes
        Specifies the physical sector size, in bytes, for the VHDX.

    .PARAMETER Description
        Specifies the description for the iSCSI virtual disk.

    .PARAMETER ParentPath
        Specifies the parent virtual disk path if the VHDX is a differencing disk.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Path,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [ValidateSet('Dynamic', 'Fixed', 'Differencing')]
        [System.String]
        $DiskType = 'Dynamic',

        [Parameter()]
        [System.Uint64]
        $SizeBytes,

        [Parameter()]
        [System.Uint32]
        $BlockSizeBytes,

        [Parameter()]
        [ValidateSet(512, 4096)]
        [System.Uint32]
        $LogicalSectorSizeBytes,

        [Parameter()]
        [ValidateSet(512, 4096)]
        [System.UInt32]
        $PhysicalSectorSizeBytes,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String]
        $ParentPath
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingiSCSIVirtualDiskMessage) `
                -f $Path
        ) -join '' )

    # Remove any parameters that can't be splatted.
    $null = $PSBoundParameters.Remove('Ensure')
    $null = $PSBoundParameters.Remove('DiskType')

    # Lookup the existing iSCSI Virtual Disk
    $virtualDisk = Get-VirtualDisk -Path $Path

    if ($Ensure -eq 'Present')
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureiSCSIVirtualDiskExistsMessage) `
                    -f $Path
            ) -join '' )

        if ($virtualDisk)
        {
            # The iSCSI Virtual Disk exists
            [Boolean] $recreate = $false

            if (($DiskType) `
                    -and ($virtualDisk.DiskType -ne $DiskType))
            {
                $recreate = $true
            }

            if (($SizeBytes) `
                    -and ($virtualDisk.Size -ne $SizeBytes))
            {
                $recreate = $true
            }

            if (($ParentPath) `
                    -and ($virtualDisk.ParentPath -ne $ParentPath))
            {
                $recreate = $true
            }

            <#
                If any parameters differ that require this Virtual Disk to be recreated
                then throw an error. Recreating the Virtual Disk is too dangerous as it
                may contain data. If the Virtual Disk *must* be recreated then the user
                will need to manually delete the Virtual Disk and the config will then
                create a new one.
            #>
            if ($recreate)
            {
                $errorId = 'iSCSIVirtualDiskRequiresRecreateError'
                $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidArgument
                $errorMessage = $($LocalizedData.iSCSIVirtualDiskRequiresRecreateError) -f $Path
                $exception = New-Object -TypeName System.InvalidOperationException `
                    -ArgumentList $errorMessage
                $errorRecord = New-Object -TypeName System.Management.Automation.ErrorRecord `
                    -ArgumentList $exception, $errorId, $errorCategory, $null

                $PSCmdlet.ThrowTerminatingError($errorRecord)
            }

            Set-iSCSIVirtualDisk `
                -ComputerName LOCALHOST `
                -Path $Path `
                -Description $Description `
                -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.iSCSIVirtualDiskUpdatedMessage) `
                        -f $Path
                ) -join '' )
        }
        else
        {
            # Create the iSCSI Virtual Disk
            if ($DiskType -eq 'Fixed')
            {
                $null = $PSBoundParameters.Add('UseFixed', $True)
            }
            else
            {
                $null = $PSBoundParameters.Remove('LogicalSectorSizeBytes')
            }
            New-iSCSIVirtualDisk `
                @PSBoundParameters `
                -ComputerName LOCALHOST `
                -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.iSCSIVirtualDiskCreatedMessage) `
                        -f $Path
                ) -join '' )
        }
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureiSCSIVirtualDiskDoesNotExistMessage) `
                    -f $Path
            ) -join '' )

        if ($virtualDisk)
        {
            # The iSCSI Virtual Disk shouldn't exist - remove it
            Remove-iSCSIVirtualDisk `
                -ComputerName LOCALHOST `
                -Path $Path `
                -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.iSCSIVirtualDiskRemovedMessage) `
                        -f $Path
                ) -join '' )
        } # if
    } # if
} # Set-TargetResource

<#
    .SYNOPSIS
        Tests if an iSCSI Virtual Disk needs to be created, updated or removed.

    .PARAMETER Ensure
        Ensures that Virtual Disk is either Absent or Present.

    .PARAMETER Path
        Specifies the path of the VHDX file that is associated with the iSCSI virtual disk.

    .PARAMETER SizeBytes
        Specifies the size, in bytes, of the iSCSI virtual disk.

    .PARAMETER BlockSizeBytes
        Specifies the block size, in bytes, for the VHDX. For fixed VHDX, if the value of the SizeBytes
        parameter is less than 32 MB, the default size is 2 MB. Otherwise, the default value is 32 MB.
        For dynamic VHDX, the default size is 2 MB. For differencing VHDX, the default size is the
        parent BlockSize.

    .PARAMETER DiskType
        Specifies the type of the VHDX.

    .PARAMETER LogicalSectorSizeBytes
        Specifies the logical sector size, in bytes, for the VHDX.

    .PARAMETER PhysicalSectorSizeBytes
        Specifies the physical sector size, in bytes, for the VHDX.

    .PARAMETER Description
        Specifies the description for the iSCSI virtual disk.

    .PARAMETER ParentPath
        Specifies the parent virtual disk path if the VHDX is a differencing disk.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Path,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [ValidateSet('Dynamic', 'Fixed', 'Differencing')]
        [System.String]
        $DiskType = 'Dynamic',

        [Parameter()]
        [System.Uint64]
        $SizeBytes,

        [Parameter()]
        [System.Uint32]
        $BlockSizeBytes,

        [Parameter()]
        [ValidateSet(512, 4096)]
        [System.Uint32]
        $LogicalSectorSizeBytes,

        [Parameter()]
        [ValidateSet(512, 4096)]
        [System.UInt32]
        $PhysicalSectorSizeBytes,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.String]
        $ParentPath
    )

    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingiSCSIVirtualDiskMessage) `
                -f $Path
        ) -join '' )

    # Lookup the existing iSCSI Virtual Disk
    $virtualDisk = Get-VirtualDisk -Path $Path

    if ($Ensure -eq 'Present')
    {
        # The iSCSI Virtual Disk should exist
        if ($virtualDisk)
        {
            # The iSCSI Virtual Disk exists already - check the parameters
            [Boolean] $recreate = $false

            if (($Description) `
                    -and ($virtualDisk.Description -ne $Description))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.iSCSIVirtualDiskParameterNeedsUpdateMessage) `
                            -f $Path, 'Description'
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }

            if (($DiskType) `
                    -and ($virtualDisk.DiskType -ne $DiskType))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.iSCSIVirtualDiskParameterNeedsUpdateMessage) `
                            -f $Path, 'SizeBytes'
                    ) -join '' )
                $recreate = $true
            }

            if (($SizeBytes) `
                    -and ($virtualDisk.Size -ne $SizeBytes))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.iSCSIVirtualDiskParameterNeedsUpdateMessage) `
                            -f $Path, 'SizeBytes'
                    ) -join '' )
                $recreate = $true
            }

            if (($ParentPath) `
                    -and ($virtualDisk.ParentPath -ne $ParentPath))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.iSCSIVirtualDiskParameterNeedsUpdateMessage) `
                            -f $Path, 'ParentPath'
                    ) -join '' )
                $recreate = $true
            }

            <#
                If any parameters differ that require this Virtual Disk to be recreated
                then throw an error. Recreating the Virtual Disk is too dangerous as it
                may contain data. If the Virtual Disk *must* be recreated then the user
                will need to manually delete the Virtual Disk and the config will then
                create a new one.
            #>
            if ($recreate)
            {
                $errorId = 'iSCSIVirtualDiskRequiresRecreateError'
                $errorCategory = [System.Management.Automation.ErrorCategory]::InvalidArgument
                $errorMessage = $($LocalizedData.iSCSIVirtualDiskRequiresRecreateError) -f $Path
                $exception = New-Object -TypeName System.InvalidOperationException `
                    -ArgumentList $errorMessage
                $errorRecord = New-Object -TypeName System.Management.Automation.ErrorRecord `
                    -ArgumentList $exception, $errorId, $errorCategory, $null

                $PSCmdlet.ThrowTerminatingError($errorRecord)
            }
        }
        else
        {
            # Ths iSCSI Virtual Disk doesn't exist but should
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.iSCSIVirtualDiskDoesNotExistButShouldMessage) `
                        -f $Path
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
    }
    else
    {
        # The iSCSI Virtual Disk should not exist
        if ($virtualDisk)
        {
            # The iSCSI Virtual Disk exists but should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.iSCSIVirtualDiskExistsButShouldNotMessage) `
                        -f $Path
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
        else
        {
            # The iSCSI Virtual Disk does not exist and should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.iSCSIVirtualDiskDoesNotExistAndShouldNotMessage) `
                        -f $Path
                ) -join '' )
        }
    } # if
    return $desiredConfigurationMatch
} # Test-TargetResource

# Helper Functions
<#
    .SYNOPSIS
        Looks up the specified iSCSI Virtual Disk.

    .PARAMETER Path
        Specifies the path of the VHDX file that is associated with the iSCSI virtual disk.
#>
function Get-VirtualDisk
{
    param
    (
        [Parameter(Mandatory = $true)]
        [ValidateNotNullOrEmpty()]
        [System.String]
        $Path
    )
    try
    {
        # Specify Localhost as computer because
        # it speeds cmdlet up significantly
        $virtualDisk = Get-iSCSIVirtualDisk `
            -ComputerName LOCALHOST `
            -Path $Path `
            -ErrorAction Stop
    }
    catch [Microsoft.Iscsi.Target.Commands.IscsiCmdException]
    {
        $virtualDisk = $null
    }
    catch
    {
        Throw $_
    }
    Return $virtualDisk
}

Export-ModuleMember -function *-TargetResource
