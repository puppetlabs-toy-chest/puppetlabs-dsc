require 'erb'
require 'dsc_utils'
test_name 'MODULES-2480 - C89505 - Misconfigure LCM and Attempt to Apply DSC Manifest'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'file'
dsc_props = {
  :dsc_ensure          => 'Present',
  :dsc_destinationpath => 'C:\test.file',
  :dsc_contents        => 'Cats go meow!',
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Teardown
teardown do
  step 'Disable LCM on Windows Agents'
  configure_lcm(agents, refresh_mode = 'Disabled')
end

# Verify
error_msg = /Error:.*DSC LCM RefreshMode must be set to Disabled/

# Setup
step 'Enable LCM on Windows Agents'
configure_lcm(agents, refresh_mode = 'Push')

# Tests
agents.each do |agent|
  step 'Attempt to Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => 0) do |result|
    assert_match(error_msg, result.stderr, 'Expected error was not detected!')
  end
end
