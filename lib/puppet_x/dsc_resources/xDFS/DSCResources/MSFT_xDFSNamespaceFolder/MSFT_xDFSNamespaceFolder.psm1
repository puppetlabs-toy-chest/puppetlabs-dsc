data LocalizedData
{
# culture="en-US"
ConvertFrom-StringData -StringData @'
GettingNamespaceFolderMessage=Getting DFS Namespace Folder "{0}" Target "{1}".
NamespaceFolderExistsMessage=DFS Namespace Folder "{0}" exists.
NamespaceFolderDoesNotExistMessage=DFS Namespace Folder "{0}" does not exist.
NamespaceFolderTargetExistsMessage=DFS Namespace Folder "{0}" target "{1}" exists.
NamespaceFolderTargetDoesNotExistMessage=DFS Namespace Folder "{0}" target "{1}" does not exist.
SettingNamespaceFolderMessage=Setting DFS Namespace Folder "{0}" Target "{1}".
NamespaceFolderUpdateParameterMessage=Setting DFS Namespace Folder "{0}" parameter {2} to "{3}".
NamespaceFolderTargetUpdateParameterMessage=Setting DFS Namespace Folder "{0}" Target "{1}" parameter {2} to "{3}".
NamespaceFolderCreatedMessage=DFS Namespace Folder "{0}" Target "{1}" created.
NamespaceFolderTargetRemovedMessage=DFS Namespace Folder "{0}" Target "{1}" removed.
TestingNamespaceFolderMessage=Testing DFS Namespace Folder "{0}" Target "{1}".
NamespaceFolderParameterNeedsUpdateMessage=DFS Namespace Folder "{0}" {2} is different. Change required.
NamespaceFolderTargetParameterNeedsUpdateMessage=DFS Namespace Folder "{0}" Target "{1}" {2} is different. Change required.
NamespaceFolderDoesNotExistButShouldMessage=DFS Namespace Folder "{0}" does not exist but should. Change required.
NamespaceFolderTargetExistsButShouldNotMessage=DFS Namespace Folder "{0}" Target "{1}" exists but should not. Change required.
NamespaceFolderTargetDoesNotExistButShouldMessage=DFS Namespace Folder "{0}" Target "{1}" does not exist but should. Change required.
NamespaceFolderDoesNotExistAndShouldNotMessage=DFS Namespace Folder "{0}" does not exist and should not. Change not required.
NamespaceFolderTargetDoesNotExistAndShouldNotMessage=DFS Namespace Folder "{0}" Target "{1}" does not exist and should not. Change not required.
'@
}

function Get-TargetResource 
{
    [CmdletBinding()]
    [OutputType([Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $Path,

        [parameter(Mandatory = $true)]
        [String]
        $TargetPath,

        [parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure
    )       

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.GettingNamespaceFolderMessage) `
                -f $Path,$TargetPath
        ) -join '' )

    # Generate the return object assuming absent.
    $ReturnValue = @{
        Path = $Path
        TargetPath = $TargetPath
        Ensure = 'Absent'
    }
    
    # Remove the Ensue parmeter from the bound parameters
    $null = $PSBoundParameters.Remove('Ensure')
        
    # Lookup the existing Namespace Folder    
    $Folder = Get-Folder `
        -Path $Path
    
    if ($Folder)
    {
        # The namespace folder exists
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceFolderExistsMessage) `
                    -f $Path,$TargetPath
            ) -join '' )
    }
    else
    {
        # The namespace folder does not exist
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceFolderDoesNotExistMessage) `
                    -f $Path,$TargetPath 
            ) -join '' )
        return $ReturnValue
    }

    $ReturnValue += @{
        TimeToLiveSec                = $Folder.TimeToLiveSec
        State                        = $Folder.State
        Description                  = $Folder.Description
        EnableInsiteReferrals        = ($Folder.Flags -contains 'Insite Referrals')
        EnableTargetFailback         = ($Folder.Flags -contains 'Target Failback')
    }
    
    # DFS Folder exists but does target exist?               
    $Target = Get-FolderTarget `
        -Path $Path `
        -TargetPath $TargetPath

    if ($Target)
    {
        # The target exists in this namespace
        $ReturnValue.Ensure = 'Present'
        $ReturnValue += @{
            ReferralPriorityClass        = $Target.ReferralPriorityClass
            ReferralPriorityRank         = $Target.ReferralPriorityRank
        }
        
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceFolderTargetExistsMessage) `
                    -f $Path,$TargetPath
            ) -join '' )
    }
    else
    {               
        # The target does not exist in this namespace
        Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceFolderTargetDoesNotExistMessage) `
                    -f $Path,$TargetPath
            ) -join '' )
    }    
    
    return $ReturnValue
} # Get-TargetResource

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $Path,

        [parameter(Mandatory = $true)]
        [String]
        $TargetPath,

        [parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure,
        
        [String]
        $Description,
        
        [Uint32]
        $TimeToLiveSec,

        [Boolean]
        $EnableInsiteReferrals,
           
        [Boolean]
        $EnableTargetFailback,

        [ValidateSet('Global-High','SiteCost-High','SiteCost-Normal','SiteCost-Low','Global-Low')]
        [String]
        $ReferralPriorityClass,
        
        [Uint32]
        $ReferralPriorityRank        
    )

    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.SettingNamespaceFolderMessage) `
                -f $Path,$TargetPath
        ) -join '' )

    # Lookup the existing Namespace Folder    
    $Folder = Get-Folder `
        -Path $Path

    if ($Ensure -eq 'Present')
    {
        # Set desired Configuration
        if ($Folder)
        {
            # Does the Folder need to be updated?
            [boolean] $FolderChange = $false
            
            # The Folder properties that will be updated
            $FolderProperties = @{
                State = 'online'
            }

            if (($Description) `
                -and ($Folder.Description -ne $Description))
            {
                $FolderProperties += @{
                    Description = $Description
                }
                $FolderChange = $true
            }

            if (($TimeToLiveSec) `
                -and ($Folder.TimeToLiveSec -ne $TimeToLiveSec))
            {
                $FolderProperties += @{
                    TimeToLiveSec = $TimeToLiveSec
                }
                $FolderChange = $true
            }

            if (($EnableInsiteReferrals -ne $null) `
                -and (($Folder.Flags -contains 'Insite Referrals') -ne $EnableInsiteReferrals))
            {
                $FolderProperties += @{                    
                    EnableInsiteReferrals = $EnableInsiteReferrals
                }
                $FolderChange = $true
            }

            if (($EnableTargetFailback -ne $null) `
                -and (($Folder.Flags -contains 'Target Failback') -ne $EnableTargetFailback))
            {
                $FolderProperties += @{                    
                    EnableTargetFailback = $EnableTargetFailback
                }
                $FolderChange = $true
            }
            
            if ($FolderChange)
            {
                # Update Folder settings
                $null = Set-DfsnFolder `
                    -Path $Path `
                    @FolderProperties `
                    -ErrorAction Stop

                $FolderProperties.GetEnumerator() | ForEach-Object -Process {                
                    Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.NamespaceFolderUpdateParameterMessage) `
                            -f $Path,$TargetPath,$_.name, $_.value
                    ) -join '' )            
                }
            }
                                
            # Get target
            $Target = Get-FolderTarget `
                -Path $Path `
                -TargetPath $TargetPath
            
            # Does the target need to be updated?
            [boolean] $TargetChange = $false

            # The Target properties that will be updated
            $TargetProperties = @{}

            # Check the target properties
            if (($ReferralPriorityClass) `
                -and ($Target.ReferralPriorityClass -ne $ReferralPriorityClass))
            {
                $TargetProperties += @{
                    ReferralPriorityClass = ($ReferralPriorityClass -replace '-','')
                }
                $TargetChange = $true
            }
            
            if (($ReferralPriorityRank) `
                -and ($Target.ReferralPriorityRank -ne $ReferralPriorityRank))
            {
                $TargetProperties += @{                    
                    ReferralPriorityRank = $ReferralPriorityRank
                }
                $TargetChange = $true
            }                

            # Is the target a member of the namespace?
            if ($Target)
            {
                # Does the target need to be changed?
                if ($TargetChange)
                {
                    # Update target settings
                    $null = Set-DfsnFolderTarget `
                        -Path $Path `
                        -TargetPath $TargetPath `
                        @TargetProperties `
                        -ErrorAction Stop
                }
            }
            else
            {
                # Add target to Namespace
                $null = New-DfsnFolderTarget `
                    -Path $Path `
                    -TargetPath $TargetPath `
                    @TargetProperties `
                    -ErrorAction Stop
            }

            # Output the target parameters that were changed/set
            $TargetProperties.GetEnumerator() | ForEach-Object -Process {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceFolderTargetUpdateParameterMessage) `
                        -f $Path,$TargetPath,$_.name, $_.value
                ) -join '' )
            }
        }
        else
        {
            # Prepare to use the PSBoundParameters as a splat to created
            # The new DFS Namespace Folder.
            $null = $PSBoundParameters.Remove('Ensure')

            # Correct the ReferralPriorityClass field
            if ($ReferralPriorityClass)
            { 
                $PSBoundParameters.ReferralPriorityClass = ($ReferralPriorityClass -replace '-','')
            }

            # Create New-DfsnFolder
            $null = New-DfsnFolder `
                @PSBoundParameters `
                -ErrorAction Stop

            $PSBoundParameters.GetEnumerator() | ForEach-Object -Process {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceFolderUpdateParameterMessage) `
                        -f $Path,$TargetPath,$_.name, $_.value
                ) -join '' )
            }
        }
    }
    else
    {
        # The Namespace Folder Target should not exist

        # Get Folder target
        $Target = Get-FolderTarget `
            -Path $Path `
            -TargetPath $TargetPath

        if ($Target)
        {
            # Remove the target from the Namespace Folder
            $null = Remove-DfsnFolderTarget `
                -Path $Path `
                -TargetPath $TargetPath `
                -Confirm:$false `
                -ErrorAction Stop

            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                $($LocalizedData.NamespaceFolderTargetRemovedMessage) `
                    -f $Path,$TargetPath
            ) -join '' )
        }
    }
} # Set-TargetResource

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $Path,

        [parameter(Mandatory = $true)]
        [String]
        $TargetPath,

        [parameter(Mandatory = $true)]
        [ValidateSet('Present','Absent')]
        [String]
        $Ensure,
        
        [String]
        $Description,
        
        [Uint32]
        $TimeToLiveSec,

        [Boolean]
        $EnableInsiteReferrals,
            
        [Boolean]
        $EnableTargetFailback,

        [ValidateSet('Global-High','SiteCost-High','SiteCost-Normal','SiteCost-Low','Global-Low')]
        [String]
        $ReferralPriorityClass,
        
        [Uint32]
        $ReferralPriorityRank          
    )
   
    Write-Verbose -Message ( @(
            "$($MyInvocation.MyCommand): "
            $($LocalizedData.TestingNamespaceFolderMessage) `
                -f $Path,$TargetPath 
        ) -join '' )

    # Flag to signal whether settings are correct
    [Boolean] $DesiredConfigurationMatch = $true    

    # Lookup the existing Namespace Folder    
    $Folder = Get-Folder `
        -Path $Path
            
    if ($Ensure -eq 'Present')
    {
        # The Namespace Folder should exist
        if ($Folder)
        {
            # The Namespace Folder exists and should

            # Check the Namespace parameters
            if (($Description) `
                -and ($Folder.Description -ne $Description)) {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceFolderParameterNeedsUpdateMessage) `
                        -f $Path,$TargetPath,'Description'
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }
                        
            if (($TimeToLiveSec) `
                -and ($Folder.TimeToLiveSec -ne $TimeToLiveSec)) {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceFolderParameterNeedsUpdateMessage) `
                        -f $Path,$TargetPath,'TimeToLiveSec'
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }

            if (($EnableInsiteReferrals -ne $null) `
                -and (($Folder.Flags -contains 'Insite Referrals') -ne $EnableInsiteReferrals)) {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceFolderParameterNeedsUpdateMessage) `
                        -f $Path,$TargetPath,'EnableInsiteReferrals'
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }

            if (($EnableTargetFailback -ne $null) `
                -and (($Folder.Flags -contains 'Target Failback') -ne $EnableTargetFailback)) {
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceFolderParameterNeedsUpdateMessage) `
                        -f $Path,$TargetPath,'EnableTargetFailback'
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }

            $Target = Get-FolderTarget `
                -Path $Path `
                -TargetPath $TargetPath

            if ($Target)
            {
                if (($ReferralPriorityClass) `
                    -and ($Target.ReferralPriorityClass -ne $ReferralPriorityClass)) {
                    Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.NamespaceFolderTargetParameterNeedsUpdateMessage) `
                            -f $Path,$TargetPath,'ReferralPriorityClass'
                        ) -join '' )
                    $desiredConfigurationMatch = $false
                }

                if (($ReferralPriorityRank) `
                    -and ($Target.ReferralPriorityRank -ne $ReferralPriorityRank)) {
                    Write-Verbose -Message ( @(
                        "$($MyInvocation.MyCommand): "
                        $($LocalizedData.NamespaceFolderTargetParameterNeedsUpdateMessage) `
                            -f $Path,$TargetPath,'ReferralPriorityRank'
                        ) -join '' )
                    $desiredConfigurationMatch = $false
                }
            }
            else
            {
                # The Folder target does not exist but should - change required
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceFolderTargetDoesNotExistButShouldMessage) `
                        -f $Path,$TargetPath
                    ) -join '' )
                $desiredConfigurationMatch = $false                   
            }
        }
        else
        {
            # Ths Namespace Folder doesn't exist but should - change required
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                 $($LocalizedData.NamespaceFolderDoesNotExistButShouldMessage) `
                    -f $Path,$TargetPath
                ) -join '' )
            $desiredConfigurationMatch = $false
        }
    }
    else
    {
        # The Namespace target should not exist
        if ($Folder)
        {
            $Target = Get-FolderTarget `
                -Path $Path `
                -TargetPath $TargetPath
                
            if ($Target)
            {
                # The Folder target exists but should not - change required
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceFolderTargetExistsButShouldNotMessage) `
                        -f $Path,$TargetPath
                    ) -join '' )
                $desiredConfigurationMatch = $false
            }
            else
            {
                # The Namespace exists but the target doesn't - change not required
                Write-Verbose -Message ( @(
                    "$($MyInvocation.MyCommand): "
                    $($LocalizedData.NamespaceFolderTargetDoesNotExistAndShouldNotMessage) `
                        -f $Path,$TargetPath
                    ) -join '' )
            }
        }
        else
        {
            # The Namespace does not exist (so neither does the target) - change not required
            Write-Verbose -Message ( @(
                "$($MyInvocation.MyCommand): "
                 $($LocalizedData.NamespaceFolderDoesNotExistAndShouldNotMessage) `
                    -f $Path,$TargetPath
                ) -join '' )
        }
    } # if
               
    return $DesiredConfigurationMatch 

} # Test-TargetResource

# Helper Functions
Function Get-Folder {
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $Path
    )
    # Lookup the DFSN Folder.
    # Return null if doesn't exist.
    try
    {
        $DfsnFolder = Get-DfsnFolder `
            -Path $Path `
            -ErrorAction Stop
    }
    catch [Microsoft.Management.Infrastructure.CimException]
    {
        $DfsnFolder = $null
    }
    catch
    {
        Throw $_
    }
    Return $DfsnFolder
}

Function Get-FolderTarget {
    param
    (
        [parameter(Mandatory = $true)]
        [String]
        $Path,
        
        [parameter(Mandatory = $true)]
        [String]
        $TargetPath        
    )
    # Lookup the DFSN Folder Target in a namespace.
    # Return null if doesn't exist.
    try
    {
        $DfsnTarget = Get-DfsnFolderTarget `
            -Path $Path `
            -TargetPath $TargetPath `
            -ErrorAction Stop
    }
    catch [Microsoft.Management.Infrastructure.CimException]
    {
        $DfsnTarget = $null
    }
    catch
    {
        Throw $_
    }
    Return $DfsnTarget
}

function New-TerminatingError
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [String] $ErrorId,

        [Parameter(Mandatory)]
        [String] $ErrorMessage,

        [Parameter(Mandatory)]
        [System.Management.Automation.ErrorCategory] $ErrorCategory
    )

    $exception = New-Object `
        -TypeName System.InvalidOperationException `
        -ArgumentList $errorMessage
    $errorRecord = New-Object `
        -TypeName System.Management.Automation.ErrorRecord `
        -ArgumentList $exception, $errorId, $errorCategory, $null
    $PSCmdlet.ThrowTerminatingError($errorRecord)
}

Export-ModuleMember -Function *-TargetResource
