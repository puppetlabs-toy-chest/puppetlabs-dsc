require 'bundler'
Bundler.require(:rake)

# devel
require 'puppet_blacksmith/rake_tasks' if Bundler.rubygems.find_name('puppet-blacksmith').any?
require 'puppetlabs_spec_helper/rake_tasks' if Bundler.rubygems.find_name('puppetlabs_spec_helper').any?
if Bundler.rubygems.find_name('puppet-lint').any?
  require 'puppet-lint/tasks/puppet-lint'
  PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "vendor/**/*.pp"]
  PuppetLint.configuration.log_format = '%{path}:%{linenumber}:%{KIND}: %{message}'
  PuppetLint.configuration.send("disable_class_inherits_from_params_class")
  PuppetLint.configuration.send("disable_80chars")
end

# debug
require 'pry' if Bundler.rubygems.find_name('pry').any?

# build
if Bundler.rubygems.find_name('mof').any?
  Dir.glob('build/*.rb').each { |r| import r }
  Dir.glob('build/*.rake').each { |r| import r }
end

# tasks
desc 'Run the Acceptance Tests'
task :acceptance_tests, :tests, :config, :puppet_agent_ver do |t, args|
  args.with_defaults(:tests            => 'tests',
                     :config           => 'windows-2012r2-64a',
                     :puppet_agent_ver => '1.2.2'
  )

  beaker_cmd = <<-EOS
export BEAKER_PUPPET_AGENT_VERSION=#{args[:puppet_agent_ver]}

bundle exec beaker \
  --config tests/configs/#{args[:config]} \
  --pre-suite tests/acceptance/pre-suite \
  --tests tests/acceptance/#{args[:tests]} \
  --load-path tests/lib \
  --keyfile ~/.ssh/id_rsa-acceptance \
  --preserve-hosts onfail \
  --debug \
  --type aio
EOS

  sh beaker_cmd
  raise 'FAILURE' unless $?.success?
end

desc 'Run the Integration Tests'
task :integration_tests, :tests, :config, :pe_dist_dir do |t, args|
  args.with_defaults(:tests       => 'tests',
                     :config      => 'windows-2012r2-64mda',
                     :pe_dist_dir => 'http://neptune.puppetlabs.lan/2015.2/preview'
  )

  beaker_cmd = <<-EOS
export pe_dist_dir=#{args[:pe_dist_dir]}

bundle exec beaker \
  --config tests/configs/#{args[:config]} \
  --pre-suite tests/integration/pre-suite \
  --tests tests/integration/#{args[:tests]} \
  --load-path tests/lib \
  --keyfile ~/.ssh/id_rsa-acceptance \
  --preserve-hosts onfail \
  --debug
EOS

  sh beaker_cmd
  raise 'FAILURE' unless $?.success?

  # remove Beaker tmp directory
  sh 'rm -rf tmp'
end

task :default => [:spec, :lint]
