require 'erb'
require 'dsc_utils'
test_name 'MODULES-2511 - C68729 - Apply DSC Service Resource that Removes a Service'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'service'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure => 'Absent',
  :dsc_name   => 'puppet'
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Teardown
# A teardown is not necessary because the Puppet Agent service is not
# needed for acceptance testing.

# Tests
agents.each do |agent|
  step 'Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  expect_failure('Expected to fail because of MODULES-2512') do
    assert_dsc_resource(
      agent,
      dsc_type,
      dsc_module,
      :Ensure => dsc_props[:dsc_ensure],
      :Name   => dsc_props[:dsc_name]
    )
  end
end
