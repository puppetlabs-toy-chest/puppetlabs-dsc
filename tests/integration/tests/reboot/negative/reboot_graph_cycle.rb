require 'erb'
require 'master_manipulator'
require 'dsc_utils'
test_name 'MODULES-2843 - C96008 - Attempt to Apply DSC Resource that Requires Reboot with Inverse Relationship to a "reboot" Resource'

# Init
local_files_root_path = ENV['FILES'] || 'tests/files'

# Manifest
dsc_manifest = <<-MANIFEST
reboot { 'dsc_reboot':
  when => pending,
  notify => Dsc_puppetfakeresource['reboot_test']
}
dsc_puppetfakeresource { 'reboot_test':
  dsc_importantstuff => 'reboot'
}
MANIFEST

# Verify
error_message = /Error:.*Found 1 dependency cycle/

# Teardown
teardown do
  uninstall_fake_reboot_resource(master)
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
    on(agent, puppet('agent -t --environment production'), :acceptable_exit_codes => [0,1]) do |result|
      assert_match(error_message, result.stderr, 'Expected error was not detected!')
    end

    step 'Verify Reboot is NOT Pending'
    expect_failure('Expect that no reboot should be pending.') do
      assert_reboot_pending(agent)
    end
  end
end
