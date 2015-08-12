require 'erb'
require 'dsc_utils'
test_name 'MODULES-2286 - C68565 - Apply DSC File (Directory) Resource with Valid Unicode "DestinationPath" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'
test_manifest_name = 'test_manifest.pp'
test_dir_name = "\u1134\u1169\u1185\u1173\u112D\u1117\u1114\u1135\u114E"

# ERB Manifest
dsc_type = 'file'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure          => 'Present',
  :dsc_type            => 'Directory',
  :dsc_destinationpath => "C:\\#{test_dir_name}"
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Teardown
teardown do
  step 'Remove Test Artifacts'
  on(agents, "rm -rf /cygdrive/c/#{test_dir_name}")
  on(agents, "rm -rf /cygdrive/c/#{test_manifest_name}")
end

# Setup
create_remote_file(agents, "/cygdrive/c/#{test_manifest_name}", dsc_manifest)

# Tests
agents.each do |agent|
  step 'Apply Manifest'
  on(agent, puppet("apply C:\\\\#{test_manifest_name}"), :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  # Expected to fail because of MODULES-2310
  step 'Verify Results'
  on(agent, "test -d /cygdrive/c/#{test_dir_name}", :acceptable_exit_codes => 1)
end
