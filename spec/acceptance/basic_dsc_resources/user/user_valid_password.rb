require 'erb'
require 'dsc_utils'
test_name 'MODULES-2537 - C68751 - Apply DSC User Resource with Valid "UserName" and "Password" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'
username = 'specialcat'
password = 'specialcatpassword'

# ERB Manifest
dsc_type = 'user'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure   => 'Present',
  :dsc_username => username,
  :dsc_password => "{'user' => '#{username}', 'password' => '#{password}'}"
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
    :Ensure   => 'Absent',
    :UserName => username
  )
end

# Tests
agents.each do |agent|
  step 'Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  assert_dsc_cred_resource(
    agent,
    username,
    password,
    dsc_type,
    dsc_module,
    :Password,
    :Ensure   => dsc_props[:dsc_ensure],
    :UserName => username
  )
end
