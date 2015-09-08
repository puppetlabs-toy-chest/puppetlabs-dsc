require 'dsc_utils'
test_name 'FM-2626 - C70297 - Configure LCM for "Disabled" Refresh Mode'

confine(:to, :platform => 'windows')

step 'Disable LCM on Windows Agents'
configure_lcm(agents, refresh_mode = 'Disabled')
