$modulePath = Join-Path -Path (Split-Path -Path (Split-Path -Path $PSScriptRoot -Parent) -Parent) -ChildPath 'Modules'

# Import the Certificate Resource Helper Module
Import-Module -Name (Join-Path -Path $modulePath `
                               -ChildPath (Join-Path -Path 'DFSDsc.ResourceHelper' `
                                                     -ChildPath 'DFSDsc.ResourceHelper.psm1'))

# Import Localization Strings
$localizedData = Get-LocalizedData `
    -ResourceName 'MSFT_xDFSNamespaceRoot' `
    -ResourcePath (Split-Path -Parent $Script:MyInvocation.MyCommand.Path)

<#
    .SYNOPSIS
    Returns the current state of a DFS Namespace Root.

    .PARAMETER Path
    Specifies a path for the root of a DFS namespace.

    .PARAMETER TargetPath
    Specifies a path for a root target of the DFS namespace.

    .PARAMETER Ensure
    Specifies if the DFS Namespace root should exist.

    .PARAMETER Type
    Specifies the type of a DFS namespace as a Type object.
#>
function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter(Mandatory = $true)]
        [System.String]
        $TargetPath,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Standalone','DomainV1','DomainV2')]
        [System.String]
        $Type
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingNamespaceRootMessage) `
                -f $Type,$Path,$TargetPath
        ) -join '' )

    # Generate the return object assuming absent.
    $returnValue = @{
        Path = $Path
        TargetPath = $TargetPath
        Ensure = 'Absent'
        Type = $Type
    }

    # Lookup the existing Namespace root
    $root = Get-Root `
        -Path $Path

    if ($root)
    {
        # The namespace exists
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceRootExistsMessage) `
                    -f $Type,$Path
            ) -join '' )
    }
    else
    {
        # The namespace does not exist
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceRootDoesNotExistMessage) `
                    -f $Type,$Path
            ) -join '' )
        return $returnValue
    } # if

    $returnValue += @{
        TimeToLiveSec                = $root.TimeToLiveSec
        State                        = $root.State
        Description                  = $root.Description
        EnableSiteCosting            = ($root.Flags -contains 'Site Costing')
        EnableInsiteReferrals        = ($root.Flags -contains 'Insite Referrals')
        EnableAccessBasedEnumeration = ($root.Flags -contains 'AccessBased Enumeration')
        EnableRootScalability        = ($root.Flags -contains 'Root Scalability')
        EnableTargetFailback         = ($root.Flags -contains 'Target Failback')
    }

    # DFS Root exists but does target exist?
    $target = Get-RootTarget `
        -Path $Path `
        -TargetPath $TargetPath

    if ($target)
    {
        # The target exists in this namespace
        $returnValue.Ensure = 'Present'
        $returnValue += @{
            ReferralPriorityClass        = $target.ReferralPriorityClass
            ReferralPriorityRank         = $target.ReferralPriorityRank
        }

        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceRootTargetExistsMessage) `
                    -f $Type,$Path,$TargetPath
            ) -join '' )
    }
    else
    {
        # The target does not exist in this namespace
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceRootTargetDoesNotExistMessage) `
                    -f $Type,$Path,$TargetPath
            ) -join '' )
    } # if

    return $returnValue
} # Get-TargetResource

<#
    .SYNOPSIS
    Sets the current state of a DFS Namespace Folder.

    .PARAMETER Path
    Specifies a path for the root of a DFS namespace.

    .PARAMETER TargetPath
    Specifies a path for a root target of the DFS namespace.

    .PARAMETER Ensure
    Specifies if the DFS Namespace root should exist.

    .PARAMETER Type
    Specifies the type of a DFS namespace as a Type object.

    .PARAMETER Description
    The description of the DFS Namespace.

    .PARAMETER TimeToLiveSec
    Specifies a TTL interval, in seconds, for referrals.

    .PARAMETER EnableSiteCosting
    Indicates whether a DFS namespace uses cost-based selection.

    .PARAMETER EnableInsiteReferrals
    Indicates whether a DFS namespace server provides a client only with referrals that are in the same site as the client.

    .PARAMETER EnableAccessBasedEnumeration
    Indicates whether a DFS namespace uses access-based enumeration.

    .PARAMETER EnableRootScalability
    Indicates whether a DFS namespace uses root scalability mode.

    .PARAMETER EnableTargetFailback
    Indicates whether a DFS namespace uses target failback.

    .PARAMETER ReferralPriorityClass
    Specifies the target priority class for a DFS namespace root.

    .PARAMETER ReferralPriorityRank
    Specifies the priority rank, as an integer, for a root target of the DFS namespace.
#>
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter(Mandatory = $true)]
        [System.String]
        $TargetPath,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Standalone','DomainV1','DomainV2')]
        [System.String]
        $Type,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.UInt32]
        $TimeToLiveSec,

        [Parameter()]
        [System.Boolean]
        $EnableSiteCosting,

        [Parameter()]
        [System.Boolean]
        $EnableInsiteReferrals,

        [Parameter()]
        [System.Boolean]
        $EnableAccessBasedEnumeration,

        [Parameter()]
        [System.Boolean]
        $EnableRootScalability,

        [Parameter()]
        [System.Boolean]
        $EnableTargetFailback,

        [Parameter()]
        [ValidateSet('Global-High','SiteCost-High','SiteCost-Normal','SiteCost-Low','Global-Low')]
        [System.String]
        $ReferralPriorityClass,

        [Parameter()]
        [System.UInt32]
        $ReferralPriorityRank
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingNamespaceRootMessage) `
                -f $Type,$Path,$TargetPath
        ) -join '' )

    # Lookup the existing Namespace root
    $root = Get-Root `
        -Path $Path

    if ($Ensure -eq 'Present')
    {
        # Set desired Configuration
        if ($root)
        {
            # Does the root need to be updated?
            [System.Boolean] $rootChange = $false

            # The root properties that will be updated
            $rootProperties = @{
                State = 'online'
            }

            if (($Description) `
                -and ($root.Description -ne $Description))
            {
                $rootProperties += @{
                    Description = $Description
                }
                $rootChange = $true
            } # if

            if (($TimeToLiveSec) `
                -and ($root.TimeToLiveSec -ne $TimeToLiveSec))
            {
                $rootProperties += @{
                    TimeToLiveSec = $TimeToLiveSec
                }
                $rootChange = $true
            } # if

            if (($null -ne $EnableSiteCosting) `
                -and (($root.Flags -contains 'Site Costing') -ne $EnableSiteCosting))
            {
                $rootProperties += @{
                    EnableSiteCosting = $EnableSiteCosting
                }
                $rootChange = $true
            } # if

            if (($null -ne $EnableInsiteReferrals) `
                -and (($root.Flags -contains 'Insite Referrals') -ne $EnableInsiteReferrals))
            {
                $rootProperties += @{
                    EnableInsiteReferrals = $EnableInsiteReferrals
                }
                $rootChange = $true
            } # if

            if (($null -ne $EnableAccessBasedEnumeration) `
                -and (($root.Flags -contains 'AccessBased Enumeration') -ne $EnableAccessBasedEnumeration))
            {
                $rootProperties += @{
                    EnableAccessBasedEnumeration = $EnableAccessBasedEnumeration
                }
                $rootChange = $true
            } # if

            if (($null -ne $EnableRootScalability) `
                -and (($root.Flags -contains 'Root Scalability') -ne $EnableRootScalability))
            {
                $rootProperties += @{
                    EnableRootScalability = $EnableRootScalability
                }
                $rootChange = $true
            } # if

            if (($null -ne $EnableTargetFailback) `
                -and (($root.Flags -contains 'Target Failback') -ne $EnableTargetFailback))
            {
                $rootProperties += @{
                    EnableTargetFailback = $EnableTargetFailback
                }
                $rootChange = $true
            } # if

            if ($rootChange)
            {
                # Update root settings
                $null = Set-DfsnRoot `
                    -Path $Path `
                    @RootProperties `
                    -ErrorAction Stop

                $rootProperties.GetEnumerator() | ForEach-Object -Process {
                    Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.NamespaceRootUpdateParameterMessage) `
                            -f $Type,$Path,$_.name, $_.value
                    ) -join '' )
                }
            } # if

            # Get target
            $target = Get-RootTarget `
                -Path $Path `
                -TargetPath $TargetPath

            # Does the target need to be updated?
            [System.Boolean] $targetChange = $false

            # The Target properties that will be updated
            $targetProperties = @{}

            # Check the target properties
            if (($ReferralPriorityClass) `
                -and ($target.ReferralPriorityClass -ne $ReferralPriorityClass))
            {
                $targetProperties += @{
                    ReferralPriorityClass = ($ReferralPriorityClass -replace '-','')
                }
                $targetChange = $true
            } # if

            if (($ReferralPriorityRank) `
                -and ($target.ReferralPriorityRank -ne $ReferralPriorityRank))
            {
                $targetProperties += @{
                    ReferralPriorityRank = $ReferralPriorityRank
                }
                $targetChange = $true
            } # if

            # Is the target a member of the namespace?
            if ($target)
            {
                # Does the target need to be changed?
                if ($targetChange)
                {
                    # Update target settings
                    $null = Set-DfsnRootTarget `
                        -Path $Path `
                        -TargetPath $TargetPath `
                        @TargetProperties `
                        -ErrorAction Stop
                }
            }
            else
            {
                # Add target to Namespace
                $null = New-DfsnRootTarget `
                    -Path $Path `
                    -TargetPath $TargetPath `
                    @TargetProperties `
                    -ErrorAction Stop
            } # if

            # Output the target parameters that were changed/set
            $targetProperties.GetEnumerator() | ForEach-Object -Process {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootTargetUpdateParameterMessage) `
                        -f $Type,$Path,$TargetPath,$_.name, $_.value
                ) -join '' )
            }
        }
        else
        {
            <#
                Prepare to use the PSBoundParameters as a splat to created
                The new DFS Namespace root.
            #>
            $null = $PSBoundParameters.Remove('Ensure')

            # Correct the ReferralPriorityClass field
            if ($ReferralPriorityClass)
            {
                $PSBoundParameters.ReferralPriorityClass = ($ReferralPriorityClass -replace '-','')
            } # if

            # Create New-DfsnRoot
            $null = New-DfsnRoot `
                @PSBoundParameters `
                -ErrorAction Stop

            $PSBoundParameters.GetEnumerator() | ForEach-Object -Process {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootUpdateParameterMessage) `
                        -f $Type,$Path,$_.name, $_.value
                ) -join '' )
            }
        } # if
    }
    else
    {
        <#
            The Namespace Target should not exist
            Get root target
        #>
        $target = Get-RootTarget `
            -Path $Path `
            -TargetPath $TargetPath

        if ($target)
        {
            # Remove the target from the namespace
            $null = Remove-DfsnRootTarget `
                -Path $Path `
                -TargetPath $TargetPath `
                -Confirm:$false `
                -ErrorAction Stop

            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceRootTargetRemovedMessage) `
                    -f $Type,$Path,$TargetPath
            ) -join '' )
        } # if
    } # if
} # Set-TargetResource

<#
    .SYNOPSIS
    Tests the current state of a DFS Namespace Folder.

    .PARAMETER Path
    Specifies a path for the root of a DFS namespace.

    .PARAMETER TargetPath
    Specifies a path for a root target of the DFS namespace.

    .PARAMETER Ensure
    Specifies if the DFS Namespace root should exist.

    .PARAMETER Type
    Specifies the type of a DFS namespace as a Type object.

    .PARAMETER Description
    The description of the DFS Namespace.

    .PARAMETER TimeToLiveSec
    Specifies a TTL interval, in seconds, for referrals.

    .PARAMETER EnableSiteCosting
    Indicates whether a DFS namespace uses cost-based selection.

    .PARAMETER EnableInsiteReferrals
    Indicates whether a DFS namespace server provides a client only with referrals that are in the same site as the client.

    .PARAMETER EnableAccessBasedEnumeration
    Indicates whether a DFS namespace uses access-based enumeration.

    .PARAMETER EnableRootScalability
    Indicates whether a DFS namespace uses root scalability mode.

    .PARAMETER EnableTargetFailback
    Indicates whether a DFS namespace uses target failback.

    .PARAMETER ReferralPriorityClass
    Specifies the target priority class for a DFS namespace root.

    .PARAMETER ReferralPriorityRank
    Specifies the priority rank, as an integer, for a root target of the DFS namespace.
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

        [Parameter(Mandatory = $true)]
        [System.String]
        $TargetPath,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [System.String]
        $Ensure,

        [Parameter(Mandatory = $true)]
        [ValidateSet('Standalone','DomainV1','DomainV2')]
        [System.String]
        $Type,

        [Parameter()]
        [System.String]
        $Description,

        [Parameter()]
        [System.UInt32]
        $TimeToLiveSec,

        [Parameter()]
        [System.Boolean]
        $EnableSiteCosting,

        [Parameter()]
        [System.Boolean]
        $EnableInsiteReferrals,

        [Parameter()]
        [System.Boolean]
        $EnableAccessBasedEnumeration,

        [Parameter()]
        [System.Boolean]
        $EnableRootScalability,

        [Parameter()]
        [System.Boolean]
        $EnableTargetFailback,

        [Parameter()]
        [ValidateSet('Global-High','SiteCost-High','SiteCost-Normal','SiteCost-Low','Global-Low')]
        [System.String]
        $ReferralPriorityClass,

        [Parameter()]
        [System.UInt32]
        $ReferralPriorityRank
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingNamespaceRootMessage) `
                -f $Type,$Path,$TargetPath
        ) -join '' )

    # Flag to signal whether settings are correct
    [System.Boolean] $desiredConfigurationMatch = $true

    # Lookup the existing Namespace root
    $root = Get-Root `
        -Path $Path

    if ($Ensure -eq 'Present')
    {
        # The Namespace root should exist
        if ($root)
        {
            <#
                The Namespace root exists and should
                Changing the namespace type is not possible - the namespace
                can only be recreated if the type should change.
            #>
            if (($root.Type -replace ' ','') -ne $Type)
            {
                New-InvalidOperationException `
                    -Message ($($LocalizedData.NamespaceRootTypeConversionError) `
                        -f $Type,($root.Type -replace ' ',''))
            } # if

            # Check the Namespace parameters
            if (($Description) `
                -and ($root.Description -ne $Description)) {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootParameterNeedsUpdateMessage) `
                        -f $Type,$Path,'Description'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            } # if

            if (($TimeToLiveSec) `
                -and ($root.TimeToLiveSec -ne $TimeToLiveSec)) {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootParameterNeedsUpdateMessage) `
                        -f $Type,$Path,'TimeToLiveSec'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            } # if

            if (($null -ne $EnableSiteCosting) `
                -and (($root.Flags -contains 'Site Costing') -ne $EnableSiteCosting)) {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootParameterNeedsUpdateMessage) `
                        -f $Type,$Path,'EnableSiteCosting'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            } # if

            if (($null -ne $EnableInsiteReferrals) `
                -and (($root.Flags -contains 'Insite Referrals') -ne $EnableInsiteReferrals)) {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootParameterNeedsUpdateMessage) `
                        -f $Type,$Path,'EnableInsiteReferrals'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            } # if

            if (($null -ne $EnableAccessBasedEnumeration) `
                -and (($root.Flags -contains 'AccessBased Enumeration') -ne $EnableAccessBasedEnumeration)) {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootParameterNeedsUpdateMessage) `
                        -f $Type,$Path,'EnableAccessBasedEnumeration'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            } # if

            if (($null -ne $EnableRootScalability) `
                -and (($root.Flags -contains 'Root Scalability') -ne $EnableRootScalability)) {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootParameterNeedsUpdateMessage) `
                        -f $Type,$Path,'EnableRootScalability'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            } # if

            if (($null -ne $EnableTargetFailback) `
                -and (($root.Flags -contains 'Target Failback') -ne $EnableTargetFailback)) {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootParameterNeedsUpdateMessage) `
                        -f $Type,$Path,'EnableTargetFailback'
                    ) -join '' )

                $desiredConfigurationMatch = $false
            } # if

            $target = Get-RootTarget `
                -Path $Path `
                -TargetPath $TargetPath

            if ($target)
            {
                if (($ReferralPriorityClass) `
                    -and ($target.ReferralPriorityClass -ne $ReferralPriorityClass)) {
                    Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.NamespaceRootTargetParameterNeedsUpdateMessage) `
                            -f $Type,$Path,$TargetPath,'ReferralPriorityClass'
                        ) -join '' )
                    $desiredConfigurationMatch = $false
                } # if

                if (($ReferralPriorityRank) `
                    -and ($target.ReferralPriorityRank -ne $ReferralPriorityRank)) {
                    Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.NamespaceRootTargetParameterNeedsUpdateMessage) `
                            -f $Type,$Path,$TargetPath,'ReferralPriorityRank'
                        ) -join '' )
                    $desiredConfigurationMatch = $false
                } # if
            }
            else
            {
                # The Root target does not exist but should - change required
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootTargetDoesNotExistButShouldMessage) `
                        -f $Type,$Path,$TargetPath
                    ) -join '' )
                $desiredConfigurationMatch = $false
            } # if
        }
        else
        {
            # Ths Namespace root doesn't exist but should - change required
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                 $($LocalizedData.NamespaceRootDoesNotExistButShouldMessage) `
                    -f $Type,$Path
                ) -join '' )
            $desiredConfigurationMatch = $false
        } # if
    }
    else
    {
        # The Namespace target should not exist
        if ($root)
        {
            $target = Get-RootTarget `
                -Path $Path `
                -TargetPath $TargetPath

            if ($target)
            {
                # The Root target exists but should not - change required
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootTargetExistsButShouldNotMessage) `
                        -f $Type,$Path,$TargetPath
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }
            else
            {
                # The Namespace exists but the target doesn't - change not required
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceRootTargetDoesNotExistAndShouldNotMessage) `
                        -f $Type,$Path,$TargetPath
                    ) -join '' )
            } # if
        }
        else
        {
            # The Namespace does not exist (so neither does the target) - change not required
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                 $($LocalizedData.NamespaceRootDoesNotExistAndShouldNotMessage) `
                    -f $Type,$Path
                ) -join '' )
        } # if
    } # if

    return $desiredConfigurationMatch
} # Test-TargetResource

<#
    .SYNOPSIS
    Lookup the DFSN Root.

    .PARAMETER Path
    Specifies a path for the root of a DFS namespace.
#>
Function Get-Root
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Path
    )

    try
    {
        $dfsnRoot = Get-DfsnRoot `
            -Path $Path `
            -ErrorAction Stop
    }
    catch [Microsoft.Management.Infrastructure.CimException]
    {
        $dfsnRoot = $null
    }
    catch
    {
        throw $_
    }
    return $dfsnRoot
}

<#
    .SYNOPSIS
    Lookup the DFSN Root Target in a namespace.

    .PARAMETER Path
    Specifies a path for the root of a DFS namespace.

    .PARAMETER TargetPath
    Specifies a path for a root target of the DFS namespace.
#>
Function Get-RootTarget
{
    param
    (
        [Parameter(Mandatory = $true)]
        [System.String]
        $Path,

        [Parameter(Mandatory = $true)]
        [System.String]
        $TargetPath
    )

    try
    {
        $dfsnTarget = Get-DfsnRootTarget `
            -Path $Path `
            -TargetPath $TargetPath `
            -ErrorAction Stop
    }
    catch [Microsoft.Management.Infrastructure.CimException]
    {
        $dfsnTarget = $null
    }
    catch
    {
        throw $_
    }
    return $dfsnTarget
}

Export-ModuleMember -Function *-TargetResource
