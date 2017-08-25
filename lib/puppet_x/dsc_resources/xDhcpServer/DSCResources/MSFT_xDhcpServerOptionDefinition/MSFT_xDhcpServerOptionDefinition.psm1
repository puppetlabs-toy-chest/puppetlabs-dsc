function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [Parameter(mandatory)] [ValidateNotNullOrEmpty()]
        [UInt32]$OptionID,

        [Parameter()] [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4'
    )


#region Input Validation

#endregion Input Validation


    $ensure = 'Absent'
 
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -ErrorAction SilentlyContinue
  
    @{
        OptionId = $OptionID
        Name =  $dhcpServerOptionDefinition.Name
        AddressFamily = 'IPv4'
        Ensure = $ensure
        Description = $dhcpServerOptionDefinition.Description
        Type = $dhcpServerOptionDefinition.Type
        DefaultValue = $dhcpServerOptionDefinition.DefaultValue
        VendorClass = $dhcpServerOptionDefinition.VendorClass
        MultiValued = $dhcpServerOptionDefinition.MultiValued
    }

}
function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory)] [ValidateNotNullOrEmpty()]
        [String]$Name,

        [Parameter(Mandatory)] [ValidateNotNullOrEmpty()]
        [UInt32]$OptionID,

        [ValidateSet('Byte','Word','DWord','DWordDWord','IPv4Address','String','BinaryData','EncapsulatedData')]
        [String]$Type,

        [ValidateNotNullOrEmpty()]
        [string]$Description,
        
        [switch]$MultiValued,

        [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present',
        
        [ValidateNotNullOrEmpty()]
        [string]$Vendorclass

    )
        
    #reading the dhcp option
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -ErrorAction SilentlyContinue

    #testing for present
    if ($Ensure -eq 'Present')
    {
        #testing if exists
        if ($dhcpServerOptionDefinition)
        {
            #if it exists and  any of multivalued or type is being changed remote then re-add the option
            if (($dhcpServerOptionDefinition.type -ne $Type) -or ($dhcpServerOptionDefinition.MultiValued -ne $MultiValued) -or ($dhcpServerOptionDefinition.VendorClass -ne $Vendorclass))
            {
                Write-Verbose "Recreating option $OptionID because of changed type or multivalued"
                Remove-DhcpServerv4OptionDefinition -OptionId $OptionID
                Add-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Type $Type -Description $Description -MultiValued:$MultiValued -VendorClass $Vendorclass
            }
            else
            {
                #if option exists we need only to adjust the parameters
                Write-Verbose "Modifying DHCP Option Definition $OptionID"
                set-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Description $Description
            }
        }

        #if option does not exist we need to add it
        else
        {
            write-verbose "Adding DHCP Option Definition $OptionID"
            Add-DhcpServerv4OptionDefinition -OptionId $OptionID -name $Name -Type $Type -Description $Description -MultiValued:$MultiValued -VendorClass $Vendorclass
        }
    }
    
    #testing for 'absent'
    else
    {
    if ($dhcpServerOptionDefinition)
        {
            Write-Verbose "Removing option $OptionID"
            Remove-DhcpServerv4OptionDefinition -OptionId $OptionID
        }
    
    }
}
function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter()] [ValidateNotNullOrEmpty()]
        [String]$Name,
         
        [Parameter()] [ValidateNotNullOrEmpty()]
        [UInt32]$OptionID,

        [Parameter()] [ValidateSet('Byte,Word,DWord,DWordDWord,IPv4Address,String,BinaryData,EncapsulatedData')]
        [String]$Type,

        [Parameter()]
        [string]$Description,
        
        [Parameter()]
        [bool]$MultiValued = $false,

        [Parameter()] [ValidateSet('IPv4')]
        [String]$AddressFamily = 'IPv4',

        [ValidateSet('Present','Absent')]
        [String]$Ensure = 'Present'
    )
#region Input Validation

    # Check for DhcpServer module/role
    #Assert-Module -moduleName DHCPServer
#endregion Input Validation

try
{
    #geting the dhcp option definition
    Write-Verbose "Getting DHCP ServerOptionDefinition $OptionID"
    $dhcpServerOptionDefinition = Get-DhcpServerv4OptionDefinition -OptionId $OptionID -ErrorAction SilentlyContinue -ErrorVariable err
    
    #testing for Present
    if ($Ensure -eq 'Present')
    {
        if ($dhcpServerOptionDefinition)
        {
            #dhcp server option # exists
            $Result = $true
        }
    }
    # If option # not exists return false.
    else
    {
        $Result = $false
    }
    

}
catch
{
}

$Result
}
