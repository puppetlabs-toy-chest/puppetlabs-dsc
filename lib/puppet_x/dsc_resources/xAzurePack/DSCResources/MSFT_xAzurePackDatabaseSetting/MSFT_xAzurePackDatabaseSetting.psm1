function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("AdminSite","TenantSite")]
        [System.String]
        $Namespace,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $Value,

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
        $ConnectionString = "Data Source=$SQLServer;Initial Catalog=Microsoft.MgmtSvc.PortalConfigStore;Integrated Security=True";
    }
    else
    {
        $ConnectionString = "Data Source=$SQLServer\$SQLInstance;Initial Catalog=Microsoft.MgmtSvc.PortalConfigStore;Integrated Security=True";
    }

    $Value = Invoke-Command -ComputerName . -Credential $AzurePackAdminCredential -Authentication Credssp {
        $Namespace = $args[0]
        $Name = $args[1]
        $ConnectionString = $args[2]
        (Get-MgmtSvcDatabaseSetting -Namespace $Namespace -Name $Name -ConnectionString $ConnectionString).Value
    } -ArgumentList @($Namespace,$Name,$ConnectionString)

    $returnValue = @{
        Name = $Name
        Value = $Value
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
        [parameter(Mandatory = $true)]
        [ValidateSet("AdminSite","TenantSite")]
        [System.String]
        $Namespace,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $Value,

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
        $ConnectionString = "Data Source=$SQLServer;Initial Catalog=Microsoft.MgmtSvc.PortalConfigStore;Integrated Security=True";
    }
    else
    {
        $ConnectionString = "Data Source=$SQLServer\$SQLInstance;Initial Catalog=Microsoft.MgmtSvc.PortalConfigStore;Integrated Security=True";
    }

    Invoke-Command -ComputerName . -Credential $AzurePackAdminCredential -Authentication Credssp {
        $Namespace = $args[0]
        $Name = $args[1]
        $Value = $args[2]
        $ConnectionString = $args[3]
        Set-MgmtSvcDatabaseSetting -Namespace $Namespace -Name $Name -Value $Value -ConnectionString $ConnectionString -Force
    } -ArgumentList @($Namespace,$Name,$Value,$ConnectionString)

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
        [parameter(Mandatory = $true)]
        [ValidateSet("AdminSite","TenantSite")]
        [System.String]
        $Namespace,

        [parameter(Mandatory = $true)]
        [System.String]
        $Name,

        [parameter(Mandatory = $true)]
        [System.String]
        $Value,

        [parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $AzurePackAdminCredential,

        [parameter(Mandatory = $true)]
        [System.String]
        $SQLServer,

        [System.String]
        $SQLInstance = "MSSQLSERVER"
    )

    $result = ((Get-TargetResource @PSBoundParameters).Value -eq $Value)

    $result
}


Export-ModuleMember -Function *-TargetResource
