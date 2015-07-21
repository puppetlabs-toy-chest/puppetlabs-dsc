test_name 'FM-2626 - C68503 - Install Module via PMT on Agent with Prerequisites Satisfied'

confine(:to, :platform => 'windows')

step 'Install Module via PMT'
stub_forge_on(agents)
on(agents, puppet('module install puppetlabs-dsc --module_working_dir C:/Windows/Temp'))
