[![Build status](https://ci.appveyor.com/api/projects/status/b30a0ayk2t21kg7j/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xsafeharbor/branch/master)

# xSafeHarbor

The **xSafeHarbor** module contains the DSC configurations that allow you to setup the **SafeHarbor** example.

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).


## Description

The **xSafeHarbor** module contains the **Assert-SafeHarborScenario.ps1** script file. 
This script allows you to exercise the **SafeHarbor** example by setting up a secure environment to run a particular application or service inside of an assume-breached network. 
This substantially reduces the attack surface of the application or service by configuring a highly customized, application specific environment, by limiting user access and by having "Just Enough" administrative control with full auditing.

To learn more details about this example, please see [this blog post](http://blogs.msdn.com/b/powershell/archive/2014/07/21/creating-a-secure-environment-using-powershell-desired-state-configuration.aspx).

Note: This example require the use of [Windows Management Framework (WMF) 5.0 Preview](http://go.microsoft.com/fwlink/?LinkId=398175).


## Details

### Assert-SafeHarborScenario

* **BaseVhdFilePath**: (Mandatory) Path to VHD file that would be used as base image for all the VMs.
* **Credentials**: Collection of credentials for following user names. 
If not specified, the script will prompt for:
    - DHCPServer\Administrator
    - Corporate\Administrator
    - Corporate\User1
    - Corporate\Papa
    - Corporate\DeptHead
    - Safeharbor\Administrator
    - Safeharbor\Mata
* **VhdDestinationPath**: Path where differencing VHDs will be stored.
* **Validate**: If specified, will run the validation steps at the end of example.
* **PauseBetweenStages**: If specified, pauses the script execution between various stages of example setup
 
## Versions

### 1.0.0.1

* Minor bug fix: Replaced hardcoded hotfix ID for WMF with test for that version or higher. 

### 1.0.0.0

* Initial release with the **SafeHarbor** example 


## Examples

### Setup SafeHarbor example on a Hyper-V host 

```powershell
$baseVhdFilePath = ‘C:\BaseVhd\serverdatacenter_en-us.vhd 
.\Assert-SafeHarborScenario.ps1 -BaseVhdFilePath $baseVhdFilePath -Validate –PauseBetweenStages
```
