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
PuppetLint.configuration.send("disable_class_inherits_from_params_class")
PuppetLint.configuration.send("disable_80chars")

task :default => [:spec, :lint]

# These rake tasks exist to pre-empt adding test tiering and rototiller the DSC Module
# Note that these are very Puppet Jenkins CI specific
desc "Rake facade for running acceptance tests"
task :acceptance_tests do
  # Environment variables normally used for Puppetlabs Spec Helper
  hostsfile = ENV['BEAKER_setfile']
  keyfile   = ENV['BEAKER_keyfile']

  system("beaker --color --debug --preserve-hosts never --hosts #{hostsfile} --keyfile #{keyfile} --load-path tests/lib --pre-suite tests/integration/pre-suite --tests tests/integration/tests")
  result = $?

  if result.exitstatus != 0
    raise "acceptance_tests execution failed (exit code: #{result.exitstatus})"
  end
end

desc "Rake facade for running reference tests"
task :reference_tests do
  # Environment variables normally used for Puppetlabs Spec Helper
  hostsfile = ENV['BEAKER_setfile']
  keyfile   = ENV['BEAKER_keyfile']

  system("beaker --color --debug --preserve-hosts never --hosts #{hostsfile} --keyfile #{keyfile} --load-path tests/lib --pre-suite tests/acceptance/pre-suite --tests tests/acceptance/tests")
  result = $?

  if result.exitstatus != 0
    raise "reference_tests execution failed (exit code: #{result.exitstatus})"
  end
end
