source 'https://rubygems.org'

if ENV.key?('PUPPET_VERSION')
  puppetversion = "~> #{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['>= 3.3.1']
end

group :development do
  gem 'pry'
end

gem 'puppet', puppetversion
gem 'puppet-lint', '>=0.3.2'
gem 'puppetlabs_spec_helper', '>=0.2.0'
gem 'rake', '>=0.9.2.2'
gem 'librarian-puppet', '>=0.9.10'
gem 'cim'
gem 'mof'