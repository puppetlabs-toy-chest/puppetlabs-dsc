$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Networking Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'FSRMDsc.ResourceHelper' `
            -ChildPath 'FSRMDsc.ResourceHelper.psm1'))

# Import Localization Strings
$LocalizedData = Get-LocalizedData `
    -ResourceName 'DSR_FSRMClassificationRule' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Retrieves the FSRM Classification Rule with the specified Name.

    .PARAMETER Name
        The name of the FSRM Classification Rule.
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
            $($LocalizedData.GettingClassificationRuleMessage) `
                -f $Name
        ) -join '' )

    $classificationRule = Get-ClassificationRule -Name $Name

    $returnValue = @{
        Name = $Name
    }

    if ($classificationRule)
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationRuleExistsMessage) `
                    -f $Name
            ) -join '' )

        $returnValue += @{
            Ensure                     = 'Present'
            Description                = $classificationRule.Description
            Property                   = $classificationRule.Property
            PropertyValue              = $classificationRule.PropertyValue
            ClassificationMechanism    = $classificationRule.ClassificationMechanism
            ContentRegularExpression   = $classificationRule.ContentRegularExpression
            ContentString              = $classificationRule.ContentString
            ContentStringCaseSensitive = $classificationRule.ContentStringCaseSensitive
            Disabled                   = $classificationRule.Disabled
            Flags                      = $classificationRule.Flags
            Parameters                 = $classificationRule.Parameters
            Namespace                  = $classificationRule.Namespace
            ReevaluateProperty         = $classificationRule.ReevaluateProperty
        }
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationRuleDoesNotExistMessage) `
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
        Sets the FSRM Classification Rule with the specified Name.

    .PARAMETER Name
        The name of the FSRM Classification Rule.

    .PARAMETER Description
        The description for the FSRM Classification Rule.

    .PARAMETER Ensure
        Specifies whether the FSRM Classification Rule should exist.

    .PARAMETER Property
        Specifies the name of a classification property definition to set.

    .PARAMETER PropertyValue
        Specifies the property value that the rule will assign.

    .PARAMETER ClassificationMechanism
        Specifies the name of a valid classification mechanism available on the server for
        assigning the property value.

    .PARAMETER ContentRegularExpression
        An array of regular expressions for pattern matching.

    .PARAMETER ContentString
        An array of strings for the content classifier to search for.

    .PARAMETER ContentStringCaseSensitive
        An array of case sensitive strings for the content classifier to search for.

    .PARAMETER Disabled
        Indicates that the classification rule is disabled.

    .PARAMETER Flags
        An array of flags that defines the possible states of the rule.

    .PARAMETER Parameters
        An array of parameters in the format <name>=<value> that can be used by the File
        Classification Infrastructure.

    .PARAMETER Namespace
        An array of namespaces where the rule is applied.

    .PARAMETER ReevaluateProperty
        Specifies the evaluation policy of the rule.
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
        [System.String]
        $Property,

        [Parameter()]
        [System.String]
        $PropertyValue,

        [Parameter()]
        [System.String]
        $ClassificationMechanism,

        [Parameter()]
        [System.String[]]
        $ContentRegularExpression,

        [Parameter()]
        [System.String[]]
        $ContentString,

        [Parameter()]
        [System.String[]]
        $ContentStringCaseSensitive,

        [Parameter()]
        [System.Boolean]
        $Disabled,

        [Parameter()]
        [System.String[]]
        $Flags,

        [Parameter()]
        [System.String[]]
        $Parameters,

        [Parameter()]
        [System.String[]]
        $Namespace,

        [Parameter()]
        [ValidateSet('Never', 'Overwrite', 'Aggregate')]
        [System.String]
        $ReevaluateProperty
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingClassificationRuleMessage) `
                -f $Name
        ) -join '' )

    # Remove any parameters that can't be splatted.
    $null = $PSBoundParameters.Remove('Ensure')

    # Lookup the existing Classification Rule
    $classificationRule = Get-ClassificationRule -Name $Name

    if ($Ensure -eq 'Present')
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureClassificationRuleExistsMessage) `
                    -f $Name
            ) -join '' )

        if ($classificationRule)
        {
            # The Classification Rule exists
            Set-FSRMClassificationRule @PSBoundParameters -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationRuleUpdatedMessage) `
                        -f $Name
                ) -join '' )
        }
        else
        {
            # Create the Classification Rule
            New-FSRMClassificationRule @PSBoundParameters -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationRuleCreatedMessage) `
                        -f $Name
                ) -join '' )
        }
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureClassificationRuleDoesNotExistMessage) `
                    -f $Name
            ) -join '' )

        if ($classificationRule)
        {
            # The Classification Rule shouldn't exist - remove it
            Remove-FSRMClassificationRule -Name $Name -ErrorAction Stop

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationRuleRemovedMessage) `
                        -f $Name
                ) -join '' )
        } # if
    } # if
} # Set-TargetResource

<#
    .SYNOPSIS
        Tests the FSRM Classification Rule with the specified Name.

    .PARAMETER Name
        The name of the FSRM Classification Rule.

    .PARAMETER Description
        The description for the FSRM Classification Rule.

    .PARAMETER Ensure
        Specifies whether the FSRM Classification Rule should exist.

    .PARAMETER Property
        Specifies the name of a classification property definition to set.

    .PARAMETER PropertyValue
        Specifies the property value that the rule will assign.

    .PARAMETER ClassificationMechanism
        Specifies the name of a valid classification mechanism available on the server for
        assigning the property value.

    .PARAMETER ContentRegularExpression
        An array of regular expressions for pattern matching.

    .PARAMETER ContentString
        An array of strings for the content classifier to search for.

    .PARAMETER ContentStringCaseSensitive
        An array of case sensitive strings for the content classifier to search for.

    .PARAMETER Disabled
        Indicates that the classification rule is disabled.

    .PARAMETER Flags
        An array of flags that defines the possible states of the rule.

    .PARAMETER Parameters
        An array of parameters in the format <name>=<value> that can be used by the File
        Classification Infrastructure.

    .PARAMETER Namespace
        An array of namespaces where the rule is applied.

    .PARAMETER ReevaluateProperty
        Specifies the evaluation policy of the rule.
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
        [System.String]
        $Property,

        [Parameter()]
        [System.String]
        $PropertyValue,

        [Parameter()]
        [System.String]
        $ClassificationMechanism,

        [Parameter()]
        [System.String[]]
        $ContentRegularExpression,

        [Parameter()]
        [System.String[]]
        $ContentString,

        [Parameter()]
        [System.String[]]
        $ContentStringCaseSensitive,

        [Parameter()]
        [System.Boolean]
        $Disabled,

        [Parameter()]
        [System.String[]]
        $Flags,

        [Parameter()]
        [System.String[]]
        $Parameters,

        [Parameter()]
        [System.String[]]
        $Namespace,

        [Parameter()]
        [ValidateSet('Never', 'Overwrite', 'Aggregate')]
        [System.String]
        $ReevaluateProperty
    )

    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingClassificationRuleMessage) `
                -f $Name
        ) -join '' )

    # Lookup the existing Classification Rule
    $classificationRule = Get-ClassificationRule -Name $Name

    if ($Ensure -eq 'Present')
    {
        # The Classification Rule should exist
        if ($classificationRule)
        {
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationRuleExistsAndShouldMessage) `
                        -f $Name
                ) -join '' )

            # The Classification Rule exists already - check the parameters
            if (($Description) -and ($classificationRule.Description -ne $Description))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'Description'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($Property) -and ($classificationRule.Property -ne $Property))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'Property'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($PropertyValue) -and ($classificationRule.PropertyValue -ne $PropertyValue))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'PropertyValue'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($ClassificationMechanism) `
                    -and ($classificationRule.ClassificationMechanism -ne $ClassificationMechanism))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'ClassificationMechanism'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($ContentRegularExpression) `
                    -and (Compare-Object `
                        -ReferenceObject $ContentRegularExpression `
                        -DifferenceObject $classificationRule.ContentRegularExpression).Count -ne 0)
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'ContentRegularExpression'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($ContentString) `
                    -and (Compare-Object `
                        -ReferenceObject $ContentString `
                        -DifferenceObject $classificationRule.ContentString).Count -ne 0)
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'ContentString'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($ContentStringCaseSensitive) `
                    -and (Compare-Object `
                        -ReferenceObject $ContentStringCaseSensitive `
                        -DifferenceObject $classificationRule.ContentStringCaseSensitive).Count -ne 0)
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'ContentStringCaseSensitive'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($Disabled) -and ($classificationRule.Disabled -ne $Disabled))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'Disabled'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            $existingRuleFlags = @()

            if ($classificationRule.Flags)
            {
                $existingRuleFlags = $classificationRule.Flags
            }

            if (($Flags) `
                    -and (Compare-Object `
                        -ReferenceObject $Flags `
                        -DifferenceObject $existingRuleFlags).Count -ne 0)
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'Flags'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            $existingParameters = @()
            if ($classificationRule.Parameters)
            {
                $existingParameters = $classificationRule.Parameters
            }

            if (($Parameters) `
                    -and (Compare-Object `
                        -ReferenceObject $Parameters `
                        -DifferenceObject $existingParameters).Count -ne 0)
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'Parameters'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($Namespace) `
                    -and (Compare-Object `
                        -ReferenceObject $Namespace `
                        -DifferenceObject $classificationRule.Namespace).Count -ne 0)
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'Namespace'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }

            if (($ReevaluateProperty) `
                    -and ($classificationRule.ReevaluateProperty -ne $ReevaluateProperty))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationRuleNeedsUpdateMessage) `
                            -f $Name, 'ReevaluateProperty'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            }
        }
        else
        {
            # Ths Classification Rule doesn't exist but should
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationRuleDoesNotExistButShouldMessage) `
                        -f $Name
                ) -join '' )

            $desiredConfigurationMatch = $false
        }
    }
    else
    {
        # The Classification Rule should not exist
        if ($classificationRule)
        {
            # The Classification Rule exists but should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationRuleExistsButShouldNotMessage) `
                        -f $Name
                ) -join '' )

            $desiredConfigurationMatch = $false
        }
        else
        {
            # The Classification Rule does not exist and should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationRuleDoesNotExistAndShouldNotMessage) `
                        -f $Name
                ) -join '' )
        }
    } # if

    return $desiredConfigurationMatch
} # Test-TargetResource

<#
    .SYNOPSIS
        Gets the FSRM Classification Rule object with the specified Name.

    .PARAMETER Name
        The name of the FSRM Classification Rule.
#>
Function Get-ClassificationRule
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name
    )

    try
    {
        $classificationRule = Get-FSRMClassificationRule -Name $Name -ErrorAction Stop
    }
    catch [Microsoft.PowerShell.Cmdletization.Cim.CimJobException]
    {
        $classificationRule = $null
    }
    catch
    {
        Throw $_
    }

    return $classificationRule
}

Export-ModuleMember -Function *-TargetResource
