test_name 'FM-2626 - C68506 - Plug-in Sync Module from Master with Prerequisites Satisfied on Agent'

step 'Install Module via PMT'
stub_forge_on(master)
on(master, puppet('module install puppetlabs-dsc'))

# Init
proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
staging = { :module_name => 'puppetlabs-dsc' }
local = { :module_name => 'dsc', :proj_root => proj_root, :target_module_path => master['distmoduledir'] }

step 'Install DSC Module Dependencies'
on(master, puppet('module install puppetlabs-stdlib'))
on(master, puppet('module install puppetlabs-powershell'))

step 'Install DSC Module'
# in CI install from staging forge, otherwise from local
install_dev_puppet_module_on(master, options[:forge_host] ? staging : local)
