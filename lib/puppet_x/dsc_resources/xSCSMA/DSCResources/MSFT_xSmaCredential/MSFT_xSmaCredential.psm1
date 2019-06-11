function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $credential,

        [System.String]
        $Description,

        [parameter(Mandatory = $true)]
        [System.String]
        $WebServiceEndpoint,

        [System.UInt32]
        $Port
    )

    $null = $PSBoundParameters.Remove("credential")
    $null = $PSBoundParameters.Remove("Description")

    $SMACredential = Get-SmaCredential @PSBoundParameters -ErrorAction SilentlyContinue

    $foundUserName = $SMACredential.UserName
    $foundDescription = $SMACredential.Description    
    
    $returnValue = @{
        Name = [System.String]$Name
        Credential = [System.Management.Automation.PSCredential]$credential  # return credentials given, because SMA does not return any
        Description = [System.String]$foundDescription
        WebServiceEndpoint = [System.String]$WebServiceEndpoint
        Port = [System.UInt32]$Port
        UserName = [System.String]$foundUserName
    }

    $returnValue
    
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $credential,

        [System.String]
        $Description,

        [parameter(Mandatory = $true)]
        [System.String]
        $WebServiceEndpoint,

        [System.UInt32]
        $Port
    )

    $PSBoundParameters.Add("value", $credential)
    $PSBoundParameters.Remove("credential")

    Set-SmaCredential @PSBoundParameters -ErrorAction Stop
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $credential,

        [System.String]
        $Description,

        [parameter(Mandatory = $true)]
        [System.String]
        $WebServiceEndpoint,

        [System.UInt32]
        $Port
    )

    $results = Get-TargetResource @PSBoundParameters

    # check user name value match
    if($results.UserName -ne $credential.UserName)
    {
        Write-Verbose "SMA credential $Name user name $($results.UserName) expected $($credential.UserName)"
        return $false
    }

    # check descption match
    if($results.Description -ne $Description )
    {
        # check description are not supposed to be empty
        if( !(($results.Description -eq $null) -and ($Description -eq ""))  )
        {
            Write-Verbose "SMA credential $Name description $($results.Description) expected $Description"
            return $false
        }
    }

    return $true
}


Export-ModuleMember -Function Get-TargetResource, Set-TargetResource, Test-TargetResource
