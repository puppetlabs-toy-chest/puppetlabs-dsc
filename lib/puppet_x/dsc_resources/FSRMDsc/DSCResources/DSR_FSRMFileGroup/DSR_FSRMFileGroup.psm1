$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Networking Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'FSRMDsc.ResourceHelper' `
            -ChildPath 'FSRMDsc.ResourceHelper.psm1'))

# Import Localization Strings
$LocalizedData = Get-LocalizedData `
    -ResourceName 'DSR_FSRMFileGroup' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Retrieves the FSRM File Group with the specified Name.

    .PARAMETER Name
        The name of the FSRM File Group.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingFileGroupMessage) `
                -f $Name
        ) -join '' )

    $fileGroup = Get-FileGroup -Name $Name

    $returnValue = @{
        Name = $Name
    }

    if ($fileGroup)
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.FileGroupExistsMessage) `
                    -f $Name
            ) -join '' )

        $returnValue += @{
            Ensure         = 'Present'
            Description    = $fileGroup.Description
            IncludePattern = $fileGroup.IncludePattern
            ExcludePattern = $fileGroup.ExcludePattern
        }
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.FileGroupDoesNotExistMessage) `
                    -f $Name
            ) -join '' )

        $returnValue += @{
            Ensure = 'Absent'
        }
    }

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
        Sets the FSRM File Group with the specified Name.

    .PARAMETER Name
        The name of the FSRM File Group.

    .PARAMETER Description
        The description for the FSRM File Group.

    .PARAMETER Ensure
        Specifies whether the FSRM File Group should exist.

    .PARAMETER IncludePattern
        An array of file patterns to include in this FSRM File Group.

    .PARAMETER ExcludePattern
        An array of file patterns to exclude in this FSRM File Group.
#>
function Set-TargetResource
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding(SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String[]]
        $IncludePattern = @(''),

        [Parameter()]
        [System.String[]]
        $ExcludePattern = @('')
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingFileGroupMessage) `
                -f $Name
        ) -join '' )

    # Remove any parameters that can't be splatted.
    $null = $PSBoundParameters.Remove('Ensure')

    # Lookup the existing file group
    $fileGroup = Get-FileGroup -Name $Name

    if ($Ensure -eq 'Present')
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureFileGroupExistsMessage) `
                    -f $Name
            ) -join '' )

        if ($fileGroup)
        {
            # The file group exists
            Set-FSRMFileGroup @PSBoundParameters -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileGroupUpdatedMessage) `
                        -f $Name
                ) -join '' )
        }
        else
        {
            # Create the File Group
            New-FSRMFileGroup @PSBoundParameters -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileGroupCreatedMessage) `
                        -f $Name
                ) -join '' )
        }
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureFileGroupDoesNotExistMessage) `
                    -f $Name
            ) -join '' )

        if ($fileGroup)
        {
            # The File Group shouldn't exist - remove it
            Remove-FSRMFileGroup -Name $Name -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileGroupRemovedMessage) `
                        -f $Name
                ) -join '' )
        } # if
    } # if
} # Set-TargetResource

<#
    .SYNOPSIS
        Tests the FSRM File Group with the specified Name.

    .PARAMETER Name
        The name of the FSRM File Group.

    .PARAMETER Description
        The description for the FSRM File Group.

    .PARAMETER Ensure
        Specifies whether the FSRM File Group should exist.

    .PARAMETER IncludePattern
        An array of file patterns to include in this FSRM File Group.

    .PARAMETER ExcludePattern
        An array of file patterns to exclude in this FSRM File Group.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String[]]
        $IncludePattern = @(''),

        [Parameter()]
        [System.String[]]
        $ExcludePattern = @('')
    )

    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingFileGroupMessage) `
                -f $Name
        ) -join '' )

    # Lookup the existing file group
    $fileGroup = Get-FileGroup -Name $Name

    if ($Ensure -eq 'Present')
    {
        # The File Group should exist
        if ($fileGroup)
        {
            # The File Group exists already - check the parameters
            if (($Description) -and ($fileGroup.Description -ne $Description))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.FileGroupDescriptionNeedsUpdateMessage) `
                            -f $Name
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($IncludePattern) -and (Compare-Object `
                        -ReferenceObject $IncludePattern `
                        -DifferenceObject $fileGroup.IncludePattern).Count -ne 0)
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.FileGroupIncludePatternNeedsUpdateMessage) `
                            -f $Name
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($ExcludePattern) -and (Compare-Object `
                        -ReferenceObject $ExcludePattern `
                        -DifferenceObject $fileGroup.ExcludePattern).Count -ne 0)
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.FileGroupExcludePatternNeedsUpdateMessage) `
                            -f $Name
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }
        }
        else
        {
            # Ths File Group doesn't exist but should
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileGroupDoesNotExistButShouldMessage) `
                        -f $Name
                ) -join '' )

            $desiredConfigurationMatch = $false
        }
    }
    else
    {
        # The File Group should not exist
        if ($fileGroup)
        {
            # The File Group exists but should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileGroupExistsButShouldNotMessage) `
                        -f $Name
                ) -join '' )

            $desiredConfigurationMatch = $false
        }
        else
        {
            # The File Group does not exist and should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileGroupDoesNotExistAndShouldNotMessage) `
                        -f $Name
                ) -join '' )
        }
    } # if

    return $desiredConfigurationMatch
} # Test-TargetResource

<#
    .SYNOPSIS
        Gets the FSRM File Group object with the specified Name.

    .PARAMETER Name
        The name of the FSRM File Group.
#>
Function Get-FileGroup
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name
    )

    try
    {
        $fileGroup = Get-FSRMFileGroup -Name $Name -ErrorAction Stop
    }
    catch [Microsoft.PowerShell.Cmdletization.Cim.CimJobException]
    {
        $fileGroup = $null
    }
    catch
    {
        Throw $_
    }

    return $fileGroup
}

Export-ModuleMember -Function *-TargetResource
