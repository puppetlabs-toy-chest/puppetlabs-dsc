[![Build status](https://ci.appveyor.com/api/projects/status/29y5yx2vxwjq60ic/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xcredssp/branch/master)

# xCredSSP


The **xCredSSP** module is a part of the Windows PowerShell Desired State Configuration (DSC) Resource Kit, which is a collection of DSC Resources produced by the PowerShell Team.
This module contains the **xCredSSP** resource, which enables or disables Credential Security Support Provider (CredSSP) authentication on a client or on a server computer, and which server or servers the client credentials can be delegated to.


**All of the resources in the DSC Resource Kit are provided AS IS, and are not supported through any Microsoft standard support program or service.
The "x" in xCredSSP stands for experimental**, which means that these resources will be **fix forward** and monitored by the module owner(s).

## Installation

To install **xCredSSP** module

*   Unzip the content under $env:ProgramFiles\WindowsPowerShell\Modules folder

To confirm installation:

*   Run **Get-DSCResource** to see that **xCredSSP** is among the DSC Resources listed.


## Requirements

This module requires the latest version of PowerShell (v4.0, which ships in Windows 8.1 or Windows Server 2012R2).
To easily use PowerShell 4.0 on older operating systems, [<span style="color:#0000ff">install WMF 4.0</span>](http://www.microsoft.com/en-us/download/details.aspx?id=40855).
Please read the installation instructions that are present on both the download page and the release notes for WMF 4.0.


## Description

The **xCredSSP** module contains the **xCredSSP** resource, which enables or disables Credential Security Support Provider (CredSSP) authentication on a client or on a server computer, and which server or servers the client credentials can be delegated to.


## Details

**xCredSSP** resource has following properties:

*   **Ensure:** Specifies whether the domain trust is present or absent 
*   **Role**: REQUIRED parameter representing the CredSSP role, and is either "Server" or "Client" 
*   **DelegateComputers**: Array of servers to be delegated to, REQUIRED when Role is set to "Client".

## Versions

### 1.0.1.0

*   Updated with minor bug fixes.


### 1.0.0.0

*   Initial release with the following resources 
    *   <span style="font-family:Calibri; font-size:medium">xADDomain</span> 

## Examples

Enable CredSSP for both server and client roles, and delegate to Server1 and Server2.

```powershell
Configuration EnableCredSSP
{
    Import-DscResource -Module xCredSSP
    Node localhost
    {
        xCredSSP Server
        {
            Ensure = "Present"
            Role = "Server"
        }
        xCredSSP Client
        {
            Ensure = "Present"
            Role = "Client"
            DelegateComputers = "Server1","Server2"
        }
    }
} 
```

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).
