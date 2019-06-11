$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Networking Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'FSRMDsc.ResourceHelper' `
            -ChildPath 'FSRMDsc.ResourceHelper.psm1'))

# Import Localization Strings
$LocalizedData = Get-LocalizedData `
    -ResourceName 'DSR_FSRMQuota' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Retrieves the FSRM Quota assigned to the specified Path.

    .PARAMETER Path
        The path this FSRM Quota applies to.
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
            $($LocalizedData.GettingQuotaMessage) `
                -f $Path
        ) -join '' )

    # Lookup the existing quota
    $quota = Get-Quota -Path $Path

    $returnValue = @{
        Path = $Path
    }

    if ($quota)
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.QuotaExistsMessage) `
                    -f $Path
            ) -join '' )

        $returnValue += @{
            Ensure               = 'Present'
            Description          = $quota.Description
            Size                 = $quota.Size
            SoftLimit            = $quota.SoftLimit
            ThresholdPercentages = @($quota.Threshold.Percentage)
            Disabled             = $quota.Disabled
            Template             = $quota.Template
            MatchesTemplate      = $quota.MatchesTemplate
        }
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.QuotaDoesNotExistMessage) `
                    -f $Path
            ) -join '' )

        $returnValue += @{
            Ensure = 'Absent'
        }
    }

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
        Set the FSRM Quota assigned to the specified Path.

    .PARAMETER Path
        The path this FSRM Quota applies to.

    .PARAMETER Description
        An optional description for this FSRM Quota.

    .PARAMETER Ensure
        Specifies whether the FSRM Quota should exist.

    .PARAMETER Size
        The size in bytes of this FSRM Quota limit.

    .PARAMETER SoftLimit
        Controls whether this FSRM Quota has a hard or soft limit.

    .PARAMETER ThresholdPercentages
        An array of threshold percentages in this FSRM Quota.

    .PARAMETER Disabled
        Disables the FSRM Quota applied to this path.

    .PARAMETER Template
        The name of the FSRM Quota Template to apply to this path.

    .PARAMETER MatchesTemplate
        Causes the template to use only the template name and ignore Size, SoftLimit and
        ThresholdPercentage parameters.
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
        [System.Int64]
        $Size,

        [Parameter()]
        [System.Boolean]
        $SoftLimit,

        [Parameter()]
        [ValidateRange(0, 100)]
        [System.Uint32[]]
        $ThresholdPercentages,

        [Parameter()]
        [System.Boolean]
        $Disabled,

        [Parameter()]
        [System.String]
        $Template,

        [Parameter()]
        [System.Boolean]
        $MatchesTemplate
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingQuotaMessage) `
                -f $Path
        ) -join '' )

    # Check the properties are valid.
    Assert-ResourcePropertiesValid @PSBoundParameters

    # Remove any parameters that can't be splatted.
    $null = $PSBoundParameters.Remove('Ensure')
    $null = $PSBoundParameters.Remove('ThresholdPercentages')
    $null = $PSBoundParameters.Remove('MatchesTemplate')

    # Lookup the existing Quota
    $quota = Get-Quota -Path $Path

    if ($Ensure -eq 'Present')
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureQuotaExistsMessage) `
                    -f $Path
            ) -join '' )

        if (-not $MatchesTemplate)
        {
            # If the MatchesTemplate is not set Assemble the Threshold Percentages
            if ($quota)
            {
                $thresholds = [System.Collections.ArrayList]$quota.Threshold
            }
            else
            {
                $thresholds = [System.Collections.ArrayList]@()
            }

            # Scan through the required thresholds and add any that are misssing
            foreach ($ThresholdPercentage in $ThresholdPercentages)
            {
                if ($ThresholdPercentage -notin $thresholds.Percentage)
                {
                    # The threshold percentage is missing so add it
                    $thresholds += New-FSRMQuotaThreshold -Percentage $ThresholdPercentage

                    Write-Verbose -Message ( @(
                            "$($MyInvocation.MyCommand): "
                            $($LocalizedData.QuotaThresholdAddedMessage) `
                                -f $Path, $ThresholdPercentage
                        ) -join '' )
                }
            }

            <#
                Only remove thresholds that aren't passed IF a template isn't specified
                because otherwise thresholds assigned by the template will get removed.
            #>
            if (-not $quota.Template)
            {
                # Scan through the existing thresholds and remove any that are misssing
                for ($counter = $thresholds.Count - 1; $counter -ge 0; $counter--)
                {
                    If ($thresholds[$counter].Percentage -notin $ThresholdPercentages)
                    {
                        # The threshold percentage exists but shouldn not so remove it
                        $thresholds.Remove($counter)

                        Write-Verbose -Message ( @(
                                "$($MyInvocation.MyCommand): "
                                $($LocalizedData.QuotaThresholdRemovedMessage) `
                                    -f $Path, $thresholds[$counter].Percentage
                            ) -join '' )
                    }
                }
            }

            if ($thresholds)
            {
                $PSBoundParameters.Add('Threshold', $thresholds)
            }
        }

        if ($quota)
        {
            # The Quota exists
            if ($MatchesTemplate -and ($Template -ne $quota.Template))
            {
                <#
                    The template needs to be changed so the quota needs to be
                    Completely recreated.
                #>
                Remove-FSRMQuota `
                    -Path $Path `
                    -Confirm:$false `
                    -ErrorAction Stop

                    New-FSRMQuota @PSBoundParameters `
                    -ErrorAction Stop

                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.QuotaRecreatedMessage) `
                            -f $Path
                    ) -join '' )
            }
            else
            {
                $PSBoundParameters.Remove('Template')

                Set-FSRMQuota @PSBoundParameters `
                    -ErrorAction Stop

                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.QuotaUpdatedMessage) `
                            -f $Path
                    ) -join '' )
            }
        }
        else
        {
            # Create the Quota
            New-FSRMQuota @PSBoundParameters `
                -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.QuotaCreatedMessage) `
                        -f $Path
                ) -join '' )
        }
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureQuotaDoesNotExistMessage) `
                    -f $Path
            ) -join '' )

        if ($quota)
        {
            # The Quota shouldn't exist - remove it
            Remove-FSRMQuota -Path $Path -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.QuotaRemovedMessage) `
                        -f $Path
                ) -join '' )
        } # if
    } # if
} # Set-TargetResource

<#
    .SYNOPSIS
        Tests the FSRM Quota assigned to the specified Path.

    .PARAMETER Path
        The path this FSRM Quota applies to.

    .PARAMETER Description
        An optional description for this FSRM Quota.

    .PARAMETER Ensure
        Specifies whether the FSRM Quota should exist.

    .PARAMETER Size
        The size in bytes of this FSRM Quota limit.

    .PARAMETER SoftLimit
        Controls whether this FSRM Quota has a hard or soft limit.

    .PARAMETER ThresholdPercentages
        An array of threshold percentages in this FSRM Quota.

    .PARAMETER Disabled
        Disables the FSRM Quota applied to this path.

    .PARAMETER Template
        The name of the FSRM Quota Template to apply to this path.

    .PARAMETER MatchesTemplate
        Causes the template to use only the template name and ignore Size, SoftLimit and
        ThresholdPercentage parameters.
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
        [System.Int64]
        $Size,

        [Parameter()]
        [System.Boolean]
        $SoftLimit,

        [Parameter()]
        [ValidateRange(0, 100)]
        [System.Uint32[]]
        $ThresholdPercentages,

        [Parameter()]
        [System.Boolean]
        $Disabled,

        [Parameter()]
        [System.String]
        $Template,

        [Parameter()]
        [System.Boolean]
        $MatchesTemplate
    )

    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingQuotaMessage) `
                -f $Path
        ) -join '' )

    # Check the properties are valid.
    Assert-ResourcePropertiesValid @PSBoundParameters

    # Lookup the existing Quota
    $quota = Get-Quota -Path $Path

    if ($Ensure -eq 'Present')
    {
        # The Quota should exist
        if ($quota)
        {
            # The Quota exists already - check the parameters
            if ($MatchesTemplate)
            {
                # MatchesTemplate is set so only care if it matches template
                if (-not $quota.MatchesTemplate)
                {
                    Write-Verbose -Message ( @(
                            "$($MyInvocation.MyCommand): "
                            $($LocalizedData.QuotaDoesNotMatchTemplateNeedsUpdateMessage) `
                                -f $Path, 'Description'
                        ) -join '' )

                    $desiredConfigurationMatch = $false
                }
            }
            else
            {
                if (($PSBoundParameters.ContainsKey('Size')) `
                        -and ($quota.Size -ne $Size))
                {
                    Write-Verbose -Message ( @(
                            "$($MyInvocation.MyCommand): "
                            $($LocalizedData.QuotaPropertyNeedsUpdateMessage) `
                                -f $Path, 'Size'
                        ) -join '' )

                    $desiredConfigurationMatch = $false
                }

                if (($PSBoundParameters.ContainsKey('SoftLimit')) `
                        -and ($quota.SoftLimit -ne $SoftLimit))
                {
                    Write-Verbose -Message ( @(
                            "$($MyInvocation.MyCommand): "
                            $($LocalizedData.QuotaPropertyNeedsUpdateMessage) `
                                -f $Path, 'SoftLimit'
                        ) -join '' )

                    $desiredConfigurationMatch = $false
                }

                # Check the threshold percentages
                if (($PSBoundParameters.ContainsKey('ThresholdPercentages')) `
                        -and (Compare-Object `
                            -ReferenceObject $ThresholdPercentages `
                            -DifferenceObject $quota.Threshold.Percentage).Count -ne 0)
                {
                    Write-Verbose -Message ( @(
                            "$($MyInvocation.MyCommand): "
                            $($LocalizedData.QuotaPropertyNeedsUpdateMessage) `
                                -f $Path, 'ThresholdPercentages'
                        ) -join '' )

                    $desiredConfigurationMatch = $false
                }
            } # if ($MatchesTemplate)

            if (($PSBoundParameters.ContainsKey('Description')) `
                    -and ($quota.Description -ne $Description))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.QuotaPropertyNeedsUpdateMessage) `
                            -f $Path, 'Description'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($PSBoundParameters.ContainsKey('Disabled')) `
                    -and ($quota.Disabled -ne $Disabled))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.QuotaPropertyNeedsUpdateMessage) `
                            -f $Path, 'Disabled'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($PSBoundParameters.ContainsKey('Template')) `
                    -and ($quota.Template -ne $Template))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.QuotaPropertyNeedsUpdateMessage) `
                            -f $Path, 'Template'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }
        }
        else
        {
            # Ths Quota doesn't exist but should
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.QuotaDoesNotExistButShouldMessage) `
                        -f $Path
                ) -join '' )

            $desiredConfigurationMatch = $false
        }
    }
    else
    {
        # The Quota should not exist
        if ($quota)
        {
            # The Quota exists but should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.QuotaExistsButShouldNotMessage) `
                        -f $Path
                ) -join '' )

            $desiredConfigurationMatch = $false
        }
        else
        {
            # The Quota does not exist and should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.QuotaDoesNotExistAndShouldNotMessage) `
                        -f $Path
                ) -join '' )
        }
    } # if

    return $desiredConfigurationMatch
} # Test-TargetResource

<#
    .SYNOPSIS
        Gets the current quota assigned to this Path.

    .PARAMETER Path
        The path this FSRM Quota applies to.
#>
Function Get-Quota
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Path
    )

    try
    {
        $quota = Get-FSRMQuota -Path $Path -ErrorAction Stop
    }
    catch [Microsoft.Management.Infrastructure.CimException]
    {
        $quota = $null
    }
    catch
    {
        Throw $_
    }

    return $quota
}

<#
    .SYNOPSIS
        This function validates the parameters passed. Called by Test-Resource.
        Will throw an error if any parameters are invalid.

    .PARAMETER Path
        The path this FSRM Quota applies to.

    .PARAMETER Description
        An optional description for this FSRM Quota.

    .PARAMETER Ensure
        Specifies whether the FSRM Quota should exist.

    .PARAMETER Size
        The size in bytes of this FSRM Quota limit.

    .PARAMETER SoftLimit
        Controls whether this FSRM Quota has a hard or soft limit.

    .PARAMETER ThresholdPercentages
        An array of threshold percentages in this FSRM Quota.

    .PARAMETER Disabled
        Disables the FSRM Quota applied to this path.

    .PARAMETER Template
        The name of the FSRM Quota Template to apply to this path.

    .PARAMETER MatchesTemplate
        Causes the template to use only the template name and ignore Size, SoftLimit and
        ThresholdPercentage parameters.
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
        [System.Int64]
        $Size,

        [Parameter()]
        [System.Boolean]
        $SoftLimit,

        [Parameter()]
        [ValidateRange(0, 100)]
        [System.Uint32[]]
        $ThresholdPercentages,

        [Parameter()]
        [System.Boolean]
        $Disabled,

        [Parameter()]
        [System.String]
        $Template,

        [Parameter()]
        [System.Boolean]
        $MatchesTemplate
    )

    # Check the path exists
    if (-not (Test-Path -Path $Path))
    {
        $errorMessage = $($LocalizedData.QuotaPathDoesNotExistError) -f $Path
        $errorArgumentName = 'Path'
    }

    if ($Ensure -eq 'Absent')
    {
        # No further checks required if quota should be removed.
        return
    }

    if ($Template)
    {
        # Check the template exists
        try
        {
            $null = Get-FSRMQuotaTemplate -Name $Template -ErrorAction Stop
        }
        catch [Microsoft.PowerShell.Cmdletization.Cim.CimJobException]
        {
            $errorMessage = $($LocalizedData.QuotaTemplateNotFoundError) -f $Path, $Template
            $errorArgumentName = 'Path'
        }
    }
    else
    {
        # A template wasn't specifed, ensure the matches template flag is false
        if ($MatchesTemplate)
        {
            $errorMessage = $($LocalizedData.QuotaTemplateEmptyError) -f $Path
            $errorArgumentName = 'Path'
        }
    }

    if ($errorMessage)
    {
        New-InvalidArgumentException `
            -Message $errorMessage `
            -ArgumentName $errorArgumentName
    }
}

Export-ModuleMember -Function *-TargetResource
