test_name 'FM-2626 - C68503 - Install Module via PMT on Agent with Prerequisites Satisfied'

confine(:to, :platform => 'windows')

# Init
proj_root = File.expand_path(File.join(File.dirname(__FILE__), '../../../'))
local = { :module_name => 'dsc', :source => proj_root }
pmt_cmd = "module install puppetlabs-dsc --module_working_dir C:/Windows/Temp"

agents.each do |agent|
  # Beaker option set if "BEAKER_FORGE_HOST" environment variable is present
  if options[:forge_host]
    # Check to see if module version is specified.
    pmt_cmd << " --version #{ENV['MODULE_VERSION']}" if ENV['MODULE_VERSION']

    step 'Install DSC Module from Forge'
    # Work-around for limitation found in PUP-4866.
    with_forge_stubbed_on(agent) do
      on(agent, puppet(pmt_cmd))
    end
  else
    step 'Install DSC Module Dependencies'
    on(agent, puppet('module install puppetlabs-stdlib'))
    on(agent, puppet('module install puppetlabs-powershell'))
    on(agent, puppet('module install puppetlabs-reboot'))

    step 'Install DSC Module from Local Source'
    install_dev_puppet_module_on(agent, local)
  end
end
