[![Build status](https://ci.appveyor.com/api/projects/status/7basx8plqk4s29yn/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xscsr/branch/master)

# xSCSR

The **xSCSR** module contains DSC resources for deploying System Center Service Reporting (SR):

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

* **xSCSRServerSetup installs the SR server.
* **xSCSRServerUpdate** updates an SR server to Update Rollup 4.

### xSCSRServerSetup

* **Ensure**: (Key) Ensures that SR server is installed on the machine: { Present | Absent }
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SetupCredential**: (Required) Credential to be used to perform the installation.
* **UseMicrosoftUpdate**: { 0 | 1 } 
0: Do not opt in to Microsoft Update. 
1: Opt in to Microsoft Update.
* **SendCEIPReports**: { 0 | 1 } 
0: Do not opt in to the Customer Experience Improvement Program (CEIP). 
1: Opt in to CEIP.
* **InstallFolder**: Folder to install to.
* **DatabaseServer**: (Required) Name of the database server.
* **DatabaseServerInstance**: (Required) Name of the SQL Server database instance to install to.
* **RepositoryDatabaseName**: Name of the usage repository database that already exists, or that setup should create.
* **StagingDatabaseName**: Name of the usage staging database that already exists, or that setup should create.
* **DWDatabaseName**: Name of the usage data warehouse database that already exists, or that setup should create.
* **AnalysisDatabaseServer**: (Required) Name of the server that is running SQL Server where the analysis database already exists, or that setup should create.
* **AnalysisDatabaseServerInstance**: (Required) Name of the SQL Server analysis database instance to install to.
* **AnalysisDatabaseName**: Name of the analysis database that already exists, or that setup should create.

### xSCSRServerUpdate

* **Ensure**: (Key) Ensures that SR server update is installed on the machine: { Present | Absent }
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **Credential**: (Required) Credential to be used to perform the installation.
* **Update**: Output display name of the update.

## Versions

### 1.3.0.0

* Increased timeout for setup process to start to 60 seconds
* Added /norestart to xSCSRUpdate to allow DSC to control reboots

### 1.2.0.0

* Updated release with the following resource:
    - xSCSRServerUpdate

### 1.1.0.0

* Initial release with the following resource:
    - xSCSRServerSetup

## Examples

### Single Server Installation

SCSR-SingleServer.ps1 installs SR including prerequisites and SQL on a single server.

### Separate SQL

SCSR-SeperateSQL.ps1 installs SR on one server and SQL on a seperate server.

Notes: 

The samples require the use of [Windows Management Framework (WMF) 5.0 Preview](http://go.microsoft.com/fwlink/?LinkId=398175).

All three examples use the exact same Configuration and just modify the behavior based on input ConfigurationData.

In the Examples folder you will see a version of each file with "-TP" appended to the name. 
These are the equivalent examples for deployment of System Center Technical Preview on Windows Server Technical Preview.
