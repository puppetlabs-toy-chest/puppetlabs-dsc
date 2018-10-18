# dsc

[wmf-5.0]: https://www.microsoft.com/en-us/download/details.aspx?id=50395
[DSCResources]: https://github.com/powershell/DSCResources
[wmf5-blog-post]: https://msdn.microsoft.com/en-us/powershell/wmf/5.1/release-notes
[wmf5-blog-incompatibilites]: https://msdn.microsoft.com/en-us/powershell/wmf/5.1/productincompat

#### Table of Contents

1. [Description - What is the dsc module and what does it do](#module-description)
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
5. [Reference](#reference)
6. [Limitations](#limitations)
  * [Known Issues](#known-issues)
  * [Running Puppet and DSC without Administrative Privileges](#running-puppet-and-dsc-without-administrative-privileges)
7. [Development - Guide for contributing to the module](#development)
8. [Places to Learn More About DSC](#places-to-learn-more-about-dsc)
9. [License](#license)

## Description

The Puppet dsc module manages Windows PowerShell DSC (Desired State Configuration) resources.

This module generates Puppet types based on DSC Resources MOF (Managed Object Format) schema files.

In this version, the following DSC Resources are already built and ready for use:

- All base DSC resources found in PowerShell 5 ([WMF 5.0][wmf-5.0]).
- All DSC resources found in the [Microsoft PowerShell DSC Resource Kit][DSCResources]

## Windows System Prerequisites

 - PowerShell 5, which is included in [Windows Management Framework 5.0][wmf-5.0].
 - [Windows 2003 is not supported](#known-issues).

## Setup

~~~bash
puppet module install puppetlabs-dsc
~~~

See [known issues](#known-issues) for troubleshooting setup.

## Usage

### Using DSC Resources with Puppet

You can use a DSC Resource by prefixing each DSC Resource name and parameter with 'dsc_' and lowercasing the values.

So a DSC resource specified in PowerShell...

~~~powershell
WindowsFeature IIS {
  Ensure = 'present'
  Name   = 'Web-Server'
}
~~~

...would look like this in Puppet:

~~~puppet
dsc_windowsfeature {'IIS':
  dsc_ensure => 'present',
  dsc_name   => 'Web-Server',
}
~~~

All DSC Resource names and parameters have to be in lowercase, for example: `dsc_windowsfeature` or `dsc_name`.

You can use either `ensure =>` (Puppet's `ensure`) or `dsc_ensure =>` (DSC's `Ensure`) in your manifests for Puppet DSC resource types. If you use both in a Puppet DSC resource, `dsc_ensure` overrides the value in `ensure`, so the value for `ensure` is essentially ignored.

We recommend that you use `dsc_ensure` instead of `ensure`, as it is a closer match for converting the DSC properties to Puppet DSC resources. It also overrides `ensure`, so there is less confusion if both are accidentally included.

> Note: While you can use either `ensure =>` (Puppet's `ensure`) or `dsc_ensure =>` (DSC's `Ensure`) in your manifests, there is currently a known issue where `ensure => absent` reports success but does nothing. See [MODULES-2966](https://tickets.puppet.com/browse/MODULES-2966) for details. **Until this issue is resolved, we recommend using `dsc_ensure` exclusively.**

### Handling Reboots with DSC

Add the following `reboot` resource to your manifest. It must have the name `dsc_reboot` for the `dsc` module to find and use it.

~~~puppet
reboot { 'dsc_reboot' :
  message => 'DSC has requested a reboot',
  when => 'pending'
}
~~~

### Installing Packages with DSC

Install MSIs or EXEs with DSC using the Puppet type `dsc_package`, which maps to the `Package` DSC Resource.

~~~puppet
dsc_package{'installpython'
  dsc_ensure    => 'Present',
  dsc_name      => 'Python 2.7.10',
  dsc_productid => 'E2B51919-207A-43EB-AE78-733F9C6797C2'
  dsc_path      => 'C:\\python.msi',
}
~~~

The `Package` DSC Resource requires the following information to install an MSI:

- ProductName: The `Name` of product being installed.
- ProductId: The `ProductCode` property of the MSI, which is a unique identifier for the particular product release, represented as a GUID string. For more information see the [MSDN ProductCode property](https://msdn.microsoft.com/en-us/library/aa370854.aspx) documentation page.

You can obtain this information in a variety of ways.

- Use a tool such as Orca to open the MSI file and inspect the `Name` and `ProductCode`.
- Install the product on a test system, and inspect the `Name` and `ProductCode` in the Windows Add/Remove Programs Control Panel.
- Use a script to query the MSI file for the `Name` and `ProductCode`, as in the example PowerShell script below, which was adapted from [Stack Overflow](http://stackoverflow.com/a/8743878/1083).

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

### Using Hashes

Supply a hash to any parameter that accepts PowerShell hashes, and Puppet handles creating the appropriate values for you.

~~~puppet
dsc_example_resource { 'examplefoo':
  dsc_ensure         => present,
  dsc_hash_parameter => {
    'key1' => 'value1',
    'key2' => 'value2'
  },
}
~~~

### Using Credentials

DSC uses `MSFT_Credential` objects to pass credentials to DSC Resources. Supply a hash to any `credential` parameter, and Puppet handles creating the `credential` object for you.

Optionally use the Puppet [Sensitive type](https://puppet.com/docs/puppet/latest/lang_data_sensitive.html) to ensure logs and reports redact the password.

~~~puppet
dsc_user { 'jane-doe':
  dsc_username             => 'jane-doe',
  dsc_description          => 'Jane Doe user',
  dsc_ensure               => present,
  dsc_password             => {
    'user' => 'jane-doe',
    'password' => Sensitive('jane-password')
  },
  dsc_passwordneverexpires => false,
  dsc_disabled             => true,
}
~~~

### Setting Registry Values

Creating and modifying Registry keys and values is done with the `dsc_registry` Puppet type which maps to the `Registry` DSC Resource.

#### Registry Example: Simple

Set simple values by specifying key-value pairs.

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

The 'Dword' and 'Qword' data types expect signed integer values, as opposed to hexadecimal or unsigned.

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

~~~powershell
[PS]> Get-WindowsFeature
~~~

### Website Installation Example

An end-to-end example installation of a test website.

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

  # Create a new website
  dsc_xwebsite {'BackeryWebSite':
    dsc_ensure       => 'present',
    dsc_name         => $websitename,
    dsc_state        => 'Started',
    dsc_physicalpath => $destinationpath,
  }
}
~~~

As you can see, you can mix and match DSC resources with common Puppet resources.
All [Puppet metaparameters](https://docs.puppet.com/references/latest/metaparameter.html) are also supported.

## Reference

### Types

A comprehensive list of all types included in the dsc module is available in the [types document](https://github.com/puppetlabs/puppetlabs-dsc/blob/master/types.md). This list maps each Puppet resource (for example, `dsc_xcertreq`) to the corresponding DSC resource.

Because types are built from the source code of each DSC Resources MOF schema files, the name of the DSC resource in the types document links to a local copy of that resource code (in this case, `xCertReq`), so that you can see how the code is applied to your system.

Where available, a link to the external GitHub repo of each resource is also included. The DSC resources are third-party resources that may or may not be documented in their repositories. Available DSC resources and parameters are subject to change.

## Limitations

- DSC Composite Resources are not supported.

- DSC requires PowerShell `Execution Policy` for the `LocalMachine` scope to be set to a less restrictive setting than `Restricted`. If you see the error below, the subsequent Puppet code will set it to RemoteSigned. See [MODULES-2500](https://tickets.puppet.com/browse/MODULES-2500) for more detailed information.

  ~~~
  Error: /Stage[main]/Main/Dsc_xgroup[testgroup]: Could not evaluate: Importing module MSFT_xGroupResource failed with
  error - File C:\Program
  Files\WindowsPowerShell\Modules\PuppetVendoredModules\xPSDesiredStateConfiguration\DscResources\MSFT_xGroupR
  esource\MSFT_xGroupResource.psm1 cannot be loaded because running scripts is disabled on this system. For more
  information, see about_Execution_Policies at http://go.microsoft.com/fwlink/?LinkID=135170.
  ~~~
  
  ~~~puppet
  exec { 'Set PowerShell execution policy RemoteSigned':
    command  => 'Set-ExecutionPolicy RemoteSigned',
    unless   => 'if ((Get-ExecutionPolicy -Scope LocalMachine).ToString() -eq "RemoteSigned") { exit 0 } else { exit 1 }',
    provider => powershell
  }
  ~~~

- You cannot use forward slashes for the MSI `Path` property for the `Package` DSC Resource. The underlying implementation does not accept forward slashes instead of backward slashes in paths, and it throws a misleading error that it could not find a Package with the Name and ProductId provided. [MODULES-2486](https://tickets.puppet.com/browse/MODULES-2486) has more examples and information on this subject.
- `dsc_ensure` overrides and ignores the value in `ensure` if both are present in a Puppet DSC resource. See [Using DSC Resources with Puppet](#using-dsc-resources-with-puppet).
- Use of this module with the 3.8.x x86 version of Puppet is highly discouraged, though supported.  Normally, this module employs a technique to dramatically improve performance by reusing a PowerShell process to execute DSC related commands.  However, due to the Ruby 1.9.3 runtime used with the 3.8.x x86 version of Puppet, this technique must be disabled, resulting in at least a 2x slowdown.

### Known Issues

- The DSC Local Configuration Manager (LCM) `RefreshMode` **must** be set to either `Push` or `Disabled` for the Puppet `dsc` module to function. The default value for `RefreshMode` in WMF 5.0 and WMF 5.1 is `Push` — there is no action needed on your part. Changing the value is only needed if the `RefreshMode` has been set to any value other than `Push`. The Puppet `dsc` module uses the `Invoke-DscResource` cmdlet to invoke DSC Resources of the target machine. If the `RefreshMode` is set to `Pull`, DSC Resources will only run from a DSC Pull Server — in this setting DSC does not allow any DSC Resources to be run interactively on the host.


- The `WaitFor*` type of DSC Resources may not work with this module. These DSC Resources use sleeps, timers, or locking to 'wait' for other resources to be in a specified state. These waits would 'pause' a Puppet run for an amount of time that varies between DSC Resource implementations, which may cause unintended problems in the Puppet run. Puppet cannot test all possible interactions from these `WaitFor*` DSC Resources, and does not support them at this time.

- The `dsc_log` resource might not appear to work. The ["Log" resource](https://technet.microsoft.com/en-us/library/Dn282117.aspx) writes events to the 'Microsoft-Windows-Desired State Configuration/Analytic' event log, which is [disabled by default](https://technet.microsoft.com/en-us/library/Cc749492.aspx).

- You might have issues if you attempt to use `dsc_ensure => absent` with `dsc_service` with services that are not running.

  When setting resources to absent, you might normally specify a minimal statement such as:

  ~~~puppet
  dsc_service{'disable_foo':
    dsc_ensure => absent,
    dsc_name => 'foo'
  }
  ~~~

  However, due to the way the Service DSC Resource sets its defaults, if the service is not currently running, the above statement erroneously reports that the service is already absent. To work around this, specify that `State => 'Stopped'` as well as `Ensure => absent'`. The following example works:

  ~~~puppet
  dsc_service{'disable_foo':
    dsc_ensure => absent,
    dsc_name   => 'foo',
    dsc_state  => 'stopped'
  }
  ~~~

  [MODULES-2512](https://tickets.puppet.com/browse/MODULES-2512) has more details.

- You might have issues attempting to use `dsc_ensure => absent` with `dsc_xservice` with services that are already not present. To work around this problem, always specify the path to the executable for the service when specifying `absent`. [MODULES-2512](https://tickets.puppet.com/browse/MODULES-2512) has more details. The following example works:

  ~~~puppet
  dsc_xservice{'disable_foo':
    dsc_ensure => absent,
    dsc_name   => 'foo',
    dsc_path   => 'c:\\Program Files\\Foo\\bin\\foo.exe'
  }
  ~~~

- Use `ensure` instead of `dsc_ensure` - `ensure => absent` will report success while doing nothing - see [MODULES-2966](https://tickets.puppet.com/browse/MODULES-2966) for details. Also see [Using DSC Resources with Puppet](#using-dsc-resources-with-puppet).

- When installing the module on Windows you might run into an issue regarding long file names (LFN) due to the long paths of the generated schema files. If you install your module on a Linux master, and then use plugin sync you will likely not see this issue. If you are attempting to install the module on a Windows machine using `puppet module install puppetlabs-dsc` you may run into an error that looks similar to the following:

  ~~~puppet
  Error: No such file or directory @ rb_sysopen - C:/ProgramData/PuppetLabs/puppet/cache/puppet-module/cache/tmp-unpacker20150713-...mof
  Error: Try 'puppet help module install' for usage
  ~~~

  For Puppet 4.2.2+ (and 3.8.2) we've decreased the possibility of the issue occurring based on the fixes in [PUP-4854](https://tickets.puppet.com/browse/PUP-4854). A complete fix is plannd in a future version of Puppet that incorporates [PUP-4866](https://tickets.puppet.com/browse/PUP-4866).

  If you are affected by this issue:
  - Use the `--module_working_dir` parameter to set a different temporary directory which has a smaller length, for example;
    `puppet module install puppetlabs-dsc --module_working_dir C:\Windows\Temp`
  - Download the `.tar.gz` from the [Forge](https://forge.puppet.com/puppetlabs/dsc) and use `puppet module install` using the downloaded file, rather than directly installing from the Forge.

- Windows Server 2003 is not supported. **If this module is present on the master, it breaks Windows 2003 agents.**

  When installed on a Puppet master to the default `production` environment, this module causes pluginsync to **fail** on Windows 2003 agents because of an issue with [LFN (long file names)](https://tickets.puppet.com/browse/PUP-4866). To work around this issue, host your Windows 2003 nodes on a [Puppet environment](https://docs.puppet.com/puppet/latest/reference/environments.html) that is separate from `production` and that does **not** have the DSC module installed.

- `--noop` mode, `puppet resource` and property change notifications are currently not implemented - see [MODULES-2270](https://tickets.puppet.com/browse/MODULES-2270) for details.

- [Known WMF 5.0 Product Incompatibilites][wmf5-blog-incompatibilites]

  Systems that are running the following server applications should not run Windows Management Framework 5.0 at this time:
   - Microsoft Exchange Server 2013
   - Microsoft Exchange Server 2010 SP3
   - Microsoft SharePoint Server 2013
   - Microsoft SharePoint Server 2010
   - System Center 2012 Virtual Machine Manager

- The `Registry` DSC Resource continually changes state, even if the system state matches the desired state, when using a HEX value. See issue [#237](https://github.com/puppetlabs/puppetlabs-dsc/issues/237) for more information.

- The Puppet DSC module hangs on systems with WMF 5.1 installed. This is being addressed in [MODULES-3690](https://tickets.puppetlabs.com/browse/MODULES-3690).

- If you create files with the `dsc_file` resource, the resulting file on disk will be UTF-8 with BOM. This can be a problem if you use tools that are not UTF-8 BOM aware. This is by design for Microsoft PowerShell DSC. More information can be found in [MODULES-3178](https://tickets.puppetlabs.com/browse/MODULES-3178).

### Running Puppet and DSC without Administrative Privileges

While there are avenues for using Puppet with a non-administrative account, DSC is limited to only accounts with administrative privileges. The underlying CIM implementation DSC uses for DSC Resource invocation requires administrative credentials to function.

- Using the Invoke-DscResource cmdlet requires administrative credentials

The Puppet agent on a Windows node can run DSC with a normal default install. If the Puppet agent was configured to use an alternate user account, that account must have administrative privileges on the system in order to run DSC.

## Troubleshooting

When Puppet runs, the dsc module takes the code supplied in your puppet manifest and converts that into PowerShell code that is sent to the DSC engine directly using `Invoke-DscResource`. You can see both the commands sent and the result of this by running puppet interactively, e.g. `puppet apply --debug`. It will output the PowerShell code that is sent to DSC to execute and the return data from DSC. For example:

```puppet
Notice: Compiled catalog for win2012r2 in environment production in 0.82 seconds
Debug: Creating default schedules
Debug: Loaded state in 0.03 seconds
Debug: Loaded state in 0.05 seconds
Info: Applying configuration version '1475264065'
Debug: Reloading posix reboot provider
Debug: Facter: value for uses_win32console is still nil
Debug: PowerShell Version: 5.0.10586.117
$invokeParams = @{
  Name          = 'ExampleDSCResource'
  Method        = 'test'
  Property      = @{
    property1 = 'value1'
    property2 = 'value2'
  }
  ModuleName = @{
    ModuleName      = "C:/puppetlabs/modules/dsc/lib/puppet_x/dsc_resources/ExampleDSCResource/ExampleDSCResource.psd1"
    RequiredVersion = "1.0"
  }
}
############### SNIP ################
Debug: Waited 50 milliseconds...
############### SNIP ################
Debug: Waited 500 total milliseconds.
Debug: Dsc Resource returned: {"rebootrequired":false,"indesiredstate":false,"errormessage":""}
Debug: Dsc Resource Exists?: false
Debug: ensure: present
############### SNIP ################
$invokeParams = @{
  Name          = 'ExampleDSCResource'
  Method        = 'set'
  Property      = @{
    property1 = 'value1'
    property2 = 'value2'
  }
  ModuleName = @{
    ModuleName      = "C:/puppetlabs/modules/dsc/lib/puppet_x/dsc_resources/ExampleDSCResource/ExampleDSCResource.psd1"
    RequiredVersion = "1.0"
  }
}
############### SNIP ################\
Debug: Waited 100 total milliseconds.
Debug: Create Dsc Resource returned: {"rebootrequired":false,"indesiredstate":true,"errormessage":""}
Notice: /Stage[main]/Main/Dsc_exampledscresource[foober]/ensure: created
Debug: /Stage[main]/Main/Dsc_exampledscresource[foober]: The container Class[Main] will propagate my refresh event
Debug: Class[Main]: The container Stage[main] will propagate my refresh event
Debug: Finishing transaction 56434520
Debug: Storing state
Debug: Stored state in 0.10 seconds
############### SNIP ################
```

This shows us that there wasn't any problem parsing your manifest and turning it into a command to send to DSC. It also shows that there are two commands/operations for every DSC Resource executed, a SET and a test. DSC operates in two stages, it first tests if a system is in the desired state, then it sets the state of the system to the desired state. You can see the result of each operation in the debug log.

By using the debug logging of a puppet run, you can troubleshoot the application of DSC Resources during the development of your puppet manifests.

## Development

Puppet Inc modules on the Puppet Forge are open projects, and community contributions are essential for keeping them great. We can’t access the huge number of platforms and myriad of hardware, software, and deployment configurations that Puppet is intended to serve.

We want to keep it as easy as possible to contribute changes so that our modules work in your environment. There are a few guidelines that we need contributors to follow so that we can have a chance of keeping on top of things.

For more information, see our [module contribution guide.](https://docs.puppet.com/forge/contributing.html)

* The Puppet types are built from the source code of each DSC Resources MOF schema files. If you want to build the types, read the [Building DSC Resources readme](https://github.com/puppetlabs/puppetlabs-dsc/blob/master/README_BUILD.md).
* If you want the build Puppet types for your own custom DSC Resources, read [Building Puppet Types from Custom DSC Resources](https://github.com/puppetlabs/puppetlabs-dsc/blob/master/README_BUILD.md#building-puppet-types-from-custom-dsc-resources) readme.

### Version Strategy

This module generally follows [Semantic Versioning](http://semver.org/) for choosing an appropriate release version number with the following exception:

* Minor, for example from version 2.0.0 to 2.1.0

A minor change may also include [rebuilding the DSC resource types](https://github.com/puppetlabs/puppetlabs-dsc/blob/master/README_BUILD.md). Puppet wants to keep pace with the released DSC Resources from the PowerShell team repository, but this engenders risk as Puppet adopts third party code. Normally this would mean making major version bumps, but since this is anticipated to be frequent that would be too much churn.

### Contributors

To see who's already involved, see the [list of contributors.](https://github.com/puppetlabs/puppetlabs-dsc/graphs/contributors)

## Learn More About DSC

You can learn more about PowerShell DSC from the following online resources:

- [Microsoft PowerShell Desired State Configuration Overview](https://msdn.microsoft.com/en-us/PowerShell/dsc/overview) - Starting point for DSC topics
- [Microsoft PowerShell DSC Resources page](https://msdn.microsoft.com/en-us/powershell/dsc/resources) - For more information about built-in DSC Resources
- [Microsoft PowerShell xDSCResources Github Repo](https://github.com/PowerShell/DscResources) -  For more information about xDscResources
- [Windows PowerShell Blog](http://blogs.msdn.com/b/powershell/archive/tags/dsc/) - DSC tagged posts from the Microsoft PowerShell Team
- [Puppet Inc Windows DSC & WSUS Webinar 9-17-2015 webinar](https://puppet.com/webinars/windows-dsc-wsus-webinar-09-17-2015) - How DSC works with Puppet
- [Better Together: Managing Windows with Puppet, PowerShell and DSC - PuppetConf 10-2015 talk](https://www.youtube.com/watch?v=TP0zqe-yQto) and [slides](https://speakerdeck.com/iristyle/better-together-managing-windows-with-puppet-powershell-and-dsc)
- [PowerShell.org](http://powershell.org/wp/tag/dsc/) - Community based DSC tagged posts
- [PowerShell Magazine](http://www.powershellmagazine.com/tag/dsc/) - Community based DSC tagged posts

There are several books available as well. Here are some selected books for reference:

- [Learning PowerShell DSC](http://bit.ly/learndsc) - James Pogran is a member of the team here at Puppet Inc working on the DSC/Puppet integration
- [The DSC Book](https://www.penflip.com/powershellorg/the-dsc-book) - Powershell.org community contributed content
- [Windows PowerShell Desired State Configuration Revealed](http://www.apress.com/9781484200179) - Ravikanth Chaganti

## License

* Copyright (c) 2014 Marc Sutter, original author
* Copyright (c) 2015 - Present Puppet Inc
* License: [Apache License, Version 2.0](https://github.com/puppetlabs/puppetlabs-dsc/blob/master/LICENSE)
