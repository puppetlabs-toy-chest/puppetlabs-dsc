test_name 'FM-2626 - C68506 - Plug-in Sync Module from Master with Prerequisites Satisfied on Agent'

# Init
proj_root = File.expand_path(File.join(File.dirname(__FILE__), '../../../'))
staging = { :module_name => 'puppetlabs-dsc' }
local = { :module_name => 'dsc', :source => proj_root, :target_module_path => master['distmoduledir'] }

# Beaker option set if "BEAKER_FORGE_HOST" environment variable is present
if options[:forge_host]
  # Check to see if module version is specified.
  staging[:version] = ENV['MODULE_VERSION'] if ENV['MODULE_VERSION']

  step 'Install DSC Module from Forge'
  install_dev_puppet_module_on(master, staging)
else
  step 'Install DSC Module Dependencies'
  on(master, puppet('module install puppetlabs-stdlib'))
  on(master, puppet('module install puppetlabs-powershell'))
  on(master, puppet('module install puppetlabs-reboot'))

  step 'Install DSC Module from Local Source'
  install_dev_puppet_module_on(master, local)
end
