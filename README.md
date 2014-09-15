Puppet Powershell DSC Module
============================

## Overview
Puppet module for managing windows Poweshell DSC resources contained in:
- wmf 4.0
- DSC resource kit wave 6

This module is also available on the [Puppet Forge](https://forge.puppetlabs.com/msutter/dsc)

## Windows Systems Prerequisites
 - Powershell 4 (Windows Management Framework 4.0)
 - Windows management Framework 4.0 ([wmf 4.0](http://www.microsoft.com/en-us/download/details.aspx?id=40855))

## Installation
    puppet module install msutter-dsc

## Usage
You can use every DSC resource available on your windows system by prefixing resource names and parameters with 'dsc_'.
The following example class would install a website:

```ruby
  class fourthcoffee(
    $websitename        = 'FourthCoffee',
    $zipname            = 'FourthCoffeeWebSiteContent.zip',
    $sourcerepo         = "https://github.com/msutter/fourthcoffee/raw/master",
    $destinationpath    = 'C:\inetpub\FourthCoffee',
    $defaultwebsitepath = 'C:\inetpub\wwwroot',
    $zippath            = "C:\\tmp"
  ){

    $zipuri  = "${sourcerepo}/${zipname}"
    $zipfile = "${zippath}\\${zipname}"

   # Install the IIS role
    dsc_windowsfeature {'IIS':
      dsc_ensure               => 'present',
      dsc_name                 => 'Web-Server',
      dsc_includeallsubfeature => 'True',
    } ->

    # Install the ASP .NET 4.5 role
    dsc_windowsfeature {'AspNet45':
      dsc_ensure => 'present',
      dsc_name   => 'Web-Asp-Net45',
    }

    # Stop the existing website
    dsc_xwebsite {'Stop DefaultSite':
      dsc_ensure       => 'present',
      dsc_name         => 'Default Web Site',
      dsc_state        => 'Stopped',
      dsc_physicalpath => $defaultwebsitepath,
      require          => Dsc_windowsfeature['AspNet45']
    } ->

    # Download the site content
    dsc_xremotefile {'Download WebContent Zip':
      dsc_destinationpath => $zipfile,
      dsc_uri             => $zipuri,
    } ->

    # Extract the website content 
    dsc_xarchive {'Unzip and Copy the WebContent':
      dsc_path            => $zipfile,
      dsc_destination     => $destinationpath,
      dsc_destinationtype => 'Directory',
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

[Puppet Metaparameters](https://docs.puppetlabs.com/references/latest/metaparameter.html) should also be supported.

## Limitations
- DSC Composite resources not yet supported.
- PSCredential not yet supported.

## Notes
The puppet types are build from the source code of the DSC Resources MOF schema files.
For more infos or if you want the build Puppet types for your custom DSC Resources visit

[Puppet-Dsc Project](https://github.com/msutter/puppet-dsc)

## License
Copyright (c) 2014 Marc Sutter.
License: [Apache License, Version 2.0](https://raw.githubusercontent.com/msutter/puppet-dsc/forge/LICENSE)