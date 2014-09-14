source 'https://rubygems.org'

if ENV.key?('PUPPET_VERSION')
  puppetversion = "~> #{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['>= 3.3.1']
end

gem 'puppet', puppetversion
gem 'puppet-lint', '>=0.3.2'
gem 'puppetlabs_spec_helper', '>=0.2.0'
gem 'rake', '>=0.9.2.2'
gem 'librarian-puppet', '>=1.0.2'

group :development do
  gem 'pry'
end

group :build do
  gem 'librarian-repo', :github => 'msutter/librarian-repo'
	gem 'cim'
	gem 'mof', :github => 'msutter/mof'
end

