require 'erb'
require 'dsc_utils'
test_name 'MODULES-2286 - C68564 - Apply DSC File (Directory) Resource with Valid "DestinationPath" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'file'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure          => 'Present',
  :dsc_type            => 'Directory',
  :dsc_destinationpath => 'C:\test_dir',
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Teardown
teardown do
  step 'Remove Test Artifacts'
  set_dsc_resource(
    agents,
    dsc_type,
    dsc_module,
    :Ensure          => 'Absent',
    :Type            => dsc_props[:dsc_type],
    :DestinationPath => dsc_props[:dsc_destinationpath],
    :Force           => '$true'
  )
end

# Tests
agents.each do |agent|
  step 'Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  assert_dsc_resource(
    agent,
    dsc_type,
    dsc_module,
    :Ensure          => dsc_props[:dsc_ensure],
    :Type            => dsc_props[:dsc_type],
    :DestinationPath => dsc_props[:dsc_destinationpath],
  )
end
