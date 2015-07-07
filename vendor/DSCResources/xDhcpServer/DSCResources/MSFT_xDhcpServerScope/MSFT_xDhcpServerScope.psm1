Import-Module $PSScriptRoot\..\Helper.psm1 -Verbose:$false

# Localized messages
data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
AddingScopeMessage        = Adding DHCP server scope with the given IP address range ...
CheckScopeMessage         = Checking DHCP server scope with the given IP address range ...
SetScopeMessage           = DHCP server scope with name {0} is now present
RemovingScopeMessage      = Removing DHCP server scope with the given IP address range ...
DeleteScopeMessage        = DHCP server scope with the given IP address range is now absent
TestScopeMessage          = DHCP server scope with the given IP address range is {0} and it should be {1}                           
                          
CheckPropertyMessage      = Checking DHCP server scope {0} ...
NotDesiredPropertyMessage = DHCP server scope {0} is not correct. Expected {1}, actual {2}
DesiredPropertyMessage    = DHCP server scope {0} is correct.
SetPropertyMessage        = DHCP server scope {0} is set to {1}.
'@
}

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory)]
        [String]$Name,

        [parameter(Mandatory)]
        [String]$IPStartRange,

        [parameter(Mandatory)]
        [String]$IPEndRange,

        [parameter(Mandatory)]
        [String]$SubnetMask,

        [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4'

    )
#region Input Validation

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer

    # Convert the Start Range to be a valid IPAddress
    $IPStartRange = (Get-ValidIpAddress -ipString $IPStartRange -AddressFamily $AddressFamily -parameterName 'IPStartRange').ToString()

    # Convert the End Range to be a valid IPAddress
    $IPEndRange = (Get-ValidIpAddress -ipString $IPEndRange -AddressFamily $AddressFamily -parameterName 'IPEndRange').ToString()

    # Convert the Subnet Mask to be a valid IPAddress
    $SubnetMask = (Get-ValidIpAddress -ipString $SubnetMask -AddressFamily $AddressFamily -parameterName 'SubnetMask').ToString()

    # Check to ensure startRange is smaller than endRange
    if($IPEndRange.Address -lt $IPStartRange.Address)
    {
        $errorMsg = $LocalizedData.InvalidStartAndEndRangeMessage
        New-TerminatingError -errorId RangeNotCorrect -errorMessage $errorMsg -errorCategory InvalidArgument
    }
    
#endregion Input Validation

    $dhcpScope = Get-DhcpServerv4Scope | Where-Object {($_.StartRange -eq $IPStartRange) -and ($_.EndRange -eq $IPEndRange)}
    if($dhcpScope)
    {
        $ensure = 'Present'
    }
    else
    {
        $ensure = 'Absent'
    }

    @{
        ScopeID       = $dhcpScope.ScopeId
        Name          = $dhcpScope.Name
        IPStartRange  = $IPStartRange
        IPEndRange    = $IPEndRange
        SubnetMask    = $dhcpScope.SubnetMask
        LeaseDuration = $dhcpScope.LeaseDuration
        State         = $dhcpScope.State
        AddressFamily = 'IPv4'
        Ensure        = $Ensure
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory)]
        [String]$Name,

        [parameter(Mandatory)]
        [String]$IPStartRange,

        [parameter(Mandatory)]
        [String]$IPEndRange,

        [parameter(Mandatory)]
        [String]$SubnetMask,

        [String]$LeaseDuration,

        [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Active','Inactive')]
        [String]$State = 'Active',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

    
    if($PSBoundParameters.ContainsKey('Debug')){ $null = $PSBoundParameters.Remove('Debug')}
    if($PSBoundParameters.ContainsKey('AddressFamily')) {$null = $PSBoundParameters.Remove('AddressFamily')}

    Validate-ResourceProperties @PSBoundParameters -Apply

}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory)]
        [String]$Name,

        [parameter(Mandatory)]
        [String]$IPStartRange,

        [parameter(Mandatory)]
        [String]$IPEndRange,

        [parameter(Mandatory)]
        [String]$SubnetMask,

        [String]$LeaseDuration,

        [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Active','Inactive')]
        [String]$State = 'Active',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

#region Input Validation

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer

    # Convert the Start Range to be a valid IPAddress
    $IPStartRange = (Get-ValidIpAddress -ipString $IPStartRange -AddressFamily $AddressFamily -parameterName 'IPStartRange').ToString()

    # Convert the End Range to be a valid IPAddress
    $IPEndRange = (Get-ValidIpAddress -ipString $IPEndRange -AddressFamily $AddressFamily -parameterName 'IPEndRange').ToString()

    # Convert the Subnet Mask to be a valid IPAddress
    $SubnetMask = (Get-ValidIpAddress -ipString $SubnetMask -AddressFamily $AddressFamily -parameterName 'SubnetMask').ToString()

    # Check to ensure startRange is smaller than endRange
    if($IPEndRange.Address -lt $IPStartRange.Address)
    {
        $errorMsg = $LocalizedData.InvalidStartAndEndRangeMessage
        New-TerminatingError -errorId RangeNotCorrect -errorMessage $errorMsg -errorCategory InvalidArgument
    }

    # Convert the Lease duration to be a valid timespan
    $LeaseDuration = (Get-ValidTimeSpan -tsString $LeaseDuration -parameterName 'Leaseduration').ToString()
    
#endregion Input Validation

    if($PSBoundParameters.ContainsKey('Debug')){ $null = $PSBoundParameters.Remove('Debug')}
    if($PSBoundParameters.ContainsKey('AddressFamily')) {$null = $PSBoundParameters.Remove('AddressFamily')}

    Validate-ResourceProperties @PSBoundParameters

}

function Validate-ResourceProperties
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory)]
        [String]$Name,

        [parameter(Mandatory)]
        [String]$IPStartRange,

        [parameter(Mandatory)]
        [String]$IPEndRange,

        [parameter(Mandatory)]
        [String]$SubnetMask,

        [String]$LeaseDuration,

        [ValidateSet('Active','Inactive')]
        [String]$State = 'Active',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present',

        [Switch]$Apply
    )

    $checkScopeMessage = $LocalizedData.CheckScopeMessage
    Write-Verbose -Message $checkScopeMessage

    $dhcpScope = Get-DhcpServerv4Scope | Where-Object {($_.StartRange -eq $IPStartRange) -and ($_.EndRange -eq $IPEndRange)}
    
    # Initialize the parameter collection
    if($Apply)
    { 
        $parameters = @{}
    }

    # dhcpScope is set
    if($dhcpScope)
    {
        $TestScopeMessage = $($LocalizedData.TestScopeMessage) -f 'present', $Ensure
        Write-Verbose -Message $TestScopeMessage

        # if it should be present, test individual properties to match parameter values
        if($Ensure -eq 'Present')
        {
            #region Test the Scope Name
            $checkPropertyMsg = $($LocalizedData.CheckPropertyMessage) -f 'name'
            Write-Verbose -Message $checkPropertyMsg

            if($dhcpScope.Name -ne $Name) 
            {
                $notDesiredPropertyMsg = $($LocalizedData.NotDesiredPropertyMessage) -f 'name',$Name,$($dhcpScope.Name)
                Write-Verbose -Message $notDesiredPropertyMsg

                if($Apply)
                {
                    $parameters['Name'] = $Name
                }
                else 
                {
                    return $false
                }
            }
            else
            {
                $desiredPropertyMsg = $($LocalizedData.DesiredPropertyMessage) -f 'name'
                Write-Verbose -Message $desiredPropertyMsg
            }
            #endregion scope name

            #region Test the Lease duration
            if($PSBoundParameters.ContainsKey('LeaseDuration'))
            {
                $checkPropertyMsg = $($LocalizedData.CheckPropertyMessage) -f 'lease duration'
                Write-Verbose -Message $checkPropertyMsg

                if($dhcpScope.LeaseDuration -ne $LeaseDuration) 
                {
                    $notDesiredPropertyMsg = $($LocalizedData.NotDesiredPropertyMessage) -f 'lease duration',$LeaseDuration,$($dhcpScope.LeaseDuration)
                    Write-Verbose -Message $notDesiredPropertyMsg
 
                    if($Apply)
                    {
                        $parameters['LeaseDuration'] = $LeaseDuration
                    }
                    else
                    {
                        return $false
                    }
                }
                else
                {
                    $desiredPropertyMsg = $($LocalizedData.DesiredPropertyMessage) -f 'lease duration'
                    Write-Verbose -Message $desiredPropertyMsg
                }
            }
            #endregion lease duration

            #region Test the Scope State
            if($PSBoundParameters.ContainsKey('State'))
            {
                $checkPropertyMsg = $($LocalizedData.CheckPropertyMessage) -f 'state'
                Write-Verbose -Message $checkPropertyMsg

                if($dhcpScope.State -ne $State) 
                {
                    $notDesiredPropertyMsg = $($LocalizedData.NotDesiredPropertyMessage) -f 'state',$State,$($dhcpScope.State)
                    Write-Verbose -Message $notDesiredPropertyMsg

                    if($Apply)
                    {
                        $parameters['State'] = $State
                    }
                    else
                    {
                        return $false
                    }
                }
                else
                {
                    $desiredPropertyMsg = $($LocalizedData.DesiredPropertyMessage) -f 'state'
                    Write-Verbose -Message $desiredPropertyMsg
                }
            }
            #endregion scope state

            #region Test the Subnet Mask
            $checkPropertyMsg = $($LocalizedData.CheckPropertyMessage) -f 'subnet mask'
            Write-Verbose -Message $checkPropertyMsg

            if($dhcpScope.SubnetMask -ne $SubnetMask)
            {
                $notDesiredPropertyMsg = $($LocalizedData.NotDesiredPropertyMessage) -f 'subnet mask',$SubnetMask,$($dhcpScope.SubnetMask)
                Write-Verbose -Message $notDesiredPropertyMsg

                if($Apply)
                {
                    try
                    {
                        # To set the subnet mask scope, the only ways is to remove the old scope and add a new scope
                        Remove-DhcpServerv4Scope -ScopeId $dhcpScope.ScopeId

                        Add-DhcpServerv4Scope @parameters -Type Dhcp
                    }
                    catch
                    {
                        New-TerminatingError -errorId DhcpServerScopeFailure -errorMessage $_.Exception.Message -errorCategory InvalidOperation
                    }
                                          
                    $setPropertyMsg = $($LocalizedData.SetPropertyMessage) -f 'subnet mask',$SubnetMask
                    Write-Verbose -Message $setPropertyMsg
                }
                else
                {
                    return $false
                }
            }
            else
            {
                $desiredPropertyMsg = $($LocalizedData.DesiredPropertyMessage) -f 'subnet mask'
                Write-Verbose -Message $desiredPropertyMsg
            }
            #endregion subnet mask

            if($Apply)
            {
                # If parameters contains more than 0 key, set the DhcpServer scope
                if($parameters.Count -gt 0) 
                {
                    Set-DhcpServerv4Scope @parameters -ScopeId $dhcpScope.ScopeId
                    Write-PropertyMessage -Parameters $parameters -keysToSkip ScopeId `
                                          -Message $($LocalizedData.SetPropertyMessage) -Verbose
                }
            } # end Apply
            else
            {
                return $true
            }
        } # end ensure eq present

        # If dhcpscope should be absent
        else
        {
            if($Apply)
            {
                $removingScopeMsg = $LocalizedData.RemovingScopeMessage
                Write-Verbose -Message $removingScopeMsg

                # Remove the scope
                Remove-DhcpServerv4Scope -ScopeId $dhcpScope.ScopeId

                $deleteScopeMsg = $LocalizedData.deleteScopeMessage
                Write-Verbose -Message $deleteScopeMsg
            }
            else
            {
                return $false
            }
        }# end ensure -eq 'Absent'
    } # if $dhcpScope

    #If dhcpScope is not set, create it if needed
    else
    {
        $TestScopeMessage = $($LocalizedData.TestScopeMessage) -f 'absent', $Ensure
        Write-Verbose -Message $TestScopeMessage

        if($Ensure -eq 'Present')
        {
            if($Apply)
            {
                # Add mandatory parameters
                $parameters['Name']       = $Name
                $parameters['StartRange'] = $IPStartRange
                $parameters['EndRange']   = $IPEndRange
                $parameters['SubnetMask'] = $SubnetMask

                # Check if Lease duration is specified, add to parameter collection
                if($PSBoundParameters.ContainsKey('LeaseDuration'))
                {
                    $parameters['LeaseDuration'] = $LeaseDuration
                }

                # Check if State is specified, add to parameter collection
                if($PSBoundParameters.ContainsKey('State'))
                {
                        $parameters['State'] = $State
                }

                $addingScopeMessage = $LocalizedData.AddingScopeMessage
                Write-Verbose -Message $addingScopeMessage

                try
                {
                    # Create a new scope with specified properties
                    Add-DhcpServerv4Scope @parameters -Type dhcp

                    $setScopeMessage = $($LocalizedData.SetScopeMessage) -f $Name
                    Write-Verbose -Message $setScopeMessage
                }
                catch
                {
                    New-TerminatingError -errorId DhcpServerScopeFailure -errorMessage $_.Exception.Message -errorCategory InvalidOperation
                }
            }# end Apply
            else
            {
                return $false
            }  
        } # end Ensure -eq Present
        else
        {
            return $true
        }
    } # else !dhcpscope
}

Export-ModuleMember -Function *-TargetResource

