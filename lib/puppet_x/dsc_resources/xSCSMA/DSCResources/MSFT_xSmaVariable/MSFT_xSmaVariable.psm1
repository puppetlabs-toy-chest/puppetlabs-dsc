data LocalizedData  
{  
    # culture="en-US"  
    ConvertFrom-StringData -StringData @'  
 VariableDoesNotMatch = variable {0} has value {1} expected {2}.  
 VariableDescriptionDoesNotMatch = variable {0} has description {1} expected {2}.
 VariableNotFound = Failed to find variable {0}.
'@  
} 

function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $value,

        [System.String]
        $Description,

        [parameter(Mandatory = $true)]
        [System.String]
        $WebServiceEndpoint,

        [System.UInt32]
        $Port = 9090
    )
    
    $Set = $true
    try
    {
        $variable = Get-SmaVariable -Name $Name -WebServiceEndpoint $webserviceendpoint -port $port -ErrorAction Stop

        $Ensure = "Present"

        # check variable value match
        if($variable.Value -ne $value)
        {
            Write-Verbose ( $($LocalizedData.VariableDoesNotMatch) -f $Name, $variable.Value, $value)
            $Set = $false
        }

        # check description match
        if($variable.Description -ne $Description )
        {
            # check description are not supposed to be empty
            if( !(($variable.Description -eq $null) -and ($Description -eq ""))  )
            {
                Write-Verbose ( $($LocalizedData.VariableDescriptionDoesNotMatch) -f $Name, $variable.Description, $Description)
                $Set = $false
            }
        }
    }
    catch
    {
        Write-Verbose ( $($LocalizedData.VariableNotFound) -f $Name)
        $Set = $false
        $Ensure = "Absent"
    }
    
    $returnValue = @{
        Ensure = [System.String]$Ensure
        Name = [System.String]$variable.Name
        value = [System.String]$variable.Value
        Description = [System.String]$variable.Description
        Set = [System.Boolean]$Set
        WebServiceEndpoint = [System.String]$WebServiceEndpoint
        Port = [System.UInt32]$Port
    }

    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $value,

        [System.String]
        $Description,

        [parameter(Mandatory = $true)]
        [System.String]
        $WebServiceEndpoint,

        [System.UInt32]
        $Port = 9090
    )

    If($Ensure -eq "Present")
    {
        Set-SmaVariable -Name $Name -Value $value -Description $Description -WebServiceEndpoint $webserviceendpoint -port $port -ErrorAction Stop
    }
    else
    {
        Remove-SmaVariable -Name $Name -WebServiceEndpoint $webserviceendpoint -port $port -ErrorAction Stop
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $value,

        [System.String]
        $Description,

        [parameter(Mandatory = $true)]
        [System.String]
        $WebServiceEndpoint,

        [System.UInt32]
        $Port = 9090
    )
    
    $result = Get-TargetResource @PSBoundParameters

    if( ($Ensure -eq "Present") -and ($result.Ensure -eq "Present") -and ($result.set -eq $true))
    {
        return $true
    }
    elseif( ($result.Ensure -eq "Absent") -and ($Ensure -eq "Absent") )
    {
        return $true
    }

    return $false
}


Export-ModuleMember -Function Get-TargetResource, Set-TargetResource, Test-TargetResource

