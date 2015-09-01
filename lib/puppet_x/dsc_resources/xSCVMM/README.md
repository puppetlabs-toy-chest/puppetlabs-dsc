[![Build status](https://ci.appveyor.com/api/projects/status/m4jubjbaq05eweo9/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xscvmm/branch/master)

# xSCVMM

The **xSCVMM** module contains DSC resources for installing and updating System Center Virtual Machine Manager (VMM):

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

* **xSCVMManagementServerSetup** installs the VMM Management server.
* **xSCVMMConsoleSetup** installs the VMM console.
* **xSCVMManagementServerUpdate** updates the VMM Management server to Update Rollup 4.
* **xSCVMMConsoleUpdate** updates the VMM console to Update Rollup 4.
* **xSCVMMAdmin** adds VMM admins.
* **xSCVMMOperationsManagerServer** connects VMM to Operations Manager.

### xSCVMMManagementServerSetup

* **Ensure**: (Key) Ensures that the SCVMM management server is installed on the machine: { Present | Absent }
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SetupCredential**: (Required) Credential to be used to perform the installation.
* **vmmService**: Domain account for the VMM service.
* **vmmServiceUsername**: Output user name of the VMM service.
* **ProductKey**: Product key for licensed installations.
* **UserName**: Display name for the user.
* **CompanyName**: Display name for the organization.
* **ProgramFiles**: Installation path for the software, as defined by SCVMM Setup.
* **ClusterManagementServer**: Boolean specifying if this a clustered Management Server.
* **FirstManagementServer**: Boolean specifying if this is or is not the first Management Server.
* **CreateNewSqlDatabase**: { 0 | 1 } 
0: Use an existing Microsoft SQL Server database. 
1: Create a new SQL Server database.
* **SqlMachineName**: (Required) Name of the server that is hosting SQL Server.
* **SqlInstanceName**: (Required) Name of the new or existing instance of SQL Server.
* **SqlDatabaseName**: Name of the new or existing SQL Server database.
* **IndigoTcpPort**: Port for communication with the VMM console.
* **IndigoHTTPSPort**: Port for communication with the Windows Preinstallation Environment agents.
* **IndigoNETTCPPort**: Port for communication with Windows Deployment Services.
* **IndigoHTTPPort**: Port for communication with Windows PE agent for time synchronization.
* **WSManTcpPort**: Port for communication with agents on hosts and library servers.
* **BitsTcpPort**: Port for file transfers to agents on hosts and library servers.
* **CreateNewLibraryShare**: { 0 | 1 } 
0: Use an existing library share. 
1: Create a new library share.
* **LibraryShareName**: Name of the file share to be used or created.
* **LibrarySharePath**: Location of the existing file share or the new file share to be created.
* **LibraryShareDescription**: Description of the share.
* **TopContainerName**: Container for Distributed Key Management.
* **VmmServerName**: Clustered service name for a highly available VMM management server.
* **VMMStaticIPAddress**: IP address for the clustered service name for a highly available VMM management server, if you are not using Dynamic Host Configuration Protocol (DHCP).
* **RetainSqlDatabase**: { 0 | 1 } 
0: Remove the SQL Server database. 
1: Do not remove the SQL Server database.
* **ForceHAVMMUninstall**: { 0 | 1 } 
0: Do not force uninstallation if setup.exe cannot verify whether this node is the final node of the highly available installation. 
1: Force the uninstallation.
* **SQMOptIn**: { 0 | 1 } 
0: Do not opt in to the Customer Experience Improvement Program (CEIP). 
1: Opt in to CEIP.
* **MUOptIn**: { 0 | 1 } 
0: Do not opt in to Microsoft Update. 
1: Opt in to Microsoft Update.

### xSCVMMConsoleSetup

* **Ensure**: (Key) An enumerated value (Present, Absent) that describes if the VMM console is expected to be installed on the machine.
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **SetupCredential**: (Required) Credential to be used to perform the installation.
* **ProgramFiles**: Installation path for the software.
* **IndigoTcpPort**: Port for communication with the VMM management server.
* **MUOptIn**: { 0 | 1 } 
0: Do not opt in to Microsoft Update. 
1: Opt in to Microsoft Update.

### xSCVMManagementServerUpdate

* **Ensure**: (Key) Ensures that the VMM Management Server update is installed on the machine: { Present | Absent }
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **Credential**: (Required) Credential to be used to perform the installation.
* **Update**: Output display name of the update.

### xSCVMMConsoleUpdate

* **Ensure**: (Key) Ensures that the VMM Console update is installed on the machine: { Present | Absent }
* **SourcePath**: (Required) UNC path to the root of the source files for installation.
* **SourceFolder**: Folder within the source path containing the source files for installation.
* **Credential**: (Required) Credential to be used to perform the installation.
* **Update**: Output display name of the update.

### xSCVMMAdmin

* **Ensure**: Ensures that a principal is a Virtual Machine Manager admin: { Present | Absent }
* **Principal**: (Key) The Virtual Machine Manager admin principal.
* **UserRole**: (Key) The Virtual Machine Manager user role.
* **SCVMMAdminCredential**: (Required) Credential to be used to perform the operations.

### xSCVMMOperationsManagerServer

* **Ensure**: (Key) Ensures that an Operations Manager connection is **Absent** or **Present**. 
* **OpsMgrServer**:  (Required) Specifies the fully qualified domain name (FQDN) of the System Center Operations Manager management server to which VMM connects.
* **EnablePRO**: Indicates whether PRO is enabled for this connection.
* **EnableMaintenanceModeIntegration**: Indicates whether maintenance mode integration is enabled for this connection.
* **VMMServerCredential**: Specifies the credentials that Operations Manager uses to connect with VMM.
* **OpsMgrServerCredential**: Specifies the name of the VMM RunAs account that VMM uses to connect to the Operations Manager management group.
* **UseVMMServerServiceAccount**: Specifies the service account that VMM uses to connect to Operations Manager.
* **SCVMMAdminCredential**: Credential to be used to perform the operations.


## Versions

### 1.2.4.0

* Updated release wich added the following resource 
    - xSCVMMOperationsManagerServer
* Added /norestart to xSCVMMConsoleUpdate and xSCVMMManagementServerUpdate to allow DSC to control reboots
* Increased timeout for setup process to start to 60 seconds

### 1.2.0.0

* Updated release wich added the following resources 
    - xSCVMMManagementServerUpdate
    - xSCVMMConsoleUpdate
    - xSCVMMAdmin

### 1.1.0.0

* Initial release with the following resources 
    - xSCVMMManagementServerSetup
    - xSCVMMConsoleSetup

## Examples

Two example configurations are included in the Examples folder within the module. 
Both examples also use the **xSQLServer** module.

### Single Server Installation

SCVMM-SingleServer.ps1 installs all VMM roles including prerequisites and SQL on a single server.

### Separate SQL

SCVMM-SeperateSQL.ps1 installs all VMM roles on one server and SQL on a seperate server.

Notes:

Both examples require the use of [Windows Management Framework (WMF) 5.0 Preview](http://go.microsoft.com/fwlink/?LinkId=398175).

Both examples use the exact same Configuration and just modify the behavior based on input ConfigurationData.

In the Examples folder you will see a version of each file with "-TP" appended to the name. 
These are the equivalent examples for deployment of System Center Technical Preview on Windows Server Technical Preview.

Since the System Center 2012 R2 Virtual Machine Manager installer for the management server restarts the Windows Remote Management service, if you are using -Verbose -Wait to see the progress of the configuration you will lose the connection to the VMM server during deployment. 
However, the configuration will continue and complete without further display.
