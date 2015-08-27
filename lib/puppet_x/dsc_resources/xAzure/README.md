[![Build status](https://ci.appveyor.com/api/projects/status/bx86bb6vuf6l3lwp/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xazure/branch/master)

#xAzure

The **xAzure** module is a set of DSC resources that provide a method of depoying virtual machines in Microsoft Azure by applying a configuration to your local machine.
This is primarily intended to enable testing how a new virtual machine can be used to evaluate a scenario or application without consuming resources from the local machine.
  

 This module includes 6 DSC resources that automate provisioning of resources in Microsoft Azure.

*   **xAzureAffinityGroup** defines the relationship between compute and storage
*   **xAzureQuickVM** simple resource for creating VMs with limited options
*   **xAzureService** creates a cloud service for the VMs
*   **xAzureStorageAccount** creates the online storage account where the blobs for the test environment will reside
*   **xAzureSubscription** sets the current Azure subscription context
*   **xAzureVM** creates a virtual machine in Azure including access to VM Guest extensions
*   **xAzureVMDscConfiguration** packages and uploads a DSC Configuration for the DSC Extension
*   **xAzureVMDscExtension** uses the DSC Extension to apply a configuration within a VM
*   **xAzureSqlDatabase** creates Azure SQL Database
*   **xAzureSqlDatabaseServerFirewallRule** creates Azure SQL Database Server Firewall Rule

**All of the resources in the DSC Resource Kit are provided AS IS, and are not supported through any Microsoft standard support program or service.
The ""x" in xAzure stands for experimental**, which means that these resources will be **fix forward** and monitored by the module owner(s).

Please leave comments, feature requests, and bug reports in the Q & A tab for this module.

If you would like to modify **xAzure** module, feel free.
When modifying, please update the module name, resource friendly name, and MOF class name (instructions below).
As specified in the license, you may copy or modify this resource as long as they are used on the Windows Platform.

For more information about Windows PowerShell Desired State Configuration, check out the blog posts on the [PowerShell Blog](http://blogs.msdn.com/b/powershell/) ([this](http://blogs.msdn.com/b/powershell/archive/2013/11/01/configuration-in-a-devops-world-windows-powershell-desired-state-configuration.aspx) is a good starting point).
There are also great community resources, such as [PowerShell.org](http://powershell.org/wp/tag/dsc/), or [PowerShell Magazine](http://www.powershellmagazine.com/tag/dsc/).
For more information on the DSC Resource Kit, check out [this blog post](http://go.microsoft.com/fwlink/?LinkID=389546).

## Installation

To install **xAzure** module

*   If you are using WMF4 / PowerShell Version 4: Unzip the content under `$env:ProgramFiles\WindowsPowerShell\Modules` folder
*   If you are using WMF5 Preview: From an elevated PowerShell session run `Install-Module xAzure`

To confirm installation:

*   Run **Get-DSCResource** to see that **xAzureAffinityGroup**, **xAzureQuickVM**, **xAzureVM**, and **xAzureVMDscExtension** are among the DSC Resources listed

## Requirements

This module requires the latest version of PowerShell (v4.0, which ships in Windows 8.1 or Windows Server 2012R2).
To easily use PowerShell 4.0 on older operating systems, [install WMF](http://www.microsoft.com/en-us/download/details.aspx?id=40855).
Please read the installation instructions that are present on both the download page and the release notes for WMF 4.0.

 In addition, this module works based on the following assumptions: 
*   You have access to an Azure account.
This could be a trial account, a paid subscription, or Azure credit from an MSDN subscription.
*   You have installed the Windows Azure PowerShell cmdlets package from [WebPI](http://www.microsoft.com/web/downloads/platform.aspx)
*   You have downloaded your Publish Settings file (.publishsettings) using Get-AzurePublishSettingsFile and have copied to the working directory set in the Create and SetupSubscription example scripts.
*   Open `.publishsettings` in Notepad and copy the name of the subscription to the Clipboard.
*   Open the `.\Create.ps1` script in the ExampleConfigScripts folder and update the name of your subscription and the location of your .publishsettings file in the xAzureSubscription section.

## Resources

###xAzureAffinityGroup

*   **Name**: Specifies a name for the new affinity group that is unique to the subscription.
*   **Ensure**: Specifies whether the Azure Affinity Group should be present or absent.
*   **Location**: Specifies the geographical location of the data center where the affinity group will be created.
This must match a value from the Name property of objects returned by Get-AzureLocation.
*   **Description**: Specifies a description for the affinity group.
The description may be up to 1024 characters in length.
*   **Label**: Specifies a label for the affinity group.
The label may be up to 100 characters in length.

###xAzureQuickVM

*   **Name**: Specifies the name of the virtual machine.
*   **Ensure**: Specifies whether the Azure VM should be present or absent.
*   **ImageName**: Specifies the name of the operating system image to use to create the operating system disk.
*   **ServiceName**: Specifies the new or existing service name.
*   **Linux**: Creates a Linux virtual machine.
*   **LinuxUser**: Specifies the Linux administrative account name to create.
*   **Windows**: Creates a Windows virtual machine.
*   **AdminUsername**: Specifies the name for the administrative account to create.
*   **Password**: Specifies the password for the administrative account.
*   **InstanceSize**: Specifies the size of the instance.
For a list of virtual machine sizes, see http://msdn.microsoft.com/library/azure/dn197896.aspx

###xAzureService

*   **ServiceName**: Specifies a name for the new cloud service that is unique to the subscription.
*   **Ensure**: Specifies whether the Azure VM should be present or absent.
*   **Description**: Specifies the Azure Affinity Group for the service
*   **AffinityGroup**: Specifies a description for the service.
*   **Label**: Specifies a label for the service.

###xAzureSqlDatabase

*   **Name**: Name of the database
*   **MaximumSizeInGB**: Maximum size of the database in GB
*   **Collation**: Collation of the database
*   **Edition**: Edition of the database
*   **ServerCredential**: Credential to the database server
*   **ServerName**: Name of the database server
*   **AzureSubscriptionName**: Specifies the name of the Azure subscription that should be set to Current
*   **AzurePublishSettingsFile**: Specifies the location of the Publish Settings file for the Azure Subscription
*   **Ensure**: Ensure that database is present or absent

###xAzureSqlDatabaseServerFirewallRule

*   **RuleName**: Name of the firewall rule
*   **ServerName**: Name of the database server for which firewall rule should be created
*   **StartIPAddress**: Start IP address of the firewall rule
*   **EndIPAddress**: End IP address of the firewall rule
*   **AzureSubscriptionName**: Specifies the name of the Azure subscription that should be set to Current
*   **AzurePublishSettingsFile**: Specifies the location of the Publish Settings file for the Azure Subscription
*   **Ensure**: Ensure that firewall rule is present or absent

###xAzureStorageAccount

*   **StorageAccountName**: Specifies a name for the storage account.
The storage account name must be unique to Windows Azure and must be between 3 and 24 characters in length and use lowercase letters and numbers only.
*   **Ensure**: Specifies whether the Azure Storage Account should be present or absent.
*   **AffinityGroup**: Specifies the name of an existing affinity group in the current subscription.
You can specify either a Location or an AffinityGroup parameter, but not both.
*   **Container**: Specifies a name for the Container that should be created in the Azure Storage Account.
*   **Folder**: Specifies a local folder.
All files in the root of the folder will be uploaded to the new container.
*   **Label**: Specifies a label for the storage account.
The label may be up to 100 characters in length.

###xAzureSubscription

*   **Ensure**: Specifies whether the subscription should be present or absent.
*   **AzureSubscriptionName**: Specifies the name of the Azure subscription that should be set to Current.
*   **AzurePublishSettingsFile**: Specifies the location of the Publish Settings file for the Azure Subscription.

###xAzureVM

*   **Name**: Specifies the name of the virtual machine.
*   **Ensure**: Specifies whether the Azure VM should be present or absent.
*   **ImageName**: Specifies the name of the operating system image to use to create the operating system disk.
*   **ServiceName**: Specifies the new or existing service name.
*   **StorageAccountName**: Specifies the name of the storage account for the VM.
*   **InstanceSize**: Specifies the size of the instance.
For a list of virtual machine sizes, see http://msdn.microsoft.com/library/azure/dn197896.aspx
*   **Linux**: Creates a Linux virtual machine.
*   **Windows**: Creates a Windows virtual machine.
*   **Credential**: Specifies the credentials for the administrator account.
*   **ExtensionContainerName**: The name of the Container in Azure Blob storage where the script files will reside.
Case sensitive
*   **ExtensionFileList**: List of files in Azure Blob container that should be copied in to the VM.
Case sensitive.
*   **ExtensionScriptName**: Name of one of the files in the container that will be exectued at startup.
Case sensitive.

###xAzureVMDscConfiguration

*   **StorageAccountName**: Specifies the name of the storage account for the VM.
*   **Ensure**: Specifies whether the Azure VM should be present or absent.
*   **ContainerName**: Specifies the name of the Container in the Azure Storage Account.
*   **ConfigurationPath**: Specifies location of the Dsc Configuration document.
*   **AzureSubscriptionName**: Specifies the name of the Azure subscription that should be set to Current.
*   **AzurePublishSettingsFile**: Specifies the location of the Publish Settings file for the Azure Subscription.
*   **BlobURI**: Absolute Uri of the Blob.

###xAzureVMDscExtension

*   **VmName**: Specifies name of the VM.
This is used together with ServiceName to construct a persistent vm object.
*   **ServiceName**: Specifies name of the Service where the VM is deployed.
*   **ConfigurationArchive**: The name of the configuration package .zip file that was previously uploaded by Publish-AzureVMDscConfiguration.
This parameter must specify only the name of the file, without any path.
*   **StorageAccountName**: Specifies the name of the Storage Account used to create the Storage Context.
The Azure Storage Context provides the security settings used to access the configuration script.
This context should provide read access to the container specified by ContainerName.
*   **ConfigurationArgument**: A hashtable specifying the arguments to the configuration function.
The keys correspond to the parameter names and the values to the parameter values.
*   **ConfigurationDataPath**: The path to a .psd1 file that specifies the data for the configuration function.
*   **Configuration**: SName of the configuration script or module that will be invoked by the DSC Extension.
*   **ContainerName**: Name of the Azure Storage Container where the ConfigurationArchive is located.
*   **Force**: By default xAzureVMDscExtension will not overwrite any existing blobs.
Use -Force to overwrite them.
*   **ReferenceName**: The Extension Reference Name 
*   **StorageEndpointSuffix**: The DNS endpoint suffix for all storage services, e.g.
core.windows.net.
*   **Version**: The specific version of the DSC Extension to use.
If not given, it will default to 1.* 
*   **TimeStamp**: Returns the timestamp of the last DSC Extension execution.
*   **Code**: Returns the message code for the latest oepration by the DSC Extension.
*   **Message**: Returns the formatted message string for the latest operation by the DSC Extension.
*   **Status**: Returns the state of the DSC Extension from Azure.

## Versions

###0.1.3

*   Introduce **xAzureDSCExtension**, **xAzureVMDscConfiguration**
*   Minor bug fix in **xAzureStorageAccount** to make Folder no longer a mandatory propert

###0.1.2

 Release with the following resources 
*   **xAzureSqlDatabase** creates Azure SQL Database
*   **xAzureSqlDatabaseServerFirewallRule** creates Azure SQL Database Server Firewall Rule

###0.1.0

 Initial release with the following resources 
*   **xAzureAffinityGroup** defines the relationship between compute and storage
*   **xAzureQuickVM** simple resource for creating VMs with limited options
*   **xAzureService** creates a cloud service for the VMs
*   **xAzureStorageAccount** creates the online storage account where the blobs for the test environment will reside
*   **xAzureSubscription** sets the current Azure subscription context
*   **xAzureVM**creates a virtual machine in Azure including access to VM Guest extensions

## Examples

The 'Examples' folder within the payload includes example configurations for common work streams:

*   **LCMApplyOnly** - Set the local DSC configuration to only apply configurations and not monitor or re-apply automatically
*   **Create** - Create environment including virtual machine
*   **Create_SqlDatabase** - Create Azure SQL Database
*   **Create_FirwallRule** - Create Azure SQL Database Server Firewall Rule
*   **Destroy** - Destroy everything created in by the Create script
*   **Remove** - Remove just the VM's and their VHD files from the test environment but leave the Affinity Group, Storage Account, and Cloud Service (quick re-provision scenario)
*   **SetupSubscription** - Setup the Azure subscription (remember that DSC is running as Local System)
*   **Status** - Retrieve information about a VM and optionally download the .rdp file, install the certificate, and create a reference PS remote file

**Understanding the INSTANCE ID: **  
 Instance ID - The Create script uses the last 10 places of the .NET time format named 'Ticks' to create a unique identifer for the accounts.
This is required because storage and service names must be globally unique - not just for your account - across all Azure customers.
The last step of the Create script is to return this number to the pipeline (along with the DSC output).
  
 You can capture the Instance ID by copying and pasting it from the PowerShell window, by copying and pasting it from the Azure website by opening the Cloud Service and selecting it from the title text, or you can automatically capture it from the pipeline using a variable.
 
```powershell
$test = .\Create.ps1 # In this example, the Instance ID would be returned as $test[1]  
.\Status.ps1 $test[1] -ConnectionFiles * In this example, the status of the VM is checked using the pipeline value.
```

**Note on credentials: **  
 When running the `.\Create.ps1` script, there is an immediate prompt for credentials.
The value collected here will be used to create the account inside the VM that is added to the local administrators group.
 
 **Note** - the password will be stored in clear text inside the MOF file in the example, however the resource has been designed to work with encrypted credentials.
For more information see: http://blogs.msdn.com/b/powershell/archive/2014/01/31/want-to-secure-credentials-in-windows-powershell-desired-state-configuration.aspx

**Understanding HOW TO TEST JEA:**  
 As a side benefit of this solution it is possible to test PowerShell Just Enough Administration.
Within the ScriptExtensionFiles folder you will find a script named InstallJEA.ps1\.
This delivers prerequisites for testing including downloads of the xJEA resource and WMF5, installing them both, and enabling remote access.
You have the option to remove comment blocks that would also execute steps inside the VM to configure JEA.
This provides flexibility to either test JEA on your own or have the script build out an endpoint automatically.

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).
