# dsc
[wmf-5.0]: https://www.microsoft.com/en-us/download/details.aspx?id=48729
[DSCResources]: https://github.com/powershell/DSCResources
[wmf5-blog-post]: http://blogs.msdn.com/b/powershell/archive/2015/08/31/windows-management-framework-5-0-production-preview-is-now-available.aspx

#### Table of Contents
1. [Module Description - What is the dsc module and what does it do](#module-description)
2. [Prerequisites](#windows-system-prerequisites)
3. [Setup](#setup)
4. [Usage](#usage)
  * [Using DSC Resources with Puppet](#using-dsc-resources-with-puppet)
  * [Handling Reboots with DSC](#handling-reboots-with-dsc)
  * [Installing Packages with DSC](#installing-packages-with-dsc)
  * [Using Credentials](#using-credentials)
  * [Setting Registry Values](#setting-registry-values)
  * [Adding or Removing Windows Features](#adding-or-removing-windows-features)
  * [Website Installation Example](#website-installation-example)
  * [Optionally Configure the DSC LCM RefreshMode](#optionally-configure-the-dsc-lcm-refreshmode)
5. [Reference](#reference)
6. [Limitations](#limitations)
  * [Known Issues](#known-issues)
  * [Running Puppet and DSC without Administrative Privileges](#running-puppet-and-dsc-without-administrative-privileges)
7. [Development - Guide for contributing to the module](#development)
8. [Places to Learn More About DSC](#places-to-learn-more-about-dsc)
9. [License](#license)

## Module Description

Puppet module for managing Windows PowerShell DSC (Desired State Configuration) resources.

This module generates Puppet Types based on DSC resources' MOF (Managed Object Format) schema files.

In this version, the following DSC Resources are already built and ready for use:
- All base DSC resources found in PowerShell 5 ([WMF 5.0][wmf-5.0]).
- All DSC resources found in the [Microsoft PowerShell DSC Resource Kit][DSCResources]

This module is available on the [Puppet Forge](https://forge.puppetlabs.com/puppetlabs/dsc)

## Windows System Prerequisites

 - PowerShell 5 which is included in [Windows Management Framework 5.0][wmf-5.0]. PowerShell v5 is currently in [production preview][wmf5-blog-post], so the above link may change after official release.

## Setup

~~~
puppet module install puppetlabs-dsc
~~~

## Usage

### Using DSC Resources with Puppet

You can use a DSC Resource by prefixing each DSC Resource name and parameter with 'dsc_'.

~~~puppet
dsc_windowsfeature {'IIS':
  dsc_ensure => 'present',
  dsc_name   => 'Web-Server',
}
~~~

All DSC Resource names and parameters have to be in lowercase, e.g: `dsc_windowsfeature` or `dsc_name`.

When it comes to `ensure =>` (Puppet's `ensure`) versus `dsc_ensure =>` (DSC's `Ensure`), you can use one or the other with the exception of a known issue - `ensure => absent` will report success and do nothing - see [MODULES-2966](https://tickets.puppetlabs.com/browse/MODULES-2966) for details. **Until this issue is resolved, we recommend using `dsc_ensure` exclusively.** Once that issue is resolved you can use one or the other in your manifests for Puppet DSC resource types. If you use both in a Puppet DSC resource, `dsc_ensure` will override the value in `ensure`, so the value for `ensure` will essentially be ignored. It is recommended that `dsc_ensure` is used as it is a closer match for converting from the DSC properties to Puppet DSC resources and it overrides `ensure` so there is less confusion if both are accidentally included.

### Handling Reboots with DSC

You will need to add the following `reboot` resource to your manifest. It must have the name `dsc_reboot` for the `dsc` module to find and use it.

~~~puppet
reboot { 'dsc_reboot' :
    message => 'DSC has requested a reboot',
    when => 'pending'
}
~~~

### Installing Packages with DSC

You can install MSIs or EXEs with DSC using the Puppet type `dsc_package` which maps to the `Package` DSC Resource.

~~~puppet
dsc_package{'installpython'
  dsc_ensure    => 'Present',
  dsc_name      => 'Python 2.7.10',
  dsc_productid => 'E2B51919-207A-43EB-AE78-733F9C6797C2'
  dsc_path      => 'C:\\python.msi',
}
~~~

The `Package` DSC Resource requires the following pieces of information to install an MSI:

- ProductName: The `Name` of product being installed.
- ProductId: The `ProductCode` property of the MSI, which is a unique identifier for the particular product release, represented as a GUID string. For more information see the [MSDN ProductCode property](https://msdn.microsoft.com/en-us/library/aa370854.aspx) documentation page.

You can obtain this information in a variety of ways.

- Use a tool like Orca to open the MSI file and inspect the `Name` and `ProductCode`.
- Install the product on a test system and inspect the `Name` and `ProductCode` in the Windows Add/Remove Programs Control Panel
- Use a script to query the MSI file for the `Name` and `ProductCode` like the example PowerShell script below which was adapted from [Stack Overflow](http://stackoverflow.com/a/8743878/1083).

~~~powershell
function Get-MsiDatabaseInfo{
  param ([IO.FileInfo]$FilePath)

  $productName = Invoke-MSIQuery -FilePath $filePath.FullName -Query "SELECT Value FROM Property WHERE Property = 'ProductName'"
  $productCode = Invoke-MSIQuery -FilePath $filePath.FullName -Query "SELECT Value FROM Property WHERE Property = 'ProductCode'"

  return [PSCustomObject]@{
    FullName    = $FilePath.FullName
    ProductName = ([string]$productName).TrimStart()
    ProductCode = ([string]$productCode).Replace("{","").Replace("}","").TrimStart()
  }
}

function Invoke-MSIQuery{
  param($FilePath, $Query)
  try{
    $windowsInstaller = New-Object -com WindowsInstaller.Installer
    $database = $windowsInstaller.GetType().InvokeMember("OpenDatabase", "InvokeMethod", $Null, $windowsInstaller, @($FilePath, 0))
  }catch{
    throw "Failed to open MSI file. The error was: {0}." -f $_
  }

  try{
    $View = $database.GetType().InvokeMember("OpenView", "InvokeMethod", $Null, $database, ($query))
    $View.GetType().InvokeMember("Execute", "InvokeMethod", $Null, $View, $Null)

    $record = $View.GetType().InvokeMember("Fetch", "InvokeMethod", $Null, $View, $Null)
    $property = $record.GetType().InvokeMember("StringData", "GetProperty", $Null, $record, 1)

    $View.GetType().InvokeMember("Close", "InvokeMethod", $Null, $View, $Null)

    return $property
  }catch{
    throw "Failed to read MSI file. The error was: {0}." -f $_
  }
}
~~~

### Using Credentials

DSC uses `MSFT_Credential` objects to pass credentials to DSC Resources. Supply a hash to any `credential` parameter and Puppet will handle creating the `credential` object for you.

~~~puppet
dsc_user { 'jane-doe':
  dsc_username             => 'jane-doe',
  dsc_description          => 'Jane Doe user',
  dsc_ensure               => present,
  dsc_password             => {
    'user' => 'jane-doe',
    'password' => 'jane-password'
  },
  dsc_passwordneverexpires => false,
  dsc_disabled             => true,
}
~~~

### Setting Registry Values

Creating and modifying Registry keys and values is done with the `dsc_registry` Puppet type which maps to the `Registry` DSC Resource.

#### Registry Example: Simple

Setting simple values works like you would expect.

~~~puppet
dsc_registry {'registry_test':
    dsc_ensure    => 'Present'
    dsc_key       => 'HKEY_LOCAL_MACHINE\SOFTWARE\ExampleKey'
    dsc_valuename => 'TestValue'
    dsc_valuedata => 'TestData'
}
~~~

#### Registry Example: Binary

The 'Binary' data type expects hexadecimal in a single string.

~~~puppet
dsc_registry {'registry_test':
  dsc_ensure => 'Present',
  dsc_key => 'HKEY_LOCAL_MACHINE\SOFTWARE\TestKey',
  dsc_valuename => 'TestBinaryValue',
  dsc_valuedata => 'BEEF',
  dsc_valuetype => 'Binary',
}
~~~

#### Registry Example: Dword and Qword

The 'Dword' and 'Qword' data types expect signed integer values as opposed to hexadecimal or unsigned.

~~~puppet
dsc_registry {'registry_test':
  dsc_ensure => 'Present',
  dsc_key => 'HKEY_LOCAL_MACHINE\SOFTWARE\TestKey',
  dsc_valuename => 'TestDwordValue',
  dsc_valuedata => '-2147483648',
  dsc_valuetype => 'Dword',
}
~~~

*Note*: DSC Resources are executed under the SYSTEM context by default, which means you are unable to access any user level Registry key without providing alternate credentials.

### Adding or Removing Windows Features

You can add or remove Windows Features using Puppet type `dsc_windowsfeature` which maps to the `WindowsFeature` DSC Resource.

#### Add a Windows Feature

~~~puppet
dsc_windowsfeature {'featureexample':
  dsc_ensure = 'present'
  dsc_name = 'Web-Server'
}
~~~

#### Remove a Windows Feature

~~~puppet
dsc_windowsfeature {'featureexample':
  dsc_ensure = 'absent'
  dsc_name = 'Web-Server'
}
~~~

#### Finding Windows Feature Names

You can find the name to use when adding or removing Windows Features by executing the `Get-WindowsFeature` cmdlet and using the `Name` property.

~~~
[PS]> Get-WindowsFeature
~~~

### Website Installation Example

An end to end example installtion of a test website.

~~~puppet
class fourthcoffee(
  $websitename        = 'FourthCoffee',
  $zipname            = 'FourthCoffeeWebSiteContent.zip',
  $sourcerepo         = 'https://github.com/msutter/fourthcoffee/raw/master',
  $destinationpath    = 'C:\inetpub\FourthCoffee',
  $defaultwebsitepath = 'C:\inetpub\wwwroot',
  $zippath            = 'C:\tmp'
){

  $zipuri  = "${sourcerepo}/${zipname}"
  $zipfile = "${zippath}\\${zipname}"

  # Install the IIS role
  dsc_windowsfeature {'IIS':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Server',
  } ->

  # Install the ASP .NET 4.5 role
  dsc_windowsfeature {'AspNet45':
    dsc_ensure => 'present',
    dsc_name   => 'Web-Asp-Net45',
  } ->

  # Stop an existing website (set up in Sample_xWebsite_Default)
  dsc_xwebsite {'Stop DefaultSite':
    dsc_ensure       => 'present',
    dsc_name         => 'Default Web Site',
    dsc_state        => 'Stopped',
    dsc_physicalpath => $defaultwebsitepath,
  } ->

  # Create tmp folder
  dsc_file {'tmp folder':
    dsc_ensure          => 'present',
    dsc_type            => 'Directory',
    dsc_destinationpath => $zippath,
  } ->

  # Download the site content
  dsc_xremotefile {'Download WebContent Zip':
    dsc_destinationpath => $zipfile,
    dsc_uri             => $zipuri,
  } ->

  # Extract the website content 
  dsc_archive {'Unzip and Copy the WebContent':
    dsc_ensure      => 'present',
    dsc_path        => $zipfile,
    dsc_destination => $destinationpath,
  } ->

  # Create a new Website
  dsc_xwebsite {'BackeryWebSite':
    dsc_ensure       => 'present',
    dsc_name         => $websitename,
    dsc_state        => 'Started',
    dsc_physicalpath => $destinationpath,
  }
}
~~~

As you can see, you can mix and match dsc resources with common puppet resources.
All [puppet metaparameters](https://docs.puppetlabs.com/references/latest/metaparameter.html) should also be supported.

### Optionally Configure the DSC LCM RefreshMode

Prior to the WMF5 Production Preview, the DSC Local Configuration Manager (LCM) `RefreshMode` had to be set to `'Disabled'` for the module to work. That limitation has been removed in the [WMF 5 Production Preview][wmf5-blog-post], but the module still supports configuring this setting if you wish to change it.

~~~puppet
dsc::lcm_config {'disable_lcm':
  refresh_mode => 'Disabled',
}
~~~

## Reference

### Types

A comprehensive listing of all types included in the dsc module is available in the [types document](https://github.com/puppetlabs/puppetlabs-dsc/blob/master/types.md).

## Limitations

- DSC Composite Resources are not supported.
- DSC requires PowerShell `Execution Policy` for the `LocalMachine` scope to be set to a less restrictive setting than `Restricted`. If you see the error below, see [MODULES-2500](https://tickets.puppetlabs.com/browse/MODULES-2500) for more information.

~~~
Error: /Stage[main]/Main/Dsc_xgroup[testgroup]: Could not evaluate: Importing module MSFT_xGroupResource failed with
 error - File C:\Program
Files\WindowsPowerShell\Modules\PuppetVendoredModules\xPSDesiredStateConfiguration\DscResources\MSFT_xGroupR
esource\MSFT_xGroupResource.psm1 cannot be loaded because running scripts is disabled on this system. For more
information, see about_Execution_Policies at http://go.microsoft.com/fwlink/?LinkID=135170.
~~~
- You cannot use forward slashes for the MSI `Path` property for the `Package` DSC Resource. The underlying implementation does not handle forward slashes instead of backward slashes in paths and throws a misleading error that it could not find a Package with the Name and ProductId provided. [MODULES-2486](https://tickets.puppetlabs.com/browse/MODULES-2486) has more examples and information on this subject.
- `dsc_ensure` will override and ignore the value in `ensure` if both are present in a Puppet DSC resource. See [Using DSC Resources with Puppet](#using-dsc-resources-with-puppet).

### Known Issues

- The `dsc_log` resource may not appear to work. The ["Log" resource](https://technet.microsoft.com/en-us/library/Dn282117.aspx) writes events to the 'Microsoft-Windows-Desired State Configuration/Analytic' event log, which is [disabled by default](https://technet.microsoft.com/en-us/library/Cc749492.aspx).

- You may have issues attempting to use `dsc_ensure => absent` with `dsc_service` with services that are not running.

When setting resources to absent, it is common to specify a minimal statement like so:

~~~
dsc_service{'disable_foo':
  dsc_ensure => absent,
  dsc_name => 'foo'
}
~~~

Due to the way the Service DSC Resource sets its defaults, the above minimal statement will report the service as already absent erroneously if the service is currently not running. In order to work around this, you must specify that `State => 'Stopped'` as well as `Ensure => absent'`. The following example will work:

~~~
dsc_service{'disable_foo':
  dsc_ensure => absent,
  dsc_name => 'foo',
  dsc_state => 'stopped'
}
~~~

[MODULES-2512](https://tickets.puppetlabs.com/browse/MODULES-2512) has more details.

 - You may have issues attempting to use `dsc_ensure => absent` with `dsc_xservice` with services that are already not present. To work around this problem, always specify the path to the executable for the service when specifying `absent`. [MODULES-2512](https://tickets.puppetlabs.com/browse/MODULES-2512) has more details. The following example works:

~~~
dsc_xservice{'disable_foo':
  dsc_ensure => absent,
  dsc_name => 'foo',
  dsc_path => 'c:\\Program Files\\Foo\\bin\\foo.exe'
}
~~~

- Use `ensure` instead of `dsc_ensure` - `ensure => absent` will report success while doing nothing - see [MODULES-2966](https://tickets.puppetlabs.com/browse/MODULES-2966) for details. Also see [Using DSC Resources with Puppet](#using-dsc-resources-with-puppet).

- When installing the module on Windows you may run into an issue regarding long file names (LFN) due to the long paths of the generated schema files. If you install your module on a Linux master and then use plugin sync you will likely not see this issue. If you are attempting to install the module on a Windows machine using `puppet module install puppetlabs-dsc` you may run into an error that looks similar to the following:

~~~
Error: No such file or directory @ rb_sysopen - C:/ProgramData/PuppetLabs/puppet/cache/puppet-module/cache/tmp-unpacker20150713-...mof
Error: Try 'puppet help module install' for usage
~~~

For Puppet 4.2.2+ (and 3.8.2) we've lessened the possibility of the issue occurring based on the fixes in [PUP-4854](https://tickets.puppetlabs.com/browse/PUP-4854). However, a complete fix will become available in a version of Puppet that incorporates [PUP-4866](https://tickets.puppetlabs.com/browse/PUP-4866).

If you are affected by this issue, a known workaround is to download the `.tar.gz` from the forge and use `puppet module install` using the file rather than directly from the forge.

- Windows 2003 is not supported.  Further, when installing the module on a Puppet master to the default `production` environment, this module ***will*** cause pluginsync to fail on Windows 2003 agents due to an issue with [LFN (long file names)](https://tickets.puppetlabs.com/browse/PUP-4866).  To workaround this, use [Puppet environments](https://docs.puppetlabs.com/puppet/latest/reference/environments.html) to create an environment separate from `production`, without the DSC module installed, to host Windows 2003 nodes.

### Running Puppet and DSC without Administrative Privileges

While there are avenues for using Puppet with a non-administrative account, DSC is limited to only accounts with administrative privileges. The underlying CIM implementation DSC uses for DSC Resource invocation requires administrative credentials to function.

- Setting the LCM RefreshMode to Disabled requires administrative credentials
- Using the Invoke-DscResource cmdlet requires administrative credentials

The Puppet agent on a Windows node can run DSC with a normal default install. If the Puppet agent was configured to use an alternate user account, that account must have administrative privileges on the system in order to run DSC.


## Development

Puppet Labs modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. We can’t access the huge number of platforms and myriad of hardware, software, and deployment configurations that Puppet is intended to serve.

We want to keep it as easy as possible to contribute changes so that our modules work in your environment. There are a few guidelines that we need contributors to follow so that we can have a chance of keeping on top of things.

For more information, see our [module contribution guide.](https://docs.puppetlabs.com/forge/contributing.html)

* The Puppet types are built from the source code of each DSC Resources MOF schema files. If you want to build the types, read the [Quick-start and Building](README_BUILD.md#quick-start).
* If you want the build Puppet types for your own custom DSC Resources, read [Build Custom DSC Resource Types](README_BUILD.md#build-custom-dsc-resource-types).


### Contributors

To see who's already involved, see the [list of contributors.](https://github.com/puppetlabs/puppetlabs-dsc/graphs/contributors)

## Places to Learn More About DSC

You can learn more about PowerShell DSC from the following online resources:

- [Microsoft PowerShell Desired State Configuration Overview](https://msdn.microsoft.com/en-us/PowerShell/dsc/overview) - Starting point for DSC topics
- [Microsoft PowerShell DSC Resources page](https://msdn.microsoft.com/en-us/powershell/dsc/resources) - For more information about built-in DSC Resources
- [Microsoft PowerShell xDSCResources Github Repo](https://github.com/PowerShell/DscResources) -  For more information about xDscResources
- [Windows PowerShell Blog](http://blogs.msdn.com/b/powershell/archive/tags/dsc/) - DSC tagged posts from the Microsoft PowerShell Team
- [Puppet Labs Windows DSC & WSUS Webinar 9-17-2015 webinar](https://puppetlabs.com/webinars/windows-dsc-wsus-webinar-09-17-2015) - How DSC works with Puppet
- [Better Together: Managing Windows with Puppet, PowerShell and DSC - PuppetConf 10-2015 talk](https://www.youtube.com/watch?v=TP0zqe-yQto) and [slides](https://speakerdeck.com/iristyle/better-together-managing-windows-with-puppet-powershell-and-dsc)
- [PowerShell.org](http://powershell.org/wp/tag/dsc/) - Community based DSC tagged posts
- [PowerShell Magazine](http://www.powershellmagazine.com/tag/dsc/) - Community based DSC tagged posts

There are several books available as well. Here are some selected books for reference:

- [Learning PowerShell DSC](http://bit.ly/learndsc) - James Pogran is a member of the team here at Puppet Labs working on the DSC/Puppet integration
- [The DSC Book](https://www.penflip.com/powershellorg/the-dsc-book) - Powershell.org community contributed content
- [Windows PowerShell Desired State Configuration Revealed](http://www.apress.com/9781484200179) - Ravikanth Chaganti

## License

* Copyright (c) 2014 Marc Sutter, original author
* Copyright (c) 2015 - Present Puppet Labs
* License: [Apache License, Version 2.0](https://github.com/puppetlabs/puppetlabs-dsc/blob/master/LICENSE)
