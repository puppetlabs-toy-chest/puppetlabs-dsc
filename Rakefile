require 'bundler'

require 'puppet_blacksmith/rake_tasks' if Bundler.rubygems.find_name('puppet-blacksmith').any?
require 'pry' if Bundler.rubygems.find_name('puppet_blacksmith').any?

Bundler.require(:rake)

Dir.glob('build/*.rake').each { |r| import r }
Dir.glob('build/*.rb').each { |r| import r }

require 'puppetlabs_spec_helper/rake_tasks'
require 'puppet-lint/tasks/puppet-lint'

PuppetLint.configuration.ignore_paths = ["spec/**/*.pp", "vendor/**/*.pp"]
PuppetLint.configuration.log_format = '%{path}:%{linenumber}:%{KIND}: %{message}'
PuppetLint.configuration.send("disable_class_inherits_from_params_class")
PuppetLint.configuration.send("disable_80chars")

# use librarian-puppet to manage fixtures instead of .fixtures.yml
# offers more possibilities like explicit version management, forge downloads,...
task :librarian_spec_prep do
  sh "librarian-puppet install --path=spec/fixtures/modules/"
  pwd = `pwd`.strip
  unless File.directory?("#{pwd}/spec/fixtures/modules/dsc")
    sh "ln -s #{pwd} #{pwd}/spec/fixtures/modules/dsc"
  end
end
task :spec_prep => :librarian_spec_prep

task :default => ['dsc:clean', 'dsc:build', :spec, :lint]
