Building DSC Resources
======================
## Quick-start

~~~
# install the bundler gem
gem install bundler

# install the needed ruby gems/libs
bundle install

# Run the build and tests (this will remove all puppet types and build them again)
bundle exec rake
~~~~

## Rake tasks
You can use following rake tasks for your convenience

~~~
rake dsc:build             # Import and build all
rake dsc:clean             # Cleanup all
rake dsc:dmtf:clean        # Cleanup DMTF CIM MOF Schema files
rake dsc:dmtf:import       # Import DMTF CIM MOF Schema files
rake dsc:resources:clean   # Cleanup DSC Powershell modules files
rake dsc:resources:import  # Import DSC Powershell modules files
rake dsc:types:build       # Build DSC types in (lib/puppet/type)
rake dsc:types:clean       # Cleanup DSC types in (lib/puppet/type)
~~~

## Building

When building the types and specs, keep the following considerations in mind:

* Resources must be built with a non-Windows computer due to limitations in the gems that the builder uses to generate types and specs.
* You must use Ruby 1.9.3 to build the types, again due to a limitation in the builder dependencies.
* The builder requires a `MOF` and `PSD1` file to build a type. Both need to be present for the build to be successful.
* The `MOF` file encoding should be UTF-8. This ensures the most compatibility with the mof gem.
* Git client needs to be version 2.2.0 or above

### The DSC tag file

The DSC tag file, called `dsc_resource_release_tags.yml`, determines which versions of the DSC Resources to build.  If a DSC resource is not listed in the file, the latest version that has been released to the PowerShell gallery will be used during the build, and then added to the `dsc_resource_release_tags.yml` file. An example file is shown below:

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
...
~~~

* Note that while the tag file will typically contain PowerShell Gallery tags, any type of [git reference](https://git-scm.com/book/en/v2/Git-Internals-Git-References) can be used, such as a commit SHA.
* The `DSC_REF` environment variable is still honored by the build process however it is no longer necessary as the DSC resource versions are explicitly set in the tag file.

### How to rebuild all DSC resources with the latest version

The simplest way to rebuild all DSC resources with the latest version is to delete the `dsc_resource_release_tags.yml` prior to building. Alternatively, you can pass `true` to the `update_versions` argument of the `dsc:resources:import` rake task.

## Build Custom DSC Resource Types
You can build puppet types based on your own powershell source code.

### Getting started

When importing or creating custom types, the following considerations will allow the DSC resource builder to successfully
build your types.

* See the notes in Building above.
* Do not try to include your module in the import folder by default. When building the first time or during a clean, the builder will delete all files and folders in this directory. It is preferred that you keep those custom modules in a separate location. A suggested location a separate repository where you can use source control on those items. You could also keep those files in `build/vendor/custom` within this repository.
* The builder will import your custom types into the vendored resources directory. They are required to be there for the module to successfully find them during a Puppet catalog application. The dsc module requires the PowerShell files to be there ***even*** if you have already installed them elsewhere on the machine due to how it points to the location of the resource to avoid issues with duplicate resources.
* The builder requires that there is no versioned subfolder. This means that you should not have a subfolder with a version (like you get when installing existing modules from the PowerShell Gallery).
  * You can use existing modules from the Gallery if you install them, then copy the files from the versioned subfolder up to the top level folder and delete the versioned subfolder.
* The builder requires that the PSD1 file be named the same as the parent folder. If your module is named `MyModule`,
the folder structure should be `MyModule/MyModule.psd1` and not `MyModule/SomethingElse.psd1`. The builder also requires a subdirectory called `DSCRsources`. See the image below:
  ![Module Layout - PSD1 file](docs/images/dir_struct_psdname.png)

### Steps to Build

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

## Partial support for DSC composite resources.
If you need a puppet type for a DSC composite resources, you have to define a xxx.schema.mof file next to your xxx.Schema.psm1 file.

## Issues
Please report issues on the [project issues](https://tickets.puppet.com/browse/MODULES)
