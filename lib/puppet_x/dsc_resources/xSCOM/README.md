[![Build status](https://ci.appveyor.com/api/projects/status/3rh4o5270qrh4gk3/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xscom/branch/master)

# xSCOM

The **xSCOM** module contains set of DSC resources for installation of System Center Operations Manager (OM).

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

* **xSCOMManagementServerSetup** installs the OM Management server
* **xSCOMReportingServerSetup** installs the OM Reporting server
* **xSCOMWebConsoleServerSetup** installs the OM Web Console server
* **xSCOMConsoleSetup** installs the OM console
* **xSCOMManagementServerUpdate** updates an OM Management server to Update Rollup 4
* **xSCOMWebConsoleServerUpdate** updates an OM Web Console server to Update Rollup 4
* **xSCOMConsoleUpdate** updates an OM Console to Update Rollup 4
* **xSCOMAdmin** adds OM admins
* **xSCOMManagementPack** installs OM Management Packs

### xSCOMManagementServerSetup

* **Ensure**: (Key) Ensures that the OM management server is **Present** or **Absent**. 
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SetupCredential**: (Required) Credential to be used to perform the installation.
* **ProductKey**: Product key for licensed installations.
* **InstallPath**: Installation path for the software.
* **ManagementGroupName**: (Required) The name of the management group.
* **FirstManagementServer**: (Required) A boolean indicating if this is the first Management Server.
* **ManagementServicePort**: The Management Server port on install.
* **ActionAccount**: The domain and user name of the Management server action account.
* **ActionAccountUsername**: Output user name of the Management server action account.
* **DASAccount**: The domain and user name of the Data Access service account.
* **DASAccountUsername**: Output user name of the Data Access service account.
* **DataReader**: (Required) The domain and user name of the data reader account.
* **DataReaderUsername**: Output user name of the data reader account.
* **DataWriter**: (Required) The domain and user name of the data writer account.
* **DataWriterUsername**: Output user name of the data writer account.
* **SqlServerInstance**: (Required) The SQL server and instance.
* **DatabaseName**: The name of the Operational database
* **DatabaseSize**: The size in MB of the Operational database.
* **DwSqlServerInstance**: (Required) The data warehouse server and instance.
* **DwDatabaseName**: The name of the data warehouse database.
* **DwDatabaseSize**: The size in MB of the data warehouse database.
* **UseMicrosoftUpdate**: { 0 | 1 } 
0: Do not opt in to Microsoft Update. 
1: Opt in to Microsoft Update.
* **SendCEIPReports**: { 0 | 1 } 
0: Do not opt in to the Customer Experience Improvement Program (CEIP). 
1: Opt in to CEIP.
* **EnableErrorReporting**: { Never | Queued | Always }
Never: Do not opt in to sending automatic error reports.
Queued: Opt in to sending error reports, but queue the reports for review before sending.
Always: Opt in to automatically send error reports.
* **SendODRReports**: { 0 | 1 }
0: Do not opt in to sending operational data reports. 
1: Opt in to sending operational data reports.

### xSCOMReportingServerSetup

* **Ensure**: (Key) Ensures that the OM reporting server is **Present** or **Absent**. 
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SetupCredential**: (Required) Credential to be used to perform the installation.
* **InstallPath**: Installation path for the software.
* **ManagementServer**: (Required) The name of the management server associated with the reporting server.
* **SRSInstance**: (Required) The reporting server and instance.
* **DataReader**: (Required) The domain and user name of the data reader account.
* **DataReaderUsername**: Output user name of the data reader account.
* **UseMicrosoftUpdate**: { 0 | 1 } 
0: Do not opt in to Microsoft Update. 
1: Opt in to Microsoft Update.
* **SendCEIPReports**: { 0 | 1 } 
0: Do not opt in to the Customer Experience Improvement Program (CEIP). 
1: Opt in to CEIP.
* **EnableErrorReporting**: { Never | Queued | Always }
Never: Do not opt in to sending automatic error reports.
Queued: Opt in to sending error reports, but queue the reports for review before sending.
Always: Opt in to automatically send error reports.
* **SendODRReports**: { 0 | 1 }
0: Do not opt in to sending operational data reports. 
1: Opt in to sending operational data reports.

### xSCOMWebConsoleServerSetup

* **Ensure**: (Key) Ensures that the OM web console server is **Present** or **Absent**. 
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SetupCredential**: (Required) Credential to be used to perform the installation.
* **InstallPath**: Installation path for the software.
* **ManagementServer**: (Required) The name of the management server associated with the Reporting server.
* **WebSiteName**: The name of the website.
* **WebConsoleAuthorizationMode**:{ Mixed | Network } 
Mixed: Used for intranet scenarios. 
Network: Used for extranet scenarios.
* **WebConsoleUseSSL**: Specify only if your website has Secure Sockets Layer (SSL) activated.
* **UseMicrosoftUpdate**: { 0 | 1 } 
0: Do not opt in to Microsoft Update. 
1: Opt in to Microsoft Update.
* **SendCEIPReports**: { 0 | 1 } 
0: Do not opt in to the Customer Experience Improvement Program (CEIP). 
1: Opt in to CEIP.
* **EnableErrorReporting**: { Never | Queued | Always }
Never: Do not opt in to sending automatic error reports.
Queued: Opt in to sending error reports, but queue the reports for review before sending.
Always: Opt in to automatically send error reports.
* **SendODRReports**: { 0 | 1 }
0: Do not opt in to sending operational data reports. 
1: Opt in to sending operational data reports.

### xSCOMConsoleSetup

* **Ensure**: (Key) Ensures that the OM console is **Present** or **Absent**. 
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SetupCredential**: (Required) Credential to be used to perform the installation.
* **InstallPath**: Installation path for the software.
* **UseMicrosoftUpdate**: { 0 | 1 } 
0: Do not opt in to Microsoft Update. 
1: Opt in to Microsoft Update.
* **SendCEIPReports**: { 0 | 1 } 
0: Do not opt in to the Customer Experience Improvement Program (CEIP). 
1: Opt in to CEIP.
* **EnableErrorReporting**: { Never | Queued | Always }
Never: Do not opt in to sending automatic error reports.
Queued: Opt in to sending error reports, but queue the reports for review before sending.
Always: Opt in to automatically send error reports.
* **SendODRReports**: { 0 | 1 }
0: Do not opt in to sending operational data reports. 
1: Opt in to sending operational data reports.

### xSCOMManagementServerUpdate

* **Ensure**: (Key) Ensures that the OM management server update is **Present** or **Absent**. 
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **Credential**: (Required) Credential to be used to perform the installation.
* **Update**: Output display name of the update.

### xSCOMWebConsoleServerUpdate

* **Ensure**: (Key) Ensures that the OM web console server update is **Present** or **Absent**. 
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **Credential**: (Required) Credential to be used to perform the installation.
* **Update**: Output display name of the update.

### xSCOMConsoleUpdate

* **Ensure**: (Key) Ensures that the OM console update is **Present** or **Absent**. 
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **Credential**: (Required) Credential to be used to perform the installation.
* **Update**: Output display name of the update.

### xSCOMAdmin

* **Ensure**: An enumerated value that describes if the principal is an Operations Manager admin.
* **Principal**: (Key) The Operations Manager admin principal.
* **UserRole**: (Key) The Operations Manager user role.
* **SCOMAdminCredential**: (Required) Credential to be used to perform the operations.

**xSCOMManagementPack** has the following properties:

* **Name**: (Key) Name of the Management Pack.
* **Version**: Specific version of the Management Pack.
Note: This overrides MinVersion if both are set.
* **MinVersion**: Minimum version of the Management Pack.
Note: This is overridden by Version if both are set.
* **SCOMAdminCredential**: (Required) Credential with admin permissions to Operations Manager.
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SourceFile**: Name of the file in the source folder for the Management Pack.

## Versions

### 1.3.3.0

* Increased timeout for setup process to start to 60 seconds.
* Modified MSFT_xSCOMConsoleUpdate, MSFT_xSCOMManagementServerUpdate, and MSFT_xSCOMWebConsoleServerUpdate resources to use /norestart, allowing DSC to control reboots.

### 1.2.0.0

* Updated to include the following resources: 
    - xSCOMManagementServerUpdate
    - xSCOMWebConsoleServerUpdate
    - xSCOMConsoleUpdate
    - xSCOMAdmin
    - xSCOMManagementPack

### 1.1.0.0

* Initial release with the following resources:
    - xSCOMManagementServerSetup
    - xSCOMConsoleSetup
    - xSCOMReportingServerSetup,
    - xSCOMWebConsoleServerSetup

## Examples

Four example configurations are included in the Examples folder within the module. 
All four examples also use the **xCredSSP** and **xSQLServer** modules. 
Note: the samples require the use of [Windows Management Framework (WMF) 5.0 Preview](http://go.microsoft.com/fwlink/?LinkId=398175).

Note: In the Examples folder you will see a version of each file with "-TP" appended to the name. 
These are the equivalent examples for deployment of System Center Technical Preview on Windows Server Technical Preview.

### Single Server Installation

SCOM-SingleServer.ps1 installs all OM roles including prerequisites and SQL on a single server.

### Separate SQL 

SCOM-SeperateSQL.ps1 installs all OM roles on one server and SQL on a separate server.

### Multiple Separate SQL Instances

SCOM-SeperateSQLInstances.ps1 installs all OM roles on one server and SQL in multiple instances on a separate server.

### Multiple Management Servers

SCOM-MultiInstance.ps1 installs all OM roles including multiple management servers each on their own server with multiple SQL Servers.
