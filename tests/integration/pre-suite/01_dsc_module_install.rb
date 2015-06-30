test_name 'FM-2626 - C68506 - Plug-in Sync Module from Master with Prerequisites Satisfied on Agent'

step 'Install Module via PMT'
stub_forge_on(master)
on(master, puppet('module install puppetlabs-dsc'))
