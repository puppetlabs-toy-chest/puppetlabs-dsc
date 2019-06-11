function Get-TargetResource
{
    [CmdletBinding()]
    [OutputType([System.Collections.Hashtable])]
    param
    (
        [parameter(Mandatory = $true)]
        [ValidateSet("Membership","Windows")]
        [System.String]
        $Target,

        [parameter(Mandatory = $true)]
        [System.String]
        $FullyQualifiedDomainName,

        [System.UInt16]
        $Port,

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

    switch($Target)
    {
        "Membership"
        {
            $Namespace = "AuthSite"
        }
        "Windows"
        {
            $Namespace = "WindowsAuthSite"
        }
    }
    $FQDN = ((ConvertFrom-Json (Get-MgmtSvcDatabaseSetting -Namespace $Namespace -Name Authentication.RelyingParty.Primary -ConnectionString $ConnectionString).Value).ReplyTo).Split("/")[2]

    $returnValue = @{
        Target = $Target
        FullyQualifiedDomainName = $FQDN.Split(":")[0]
        Port = $FQDN.Split(":")[1]
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
        [ValidateSet("Membership","Windows")]
        [System.String]
        $Target,

        [parameter(Mandatory = $true)]
        [System.String]
        $FullyQualifiedDomainName,

        [System.UInt16]
        $Port,

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

    if($Port -eq 0)
    {
        Switch($Target)
        {
            "Windows"
            {
                $Port = 30091
            }
            "Membership"
            {
                $Port = 30081
            }
        }
    }
    
    if($SQLInstance -eq "MSSQLSERVER")
    {
        $PortalConnectionString = "Data Source=$SQLServer;Initial Catalog=Microsoft.MgmtSvc.PortalConfigStore;User ID=$($dbUser.UserName);Password=$($dbUser.GetNetworkCredential().password)";
        $ManagementConnectionString = "Data Source=$SQLServer;Initial Catalog=Microsoft.MgmtSvc.Store;User ID=$($dbUser.UserName);Password=$($dbUser.GetNetworkCredential().password)";
    }
    else
    {
        $PortalConnectionString = "Data Source=$SQLServer\$SQLInstance;Initial Catalog=Microsoft.MgmtSvc.PortalConfigStore;User ID=$($dbUser.UserName);Password=$($dbUser.GetNetworkCredential().password)";
        $ManagementConnectionString = "Data Source=$SQLServer\$SQLInstance;Initial Catalog=Microsoft.MgmtSvc.Store;User ID=$($dbUser.UserName);Password=$($dbUser.GetNetworkCredential().password)";
    }

    Set-MgmtSvcIdentityProviderSettings -Target $Target -MetadataEndpoint "https://$FullyQualifiedDomainName`:$Port/FederationMetadata/2007-06/FederationMetadata.xml" -PortalConnectionString $PortalConnectionString -ManagementConnectionString $ManagementConnectionString -DisableCertificateValidation;

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
        [ValidateSet("Membership","Windows")]
        [System.String]
        $Target,

        [parameter(Mandatory = $true)]
        [System.String]
        $FullyQualifiedDomainName,

        [System.UInt16]
        $Port,

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

    if($Port -eq 0)
    {
        Switch($Target)
        {
            "Windows"
            {
                $Port = 30091
            }
            "Membership"
            {
                $Port = 30081
            }
        }
    }

    $FQDN = Get-TargetResource @PSBoundParameters
    
    if ($Port -ne 443)
    {
    $TestPort = $Port
    }

    $result = (($FQDN.FullyQualifiedDomainName -eq $FullyQualifiedDomainName) -and ($FQDN.Port -eq $TestPort))

    $result
}


Export-ModuleMember -Function *-TargetResource