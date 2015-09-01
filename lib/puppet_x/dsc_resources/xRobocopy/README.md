[![Build status](https://ci.appveyor.com/api/projects/status/gooo7e8b374v45j6/branch/master?svg=true)](https://ci.appveyor.com/project/PowerShell/xrobocopy/branch/master)  

# xRobocopy 

The **xRobocopy** module is a part of the Windows PowerShell Desired State Configuration (DSC) Resource Kit, which is a collection of DSC Resources. This module is used to facilitate large file copies with complex requirements such as multithreading, restarts, and exclusions when recursing content., with simple declarative language.

**All of the resources in the DSC Resource Kit are provided AS IS, and are not supported through any Microsoft standard support program or service. The "x" in xRobocopy stands for experimental**, which means that these resources will be **fix forward** and monitored by the module owner(s).

Please leave comments, feature requests, and bug reports in the Q & A tab for
this module.

If you would like to modify the **xRobocopy** module, feel free. When modifying, please update the module name, resource friendly name, and MOF class name (instructions below). As specified in the license, you may copy or modify this resource as long as they are used on the Windows Platform.

For more information about Windows PowerShell Desired State Configuration, check out the blog posts on the [PowerShell Blog](http://blogs.msdn.com/b/powershell/) ([this](http://blogs.msdn.com/b/powershell/archive/2013/11/01/configuration-in-a-devops-world-windows-powershell-desired-state-configuration.aspx) is a good starting point). There are also great community resources, such as [PowerShell.org](http://powershell.org/wp/tag/dsc/), or [PowerShell Magazine](http://www.powershellmagazine.com/tag/dsc/). For more information on the DSC Resource Kit, checkout [this blog post](http://go.microsoft.com/fwlink/?LinkID=389546).

Installation
------------

To install **xRobocopy** module

-   If you are using WMF4 / PowerShell Version 4: Unzip the content under the C:\Program Files\WindowsPowerShell\Modules folder

-   If you are using WMF5 Preview: From an elevated PowerShell session run "Install-Module xRobocopy"

To confirm installation

-   Run Get-DSCResource to see that the resources listed above are among the DSC Resources displayed

Requirements
------------

This module requires the latest version of PowerShell (v4.0, which ships in
Windows 8.1 or Windows Server 2012R2). To easily use PowerShell 4.0 on older
operating systems, install WMF 4.0. Please read the installation instructions
that are present on both the download page and the release notes for WMF 4.0.

Details
-------
**xRobocopy** resource has following properties
- **Source**: Source Directory, Drive or UNC path.
- **Destination**: Destination Dir, Drive or UNC path.
- **Files**: File(s) to copy  (names/wildcards: default is all files).
- **Retry**: Number of Retries on failed copies: default 1 million.
- **Wait**: Wait time between retries: default is 30 seconds.
- **SubdirectoriesIncludingEmpty**: Copy subdirectories, including Empty ones.
- **Restartable**: Copy files in restartable mode.
- **MultiThreaded**: Do multi-threaded copies with n threads (default 8). N must be at least 1 and not greater than 128. This option is incompatible with the /IPG and /EFSRAW options. Redirect output using /LOG option for better performance.
- **ExcludeFiles**: Exclude Files matching given names/paths/wildcards.
- **LogOutput**: Output status to LOG file.
- **AppendLog**: Determine whether to overwrite log file or append.
- **AdditionalArgs**: Robocopy has MANY configuration options.  Too many to present them all as DSC parameters effectively. Use this option to set additional parameters.  The string will be appended to the arguements list.  For a list of options run Robocopy /??? in a shell window.

Renaming Requirements
---------------------

When making changes to these resources, we suggest the following practice

1. Update the following names by replacing MSFT with your company/community name
and replacing the **"x" with **"c" (short for "Community") or another prefix of your
choice
 -    Module name (ex: xModule becomes cModule)
 -    Resource folder (ex: MSFT\_xResource becomes Contoso\_xResource)
 -    Resource Name (ex: MSFT\_xResource becomes Contoso\_cResource)
 -    Resource Friendly Name (ex: xResource becomes cResource)
 -    MOF class name (ex: MSFT\_xResource becomes Contoso\_cResource)
 -    Filename for the <resource\>.schema.mof (ex: MSFT\_xResource.schema.mof becomes Contoso\_cResource.schema.mof)

2. Update module and metadata information in the module manifest  
3. Update any configuration that use these resources

We reserve resource and module names without prefixes ("x" or "c") for future use (e.g. "MSFT_Resource"). If the next version of Windows Server ships with a "WindowsEventForwarding" resource, we don't want to break any configurations that use any community modifications. Please keep a prefix such as "c" on all community modifications.

Versions
--------

### 1.1.0.0

* Updated Get-TargetResource function

### 1.0.0.0

* Initial public release of xRobocopy module with following resources:
	* xRobocopy

Examples
--------

**Example 1**:  Copy a directory from one location to another with multithreading and restartable mode.  Note that this example is using PSRunAsCredential which is a common parameter only available in WMF5 and later.
```powershell
    configuration DeployContent
    {
        param (
            [Parameter(Mandatory=$true)] 
            [ValidateNotNullorEmpty()] 
            [PsCredential] $Credential 
            )

        Import-DscResource -ModuleName xRobocopy
        Node 'localhost'
        {
            xRobocopy Content
            {
                Source                = '\\server\share\ReleaseVersion'
                Destination           = 'C:\inetpub\wwwroot\sitename'
                Multithread           = $true
                Restartable           = $true
                PSRunAsCredential     = $Credential
            }
        }
    }
    $configData = @{
        AllNodes = @(
            @{
                NodeName                    = 'localhost';
                CertificateId               = 'Your Certificate thumbprint here'
                }
            )
        }
    DeployContent -ConfigurationData $configData -Credential (get-credential) -OutputPath 'c:\DSC'
    Start-DscConfiguration -Wait -Force -Verbose -Path 'c:\DSC'

    # Validate results
    Get-ChildItem C:\inetpub\wwwroot\sitename
```

## Contributing
Please check out common DSC Resources [contributing guidelines](https://github.com/PowerShell/DscResource.Kit/blob/master/CONTRIBUTING.md).
