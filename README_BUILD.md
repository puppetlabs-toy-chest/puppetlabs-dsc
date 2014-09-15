Build custom DSC resource types
===============================

##Usage

#Quick-start
```
    # install the bundler gem
    gem install bundler

    # install the needed ruby gems/libs
    bundle install

    # Run the build and tests (this will remove all puppet types and build them again)
    bundle exec rake
```

#Rake tasks
You can use following rake tasks for your convenience
```
rake dsc:build             # Import and build all
rake dsc:clean             # Cleanup all
rake dsc:dmtf:clean        # Cleanup DMTF CIM MOF Schema files
rake dsc:dmtf:import       # Import DMTF CIM MOF Schema files
rake dsc:resources:clean   # Cleanup DSC Powershell modules files
rake dsc:resources:import  # Import DSC Powershell modules files
rake dsc:types:build       # Build DSC types in (lib/puppet/type)
rake dsc:types:clean       # Cleanup DSC types in (lib/puppet/type)
```

The default task 'bundle exec rake' will run all of this tasks.

# Custom DSC resources
You can build puppet types based on your own powershell source code.

1. Edit the Repofile and add your git URL or a zip file download URL.
2. Rebuild the module with 'bundle exec rake'
3. You should find your new types in lib/puppet/type and their spec tests in spec/unit/puppet/type
4. Enjoy !

# Issues
Please report issues on the [project issues](https://github.com/msutter/puppet-dsc/issues)
