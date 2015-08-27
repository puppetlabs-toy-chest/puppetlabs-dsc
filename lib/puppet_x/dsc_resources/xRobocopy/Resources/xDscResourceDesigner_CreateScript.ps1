$modules = 'C:\Program Files\WindowsPowerShell\Modules\'
$modulename = 'xRobocopy'
$Description = 'This module is used to facilitate large file copies with complex requirements such as multithreading, restarts, and exclusions when recursing content.'

if (!(test-path (join-path $modules $modulename))) {

    $modulefolder = mkdir (join-path $modules $modulename)
    New-ModuleManifest -Path (join-path $modulefolder "$modulename.psd1") -Guid $([system.guid]::newguid().guid) -Author 'PowerShell DSC' -CompanyName 'Microsoft Corporation' -Copyright '2015' -ModuleVersion '0.1.0.0' -Description $Description -PowerShellVersion '4.0'

    $standard = @{ModuleName = $modulename
                ClassVersion = '0.1.0.0'
                Path = $modules
                }
    $P1 = @()
    $P1 += New-xDscResourceProperty -Name Source -Type String -Attribute Key -Description 'Source Directory, Drive or UNC path.'
    $P1 += New-xDscResourceProperty -Name Destination -Type String -Attribute Key -Description 'Destination Dir, Drive or UNC path.'
    $P1 += New-xDscResourceProperty -Name Files -Type String -Attribute Write -Description 'File(s) to copy  (names/wildcards: default is all files).'
    $P1 += New-xDscResourceProperty -Name Retry -Type UInt32 -Attribute Write -Description 'Number of Retries on failed copies: default 1 million.'
    $P1 += New-xDscResourceProperty -Name Wait -Type UInt32 -Attribute Write -Description 'Wait time between retries: default is 30 seconds.'
    $P1 += New-xDscResourceProperty -Name SubdirectoriesIncludingEmpty -Type Boolean -Attribute Write -Description 'Copy subdirectories, including Empty ones.'
    $P1 += New-xDscResourceProperty -Name Restartable -Type Boolean -Attribute Write -Description 'Copy files in restartable mode.'
    $P1 += New-xDscResourceProperty -Name MultiThreaded -Type Boolean -Attribute Write -Description 'Do multi-threaded copies with n threads (default 8). N must be at least 1 and not greater than 128. This option is incompatible with the /IPG and /EFSRAW options. Redirect output using /LOG option for better performance.'
    $P1 += New-xDscResourceProperty -Name ExcludeFiles -Type String -Attribute Write -Description 'Exclude Files matching given names/paths/wildcards.'
    $P1 += New-xDscResourceProperty -Name LogOutput -Type String -Attribute Write -Description 'Output status to LOG file.'
    $P1 += New-xDscResourceProperty -Name AppendLog -Type Boolean -Attribute Write -Description 'Determine whether to overwrite log file or append.'
    $P1 += New-xDscResourceProperty -Name AdditionalArgs -Type String -Attribute Write -Description 'Robocopy has MANY configuration options.  Too many to present them all as DSC parameters effectively. Use this option to set additional parameters.  The string will be appended to the arguements list.  For a list of options run Robocopy /??? in a shell window.'
    New-xDscResource -Name MSFT_xRobocopy -Property $P1 -FriendlyName xRobocopy @standard
}


# Markdown Generator #
# This is a first draft.  Expected to become 100% efficient in future version.  Loop resources, import example from script, etc.

if (!(test-path "$modules\$modulename\Resources\")){mkdir "$modules\$modulename\Resources\"}

$MD = @"
Introduction
============

The **$ModuleName** module is a part of the Windows PowerShell Desired State Configuration (DSC) Resource Kit, which is a collection of DSC Resources. $Description, with simple declarative language.

**All of the resources in the DSC Resource Kit are provided AS IS, and are not supported through any Microsoft standard support program or service. The "x" in $ModuleName stands for experimental**, which means that these resources will be **fix forward** and monitored by the module owner(s).

Please leave comments, feature requests, and bug reports in the Q & A tab for
this module.

If you would like to modify the **$ModuleName** module, feel free. When modifying, please update the module name, resource friendly name, and MOF class name (instructions below). As specified in the license, you may copy or modify this resource as long as they are used on the Windows Platform.

For more information about Windows PowerShell Desired State Configuration, check out the blog posts on the [PowerShell Blog](http://blogs.msdn.com/b/powershell/) ([this](http://blogs.msdn.com/b/powershell/archive/2013/11/01/configuration-in-a-devops-world-windows-powershell-desired-state-configuration.aspx) is a good starting point). There are also great community resources, such as [PowerShell.org](http://powershell.org/wp/tag/dsc/), or [PowerShell Magazine](http://www.powershellmagazine.com/tag/dsc/). For more information on the DSC Resource Kit, checkout [this blog post](http://go.microsoft.com/fwlink/?LinkID=389546).

Installation
------------

To install **$ModuleName** module

-   If you are using WMF4 / PowerShell Version 4: Unzip the content under the $env:ProgramFiles\WindowsPowerShell\Modules folder

-   If you are using WMF5 Preview: From an elevated PowerShell session run "Install-Module $ModuleName"

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
**$Resource1** resource has following properties

"@
foreach ($res in $P1) {$MD += @"
- **$($res.Name)**: $($res.Description)

"@
}
$MD += @"

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

**0.1.0.0**

- Initial release with the following resources
"@
foreach ($res in $P1) {$MD += @"
    - $($res.Name)

"@
    }
$MD += @'

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
'@ 
$MD | Out-File "$modules\$modulename\Resources\ReadMe.md"
