test_name 'FM-2626 - C70297 - Configure LCM for "Disabled" Refresh Mode'

confine(:to, :platform => 'windows')

# Init
dsc_conf_manifest = <<-MANIFEST
dsc::lcm_config {'disable_lcm':
  refresh_mode => 'Disabled'
}
MANIFEST

# Configure
step 'Disable LCM on Windows Agents'
on(agent, puppet('apply'), :stdin => dsc_conf_manifest, :acceptable_exit_codes => [0,2]) do |result|
  assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
end
