[![Build status](https://ci.appveyor.com/api/projects/status/5f5k4aox5g12v93i/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xscdpm/branch/master)

# xSCDPM

The **xSCDPM** modules contains the **xSCDPMServerSetup**, **xSCDPMDatabaseServerSetup**, and **xSCDPMConsole** DSC resources for installing System Center Service Management Automation (DPM). 


## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

* **xSCDPMServerSetup** manages installation of the DPM server.
* **xSCDPMDatabaseServerSetup** manages installation of the DPM support files for SQL Server.
* **xSCDPMConsole** manages installation of the DPM console.

### xSCDPMServerSetup*

* **Ensure**: (Key) Ensures that the DPM server is **Present** or **Absent** on the machine.
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SetupCredential**: (Required) Credential to be used to perform the installation.
* **UserName**: User name that the software will be registered to.
* **CompanyName**: Company name that the software will be registered to.
* **ProductKey**: Product key for licensed installations.
* **ProgramFiles**: Installation path for the software.
* **YukonMachineName**: (Required) Name of the SQL server for the DPM database.
* **YukonInstanceName**: (Required) Name of the SQL instance for the DPM database.
* **YukonMachineCredential**: (Required) Credential to be used to access the SQL instance for DPM at installation time.
* **ReportingMachineName**: (Required) Name of the SQL server for reporting.
* **ReportingInstanceName**: (Required) SQL instance for reporting.
* **ReportingMachineCredential**: (Required) Credential to be used to access SQL reporting for DPM at installation time.

### xSCDPMDatabaseServerSetup

* **Ensure**: (Key) Ensures that the DPM management server is **Present** or **Absent** on the machine.
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SetupCredential**: (Required) Credential to be used to perform the installation.

### xSCDPMConsoleSetup

* **Ensure**: (Key) Ensures that the DPM console is **Present** or **Absent**on the machine.
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SetupCredential**: (Required) Credential to be used to perform the installation.


## Versions

### 1.2.0.0

* Increased timeout for setup process to start to 60 seconds.

### 1.1.0.0

* Initial release with the following resources 
    * xSCDPMServerSetup
    * xSCDPMDatabaseServerSetup
    * xSCDPMConsole

## Examples

All three of the following examples also require the **xDismFeature** and **xSQLServer** modules.
All three examples also use the exact same Configuration and just modify the behavior based on input ConfigurationData

Note: These examples require the use of PowerShell 5.0, included as part of [Windows Management Framework (WMF) 5.0](http://go.microsoft.com/fwlink/?LinkId=398175). 

Note: In the Examples folder you will see a version of each file with "-TP" appended to the name.
These are the equivalent examples for deployment of System Center Technical Preview on Windows Server Technical Preview.

### Single Server Installation

SCDPM-SingleServer.ps1 installs DPM including prerequisites and SQL on a single server.

### Separate SQL

SCDPM-SeperateSQL.ps1 installs DPM and SQL on separate servers.

### Multiple Instances 

SCDPM-MultiInstance.ps1 installs multiple instances of DPM on different servers all using a single SQL on another server.
