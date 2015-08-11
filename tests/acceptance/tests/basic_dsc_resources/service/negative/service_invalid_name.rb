require 'erb'
require 'dsc_utils'
test_name 'MODULES-2336 - C68748 - Attempt to Apply DSC Service Resource with Invalid "Name" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'service'
dsc_props = {
  :dsc_name        => 'makebelieve',
  :dsc_state       => 'Running',
  :dsc_startuptype => 'Automatic'
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Verify
error_msg = /Error: PowerShell DSC resource MSFT_ServiceResource.*Dsc_service\[service_test\].*The service 'makebelieve' does not exist/m

# Tests
agents.each do |agent|
  step 'Attempt to Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_match(error_msg, result.stderr, 'Expected error was not detected!')
  end
end
