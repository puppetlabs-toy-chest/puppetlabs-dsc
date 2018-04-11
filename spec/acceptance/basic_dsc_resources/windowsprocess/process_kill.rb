require 'erb'
require 'dsc_utils'
test_name 'MODULES-2398 - C68692 - Apply DSC WindowsProcess Resource that Kills a Long Running Process'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'windowsprocess'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure    => 'Present',
  :dsc_path      => 'C:\Windows\System32\ping.exe',
  :dsc_arguments => '-t -4 localhost',
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Tests
agents.each do |agent|
  step 'Apply Manifest to Start Process'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  # New manifest to kill process.
  dsc_props[:dsc_ensure] = 'Absent'
  dsc_kill_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

  step 'Apply Manifest to Stop Process'
  on(agent, puppet('apply'), :stdin => dsc_kill_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  assert_dsc_resource(
    agent,
    dsc_type,
    dsc_module,
    :Ensure    => dsc_props[:dsc_ensure],
    :Path      => dsc_props[:dsc_path],
    :Arguments => dsc_props[:dsc_arguments],
  )
end
