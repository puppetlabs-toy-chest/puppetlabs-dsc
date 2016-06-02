require 'master_manipulator'
test_name 'FM-2626 - C70297 - Configure LCM for "Disabled" Refresh Mode'

#Init
dsc_conf_manifest = <<-MANIFEST
if ($::operatingsystem == 'windows') or ($::os['name'] == 'windows') {
  dsc::lcm_config {'disable_lcm':
    refresh_mode => 'Disabled'
  }
}
MANIFEST

# Setup
step 'Inject "site.pp" on Master'
site_pp = create_site_pp(master, :manifest => dsc_conf_manifest)
inject_site_pp(master, get_site_pp_path(master), site_pp)

# Configure
step 'Disable LCM on Windows Agents'
confine_block(:to, :platform => 'windows') do
  on(agent, puppet('agent -t --environment production'), :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end
end
