$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Networking Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'FSRMDsc.ResourceHelper' `
            -ChildPath 'FSRMDsc.ResourceHelper.psm1'))

# Import Localization Strings
$LocalizedData = Get-LocalizedData `
    -ResourceName 'DSR_FSRMFileScreenException' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Retrieves the FSRM File Screen Exception assigned to the specified Path.

    .PARAMETER Path
        The path this FSRM File Screen applies to.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Path
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingFileScreenExceptionMessage) `
                -f $Path
        ) -join '' )

    # Lookup the existing FileScreenException
    $fileScreenException = Get-FileScreenException -Path $Path

    $returnValue = @{
        Path = $Path
    }
    if ($fileScreenException)
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.FileScreenExceptionExistsMessage) `
                    -f $Path
            ) -join '' )

        $returnValue += @{
            Ensure       = 'Present'
            Description  = $fileScreenException.Description
            IncludeGroup = @($fileScreenException.IncludeGroup)
        }
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.FileScreenExceptionDoesNotExistMessage) `
                    -f $Path
            ) -join '' )

        $returnValue += @{
            Ensure = 'Absent'
        }
    } # if

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
        Sets the FSRM File Screen Exception assigned to the specified Path.

    .PARAMETER Path
        The path this FSRM File Screen applies to.

    .PARAMETER Description
        An optional description for this FSRM File Screen.

    .PARAMETER Ensure
        Specifies whether the FSRM File Screen should exist.

    .PARAMETER IncludeGroup
        An array of File Groups to include in this File Screen.
#>
function Set-TargetResource
{
    [Diagnostics.CodeAnalysis.SuppressMessageAttribute('PSShouldProcess', '')]
    [CmdletBinding(SupportsShouldProcess = $true)]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String[]]
        $IncludeGroup
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingFileScreenExceptionMessage) `
                -f $Path
        ) -join '' )

    # Check the properties are valid.
    Assert-ResourcePropertiesValid @PSBoundParameters

    # Remove any parameters that can't be splatted.
    $null = $PSBoundParameters.Remove('Ensure')

    # Lookup the existing FileScreenException
    $fileScreenException = Get-FileScreenException -Path $Path

    if ($Ensure -eq 'Present')
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureFileScreenExceptionExistsMessage) `
                    -f $Path
            ) -join '' )

        if ($fileScreenException)
        {
            # The FileScreenException exists
            Set-FSRMFileScreenException @PSBoundParameters `
                -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileScreenExceptionUpdatedMessage) `
                        -f $Path
                ) -join '' )
        }
        else
        {
            # Create the File Screen Exception
            New-FSRMFileScreenException @PSBoundParameters `
                -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileScreenExceptionCreatedMessage) `
                        -f $Path
                ) -join '' )
        } # if
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureFileScreenExceptionDoesNotExistMessage) `
                    -f $Path
            ) -join '' )

        if ($fileScreenException)
        {
            # The File Screen Exception shouldn't exist - remove it
            Remove-FSRMFileScreenException -Path $Path -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileScreenExceptionRemovedMessage) `
                        -f $Path
                ) -join '' )
        } # if
    } # if
} # Set-TargetResource

<#
    .SYNOPSIS
        Tests the FSRM File Screen Exception assigned to the specified Path.

    .PARAMETER Path
        The path this FSRM File Screen applies to.

    .PARAMETER Description
        An optional description for this FSRM File Screen.

    .PARAMETER Ensure
        Specifies whether the FSRM File Screen should exist.

    .PARAMETER IncludeGroup
        An array of File Groups to include in this File Screen.
#>
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String[]]
        $IncludeGroup
    )

    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingFileScreenExceptionMessage) `
                -f $Path
        ) -join '' )

    # Check the properties are valid.
    Assert-ResourcePropertiesValid @PSBoundParameters

    # Lookup the existing FileScreenException
    $fileScreenException = Get-FileScreenException -Path $Path

    if ($Ensure -eq 'Present')
    {
        # The FileScreenException should exist
        if ($fileScreenException)
        {
            # The FileScreenException exists already - check the parameters
            if (($PSBoundParameters.ContainsKey('IncludeGroup')) `
                    -and (Compare-Object `
                        -ReferenceObject $IncludeGroup `
                        -DifferenceObject $fileScreenException.IncludeGroup).Count -ne 0)
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.FileScreenExceptionPropertyNeedsUpdateMessage) `
                            -f $Path, 'IncludeGroup'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            } # if

            if (($PSBoundParameters.ContainsKey('Description')) `
                    -and ($fileScreenException.Description -ne $Description))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.FileScreenExceptionPropertyNeedsUpdateMessage) `
                            -f $Path, 'Description'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            } # if
        }
        else
        {
            # The File Screen Exception doesn't exist but should
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileScreenExceptionDoesNotExistButShouldMessage) `
                        -f $Path
                ) -join '' )

            $desiredConfigurationMatch = $false
        }
    }
    else
    {
        # The File Screen Exception should not exist
        if ($fileScreenException)
        {
            # The File Screen Exception exists but should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileScreenExceptionExistsButShouldNotMessage) `
                        -f $Path
                ) -join '' )

            $desiredConfigurationMatch = $false
        }
        else
        {
            # The File Screen Exception does not exist and should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.FileScreenExceptionDoesNotExistAndShouldNotMessage) `
                        -f $Path
                ) -join '' )
        } # if
    } # if

    return $desiredConfigurationMatch
} # Test-TargetResource

<#
    .SYNOPSIS
        Gets the FSRM File Screen Exception Object assigned to the specified Path.

    .PARAMETER Path
        The path this FSRM File Screen applies to.
#>
Function Get-FileScreenException
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Path
    )

    try
    {
        $fileScreenException = Get-FSRMFileScreenException -Path $Path -ErrorAction Stop
    }
    catch [Microsoft.Management.Infrastructure.CimException]
    {
        $fileScreenException = $null
    }
    catch
    {
        Throw $_
    }

    return $fileScreenException
}

<#
    .SYNOPSIS
        This function validates the parameters passed. Called by Test-Resource.
        Will throw an error if any parameters are invalid.

    .PARAMETER Path
        The path this FSRM File Screen applies to.

    .PARAMETER Description
        An optional description for this FSRM File Screen.

    .PARAMETER Ensure
        Specifies whether the FSRM File Screen should exist.

    .PARAMETER IncludeGroup
        An array of File Groups to include in this File Screen.
#>
Function Assert-ResourcePropertiesValid
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String[]]
        $IncludeGroup
    )

    # Check the path exists
    if (-not (Test-Path -Path $Path))
    {
        $errorMessage = $($LocalizedData.FileScreenExceptionPathDoesNotExistError) -f $Path
        $errorArgumentName = 'Path'
    } # if

    if ($Ensure -eq 'Absent')
    {
        # No further checks required if File Screen Exception should be removed.
        return
    } # if

    if ($errorMessage)
    {
        New-InvalidArgumentException `
            -Message $errorMessage `
            -ArgumentName $errorArgumentName
    } # if
}

Export-ModuleMember -Function *-TargetResource
