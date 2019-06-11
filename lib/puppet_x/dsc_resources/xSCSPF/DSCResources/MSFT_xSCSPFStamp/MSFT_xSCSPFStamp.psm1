function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String[]]
        $Servers,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCSPFAdminCredential
    )

    $Ensure = Invoke-Command -ComputerName . -Credential $SCSPFAdminCredential -Authentication Credssp {
        $Name = $args[0]
        if(!(Get-Module spfadmin))
        {
            Import-Module spfadmin
        }
        if(Get-Module spfadmin)
        {
            if(Get-SCSpfStamp -Name $Name)
            {
                "Present"
            }
            else
            {
                "Absent"
            }
        }
        else
        {
            "Absent"
        }
    } -ArgumentList @($Name)

    if($Ensure -eq "Present")
    {
        $StampServers = Invoke-Command -ComputerName . -Credential $SCSPFAdminCredential -Authentication Credssp {
            $Name = $args[0]
            if(!(Get-Module spfadmin))
            {
                Import-Module spfadmin
            }
            if(Get-Module spfadmin)
            {
                (Get-ScSpfStamp -Name $Name | Get-ScSpfServer).Name
            }
        } -ArgumentList @($Name)
        foreach($Server in $Servers)
        {
            if($Ensure -eq "Present")
            {
                if(!($StampServers | Where-Object {$_ -eq $Server}))
                {
                    $Ensure = "Absent"
                    $Servers = $StampServers
                }
            }
        }
    }
    else
    {
        $Servers = $null
    }

    $returnValue = @{
        Ensure = $Ensure
        Name = $Name
        Servers = $Servers
    }
    $returnValue
}


function Set-TargetResource
{
    [CmdletBinding()]
    param
    (
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String[]]
        $Servers,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCSPFAdminCredential
    )

    Invoke-Command -ComputerName . -Credential $SCSPFAdminCredential -Authentication Credssp {
        $Ensure = $args[0]
        $Name = $args[1]
        $Servers = $args[2]
        if(!(Get-Module spfadmin))
        {
            Import-Module spfadmin
        }
        if(Get-Module spfadmin)
        {
            switch($Ensure)
            {
                "Present"
                {
                    $StampServers = @()
                    foreach($Server in $Servers)
                    {
                        $StampServers += Get-SCSpfServer -Name $Server
                    }
                    if(Get-ScSpfStamp -Name $Name)
                    {
                        Set-SCSpfStamp -Stamp (Get-ScSpfStamp -Name $Name) -Servers $StampServers
                    }
                    else
                    {
                        New-SCSpfStamp -Name $Name -Servers $StampServers
                    }
                }
                "Absent"
                {
                    Get-SCSPFStamp -Name $Name | Remove-SCSPFStamp
                }
            }
        }
    } -ArgumentList @($Ensure,$Name,$Servers)

    if(!(Test-TargetResource @PSBoundParameters))
    {
        throw "Set-TargetResouce failed"
    }
}


function Test-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Boolean])]
    param
    (
        [ValidateSet("Present","Absent")]
        [System.String]
        $Ensure = "Present",

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String[]]
        $Servers,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCSPFAdminCredential
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)
    
    $result
}


Export-ModuleMember -Function *-TargetResource
