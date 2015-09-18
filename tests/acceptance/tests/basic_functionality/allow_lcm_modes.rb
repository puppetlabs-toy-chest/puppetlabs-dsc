require 'erb'
require 'dsc_utils'
test_name 'MODULES-2480 - C89505 - Apply DSC Manifest with LCM refresh mode set to Push'

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

# Setup
step 'Enable LCM on Windows Agents'
configure_lcm(agents, refresh_mode = 'Push')

# Tests
agents.each do |agent|
  step 'Attempt to Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => 0) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  assert_dsc_resource(
    agent,
    'File',
    'PSDesiredStateConfiguration',
    :DestinationPath => 'C:\test.file',
    :Contents => 'Cats go meow!'
  )
end
