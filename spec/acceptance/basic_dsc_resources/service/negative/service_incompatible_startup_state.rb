require 'erb'
require 'dsc_utils'
test_name 'MODULES-2336 - C68749 - Attempt to Apply DSC Service Resource with Incompatible "StartupType" and "State"'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'service'
dsc_props = {
  :dsc_name        => 'w32time',
  :dsc_state       => 'Running',
  :dsc_startuptype => 'Disabled'
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Verify
error_msg = /Error\:.*Dsc_service\[service_test\]:.*Cannot start and disable a service/m

# Tests
agents.each do |agent|
  step 'Attempt to Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_match(error_msg, result.stderr, 'Expected error was not detected!')
  end
end
