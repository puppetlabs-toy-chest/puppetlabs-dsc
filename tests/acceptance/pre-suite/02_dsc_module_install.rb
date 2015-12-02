test_name 'FM-2626 - C68503 - Install Module via PMT on Agent with Prerequisites Satisfied'

confine(:to, :platform => 'windows')

# Init
proj_root = File.expand_path(File.join(File.dirname(__FILE__), '../../../'))

staging = { :module_name => 'puppetlabs-dsc' }
local = { :module_name => 'dsc', :source => proj_root }

# Check to see if module version is specified.
staging[:version] = ENV['MODULE_VERSION'] if ENV['MODULE_VERSION']

agents.each do |agent|
  step 'Install DSC Module Dependencies'
  on(agent, puppet('module install puppetlabs-stdlib'))
  on(agent, puppet('module install puppetlabs-powershell'))
  on(agent, puppet('module install puppetlabs-reboot'))

  step 'Install DSC Module'
  local[:target_module_path] = agent['distmoduledir']
  # in CI install from staging forge, otherwise from local
  install_dev_puppet_module_on(agent, options[:forge_host] ? staging : local)
end
