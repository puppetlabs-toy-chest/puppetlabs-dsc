****************************************
DSC Resource - xAzure
Microsoft Corporation 2014
****************************************
Summary:
This resource provides a method of depoying virtual machines in Microsoft Azure by applying a configuration to your local machine.  This is primarily intended for test where a new virtual machine can be used to evaluate a scenario or application without consuming resources from the local machine.

Please be sure to read the details of 'InstanceID' at the bottom of this ReadMe file.


PreRequisites:
This module works based on the following assumptions.
* You have access to an Azure account.  This could be a trial account, a paid subscription, or Azure credit from an MSDN subscription.
* You have installed the Windows Azure PowerShell cmdlets package from WebPI.	http://www.microsoft.com/web/downloads/platform.aspx
* You have downloaded your Publish Settings file (.publishsettings) using Get-AzurePublishSettingsFile and have copied to the working directory set in the Create and SetupSubscription example scripts.
* Open .publishsettings in Notepad and copy the name of the subscription to the Clipboard.
* Open the .\Create.ps1 script in the ExampleConfigScripts folder and update the name of your subscription and the location of your .publishsettings file in the xAzureSubscription section.


Contents:
This module includes 6 DSC resources that automate provisioning of resources in Microsoft Azure.
* MSFT_xAzureAffinityGroup - defines the relationship between compute and storage
* MSFT_xAzureAzureQuickVM - simple resource for creating VMs with limited options
* MSFT_xAzureService - creates a cloud service for the VMs
* MSFT_xAzureStorageAccount - creates the online storage account where the blobs for the test environment will reside
* MSFT_xAzureSubscription - sets the current Azure subscription context
* MSFT_xAzureAzureVM - creates a virtual machine in Azure including access to VM Guest extensions

The 'ExampleConfigScripts' folder within the payload includes example configurations for common work streams:
* LCMApplyOnly - Set the local DSC configuration to only apply configurations and not monitor or re-apply automatically
* Create - Create environment including virtual machine
* Destroy - Destroy everything created in by the Create script
* Remove - Remove just the VM's and their VHD files from the test environment but leave the Affinity Group, Storage Account, and Cloud Service  (quick re-provision scenario)
* SetupSubscription - Setup the Azure subscription (remember that DSC is running as Local System)
* Status - Retrieve information about a VM and optionally download the .rdp file, install the certificate, and create a reference PS remote file

You will find in the Create script that by default the configuration is also using the Azure VM Agent Custom Script Extension to copy and execute a script file from the 'ScriptExtensionFiles' folder.  This automates installing NuGet client binaries, PSGet, JEA, and WMF 5.0 Preview.  The intention is to demonstrate how to use the script to build out a full test environment and not just an empty VM.
* ScriptExtensionFiles folder contains the InstallJea.ps1 example file.


How-To:
The following sections define work streams expected in the most common experiences.

To 'install' this resource on your machine -
* Copy the contents of this archive file in to:
	C:\Program Files\WindowsPowerShell\Modules\xAzure

To create a 'working directory' and execute the example configuration scripts -
* Create a convenient folder such as C:\ExampleConfigScripts and copy all contents of the 'ExampleConfigScripts' folder in to it, including the subfolder ScriptExtensionFiles

To setup your local machine as DSC 'Apply Only'  -
* Open a PowerShell prompt As an Administrator and change directory to your working directory
* Run .\LCMApplyOnly.ps1
* The expected outcome would be that Get-DscLocalConfigurationManager returns ApplyOnly for property ConfigurationMode.

To bring the test VM online -
* Copy the contents of the ExampleConfigScripts folder to somewhere on your machine where you will have convenient access.  INCLUDE THE SCRIPTEXTENSIONFILES FOLDER.
* Open the Create.ps1 and SetupSubscription.ps1 files and make sure $workingdir is set to this location.  The default is C:\ExampleConfigScripts.
* Make sure the Publish Settings file is also in this location.  Obtain this using Get-AzurePublishSettingsFile.
* Open a PowerShell prompt As an Administrator and change directory to your working directory
* Run .\Create.ps1, provide credentials, and wait for the script to finish.  These credentials will set the username and password for the account inside the VM that will be a member of the Administrators group.
* Take note of the Instance ID returned (copy and paste it in to a safe place).
* By default, a new Affinity Group, Storage Account, Cloud Service, and a VM will be provisioned.
* To verify status of the VM, run .\Status with the Instance ID as a aparameter.
* The expected outcome is that Status will return information about the VM.  After about 10 minutes the Script Extension status should be Success.
* If running .\Status with -ConnectionFiles, the expected outcome includes a new Connect.rdp file and ConnectTo-FullAdmin.ps1 file in the working directory.

To remove the VM but leave the storage account, cloud service, and affinity group active -
* Open a PowerShell prompt As an Administrator and change directory to your working directory
* Run .\SetupSubscription.ps1 to validate that the System account has a current subscription set
* Run .\RemoveVMs.ps1 with the Instance ID as a parameter.
* Confirm you wish to remove the VM and VHD files by typing 'DESTROY' and hitting Enter.
* The expectation is that from the Microsoft Azure web interface, after hitting refresh, the virtual machine should no longer be listed.

To reprovision the virtual machine after it has been removed -
* Open a PowerShell prompt As an Administrator
* Run .\Create.ps1 again
* The expectation is that the virtual machine will be created again and will appear in the Status script as well as the web interface.

To remove all configurations created by the Create script -
* Open a PowerShell prompt As an Administrator and change directory to your working directory
* Run .\SetupSubscription.ps1 to validate that the System account has a current subscription set
* Run .\Destroywith the Instance ID as a parameter.
* Confirm you wish to remove the environment by typing 'DESTROY' and hitting Enter.
* The expectation is that all assets created using the Create script will be removed and no longer appear in the Azure web interface.


Understanding the INSTANCE ID:
Instance ID - The Create script uses the last 10 places of the .NET time format named 'Ticks' to create a unique identifer for the accounts.  This is required because storage and service names must be globally unique - not just for your account - across all Azure customers.  The last step of the Create script is to return this number to the pipeline (along with the DSC output).  You can capture the Instance ID by copying and pasting it from the PowerShell window, by copying and pasting it from the Azure website by opening the Cloud Service and selecting it from the title text, or you can automatically capture it from the pipeline using a variable.
$test = .\Create.ps1				* In this example, the Instance ID would be returned as $test[1]
.\Status.ps1 $test[1] -ConnectionFiles		* In this example, the status of the VM is checked using the pipeline value.

Understanding the CREDENTIALS PROMPT:
When running the .\Create.ps1 script, there is an immediate prompt for credentials.  The value collected here will be used to create the account inside the VM that is added to the local administrators group.
NOTE - the password will be stored in clear text inside the MOF file.  This is only acceptable for test scenarios.

Understanding HOW TO TEST JEA:
As a side benefit of this solution it is possible to test PowerShell Just Enough Administration.  Within the ScriptExtensionFiles folder you will find a script named InstallJEA.ps1.  This delivers prerequisites for testing including downloads of the xJEA resource and WMF5, installing them both, and enabling remote access.  You have the option to remove comment blocks that would also execute steps inside the VM to configure JEA.  This provides flexibility to either test JEA on your own or have the script build out an endpoint automatically.









