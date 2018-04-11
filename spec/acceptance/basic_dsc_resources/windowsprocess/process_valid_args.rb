require 'erb'
require 'dsc_utils'
test_name 'MODULES-2398 - C68691 - Apply DSC WindowsProcess Resource with Valid "Arguments" and "Path" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'
output_file_name = 'ping.out'

# ERB Manifest
dsc_type = 'windowsprocess'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure    => 'Present',
  :dsc_path      => 'C:\Windows\System32\cmd.exe',
  :dsc_arguments => "/c ping.exe -n 2 -4 localhost > C:\\#{output_file_name}",
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Teardown
teardown do
  step 'Remove Test Artifacts'
  set_dsc_resource(
    agents,
    'file',
    dsc_module,
    :Ensure          => 'Absent',
    :DestinationPath => "C:\\#{output_file_name}"
  )
end

# Verify
output_file_regex = /Reply from 127.0.0.1/

# Tests
agents.each do |agent|
  step 'Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  on(agent, "cat /cygdrive/c/#{output_file_name}") do |result|
    assert_match(output_file_regex, result.stdout, 'Expected contents not detected!')
  end
end
