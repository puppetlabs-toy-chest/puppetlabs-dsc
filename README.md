Puppet Powershell DSC Module
============================

## Overview
Puppet module for managing Windows poweshell DSC resources.

This module generates Puppet Types based on DSC resources MOF schema files.

In this version, the following DSC Resources are already build and ready for usage:
- All base DSC resources found in powershell 4. ([wmf 4.0](http://www.microsoft.com/en-us/download/details.aspx?id=40855))
- All DSC resources found in the [DSC resource kit wave 6](http://gallery.technet.microsoft.com/DSC-Resource-Kit-All-c449312d).

Note that I use a [fixed version of the Resource Kit 6](https://github.com/msutter/dsc-resource-kit-wave-6) to avoid parsing issues.

This module is available on the [Puppet Forge](https://forge.puppetlabs.com/msutter/dsc)

## Windows systems prerequisites
 - Powershell 4 which is included in the [Windows Management Framework 4.0](http://www.microsoft.com/en-us/download/details.aspx?id=40855)
 - [DSC resource kit wave 6](http://gallery.technet.microsoft.com/DSC-Resource-Kit-All-c449312d) must be installed to use it's own resources.

## Installation on your puppet master
    puppet module install msutter-dsc

## Usage
You can use DSC resource by prefixing resource names and parameters with 'dsc_'.
The resulting resource name has to be in lowercase. e.g: 'dsc_windowsfeature'.

## Example
The following example class will install the 'Backery' website.

It's a real example and should also work for you.

```ruby
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
```

As you can see, you can mix and match dsc resources with common puppet resources.
All [puppet metaparameters](https://docs.puppetlabs.com/references/latest/metaparameter.html) should also be supported.

## Limitations
- DSC Composite resources not yet fully supported.
- PS Objects like 'PSCredential' as parameters value not yet supported.

## Notes
The puppet types are build from the source code of the DSC Resources MOF schema files.
If you want the build Puppet types for your own custom DSC Resources, read the [README_BUILD](https://github.com/msutter/puppet-dsc/blob/master/README_BUILD.md)

## License
Copyright (c) 2014 Marc Sutter.
License: [Apache License, Version 2.0](https://raw.githubusercontent.com/msutter/puppet-dsc/forge/LICENSE)