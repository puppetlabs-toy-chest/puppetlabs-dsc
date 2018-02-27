require 'erb'
require 'dsc_utils'
test_name 'MODULES-2230 - C68706 - Apply DSC Registry Resource that Removes Registry Value'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'registry'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure    => 'Present',
  :dsc_key       => 'HKEY_LOCAL_MACHINE\SOFTWARE\TestKey',
  :dsc_valuename => 'TestRemoveValue',
  :dsc_valuedata => 'Cats',
  :dsc_valuetype => 'String'
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Tests
agents.each do |agent|
  step 'Apply Manifest to Create Value'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  # New manifest to remove value.
  dsc_props[:dsc_ensure] = 'Absent'
  dsc_remove_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

  step 'Apply Manifest to Remove Value'
  on(agent, puppet('apply'), :stdin => dsc_remove_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  assert_dsc_resource(
    agent,
    dsc_type,
    dsc_module,
    :Ensure    => dsc_props[:dsc_ensure],
    :Key       => dsc_props[:dsc_key],
    :ValueName => dsc_props[:dsc_valuename],
    :ValueData => "@(\"#{dsc_props[:dsc_valuedata]}\")",
    :ValueType => dsc_props[:dsc_valuetype]
  )
end
