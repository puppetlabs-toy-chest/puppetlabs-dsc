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
        $SQLInstance = "MSSQLSERVER",

        [System.Management.Automation.PSCredential]
        $dbUser
    )

    if($SQLInstance -eq "MSSQLSERVER")
    {
        $ConnectionString = "Data Source=$SQLServer;Initial Catalog=Microsoft.MgmtSvc.PortalConfigStore;User ID=$($dbUser.UserName);Password=$($dbUser.GetNetworkCredential().password)";
    }
    else
    {
        $ConnectionString = "Data Source=$SQLServer\$SQLInstance;Initial Catalog=Microsoft.MgmtSvc.PortalConfigStore;User ID=$($dbUser.UserName);Password=$($dbUser.GetNetworkCredential().password)";
    }

    $Value = (Get-MgmtSvcDatabaseSetting -Namespace $Namespace -Name $Name -ConnectionString $ConnectionString).Value

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
        $SQLInstance = "MSSQLSERVER",

        [System.Management.Automation.PSCredential]
        $dbUser
    )

   
    if($SQLInstance -eq "MSSQLSERVER")
    {
        $ConnectionString = "Data Source=$SQLServer;Initial Catalog=Microsoft.MgmtSvc.PortalConfigStore;User ID=$($dbUser.UserName);Password=$($dbUser.GetNetworkCredential().password)";
    }
    else
    {
        $ConnectionString = "Data Source=$SQLServer\$SQLInstance;Initial Catalog=Microsoft.MgmtSvc.PortalConfigStore;User ID=$($dbUser.UserName);Password=$($dbUser.GetNetworkCredential().password)";
    }

    Set-MgmtSvcDatabaseSetting -Namespace $Namespace -Name $Name -Value $Value -ConnectionString $ConnectionString -Force

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
        $SQLInstance = "MSSQLSERVER",

        [System.Management.Automation.PSCredential]
        $dbUser
    )

    $result = ((Get-TargetResource @PSBoundParameters).Value -eq $Value)

    $result
}


Export-ModuleMember -Function *-TargetResource