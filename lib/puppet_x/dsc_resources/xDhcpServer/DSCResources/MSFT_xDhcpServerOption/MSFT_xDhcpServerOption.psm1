Import-Module $PSScriptRoot\..\Helper.psm1 -Verbose:$false

# Localized messages
data LocalizedData
{
    # culture="en-US"
    ConvertFrom-StringData @'
InvalidScopeIDMessage     = DHCP server scopeID {0} is not valid. Supply a valid scopeID and try again
CheckScopeIDMessage       = Checking DHCP server options for scopeID {0} ...
AddingScopeIDMessage      = Adding DHCP server options for scopeID {0} ...
SetScopeIDMessage         = DHCP server options is set for scopeID {0}.
FoundScopeIDMessage       = Found DHCP server options for scopeID {0} and they should be {1}
NotFoundScopeIDMessage    = Can not find DHCP server options for scopeID {0} and they should be {1}
                          
CheckPropertyMessage      = Checking {0} option ...
NotDesiredPropertyMessage = {0} is not correct. Expected {1}, actual {2}
DesiredPropertyMessage    = {0} option is correct.
                          
SettingPropertyMessage    = Setting {0} option ...
SetPropertyMessage        = {0} option is set to {1}.
'@
}

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [String]$ScopeID,

        [parameter(Mandatory = $true)]
        [String[]]$DnsServerIPAddress,

        [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4'
    )

#region Input Validation

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer
    
    # Convert the ScopeID to be a valid IPAddress
    $ScopeID = (Get-ValidIpAddress -ipString $ScopeID -AddressFamily $AddressFamily -parameterName 'ScopeID').ToString()

    # Test if the ScopeID is valid
    $null = Get-DhcpServerv4Scope -ScopeId $ScopeID -ErrorAction SilentlyContinue -ErrorVariable err
    if($err)
    {
        $errorMsg = $($LocalizedData.InvalidScopeIdMessage) -f $ScopeID
        New-TerminatingError -errorId ScopeIdNotFound -errorMessage $errorMsg -errorCategory InvalidOperation
    }

#endregion Input Validation

    $ensure = 'Absent'
    try
    {
        $dhcpOption = Get-DhcpServerv4OptionValue -ScopeID $ScopeID
        if($dhcpOption)
        {
            $dnsDomain = (($dhcpOption | Where-Object Name -like 'DNS Domain Name').value)[0]
            $ensure = 'Present'
            $dnsServerIP = ($dhcpOption | Where-Object Name -like 'DNS Servers').value
        }
    }
    catch
    {
    }

    @{
        ScopeID = $ScopeID
        DnsDomain = $dnsDomain
        AddressFamily = 'IPv4'
        Ensure = $ensure
        DnsServerIPAddress = $dnsServerIP
    }
}

function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [String]$ScopeID,

        [parameter(Mandatory = $true)]
        [String[]]$DnsServerIPAddress,

        [String[]]$Router,

        [String]$DnsDomain,

        [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

#region Input Validation
    
    # Array of valid IP Address
    [String[]]$validDnSServer = @()

    # Convert the ScopeID to be a valid IPAddress
    $ScopeID = (Get-ValidIpAddress -ipString $ScopeID -AddressFamily $AddressFamily -parameterName 'ScopeID').ToString()

    # Convert the input to be valid IPAddress
    foreach ($dnsServerIp in $DnsServerIPAddress)
    {
        $validDnSServer += (Get-ValidIpAddress -ipString $dnsServerIp -AddressFamily $AddressFamily -parameterName 'DnsServerIPAddress').ToString()
    }
    $DnsServerIPAddress = $validDnSServer

    # Array of valid IP Address
    [String[]]$validRouter = @()

    # Convert the input to be valid IPAddress
    foreach ($routerIp in $Router)
    {
        $validRouter += (Get-ValidIpAddress -ipString $routerIp -AddressFamily $AddressFamily -parameterName 'Router').ToString()
    }
    $Router = $validRouter

#endregion Input Validation

    # Remove $AddressFamily and $debug from PSBoundParameters and pass it to validate-properties helper function
    If($PSBoundParameters['Debug'])      {$null = $PSBoundParameters.Remove('Debug')}
    If($PSBoundParameters['AddressFamily']){$null = $PSBoundParameters.Remove('AddressFamily')}

    Validate-ResourceProperties @PSBoundParameters -Apply
}

function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [String]$ScopeID,

        [parameter(Mandatory = $true)]
        [String[]]$DnsServerIPAddress,

        [String[]]$Router,

        [String]$DnsDomain,

        [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )

#region Input Validation

    # Array of valid IP Address
    [String[]]$validDnSServer = @()

    # Check for DhcpServer module/role
    Assert-Module -moduleName DHCPServer

    # Convert the ScopeID to be a valid IPAddress
    $ScopeID = (Get-ValidIpAddress -ipString $ScopeID -AddressFamily $AddressFamily -parameterName 'ScopeID').ToString()

    # Convert the input to be valid IPAddress
    foreach ($dnsServerIp in $DnsServerIPAddress)
    {
        $validDnSServer += (Get-ValidIpAddress -ipString $dnsServerIp -AddressFamily $AddressFamily -parameterName 'DnsServerIPAddress').ToString()
    }
    $DnsServerIPAddress = $validDnSServer

    # Array of valid IP Address
    [String[]]$validRouter = @()

    # Convert the input to be valid IPAddress
    foreach ($routerIp in $Router)
    {
        $validRouter += (Get-ValidIpAddress -ipString $routerIp -AddressFamily $AddressFamily -parameterName 'Router').ToString()
    }
    $Router = $validRouter

    # Test if the ScopeID is valid
    $null = Get-DhcpServerv4Scope -ScopeId $ScopeID -ErrorAction SilentlyContinue -ErrorVariable err
    if($err)
    {
        $errorMsg = $($LocalizedData.InvalidScopeIdMessage) -f $ScopeID
        New-TerminatingError -errorId ScopeIdNotFound -errorMessage $errorMsg -errorCategory InvalidOperation
    }

#endregion Input Validation

    # Remove $AddressFamily and $debug from PSBoundParameters and pass it to validateProperties helper function
    If($PSBoundParameters['Debug'])      {$null = $PSBoundParameters.Remove('Debug')}
    If($PSBoundParameters['AddressFamily']){$null = $PSBoundParameters.Remove('AddressFamily')}

    Validate-ResourceProperties @PSBoundParameters
}

#region Helper function

# Internal function to validate dhcpOptions properties
function Validate-ResourceProperties
{
    [CmdletBinding()]
    param
    (
        [Parameter(Mandatory)]
        [string]$ScopeID,

        [parameter(Mandatory)]
        [String[]]$DnsServerIPAddress,

        [String]$DnsDomain,

        [String[]]$Router,

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present',

        [switch]$Apply
    )

    $scopeIDMessage = $($LocalizedData.CheckScopeIDMessage) -f $ScopeID
    Write-Verbose -Message $scopeIDMessage
    
    $dhcpOption = Get-DhcpServerv4OptionValue -ScopeID $ScopeID

    # Found DHCPOption
    if($dhcpOption)
    {
        $foundScopeIdMessage = $($LocalizedData.FoundScopeIDMessage) -f $ScopeID, $Ensure
        Write-Verbose -Message $foundScopeIdMessage

        # If Options should be present, check other properties
        if($Ensure -eq 'Present')
        {
            # Test the DNS Server IPs
            $checkPropertyMessage = $($LocalizedData.CheckPropertyMessage) -f 'Dns server ip'
            Write-Verbose -Message $checkPropertyMessage

            $dnsServerIP = ($dhcpOption | Where-Object Name -like 'DNS Servers').value

            # If comparison return something, they are not equal
            if((-not $dnsServerIP) -or (Compare-Object $dnsServerIP $DnsServerIPAddress))
            {
                $notDesiredPropertyMessage = $($LocalizedData.NotDesiredPropertyMessage) -f 'DNS server ip', $DnsServerIPAddress, $dnsServerIP
                Write-Verbose -Message $notDesiredPropertyMessage
                if($Apply)
                {
                    $settingPropertyMessage = $($LocalizedData.SettingPropertyMessage) -f 'DNS server ip'
                    Write-Verbose -Message $settingPropertyMessage

                    Set-DhcpServerv4OptionValue -ScopeId $ScopeID -DnsServer $DnsServerIPAddress -Force
                    
                    $setPropertyMessage = $($LocalizedData.SetPropertyMessage) -f 'DNS server ip',$DnsServerIPAddress
                    Write-Verbose -Message $setPropertyMessage
                     
                } # end $Apply
                else
                {
                    return $false
                }
            } # end Compare-object
            else
            {
                $desiredPropertyMessage = $($LocalizedData.DesiredPropertyMessage) -f 'DNS server ip'
                Write-Verbose -Message $desiredPropertyMessage
            }

            # If DNS Domain is specified, test that
            if($PSBoundParameters.ContainsKey('DnsDomain'))
            {
                $checkPropertyMessage = $($LocalizedData.CheckPropertyMessage) -f 'Dns domain name'
                Write-Verbose -Message $checkPropertyMessage

                $dnsDomainName = ($DhcpOption | Where-Object Name -like 'DNS Domain Name').value
                if($dnsDomainName -ne $DnsDomain) 
                {
                    $notDesiredPropertyMessage = $($LocalizedData.NotDesiredPropertyMessage) -f 'DNS domain name', $DnsDomain, $dnsDomainName
                    Write-Verbose -Message $notDesiredPropertyMessage

                    if($Apply)
                    {
                        $settingPropertyMessage = $($LocalizedData.SettingPropertyMessage) -f 'DNS domain name'
                        Write-Verbose -Message $settingPropertyMessage

                        Set-DhcpServerv4OptionValue -ScopeId $ScopeID -DnsDomain $DnsDomain

                        $setPropertyMessage = $($LocalizedData.SetPropertyMessage) -f 'DNS domain name',$DnsDomain
                        Write-Verbose -Message $setPropertyMessage
                    } # end $Apply
                    else
                    { 
                        return $false
                    }
                } # end $dnsDomainName -ne $DnsDomain
                else
                {
                    $desiredPropertyMessage = $($LocalizedData.DesiredPropertyMessage) -f 'DNS domain name'
                    Write-Verbose -Message $desiredPropertyMessage
                }
            } # end $PSBoundParameters.ContainsKey('DnsDomain')

            # If Router is specified, test that
            if($PSBoundParameters.ContainsKey('Router'))
            {
                $propertyName = 'Router ip addresses'
                $checkPropertyMessage = $($LocalizedData.CheckPropertyMessage) -f 'Router ip addresses'
                Write-Verbose -Message $checkPropertyMessage

                $propertyValue = ($DhcpOption | Where-Object OptionId -eq 3).value

                if((-not $propertyValue) -or (Compare-Object $propertyValue $Router))
                {
                    $notDesiredPropertyMessage = $($LocalizedData.NotDesiredPropertyMessage) -f $propertyName, $DnsDomain, $dnsDomainName
                    Write-Verbose -Message $notDesiredPropertyMessage

                    if($Apply)
                    {
                        $settingPropertyMessage = $($LocalizedData.SettingPropertyMessage) -f $propertyName
                        Write-Verbose -Message $settingPropertyMessage

                        Set-DhcpServerv4OptionValue -ScopeId $ScopeID -Router $Router

                        $setPropertyMessage = $($LocalizedData.SetPropertyMessage) -f $propertyName,$Router
                        Write-Verbose -Message $setPropertyMessage
                    } # end $Apply
                    else
                    { 
                        return $false
                    }
                } # end $dnsDomainName -ne $DnsDomain
                else
                {
                    $desiredPropertyMessage = $($LocalizedData.DesiredPropertyMessage) -f $propertyName
                    Write-Verbose -Message $desiredPropertyMessage
                }
            } # end $PSBoundParameters.ContainsKey('DnsDomain')
            if(-not $Apply)
            {
                return $true
            }
        } # end $Ensure -eq 'Present'

        # If Options should be absent, return False or remove it
        else
        {
            if($Apply)
            {
                Write-Verbose -Message "Removing DHCP Server options for $ScopeID..."
                foreach($option in $dhcpOption.OptionID)
                {
                    Remove-DhcpServerv4OptionValue -ScopeId $ScopeID -OptionId $option
                }
                Write-Verbose -Message 'DHCP Server options are removed'
            } # end if $Apply
            else {return $false}
        }
    }
    else
    {
        $notFoundScopeIdMessage = $($LocalizedData.NotFoundScopeIDMessage) -f $ScopeID, $Ensure
        Write-Verbose -Message $notFoundScopeIdMessage

        if($Apply)
        {
            # If Options should be present, create those
            if($Ensure -eq 'Present')
            {
                $addingScopeIdMessage = $($LocalizedData.AddingScopeIDMessage) -f $ScopeID
                Write-Verbose -Message $addingScopeIdMessage

                $parameters = @{ScopeID = $ScopeID; DnsServer = $DnsServerIPAddress}
                # If Dns domain is specified pass it
                if($PSBoundParameters.ContainsKey('DnsDomain')){$parameters['DnsDomain'] = $DnsDomain}

                Set-DhcpServerv4OptionValue @parameters -Force

                $setScopeIdMessage = $($LocalizedData.SetScopeIDMessage) -f $ScopeID
                Write-Verbose -Message $setScopeIdMessage
            } # end Ensure -eq 'Present
        } # end if $Apply
        else
        {
            # If Options should be present, return false else true
            return ($Ensure -eq 'Absent')
        }
    }
}
#endregion Helper function
if($global:DhpcOptionTest -ne $true)
{
    Export-ModuleMember -Function *-TargetResource
}
