$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Networking Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
        -ChildPath (Join-Path -Path 'FSRMDsc.ResourceHelper' `
            -ChildPath 'FSRMDsc.ResourceHelper.psm1'))

# Import Localization Strings
$LocalizedData = Get-LocalizedData `
    -ResourceName 'DSR_FSRMClassificationPropertyValue' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
        Retrieves the FSRM Classification Property Value with the Name and PropertyName.

    .PARAMETER Name
        The FSRM Classification Property value Name.

    .PARAMETER PropertyName
        The name of the FSRM Classification Property the value applies to.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [Parameter(Mandatory = $true)]
        [System.String]
        $PropertyName
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingClassificationPropertyValueMessage) `
                -f $PropertyName, $Name
        ) -join '' )

    # Lookup the existing Classification Property
    $classificationProperty = Get-ClassificationProperty `
        -PropertyName $PropertyName
    $classificationPropertyValue = $null

    foreach ($c in $classificationProperty.PossibleValue)
    {
        if ($c.Name -eq $Name)
        {
            $classificationPropertyValue = $c
            break
        }
    }

    $returnValue = @{
        Name         = $Name
        PropertyName = $PropertyName
    }

    if ($classificationPropertyValue)
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationPropertyValueExistsMessage) `
                    -f $PropertyName, $Name
            ) -join '' )

            $returnValue += @{
            Ensure      = 'Present'
            DisplayName = $classificationPropertyValue.DisplayName
            Description = $classificationPropertyValue.Description
        }
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.ClassificationPropertyValueDoesNotExistMessage) `
                    -f $PropertyName, $Name
            ) -join '' )

        $returnValue += @{
            Ensure = 'Absent'
        }
    }

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
        Sets the FSRM Classification Property Value with the Name and PropertyName.

    .PARAMETER Name
        The FSRM Classification Property value Name.

    .PARAMETER PropertyName
        The name of the FSRM Classification Property the value applies to.

    .PARAMETER Ensure
        Specifies whether the FSRM Classification Property value should exist.

    .PARAMETER Description
        The description of the FSRM Classification Property value.
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

        [Parameter(Mandatory = $true)]
        [System.String]
        $PropertyName,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $Description
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingClassificationPropertyValueMessage) `
                -f $PropertyName, $Name
        ) -join '' )

    # Remove any parameters that can't be splatted.
    $PSBoundParameters.Remove('Ensure')
    $PSBoundParameters.Remove('PropertyName')

    # Lookup the existing Classification Property
    $classificationProperty = Get-ClassificationProperty `
        -PropertyName $PropertyName

    # Convert the CIMInstance array into an Array List so it can be worked with
    $classificationPropertyValues = `
        [System.Collections.ArrayList]($classificationProperty.PossibleValue)

    # Find the index for the existing Value name (if it exists)
    $classificationPropertyValue = $null
    $classificationPropertyValueIndex = $null

    for ($c = 0; $c -ilt $classificationPropertyValues.Count; $c++)
    {
        if ($classificationPropertyValues[$c].Name -eq $Name)
        {
            $classificationPropertyValue = $classificationPropertyValues[$c]
            $classificationPropertyValueIndex = $c
        }
    }

    if ($Ensure -eq 'Present')
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureClassificationPropertyValueExistsMessage) `
                    -f $PropertyName, $Name
            ) -join '' )

        $NewClassificationPropertyValue = New-FSRMClassificationPropertyValue `
            @PSBoundParameters `
            -ErrorAction Stop

        if ($null -eq $classificationPropertyValueIndex)
        {
            # Create the Classification Property Value
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationPropertyValueCreatedMessage) `
                        -f $PropertyName, $Name
                ) -join '' )
        }
        else
        {
            # The Classification Property Value exists, remove it then update it
            $null = $classificationPropertyValues.RemoveAt($classificationPropertyValueIndex)

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationPropertyValueUpdatedMessage) `
                        -f $PropertyName, $Name
                ) -join '' )
        }

        $null = $classificationPropertyValues.Add($NewClassificationPropertyValue)
    }
    else
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureClassificationPropertyValueDoesNotExistMessage) `
                    -f $PropertyName, $Name
            ) -join '' )

        if ($null -eq $classificationPropertyValueIndex)
        {
            # The Classification Property Value doesn't exist and should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationPropertyValueNoChangeMessage) `
                        -f $PropertyName, $Name
                ) -join '' )
            return
        }
        else
        {
            # The Classification Property Value exists, but shouldn't remove it
            $null = $classificationPropertyValues.RemoveAt($classificationPropertyValueIndex)

            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationPropertyValueRemovedMessage) `
                        -f $PropertyName, $Name
                ) -join '' )
        } # if
    } # if
    # Now write the actual change to the appropriate place
    Set-FSRMClassificationPropertyDefinition `
        -Name $PropertyName `
        -PossibleValue $classificationPropertyValues `
        -ErrorAction Stop

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.ClassificationPropertyValueWrittenMessage) `
                -f $PropertyName, $Name
        ) -join '' )
} # Set-TargetResource

<#
    .SYNOPSIS
        Tests the FSRM Classification Property Value with the Name and PropertyName.

    .PARAMETER Name
        The FSRM Classification Property value Name.

    .PARAMETER PropertyName
        The name of the FSRM Classification Property the value applies to.

    .PARAMETER Ensure
        Specifies whether the FSRM Classification Property value should exist.

    .PARAMETER Description
        The description of the FSRM Classification Property value.
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

        [Parameter(Mandatory = $true)]
        [System.String]
        $PropertyName,

        [Parameter()]
        [ValidateSet('Present', 'Absent')]
        [System.String]
        $Ensure = 'Present',

        [Parameter()]
        [System.String]
        $Description
    )
    # Flag to signal whether settings are correct
    [Boolean] $desiredConfigurationMatch = $true

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingClassificationPropertyValueMessage) `
                -f $PropertyName, $Name
        ) -join '' )

    # Lookup the existing Classification Property
    $classificationProperty = Get-ClassificationProperty `
        -PropertyName $PropertyName

    # Convert the CIMInstance array into an Array List so it can be worked with
    $classificationPropertyValues = `
        [System.Collections.ArrayList]($classificationProperty.PossibleValue)

    # Find the index for the existing Value name (if it exists)
    $classificationPropertyValue = $null
    $classificationPropertyValueIndex = $null

    for ($c = 0; $c -ilt $classificationPropertyValues.Count; $c++)
    {
        if ($classificationPropertyValues[$c].Name -eq $Name)
        {
            $classificationPropertyValue = $classificationPropertyValues[$c]
            $classificationPropertyValueIndex = $c
        }
    }

    if ($Ensure -eq 'Present')
    {
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.EnsureClassificationPropertyValueExistsMessage) `
                    -f $PropertyName, $Name
            ) -join '' )

        if ($null -eq $classificationPropertyValueIndex)
        {
            # The Classification Property Value does not exist but should
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationPropertyValueDoesNotExistButShouldMessage) `
                        -f $PropertyName, $Name
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
        else
        {
            # The Classification Property Value exists - check it
            #region Parameter Checks
            if (($PSBoundParameters.ContainsKey('Description')) `
                    -and ($classificationPropertyValue.Description -ne $Description))
            {
                Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.ClassificationPropertyValuePropertyNeedsUpdateMessage) `
                            -f $PropertyName, $Name, 'Description'
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }
            #endregion
        }
    }
    else
    {
        if ($null -eq $classificationPropertyValueIndex)
        {
            # The ClassificationPropertyValue doesn't exist and should not
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationPropertyValueDoesNotExistAndShouldNotMessage) `
                        -f $PropertyName, $Name
                ) -join '' )
        }
        else
        {
            # The ClassificationPropertyValue exists, but it should be removed
            Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.ClassificationPropertyValueExistsAndShouldNotMessage) `
                        -f $PropertyName, $Name
                ) -join '' )
            $desiredConfigurationMatch = $false
        } # if
    } # if

    return $desiredConfigurationMatch
} # Test-TargetResource

<#
    .SYNOPSIS
        Gets the FSRM Classification Property Value Object with the PropertyName.

    .PARAMETER Name
        The FSRM Classification Property value Name.
#>
Function Get-ClassificationProperty
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $PropertyName
    )

    try
    {
        $classificationProperty = Get-FSRMClassificationPropertyDefinition `
            -Name $PropertyName `
            -ErrorAction Stop
    }
    catch [Microsoft.PowerShell.Cmdletization.Cim.CimJobException]
    {
        New-InvalidArgumentException `
            -Message ($($LocalizedData.ClassificationPropertyNotFoundError) -f $PropertyName) `
            -ArgumentName $PropertyName
    }
    catch
    {
        Throw $_
    }

    return $classificationProperty
}

Export-ModuleMember -Function *-TargetResource
