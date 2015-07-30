Puppet PowerShell DSC Module
============================

## Overview

Puppet module for managing Windows poweshell DSC resources.

This module generates Puppet Types based on DSC resources MOF schema files.

In this version, the following DSC Resources are already built and ready for use:
- All base DSC resources found in PowerShell 5. ([WMF 5.0](https://www.microsoft.com/en-us/download/details.aspx?id=46889))
- All DSC resources found in the [Microsoft PowerShell DSC Resource Kit](https://github.com/powershell/DSCResources).

This module is available on the [Puppet Forge](https://forge.puppetlabs.com/puppetlabs/dsc)

## Windows systems prerequisites

 - PowerShell 5 which is included in the [Windows Management Framework 5.0](https://www.microsoft.com/en-us/download/details.aspx?id=46889). PowerShell v5 is currently in limited preview, so the above link may change after official release.

## Installation on your puppet master

~~~
puppet module install puppetlabs-dsc
~~~

## Usage

You can use a DSC Resource by prefixing each DSC Resource name and parameter with 'dsc_'.

~~~puppet
dsc_windowsfeature {'IIS':
  dsc_ensure => 'present',
  dsc_name   => 'Web-Server',
}
~~~

All DSC Resource names and parameters have to be in lowercase, e.g: `dsc_windowsfeature` or `dsc_name`.

## Example

The following example class will install the 'Backery' website.

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

- DSC Composite Resources are not yet fully supported.
- PSObjects like 'PSCredential' as parameters value not yet supported.

## Notes

The puppet types are built from the source code of each DSC Resources MOF schema files.  
If you want the build Puppet types for your own custom DSC Resources, read the [README_BUILD](README_BUILD.md)

## License

Copyright (c) 2014 Marc Sutter, original author  
Copyright (c) 2015 Puppet Labs  
License: [Apache License, Version 2.0](https://github.com/puppetlabs/puppetlabs-dsc/blob/master/LICENSE)
