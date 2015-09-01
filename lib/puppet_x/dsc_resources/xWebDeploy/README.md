[![Build status](https://ci.appveyor.com/api/projects/status/slalax51x0djryqc/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xwebdeploy/branch/master)

# xWebDeploy

The **xWebDeploy** module contains the **xWebPackageDeploy** and **xWebDeploy** DSC resources for installing an IIS site using the WebDeploy IIS extension (MSWebDeploy version 3.5). 

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

* **xWebDeploy** is a composite configuration that installs the WebDeploy 3.5 IIS extensions and deploys an IIS site from a given web package that was exported from a reference server suing MSWebDeploy 3.0 or 3.5. 
xWebDeploy supports Web Deploy sync, dump verbs, and iisApp and contentPath parameters. 
Note: This composite resource requires the **Package** resource that ships with PowerShell 4.0. 
* **xWebPackageDeploy** installs an IIS site from a given web deploy package formatted as a zip file. 

### xWebDeploy

* **SourcePath**: The full path on the filesystem where the web deploy package (as a zip file) is located. 
* **Destination**: The IIS content path or IIS site name to install the WebDeploy Zip package. 
* **WebDeployMsi**: The URI to download WebDeploy version 3.5.

### xWebPackageDeploy

* **SourcePath**: The full path on the filesystem where the web deploy package (as a zip file) is located. 
* **Destination**: The IIS content path or IIS site name to install the WebDeploy zip package. 
* **Ensure**: Ensures that the web package is installed: { Present | Absent }

## Versions

### Unreleased


### 1.1.0.0

* Added WebdeployMsi setting to make xWebDeploy work without internet access

### 1.0.0.0

* Initial release with the following resources 
    - xWebDeploy
    - xWebPackageDeploy

## Examples

### Deploy IIS site from the given zip package using the WebDeploy composite resource

```powershell
# You need to provide $SourcePath and $Destination parameter values to be able to run this sample Sample  
# Note that xWebDeploy is installing WebDeploy extension from default install location "$env:ProgramFiles\WindowsPowerShell\Modules\xWebDeploy\InstallerMsi. 
# Run xWebDeploySample.ps1 from xWebDeploy\Samples
```
