Test Levels
===========================

This folder contains tests at the acceptance, integration, and unit level for the "puppetlabs-dsc" module. 

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

The "puppetlabs-dsc" project already contains RSpec unit and acceptance tests and you might be wondering why there
is a need to have a set of tests separate from those tests. At Puppet Labs we define an "integration" test as:

> Validating the system state and/or side effects while completing a complete life cycle of user stories using a
> system. This type of test crosses the boundary of a discrete tool in the process of testing a defined user
> objective that utilizes a system composed of integrated components.

What this means for this project is that we will install and configure all infrastructure needed in a real-world
"puppetlabs-dsc" environment. (Puppet master and agent.)

## Nodesets Folder

The "nodesets" folder contains Beaker host configuration files for the various test platforms used by the "acceptance"
and "integration" test suites.

## Library Folder

The "lib" folder contains Beaker helper library that assist in automated testing shared between the "acceptance" and
"integration" test suites.

## Running Tests

### Running Unit tests
```
bundle exec rake spec
```

### Running Acceptance Tests
```
bundle exec rake beaker
```

## Documentation

Each sub-folder may contain a "README.md" that describes the content found in the sub-folder if it the content is
not obvious to a contributor.
