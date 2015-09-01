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
        $Principal,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $AzurePackAdminCredential,

        [parameter(Mandatory = $true)]
        [System.String]
        $SQLServer,

        [System.String]
        $SQLInstance = "MSSQLSERVER"
    )

    if($SQLInstance -eq "MSSQLSERVER")
    {
        $ConnectionString = "Data Source=$SQLServer;Initial Catalog=Microsoft.MgmtSvc.Store;Integrated Security=True"
    }
    else
    {
        $ConnectionString = "Data Source=$SQLServer\$SQLInstance;Initial Catalog=Microsoft.MgmtSvc.Store;Integrated Security=True"
    }

    $Ensure = Invoke-Command -ComputerName . -Credential $AzurePackAdminCredential -Authentication Credssp {
        $Ensure = $args[0]
        $Principal = $args[1]
        $ConnectionString = $args[2]
        if(Get-MgmtSvcAdminUser -Principal $Principal -ConnectionString $ConnectionString)
        {
            "Present"
        }
        else
        {
            "Absent"
        }
    } -ArgumentList @($Ensure,$Principal,$ConnectionString)

    $returnValue = @{
        Ensure = $Ensure
        Principal = $Principal
        SQLServer = $SQLServer
        SQLInstance = $SQLInstance
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
        $Principal,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $AzurePackAdminCredential,

        [parameter(Mandatory = $true)]
        [System.String]
        $SQLServer,

        [System.String]
        $SQLInstance = "MSSQLSERVER"
    )

    if($SQLInstance -eq "MSSQLSERVER")
    {
        $ConnectionString = "Data Source=$SQLServer;Initial Catalog=Microsoft.MgmtSvc.Store;Integrated Security=True"
    }
    else
    {
        $ConnectionString = "Data Source=$SQLServer\$SQLInstance;Initial Catalog=Microsoft.MgmtSvc.Store;Integrated Security=True"
    }

    Invoke-Command -ComputerName . -Credential $AzurePackAdminCredential -Authentication Credssp {
        $Ensure = $args[0]
        $Principal = $args[1]
        $ConnectionString = $args[2]
        switch($Ensure)
        {
            "Present"
            {
                if(!(Get-MgmtSvcAdminUser -Principal $Principal -ConnectionString $ConnectionString))
                {
                    Add-MgmtSvcAdminUser -Principal $Principal -ConnectionString $ConnectionString
                }
            }
            "Absent"
            {
                if(Get-MgmtSvcAdminUser -Principal $Principal -ConnectionString $ConnectionString)
                {
                    Remove-MgmtSvcAdminUser -Principal $Principal -ConnectionString $ConnectionString
                }
            }
        }
    } -ArgumentList @($Ensure,$Principal,$ConnectionString)

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
        $Principal,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $AzurePackAdminCredential,

        [parameter(Mandatory = $true)]
        [System.String]
        $SQLServer,

        [System.String]
        $SQLInstance = "MSSQLSERVER"
    )

    $result = ((Get-TargetResource @PSBoundParameters).Ensure -eq $Ensure)

    $result
}


Export-ModuleMember -Function *-TargetResource
