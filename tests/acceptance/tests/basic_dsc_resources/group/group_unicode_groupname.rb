require 'erb'
require 'dsc_utils'
test_name 'MODULES-2523 - C68585 - Apply DSC Group Resource with Valid Unicode "GroupName" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'
test_manifest_name = 'test_manifest.pp'

# ERB Manifest
dsc_type = 'group'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure    => 'Present',
  :dsc_groupname => "\u1134\u1169\u1185\u1173\u112D\u1117\u1114\u1135\u114E"
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
    :Ensure    => 'Absent',
    :GroupName  => dsc_props[:dsc_groupname]
  )
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

  step 'Verify Results'
  expect_failure('Expected to fail because of MODULES-2593') do
    assert_dsc_resource(
      agent,
      dsc_type,
      dsc_module,
      :Ensure    => dsc_props[:dsc_ensure],
      :GroupName => dsc_props[:dsc_groupname]
    )
  end
end
