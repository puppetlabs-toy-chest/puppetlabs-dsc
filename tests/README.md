Test Levels
===========================

This folder contains tests at the acceptance and integration level for the "puppetlabs-dsc" module. The unit
tests are still kept in the "spec" top-level folder of the repository.

## Acceptance Folder

At Puppet Labs we define an "acceptance" test as:

> Validating the system state and/or side effects while completing a stated piece of functionality within a tool.
> This type of test is contained within the boundaries of a tool in order to test a defined functional area within
> that tool.

What this means for this project is that we will install and configure some infrastructure needed for a "puppetlabs-dsc"
environment. (Puppet agent only.)

## Integration Folder

These tests were originally written by the QA team at Puppet Labs and is actively maintained by the QA team.
Feel free to contribute tests to this folder as long as they are written with [Beaker](https://github.com/puppetlabs/beaker)
and follow the guidelines below.

The "puppetlabs-dsc" project already contains RSpec and acceptance tests and you might be wondering why there
is a need to have a set of tests separate from those tests. At Puppet Labs we define an "integration" test as:

> Validating the system state and/or side effects while completing a complete life cycle of user stories using a
> system. This type of test crosses the boundary of a discrete tool in the process of testing a defined user
> objective that utilizes a system composed of integrated components.

What this means for this project is that we will install and configure all infrastructure needed in a real-world
"puppetlabs-dsc" environment. (Puppet master and agent.)

## Configs Folder

The "configs" folder contains Beaker host configuration files for the various test platforms used by the "acceptance"
and "integration" test suites.

## Library Folder

The "lib" folder contains Beaker helper library that assist in automated testing shared between the "acceptance" and
"integration" test suites.

## Pre-suite Folder

The "pre-suite" folder contains Beaker pre-suite scripts for setting up environments for "acceptance" and
"integration" test suites.

## Running Tests

Included in the sub-folders is the "test_run_scripts" sub-folder for simple Bash scripts that will run suites of
Beaker tests. These scripts utilize environment variables for specifying test infrastructure. For security
reasons we do not provide examples from the Puppet Labs testing environment. Hopefully in the near future we will
be able to provide necessary infrastructure to the community to allow for contributors to run the "acceptance" and
"integration" test suites.

### Running Acceptance Tests

To run acceptance tests use the "acceptance_tests.sh" test run script.

**Example: Run with defaults on Windows 2012 R2**
```
./acceptance_tests.sh
```

**Example: Run with Puppet Agent 1.2.1 on Windows 2008 R2 using Forge**
```
./acceptance_tests.sh windows-2008r2-64a 1.2.1 forge
```

**Example: Run with Puppet Agent 1.2.2 on Windows 2012 R2 with local module code (No Forge)**
```
./acceptance_tests.sh windows-2012r2-64a 1.2.2 local
```

### Running Integration Tests

To run integration tests use the "integration_tests.sh" test run script.

**Example: Run with defaults on Windows 2012 R2**
```
./integration_tests.sh
```

**Example: Run with alternate PE package repo on Windows 2008 R2 using Forge**
```
./integration_tests.sh windows-2008r2-64mda http://alt.address.local/3.8.2/preview forge
```

**Example: Run with alternate PE package repo on Windows 2012 R2 with local module code (No Forge)**
```
./integration_tests.sh windows-2012r2-64mda http://alt.address.local/3.8.2/preview local
```

## Documentation

Each sub-folder may contain a "README.md" that describes the content found in the sub-folder if it the content is
not obvious to a contributor.
