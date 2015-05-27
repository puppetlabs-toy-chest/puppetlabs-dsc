test_name 'FM-2626 - C68506 - Plug-in Sync Module from Master with Prerequisites Satisfied on Agent'

confine(:to, :platform => 'windows')

step 'Install Module via PMT'
stub_forge_on(master)
on(master, puppet('module install puppetlabs-dsc'))

step 'Plug-in Sync Agents'
on(agents, puppet('plugin download'))
