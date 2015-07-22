require 'erb'
require 'dsc_utils'
test_name 'MODULES-2263 - C68587 - Apply DSC Group Resource with Valid "Members" Specified'

# Init
test_dir_name = 'test'
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'group'
dsc_props = {
  :dsc_ensure    => 'Present',
  :dsc_groupname => 'TestGroupMembers',
  :dsc_members   => '["Administrator","Guest"]'
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Teardown
teardown do
  confine_block(:to, :platform => 'windows') do
    step 'Remove Test Artifacts'
    set_dsc_resource(
      agents,
      dsc_type,
      :Ensure    => 'Absent',
      :GroupName  => dsc_props[:dsc_groupname]
    )
  end
end

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Apply Manifest'
    on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end

    step 'Verify Results'
    assert_dsc_resource(
      agent,
      dsc_type,
      :Ensure    => dsc_props[:dsc_ensure],
      :GroupName => dsc_props[:dsc_groupname],
      :Members   => '@("Administrator","Guest")'
    )
  end
end
