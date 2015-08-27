[![Build status](https://ci.appveyor.com/api/projects/status/4umfdsbj520bmely/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xphp/branch/master)

# xPhp


## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

### xPhpProvision

* **PackageFolder**: The folder to download the PHP and Visual C++ 2012 packages to. **Note:** this must already exist. 
* **DownloadUri**: The URL/URI for the PHP package.
* **VcRedistDownloadUri**: The URL/URI for the Visual Studio C++ 2012 Redistributiable package.
* **DestinationPath**: The path to install PHP.
* **ConfigurationPath**: The path to the file to use as PHP.ini. 
* **InstallMySqlExt**: A boolean indicating if the MySQL extension should be installed.


## Versions

### 1.1.0.0
* Updated module name to support WMF 5

### 1.0.1

* Initial release with the following resources 
    - xPhp

### unreleased

* Renamed the resource as it was named against naming standards and resources cannot be named the same as the module. 
    - xPhpProvision


## Examples

### Setup a PHP Server on a single node

This configuration will setup a PHP server on a single node.
Note: this configuration requires the following other modules: **xWebAdministration**, and **xPsDesiredStateConfiguration**. 

```powershell
# This configuration will, via the xPhpProvision composite configuration: 
# 1) Make sure IIS is installed 
# 2) Make sure PHP is present 
# 3) Make sure that PHP is registered with IIS 
# 4) Make sure PHP is in the path 
# 
# ********* NOTE *********** 
# PHP changes their download URLs frequently.  Please verify the URL. 
# the VC Redist URL changes less frequently, but should still be verified. 
# After verifying the download URLs for the products and update them appropriately. 
# ************************** 
$scriptRoot = Split-Path $MyInvocation.MyCommand.Path 
$phpIniPath = (Join-Path $scriptRoot "phpConfigTemplate.txt") 
if (-not (Test-Path $phpIniPath)) 
{ 
    $message = "Missing required file $phpIniPath" 
    # This file is in the samples folder of the resource 
    throw $message 
} 
Configuration SamplePhp 
{ 
    # Import composite resources 
    Import-DscResource -module xPhp 
    Node "localhost" 
    { 
        File PackagesFolder 
        { 
            DestinationPath = "C:\package" 
            Type = "Directory" 
            Ensure = "Present" 
        } 
        # Make sure PHP is installed in IIS 
        xPhpProvision  php 
        { 
            InstallMySqlExt = $true 
            PackageFolder =  "C:\package" 
            # Update with the latest "VC11 x64 Non Thread Safe" from http://windows.php.net/download/ 
            DownloadURI = "http://windows.php.net/downloads/releases/php-5.5.14-nts-Win32-VC11-x64.zip" 
            DestinationPath = "C:\php" 
            ConfigurationPath = $phpIniPath 
            Vc2012RedistDownloadUri = "http://download.microsoft.com/download/1/6/B/16B06F60-3B20-4FF2-B699-5E9B7962F9AE/VSU_4/vcredist_x64.exe" 
            # Removed because this dependency does not work in Windows Server 2012 R2 and below 
            # This should work in WMF v5 and above 
            # DependsOn = "[IisPreReqs_WordPress]Iis" 
        } 
    } 
} 
SamplePhp 
Start-DscConfiguration -path .\SamplePhp -wait -verbose
```
