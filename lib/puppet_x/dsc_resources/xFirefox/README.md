[![Build status](https://ci.appveyor.com/api/projects/status/pe6p3pghfqkvbw77/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xfirefox/branch/master)

# xFirefox

The **xFirefox** module contains the **MSFT_xFirefox** composite resource which allows you to install the Firefox web browser


## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Resources

### MSFT_xFirefox

* **Language**: Specify the language of the browser to be installed.
The default value is English.
* **VersionNumber**: Specify the version number of the browser to be installed.
By default, the latest version is installed. 
* **OS**: Specify the operating system on which the browser is to be installed.
By default, the operating system is Windows.
* **MachineBits**: Specifies the machine's operating system bit number.
The default is x86.
* **LocalPath**: The local path on the machine where the installation file should be downloaded.

## Versions

### 1.0.0.0
* Initial release with the following resources 
    - MSFT_xFirefox


## Examples

### Install the Firefox browser

```powershell
Configuration Sample_InstallFirefoxBrowser
{
    param
    (

    [Parameter(Mandatory)]
    $VersionNumber,

    [Parameter(Mandatory)]
    $Language,

    [Parameter(Mandatory)]
    $OS,

    [Parameter(Mandatory)]
    $LocalPath      

    )

    Import-DscResource -module xFirefox

    MSFT_xFirefox Firefox
    {
    VersionNumber = $VersionNumber
    Language = $Language
    OS = $OS
    LocalPath = $LocalPath
    }
}
```
