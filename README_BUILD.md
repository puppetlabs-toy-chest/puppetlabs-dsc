# Building DSC Resources

The `dsc` module uses rake tasks to parse the DSC Resource MOF schema files to generate Puppet types. This process pulls the DSC Resources from the github [PowerShell/DSCResources](https:/github.com/powershell/DSCResources) repository using git. This is a point-in-time snapshot, so any time any of those DSC Resources are updated the build process needs to be run again to pull in the updated resources and parse them. To use non Microsoft DSC Resources follow the [Build Custom DSC Resource Types](#building-puppet-types-from-custom-dsc-resources) instructions.

## Requirements

* Knowledge of the file structure of a DSC Resource is useful to understand some of the concepts described here. Look at the [Learn More About DSC section](#learn-more-about-dsc-section) of the readme for resources on some of the terms used here.
* This module must be built with a **non-Windows** computer due to limitations in the gems that the builder uses to generate types and specs.
* Git client needs to be version 2.2.0 or above.

## Setup

To build the dsc module, clone the GitHub repository and then bundle install all the gem dependencies.

~~~bash
# clone the dsc repository
git clone https://github.com/puppetlabs/puppetlabs-dsc
# change directory to the code
cd puppetlabs-dsc
# install the needed ruby gems/libs
bundle install --path .bundle/gems --without system_tests
~~~

*NOTE*: This guide assumes that you have a working ruby installation with bundler installed. The latest version of ruby is assumed, as of this writing this guide was tested with 1.9.3 and 2.3.1.

## Considerations/Known Limitations

When building the types and specs, keep the following considerations in mind:

* The builder requires a `MOF` and `PSD1` file to build a type. Both need to be present for the build to be successful.
* The `MOF` file encoding should be UTF-8. This ensures the most compatibility with the mof gem.

## Building Puppet Types from Microsoft DSC Resources

To download all the Microsoft DSC Resources from the [PowerShell/DSCResources](https:/github.com/powershell/DSCResources) repository, parse, and build puppet types from them, run the following command:

~~~bash
# Run the build (this will remove all puppet types and build them again)
bundle exec rake dsc:build
~~~

As you continue to work, you can clean your working copy and re-build by issuing the following commands:
~~~bash
# Run the build (this will remove all puppet types and build them again)
bundle exec rake dsc:clean
bundle exec rake dsc:build
~~~

## Building Puppet Types from Microsoft DSC Resources with the latest version

The simplest way to rebuild all DSC resources with the latest version is to delete the `dsc_resource_release_tags.yml` prior to building. Alternatively, you can pass `true` to the `update_versions` argument of the `dsc:resources:import` rake task.

The DSC tag file, called `dsc_resource_release_tags.yml`, determines which versions of the DSC Resources to build. If a DSC resource is not listed in the file, the latest version that has been released to the PowerShell gallery will be used during the build, and then added to the `dsc_resource_release_tags.yml` file. An example file is shown below:

~~~ yaml
---
xActiveDirectory: 2.12.0.0-PSGallery
xAdcsDeployment: 1.0.0.0-PSGallery
xAzure: 0.2.0.0-PSGallery
xAzurePack: 1.4.0.0-PSGallery
xBitlocker: 1.1.0.0-PSGallery
xCertificate: 2.1.0.0-PSGallery
xComputerManagement: 1.7.0.0-PSGallery
...
~~~

* Note that while the tag file will typically contain PowerShell Gallery tags, any type of [git reference](https://git-scm.com/book/en/v2/Git-Internals-Git-References) can be used, such as a commit SHA.
* The `DSC_REF` environment variable is still honored by the build process however it is no longer necessary as the DSC resource versions are explicitly set in the tag file.

## Building Puppet Types from Custom DSC Resources

You can build puppet types from your own custom DSC Resources.

### Getting started

When importing or creating custom types, the following considerations will allow the DSC Resource builder to successfully build your types.

* Review the steps outlined in Building section above.
* Do not try to include your module in the `import` folder by default. When building the first time or during a clean, the builder will delete all files and folders in this directory. It is preferred that you keep those custom modules in a separate location. A suggested location a separate repository where you can use source control on those items. You could also keep those files in `build/vendor/custom` within this repository.
* The builder will import your custom types into the vendored resources `lib/puppet_x/dsc_resources` directory. They are required to be there for the module to successfully find them during a Puppet catalog application. The `dsc` module requires the PowerShell files to be there ***even*** if you have already installed them elsewhere on the machine due to how it points to the location of the resource to avoid issues with duplicate resources.
* The builder requires that there is no versioned subfolder. This means that you should not have a subfolder with a version (like you get when installing existing modules from the PowerShell Gallery).
  * You can use existing modules from the Gallery if you install them, then copy the files from the versioned subfolder up to the top level folder and delete the versioned subfolder.
* The builder requires that the PSD1 file be named the same as the parent folder. If your DSC Resource is named `MyAwesomeThing`, the folder structure should be `MyAwesomeThing/MyAwesomeThing.psd1` and not `MyAwesomeThing/SomethingElse.psd1`. The builder also requires a subdirectory called `DSCRsources`. These are standard file and folder requriments for all DSC Resources, please consult DSC Resource building documentation for more information. See the image below:
  ![Module Layout - PSD1 file](docs/images/dir_struct_psdname.png)

### Detailed Steps to Build Custom DSC Resources

When importing or creating custom types, follow these steps:

1. Build the module with `bundle exec rake dsc:build`
2. Now take your own modules path and import your types: `bundle exec rake dsc:resources:import["path/to/your/types"]`. This should be the parent path that contains a folder (or folders) of DSC Resources.
   e.g. run `bundle exec rake dsc:resources:import["build/vendor/custom"]`.
   ![Module Layout - Import the Parent Directory](docs/images/dir_struct_import.png)
3. For each of your own modules you want to import that may be in different parent paths, you can repeat the above step.
4. Rebuild the module with `bundle exec rake dsc:types:build`
5. The rake task will produce new Puppet types based on the MOFs in `lib/puppet/type` and their spec tests in `spec/unit/puppet/type`. These files should never be modified.
    * Inspect the actual types, they should be named to lower cased `dsc_DSCRESOURCENAME` and the properties all should be named to lower cased `dsc_DSCPROPERTY`.
6. The rake task will also copy the DSC resources into `lib/puppet_x/dsc_resources/`. This is necessary for the module to find the DSC resource implementations at runtime when applying the Puppet DSC resources.
7. Enjoy!

### Concise Steps to Build Custom DSC Resources

```bash
# perform an initial build to setup local copy
bundle exec rake dsc:build
# import your custom DSC Resource, repeat for each seperate directory
bundle exec rake dsc:resources:import["path/to/your/types"]
# parse the MOF files and build the types
bundle exec rake dsc:types:build
# commit the files to your fork
git add . && git commit -m "new custom DSC Resource"
```

## Partial support for DSC composite resources

If you need a puppet type for a DSC composite resources, you have to create a `xxx.schema.mof` file next to your `xxx.schema.psm1` file.

## Issues

Please report issues on the Puppet MODULES project [issue tracker](https://tickets.puppetlabs.com/CreateIssue.jspa?pid=10707)
