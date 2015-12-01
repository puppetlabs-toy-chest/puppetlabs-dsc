test_name 'FM-2626 - C68506 - Plug-in Sync Module from Master with Prerequisites Satisfied on Agent'

step 'Install DSC Module Dependencies'
on(master, puppet('module install puppetlabs-stdlib'))
on(master, puppet('module install puppetlabs-powershell'))
on(master, puppet('module install puppetlabs-reboot'))

step 'Install DSC Module'
proj_root = File.expand_path(File.join(File.dirname(__FILE__), '../../../'))
staging = { :module_name => 'puppetlabs-dsc' }
local = { :module_name => 'dsc', :source => proj_root, :target_module_path => master['distmoduledir'] }

# Check to see if module version is specified.
staging[:version] = ENV['MODULE_VERSION'] if ENV['MODULE_VERSION']

# in CI install from staging forge, otherwise from local
install_dev_puppet_module_on(master, options[:forge_host] ? staging : local)
