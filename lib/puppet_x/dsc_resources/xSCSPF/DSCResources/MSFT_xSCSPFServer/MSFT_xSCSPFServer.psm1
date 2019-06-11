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
        [ValidateSet("VMM","OM","DPM","OMDW","RDGateway","Orchestrator","None")]
        [System.String]
        $ServerType,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCSPFAdminCredential
    )

    $Ensure = Invoke-Command -ComputerName . -Credential $SCSPFAdminCredential -Authentication Credssp {
        $Name = $args[0]
        $ServerType = $args[1]
        if(!(Get-Module spfadmin))
        {
            Import-Module spfadmin
        }
        if(Get-Module spfadmin)
        {
            if(Get-SCSpfServer -Name $Name | Where-Object {$_.ServerType.ToString() -eq $ServerType})
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
    } -ArgumentList @($Name,$ServerType)

    $returnValue = @{
        Ensure = $Ensure
        Name = $Name
        ServerType = $ServerType
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
        [ValidateSet("VMM","OM","DPM","OMDW","RDGateway","Orchestrator","None")]
        [System.String]
        $ServerType,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCSPFAdminCredential
    )

    Invoke-Command -ComputerName . -Credential $SCSPFAdminCredential -Authentication Credssp {
        $Ensure = $args[0]
        $Name = $args[1]
        $ServerType = $args[2]
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
                    New-SCSpfServer -Name $Name -ServerType $ServerType
                }
                "Absent"
                {
                    Get-SCSpfServer -Name $Name | Remove-SCSPFServer
                }
            }
        }
    } -ArgumentList @($Ensure,$Name,$ServerType)

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
        [ValidateSet("VMM","OM","DPM","OMDW","RDGateway","Orchestrator","None")]
        [System.String]
        $ServerType,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $SCSPFAdminCredential
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)
    
    $result
}


Export-ModuleMember -Function *-TargetResource
