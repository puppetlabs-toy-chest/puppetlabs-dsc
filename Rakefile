require 'bundler'

# devel
require 'puppet_blacksmith/rake_tasks' if Bundler.rubygems.find_name('puppet-blacksmith').any?

# debug
require 'pry' if Bundler.rubygems.find_name('pry').any?

Bundler.require(:rake)

Dir.glob('build/*.rb').each { |r| import r }
Dir.glob('build/*.rake').each { |r| import r }

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "vendor/**/*.pp"]
PuppetLint.configuration.log_format = '%{path}:%{linenumber}:%{KIND}: %{message}'
PuppetLint.configuration.send("disable_class_inherits_from_params_class")
PuppetLint.configuration.send("disable_80chars")

task :default => [:spec, :lint]
