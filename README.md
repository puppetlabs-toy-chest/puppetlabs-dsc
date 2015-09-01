# dsc
[wmf-5.0]: https://www.microsoft.com/en-us/download/details.aspx?id=46889
[DSCResources]: https://github.com/powershell/DSCResources


#### Table of Contents
1. [Module Description - What is the dsc module and what does it do](#module-description)
2. [Prerequisites](#windows-system-prerequisites)
3. [Setup](#setup)
4. [Usage](#usage)
  * [Website Installation Example](#website-installation-example)
5. [Limitations](#limitations)
  * [Known Issues](#known-issues)
6. [Notes](#notes)
7. [License](#license)

## Module Description

Puppet module for managing Windows PowerShell DSC (Desired State Configuration) resources.

This module generates Puppet Types based on DSC resources' MOF (Managed Object Format) schema files.

In this version, the following DSC Resources are already built and ready for use:
- All base DSC resources found in PowerShell 5. ([WMF 5.0][wmf-5.0])
- All DSC resources found in the [Microsoft PowerShell DSC Resource Kit][DSCResources]

This module is available on the [Puppet Forge](https://forge.puppetlabs.com/puppetlabs/dsc)

## Windows System Prerequisites

 - PowerShell 5 which is included in [Windows Management Framework 5.0][wmf-5.0]. PowerShell v5 is currently in limited preview, so the above link may change after official release.

## Setup

~~~
puppet module install puppetlabs-dsc
~~~

## Usage

### Refresh Mode Must be Disabled

You must set refresh mode to disabled before you can use this module to apply any resources.

~~~puppet
dsc::lcm_config {'disable_lcm':
  refresh_mode => 'Disabled',
}
~~~

### Puppet DSC Resources

You can use a DSC Resource by prefixing each DSC Resource name and parameter with 'dsc_'.

~~~puppet
dsc_windowsfeature {'IIS':
  dsc_ensure => 'present',
  dsc_name   => 'Web-Server',
}
~~~

All DSC Resource names and parameters have to be in lowercase, e.g: `dsc_windowsfeature` or `dsc_name`.

### Website Installation Example

It's a real example and should also work for you.

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

## Limitations

- DSC Composite Resources are not supported.
- PSObjects like 'PSCredential' as parameters value not yet supported.

### Known Issues

- The `dsc_log` resource may not appear to work. The ["Log" resource](https://technet.microsoft.com/en-us/library/Dn282117.aspx) writes events to the 'Microsoft-Windows-Desired State Configuration/Analytic' event log, which is [disabled by default](https://technet.microsoft.com/en-us/library/Cc749492.aspx).

- When installing the module on Windows you may run into an issue regarding long file names (LFN) due to the long paths of the generated schema files. If you install your module on a Linux master and then use plugin sync you will likely not see this issue. If you are attempting to install the module on a Windows machine using `puppet module install puppetlabs-dsc` you may run into an error that looks similar to the following:

~~~
Error: No such file or directory @ rb_sysopen - C:/ProgramData/PuppetLabs/puppet/cache/puppet-module/cache/tmp-unpacker20150713-...mof
Error: Try 'puppet help module install' for usage
~~~

For Puppet 4.2.2+ (and 3.8.2) we've lessened the possibility of the issue occurring based on the fixes in [PUP-4854](https://tickets.puppetlabs.com/browse/PUP-4854). However, a complete fix will become available in a version of Puppet that incorporates [PUP-4866](https://tickets.puppetlabs.com/browse/PUP-4866).

If you are affected by this issue, a known workaround is to download the `.tar.gz` from the forge and use `puppet module install` using the file rather than directly from the forge.

## Notes

* The puppet types are built from the source code of each DSC Resources MOF schema files.
* If you want the build Puppet types for your own custom DSC Resources, read the [README_BUILD](README_BUILD.md)

## License

* Copyright (c) 2014 Marc Sutter, original author
* Copyright (c) 2015 Puppet Labs
* License: [Apache License, Version 2.0](https://github.com/puppetlabs/puppetlabs-dsc/blob/master/LICENSE)
