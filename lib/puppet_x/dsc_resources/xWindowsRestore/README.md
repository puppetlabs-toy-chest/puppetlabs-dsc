[![Build status](https://ci.appveyor.com/api/projects/status/8bysqkxmaecxvq54/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xwindowsrestore/branch/master)

# xWindowsRestore

The **xWindowsRestore** module contains the **xSystemRestore** and **xSystemRestorePoint** for managing system restore and system checkpoints on a Windows machine. 

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

* **xSystemRestore** enables or disables system restore on a specified system drive. 
* **xSystemRestorePoint:** creates and removes system checkpoints. 

### xSystemRestore

* **Drive**: Specifies the file system drives. 
Enter one or more file system drive letters, each followed by a colon and a backslash and enclosed in quotation marks, such as 'C:\' or 'D:\'.
* **Ensure**: Ensures that the system is or is not configured for system restore: { **Present** | **Absent** }

### xSystemRestorePoint

* **Description**: Descriptive name for the restore point. 
* **RestorePointType**: The type of restore point. 
The default is APPLICATION_INSTALL. 
* **Ensure**: Ensures that the restore point is **Present** or **Absent**.

## Versions

### 1.0.0.0

* Initial release with the following resources:
    - xWindowsRestore
    - xSystemRestorePoint

## Examples 

### Enable System Restore

In the Examples folder, ConfigureSystemRestore.ps1 demonstrates how to enable system restore.

### Creates a System Restore point

In the Examples folder, CreateSystemRestorePoint.ps1 demonstrates how to create a system restore point.
