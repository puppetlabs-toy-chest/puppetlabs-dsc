require 'erb'
require 'dsc_utils'
test_name 'MODULES-2537 - C68754 - Apply DSC User Resource with Valid Unicode "UserName" and "Password" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'
test_manifest_name = 'test_manifest.pp'
username = "unicode"
password = "\u11D4\u11D7\u11E8\u11F9\u118E\u1185\u118A\u11A0\u11A9\u11C5"

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
  expect_failure('Expected to fail because of MODULES-2588') do
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
end
