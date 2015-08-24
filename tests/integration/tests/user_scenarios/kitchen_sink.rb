require 'erb'
require 'master_manipulator'
require 'dsc_utils'
test_name 'MODULES-2400 - C89536 - Apply DSC Basic Resource Kitchen Sink Manifest'

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'
dsc_module = 'PSDesiredStateConfiguration'

# ERB Manifest
temp_dl_path = 'C:\Windows\Temp\kitchen_sink'

seven_zip_url = 'http://int-resources.ops.puppetlabs.net/QA_resources/7zip/7z920.exe'
seven_zip_dl_path = "#{temp_dl_path}\\7zip.exe"
seven_zip_product_name = '7-Zip 9.20'
seven_zip_install_path = 'C:\7zip'

seven_zip_test_archive_path = 'C:\Windows\Temp\test_archive.7z'
seven_zip_exe_path = "#{seven_zip_install_path}\\7z.exe"
seven_zip_command_args = "a -t7z #{seven_zip_test_archive_path} #{temp_dl_path}\\*"

env_var_name  = 'Test'
env_var_value = 'TestValue'

nssm_url = 'http://int-resources.ops.puppetlabs.net/QA_resources/nssm/nssm-2.24.zip'
nssm_dl_path = "#{temp_dl_path}\\nssm.zip"

ftp_feature_name = 'Web-Ftp-Server'
ftp_service_name = 'FTPSVC'
ftp_service_startup_type = 'Disabled'
ftp_service_state = 'Stopped'

user_name = 'TestUser'
group_name = 'TestGroup'

registry_key = 'HKEY_LOCAL_MACHINE\SOFTWARE\TestKey'
registry_value = 'TestValueName'

dsc_manifest_template_path = File.join(local_files_root_path, 'user_scenarios', 'kitchen_sink.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Teardown
teardown do
  confine_block(:to, :platform => 'windows') do
    step 'Uninstall 7-zip'
    on(agents, "cmd /c \"#{seven_zip_install_path}\\Uninstall.exe /S\"")

    step 'Unset Environment Variable'
    set_dsc_resource(
      agents,
      'Environment',
      dsc_module,
      :Ensure => 'Absent',
      :Name   => env_var_name
    )

    step 'Remove Registry Value'
    set_dsc_resource(
      agents,
      'Registry',
      dsc_module,
      :Ensure    => 'Absent',
      :Key       => registry_key,
      :ValueName => registry_value
    )

    step 'Remove Group'
    set_dsc_resource(
      agents,
      'Group',
      dsc_module,
      :Ensure    => 'Absent',
      :GroupName => group_name
    )

    step 'Remove User'
    set_dsc_resource(
      agents,
      'User',
      dsc_module,
      :Ensure   => 'Absent',
      :UserName => user_name
    )

    step 'Remove Temporary Directory'
    set_dsc_resource(
      agents,
      'File',
      dsc_module,
      :Ensure          => 'Absent',
      :Type            => 'Directory',
      :Force           => '$true',
      :DestinationPath => temp_dl_path,
    )

    step 'Remove Test Archive'
    set_dsc_resource(
      agents,
      'File',
      dsc_module,
      :Ensure          => 'Absent',
      :Type            => 'File',
      :DestinationPath => seven_zip_test_archive_path,
    )
  end
end

# Setup
step 'Inject "site.pp" on Master'
site_pp = create_site_pp(master, :manifest => dsc_manifest)
inject_site_pp(master, get_site_pp_path(master), site_pp)

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Run Puppet Agent'
    on(agent, puppet('agent -t --environment production'), :acceptable_exit_codes => [0,2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end

    step 'Verify Environment Variable'
    assert_dsc_resource(
      agent,
      'Environment',
      dsc_module,
      :Ensure => 'Present',
      :Name   => env_var_name,
      :Value  => env_var_value
    )

    step 'Verify NSSM Extracted'
    assert_dsc_resource(
      agent,
      'File',
      dsc_module,
      :Ensure          => 'Present',
      :Type            => 'Directory',
      :DestinationPath => "#{temp_dl_path}\\nssm-2.24",
    )

    step 'Verify FTP Service State'
    assert_dsc_resource(
      agent,
      'Service',
      dsc_module,
      :Name        => ftp_service_name,
      :StartupType => ftp_service_startup_type,
      :State       => ftp_service_state
    )

    step 'Verify Group Membership'
    assert_dsc_resource(
      agent,
      'Group',
      dsc_module,
      :Ensure    => 'Present',
      :GroupName => group_name,
      :Members   => "@(\"#{user_name}\")"
    )

    step 'Verify Registry Value'
    assert_dsc_resource(
      agent,
      'Registry',
      dsc_module,
      :Ensure    => 'Present',
      :Key       => registry_key,
      :ValueName => registry_value
    )

    step 'Verify 7-zip Archive'
    assert_dsc_resource(
      agent,
      'File',
      dsc_module,
      :Ensure          => 'Present',
      :Type            => 'File',
      :DestinationPath => seven_zip_test_archive_path
    )
  end
end
