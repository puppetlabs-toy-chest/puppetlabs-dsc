[![Build status](https://ci.appveyor.com/api/projects/status/05um9vwey5h64bed/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xscspf/branch/master)

# xSCSPF

The **xSCSPF** module contains DSC resources for installing System Center Service Provider Foundation (SPF):

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

* **xSCSPFServer** adds a server in SPF.
* **xSCSPFServerSetup** installs the SPF server.
* **xSCSPFServerUpdate** updates an SPF server to Update Rollup 4.
* **xSCSPFSetting** adds setting in SPF.
* **xSCSPFStamp** adds a stamp in SPF. 

### xSCSPFServer

* **Ensure**: Ensures that an SPF server is **Absent** or **Present**. 
* **Name**: (Key) The desired name of the server.
* **ServerType**: (Required) Specifies the type of server: { VMM | OM | DPM | OMDW | RDGateway | Orchestrator | None }
* **SCSPFAdminCredential**: (Required) Credential with admin permissions to Service Provider Foundation.

### xSCSPFServerSetup

* **Ensure**: (Key) Ensures that an SPF server is installed on the machine: { Absent | Present }
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SetupCredential**: (Required) Credential to be used to perform the installation.
* **UseMicrosoftUpdate**: { 0 | 1 } 
0: Do not opt in to Microsoft Update. 
1: Opt in to Microsoft Update.
* **SendCEIPReports**: { 0 | 1 } 
0: Do not opt in to the Customer Experience Improvement Program (CEIP). 
1: Opt in to CEIP.
* **SpecifyCertificate**: Use an existing certificate.
* **CertificateName**: Name of existing certificate to use.
* **DatabaseServer**: (Required) Name of the database server.
* **DatabasePortNumber**: Port of the database server instance.
* **DatabaseName**: Name of the SPF database.
* **WebSitePortNumber**: Port for the SPF web service.
* **SCVMM**: Credential for the VMM application pool.
* **SCVMMUsername**: Output user name of the VMM application pool service.
* **SCAdmin**: Credential for the Admin application pool.
* **SCAdminUsername**: Output user name of the Admin application pool service.
* **SCProvider**: Credential for the Provider application pool.
* **SCProviderUsername**: Output user name of the Provider application pool service.
* **SCUsage**: Credential for the Usage application pool.
* **SCUsageUsername**: Output user name of the Usage application pool service.
* **VMMSecurityGroupUsers**: Administrator of the VMM application pool.
* **AdminSecurityGroupUsers**: Administrator of the Admin application pool.
* **ProviderSecurityGroupUsers**: Administrator of the Provider application pool.
* **UsageSecurityGroupUsers**: Administrator of the Usage application pool

### xSCSPFServerUpdate

* **Ensure**: (Key) Ensures that the xSCSPF update is **Present** or **Absent** on the machine. 
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **Credential**: (Required) Credential to be used to perform the installation.
* **Update**: Output display name of the update.

**xSCSPFSetting** has the following properties:

* **Ensure**: Ensures that the SPF setting is **Present** or **Absent** on the machine. 
* **ServerName**: (Key) Name of the server the setting is associated with.
* **SettingType**: (Required) { DatabaseConnectionString | EndPointConnectionString }
* **Name**: (Key) Friendly name for the setting.
* **Value**: (Required) Value for the setting.
* **SCSPFAdminCredential**: (Required) Credential with admin permissions to SPF. 

**xSCSPFStamp** has the following properties:

* **Ensure**: Ensures that the SPF stamp is **Absent** or **Present**.
* **Name**: (Key) Name for the stamp.
* **Servers**: (Required) Name of one or more server objects to associate with the new stamp.
* **SCSPFAdminCredential**: (Required) Credential with admin permissions to Service Provider Foundation.


## Versions

### 1.3.1.0

* Updated with the following resources:
    - xSCSPFServer
    - xSCSPFSetting
    - xSCSPFStamp

### 1.2.0.0

* Updated with the following resource:
    - xSCSPFServerUpdate

### 1.1.0.0

* Initial release with the following resource:
    - xSCSPFServerSetup

## Examples

Three example configurations are included in the Examples folder. 
All three examples also use the **xSQLServer** and **xSCVMM** modules.

### Single Server Installation

SCSPF-SingleServer.ps1 installs SPF including prerequisites and SQL on a single server.

### Separate SQL

SCSPF-SeperateSQL.ps1 installs SPF on one server and SQL on a separate server.

### Multiple Instances
SCSPF-MultiInstance.ps1 installs multiple SPF servers each on their own server and SQL on a separate server.

Notes: 

The samples require the use of [Windows Management Framework (WMF) 5.0 Preview](http://go.microsoft.com/fwlink/?LinkId=398175).

All three examples use the exact same Configuration and just modify the behavior based on input ConfigurationData.

In the Examples folder you will see a version of each file with "-TP" appended to the name. 
These are the equivalent examples for deployment of System Center Technical Preview on Windows Server Technical Preview.
