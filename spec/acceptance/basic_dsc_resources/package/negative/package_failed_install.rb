require 'erb'
require 'dsc_utils'
test_name 'MODULES-2559 - C68690 - Attempt to Apply DSC Package Resource with Package that Fails to Install'

confine(:to, :platform => 'windows')

# Init
local_manifests_root_path = ENV['MANIFESTS'] || 'tests/manifests'
local_files_root_path = ENV['FILES'] || 'tests/files'

local_installer_file_path = File.join(local_files_root_path, 'test_installer', 'test_program_installer.exe')
install_path = 'C:\test_program'
uninstall_reg_key_path = 'Software\Microsoft\Windows\CurrentVersion\Uninstall\TestProgram'
ps_uninstall_command = "Remove-Item -Recurse -Path HKLM:\\#{uninstall_reg_key_path}"

# ERB Manifest
dsc_type = 'package'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure     => 'Present',
  :dsc_path       => "C:\\test_program_installer.exe",
  :dsc_name       => 'Test Program',
  :dsc_productid  => '',
  :dsc_arguments  => "/S /D=#{install_path}"
}

dsc_manifest_template_path = File.join(local_manifests_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Teardown
teardown do
  step 'Remove Test Artifacts'
  # This invocation will be deprecated by the changes in MODULES-2656
  # The method will be renamed and marked as public.
  _exec_dsc_script(agents, "if ( #{ps_uninstall_command} ) { exit 0 } else { exit 1 }")

  set_dsc_resource(
    agents,
    'file',
    dsc_module,
    :Ensure          => 'Absent',
    :Type            => 'File',
    :DestinationPath => dsc_props[:dsc_path]
  )

  set_dsc_resource(
    agents,
    'file',
    dsc_module,
    :Ensure          => 'Absent',
    :Type            => 'Directory',
    :Force           => '$true',
    :Recurse         => '$true',
    :DestinationPath => install_path
  )
end

# Verify
error_msg = /Error:.*The return code 4 was not expected/m

# Setup
step 'Copy Installer to Agents'
scp_to(agents, local_installer_file_path, dsc_props[:dsc_path])

# Tests
agents.each do |agent|
  step 'Attempt to Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => 0) do |result|
    assert_match(error_msg, result.stderr, 'Expected error was not detected!')
  end
end
