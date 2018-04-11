require 'erb'
require 'dsc_utils'
test_name 'MODULES-2559 - C92336 - Apply DSC Package Resource with Non-Zero "ReturnCode" Specified'

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
  :dsc_arguments  => "/S /D=#{install_path}",
  :dsc_returncode => '4'
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

# Setup
step 'Copy Installer to Agents'
scp_to(agents, local_installer_file_path, dsc_props[:dsc_path])

# Tests
agents.each do |agent|
  step 'Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => 0) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  assert_dsc_resource(
    agent,
    dsc_type,
    dsc_module,
    :Ensure     => dsc_props[:dsc_ensure],
    :Path       => dsc_props[:dsc_path],
    :Name       => dsc_props[:dsc_name],
    :ProductId  => dsc_props[:dsc_productid],
    :ReturnCode => "[uint32[]]@(#{dsc_props[:dsc_returncode]})"
  )
end
