test_name 'FM-2626 - C68503 - Install Module via PMT on Agent with Prerequisites Satisfied'

confine(:to, :platform => 'windows')

# Init
proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
staging = { :module_name => 'puppetlabs-dsc' }


agents.each do |agent|
  local = { :module_name => 'dsc', :proj_root => proj_root, :target_module_path => agent['distmoduledir'] }

  step 'Install DSC Module Dependencies'
  on(agent, puppet('module install puppetlabs-stdlib'))
  on(agent, puppet('module install puppetlabs-powershell'))

  step 'Install DSC Module'
  # in CI install from staging forge, otherwise from local
  install_dev_puppet_module_on(agent, options[:forge_host] ? staging : local)
end
