[![Build status](https://ci.appveyor.com/api/projects/status/prt9elpmmiuyg508/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xazurepack/branch/master)

# xAzurePack

The **xAzurePack** module contains resources for installation and configuration of Windows Azure Pack.

This module includes 8 DSC resources that automate provisioning of resources in Microsoft Azure.

*   **xAzurePackSetup**: for installation and initialization of Azure Pack 
*   **xAzureQuickVM**: simple resource for creating VMs with limited options 
*   **xAzurePackAdmin**: for adding Azure Pack admins
*   **xAzurePackFQDN**: for setting the FQDN of Azure Pack roles
*   **xAzurePackDatabaseSetting**: for setting Azure Pack database settings
*   **xAzurePackIdentityProvider**: for setting Azure Pack identity provider settings
*   **xAzurePackRelyingParty**: for setting Azure Pack relying party settings
*   **xAzurePackResourceProvider**: for registering and configuring Azure Pack resource providers

## Resources

###xAzurePackSetup

*   **Role**: KEY - The Azure Pack role to be installed or initialized.
Valid roles are "Admin API","Tenant API","Tenant Public API","SQL Server Extension","MySQL Extension","Admin Site","Admin Authentication Site","Tenant Site","Tenant Authentication Site".

*   **Action**: KEY - Install or initialize.
Each role must be installed then initialized.

*   **SourcePath**: REQUIRED - UNC path to the root of the source files for installation.

*   **SourceFolder**: Folder within the source path containing the source files for installation.

*   **SetupCredential**: REQUIRED - Credential to be used to perform the installation.

*   **Passphrase**: Passphrase for the Azure Pack deployment.
If omitted, the password for SetupCredential is used.

*   **SQLServer**: Database server for the Azure Pack databases.

*   **SQLInstance**: Database instance for the Azure Pack databases.

*   **dbUser**: SQL user to be used to create the database if the SetupCredential cannot be used.

*   **EnableCeip**: Enable Customer Experience Improvement Program.


###xAzurePackUpdate

*   **Role**: KEY - The Azure Pack role to be updated.
Valid roles are "Admin API","Tenant API","Tenant Public API","SQL Server Extension","MySQL Extension","Admin Site","Admin Authentication Site","Tenant Site","Tenant Authentication Site".

*   **SourcePath**: REQUIRED - UNC path to the root of the source files for installation.

*   **SourceFolder**: Folder within the source path containing the source files for installation.

*   **SetupCredential**: REQUIRED - Credential to be used to perform the installation.


###xAzurePackAdmin

*   **Ensure**: An enumerated value that describes if the principal is an Azure Pack admin.

*   **Principal**: KEY - The Azure Pack admin principal.

*   **AzurePackAdminCredential**: REQUIRED - Credential to be used to perform the installation.

*   **SQLServer**: REQUIRED - Database server for the Azure Pack databases.

*   **SQLInstance**: Database instance for the Azure Pack databases.


###xAzurePackFQDN

*   **Namespace**: KEY - Specifies a namespace - "AdminSite", "AuthSite", "TenantSite", or "WindowsAuthSite".

*   **FullyQualifiedDomainName**: REQUIRED - Specifies a Fully Qualified Domain Name (FQDN).

*   **Port**: Specifies a port number.

*   **AzurePackAdminCredential**: REQUIRED - Credential to be used to perform the installation.

*   **SQLServer**: REQUIRED - Database server for the Azure Pack databases.

*   **SQLInstance**: Database instance for the Azure Pack databases.


###xAzurePackDatabaseSetting

*   **Namespace**: KEY - Specifies a namespace - "AdminSite" or "TenantSite" 
*   **Name**: KEY - Specifies the name of the setting.

*   **Value**: REQUIRED - Specifies the value of the setting.

*   **AzurePackAdminCredential**: REQUIRED - Credential to be used to perform the installation.

*   **SQLServer**: REQUIRED - Database server for the Azure Pack databases.

*   **SQLInstance**: Database instance for the Azure Pack databases.


###xAzurePackIdentityProvider

*   **Target**: KEY - Specifies the target site - "Membership" or "Windows".

*   **FullyQualifiedDomainName**: REQUIRED - Specifies a Fully Qualified Domain Name (FQDN).

*   **Port**: Specifies a port number.

*   **AzurePackAdminCredential**: REQUIRED - Credential to be used to perform the installation.

*   **SQLServer**: REQUIRED - Database server for the Azure Pack databases.

*   **SQLInstance**: Database instance for the Azure Pack databases.


###xAzurePackRelyingParty

*   **Target**: KEY - Specifies the target site - "Admin" or "Tenant".

*   **FullyQualifiedDomainName**: REQUIRED - Specifies a Fully Qualified Domain Name (FQDN).

*   **Port**: Specifies a port number.

*   **AzurePackAdminCredential**: REQUIRED - Credential to be used to perform the installation.

*   **SQLServer**: REQUIRED - Database server for the Azure Pack databases.

*   **SQLInstance**: Database instance for the Azure Pack databases.


###xAzurePackResourceProvider

*   **AuthenticationSite**: REQUIRED - URL of the authentication site.

*   **AdminUri**: REQUIRED - Specifies the URI of the Windows Azure Pack administrator API.

*   **Name**: KEY - Specifies the name of a resource provider.

*   **AzurePackAdminCredential**: REQUIRED - Credential to be used to perform the installation.

*   **DisplayName**: Specifies the display name of a resource provider.

*   **Enabled**: Enables the resource provider.

*   **PassthroughEnabled**: Indicates whether the resource provider supports API pass-through.

*   **AllowAnonymousAccess**: Specifies the URI of the Windows Azure Pack administrator API.

*   **AllowMultipleInstances**: Indicates that the cmdlet allows multiple instances of the resource provider.

*   **AdminForwardingAddress**: Specifies an administrative forwarding address for a resource provider.

*   **AdminAuthenticationMode**: Specifies the administrative authentication mode for a resource provider - "None", "Basic", or "Windows".

*   **AdminAuthenticationUser**: Specifies, as a PSCredential object, an administrative user name and password to connect to a resource provider.

*   **AdminAuthenticationUsername**: Output for the administrative user name.

*   **TenantForwardingAddress**: Specifies the tenant forwarding address of a resource provider.

*   **TenantAuthenticationMode**: Specifies the tenant authentication mode for a resource provider - "None", "Basic", or "Windows".

*   **TenantAuthenticationUser**: Specifies, as a PSCredential object, a tenant user name and password to connect to a resource provider.

*   **TenantAuthenticationUsername**: Output for the tenant user name.

*   **TenantSourceUriTemplate**: Specifies the tenant source URI template of a resource provider.

*   **TenantTargetUriTemplate**: Specifies the tenant target URI template of a resource provider.

*   **UsageForwardingAddress**: Specifies the tenant forwarding address of a resource provider.

*   **UsageAuthenticationMode**: Specifies the usage authentication mode for a resource provider - "None", "Basic", or "Windows".

*   **UsageAuthenticationUser**: Specifies, as a PSCredential object, a usage user name and password to connect to a resource provider.

*   **UsageAuthenticationUsername**: Output for the usage user name.

*   **HealthCheckForwardingAddress**: Specifies the health check forwarding address for a resource provider.

*   **HealthCheckAuthenticationMode**: Specifies the health check authentication mode for a resource provider - "None", "Basic", or "Windows".

*   **HealthCheckAuthenticationUser**: Specifies, as a PSCredential object, a health check user name and password to connect to a resource provider.

*   **HealthCheckAuthenticationUsername**: Output for the health check user name.

*   **NotificationForwardingAddress**: Specifies the notification forwarding address of a resource provider.

*   **NotificationAuthenticationMode**: Specifies the notification authentication mode for a resource provider - "None", "Basic", or "Windows".

*   **NotificationAuthenticationUser**: Specifies, as a PSCredential object, a notification user name and password to connect to a resource provider.

*   **NotificationAuthenticationUsername**: Output for the notification user name.

*   **InstanceId**: Specifies an ID for an instance of a resource provider.

*   **InstanceDisplayName**: Specifies a display name for an instance of a resource provider.

*   **MaxQuotaUpdateBatchSize**: Specifies the number of subscriptions that can be updated in a single request.

*   **SubscriptionStatusPollingInterval**: Specifies the time interval at which the management service polls the resource provider for subscription status updates.

*   **Type**: Specifies the type of the resource provider - "Standard", "UsageProvider", or "CloudServiceProvider".

## Versions

### 1.1.4.0
* Update increased timeout for setup process to start to 60 seconds. 

### 1.0.0.0

Initial release with the following resources 
*   **xAzurePackSetup** 
*   **xAzureQuickVM** 
*   **xAzurePackAdmin**
*   **xAzurePackFQDN**
*   **xAzurePackDatabaseSetting**
*   **xAzurePackIdentityProvider**
*   **xAzurePackRelyingParty**
*   **xAzurePackResourceProvider**

## Examples

An example configuration is included in the Examples folder within the module, which also uses the xSQLServer module and xCredSSP modules

AzurePack-SeperateSQL.ps1 installs all Azure Pack admin and tenant servers and SQL on a seperate server.

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).
