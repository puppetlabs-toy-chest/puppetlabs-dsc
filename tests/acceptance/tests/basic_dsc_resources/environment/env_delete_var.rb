require 'erb'
require 'dsc_utils'
test_name 'MODULES-2501 - C68554 - Apply DSC Environment Resource that Deletes Environment Vairable'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'environment'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure => 'Present',
  :dsc_name   => 'delete',
  :dsc_value  => 'Should not exist!',
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Tests
agents.each do |agent|
  step 'Apply Manifest to Create Environment Variable'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  # New manifest to delete value.
  dsc_props[:dsc_ensure] = 'Absent'
  dsc_delete_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

  step 'Apply Manifest to Delete Environment Variable'
  on(agent, puppet('apply'), :stdin => dsc_delete_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  assert_dsc_resource(
    agent,
    dsc_type,
    dsc_module,
    :Ensure => dsc_props[:dsc_ensure],
    :Name   => dsc_props[:dsc_name]
  )
end
