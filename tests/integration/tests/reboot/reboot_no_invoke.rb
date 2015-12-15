require 'erb'
require 'master_manipulator'
require 'dsc_utils'
test_name 'MODULES-2843 - C96007 - Apply DSC Resource that Does not Require a Reboot with Autonotify "reboot" Resource'

# Init
local_files_root_path = ENV['FILES'] || 'tests/files'
dsc_type = 'Directory'
test_directory = 'C:/test'

# Manifest
dsc_manifest = <<-MANIFEST
reboot { 'dsc_reboot':
  when => pending
}
dsc_file { 'reboot_test':
  dsc_ensure          => present,
  dsc_type            => '#{dsc_type}',
  dsc_destinationpath => '#{test_directory}'
}
MANIFEST

# Teardown
teardown do
  uninstall_fake_reboot_resource(master)

  confine_block(:to, :platform => 'windows') do
    step 'Remove Test Artifacts'
    set_dsc_resource(
      agents,
      'File',
      'PSDesiredStateConfiguration',
      :Ensure          => 'Absent',
      :Type            => dsc_type,
      :DestinationPath => test_directory
    )
  end
end

# Setup
install_fake_reboot_resource(master, "#{local_files_root_path}/reboot")

step 'Inject "site.pp" on Master'
site_pp = create_site_pp(master, :manifest => dsc_manifest)
inject_site_pp(master, get_site_pp_path(master), site_pp)

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Run Puppet Agent'
    on(agent, puppet('agent -t --environment production'), :acceptable_exit_codes => [0,2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
      assert_no_match(/Warning:/, result.stderr, 'Unexpected warning was detected!')
    end

    step 'Verify Reboot is NOT Pending'
    expect_failure('Expect that no reboot should be pending.') do
      assert_reboot_pending(agent)
    end
  end
end
