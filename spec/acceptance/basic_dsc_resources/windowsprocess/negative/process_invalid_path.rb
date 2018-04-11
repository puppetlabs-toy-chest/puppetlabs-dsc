require 'erb'
require 'dsc_utils'
test_name 'MODULES-2398 - C68696 - Attempt to Apply DSC WindowsProcess Resource with Invalid "Path" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'windowsprocess'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure    => 'Present',
  :dsc_path      => 'C:\Windows\System32\fake.exe',
  :dsc_arguments => "-moo",
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Verify
error_msg = /Error:.*Invalid argument: 'Path' with value/

# Tests
agents.each do |agent|
  step 'Attempt to Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_match(error_msg, result.stderr, 'Unexpected error was detected!')
  end
end
