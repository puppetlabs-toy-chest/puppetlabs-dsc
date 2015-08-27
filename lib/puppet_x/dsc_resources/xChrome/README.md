[![Build status](https://ci.appveyor.com/api/projects/status/gx1p29qa9ug73u0v/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xchrome/branch/master)

# xChrome

The **xChrome** module is a part of the Windows PowerShell Desired State Configuration (DSC) Resource Kit, which is a collection of DSC Resources produced by the PowerShell Team.
This module contains the **MSFT_xChrome** resource.
The **MSFT_xChrome** DSC Resource allows you to install the latest version of Google Chrome.

**All of the resources in this module are provided AS IS, and are not supported through any Microsoft standard support program or service. The "x" prefix in the module name stands for "experimental," which means that these resources will be fix-forward and monitored by the module owner(s).**

## Installation

To install **xChrome** PowerShell DSC module:

*   Unzip the content under the `$env:ProgramFiles\WindowsPowerShell\Modules` folder
*   **OR** Run `Install-Module -Name xChrome` from an administrative PowerShell prompt

To confirm installation:  

*   Run `Get-DSCResource -Module xChrome` to see that `MSFT_xChrome` is among the DSC Resources listed  
*   Run the `Get-Module -ListAvailable -Name xChrome` command to verify that the `xChrome` DSC module is listed

## Requirements

This module requires the latest version of PowerShell (v4.0, which ships in Windows 8.1 or Windows Server 2012R2).
To easily use PowerShell 4.0 on older operating systems, [install WMF 4.0](http://www.microsoft.com/en-us/download/details.aspx?id=40855).
Please read the installation instructions that are present on both the download page and the release notes for WMF 4.0.

## Description

The `xChrome` module contains the `MSFT_xChrome` DSC Resource. This DSC Resource allows you to install the latest version of chrome.

## Details

The **MSFT_xChrome** DSC Resource has following optional properties:

*  **Language**: Specify the language of the browser to be installed.Default it is English.
*  **LocalPath**: The local location on the machine which can you used to place the downloaded installation file.

## Versions

### 1.0.2.0

* Minor documentation updates

### 1.0.1.0

* Minor changes in module manifest

### 1.0.0.0

*   Initial release with the following resources 
    *   MSFT_xChrome 

## Examples

### Install the Chrome browser

Install the latest Google Chrome web browser.

```
# Installs the latest version of Chrome in the language specified in the parameter Language.

Configuration Sample_InstallChromeBrowser
{
    param
    (
    [Parameter(Mandatory)]
    $Language,
        
    [Parameter(Mandatory)]
    $LocalPath
        
    )
    
    Import-DscResource -module xChrome
    
    MSFT_xChrome chrome
    {
    Language = $Language
    LocalPath = $LocalPath
    }
}
```

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).
