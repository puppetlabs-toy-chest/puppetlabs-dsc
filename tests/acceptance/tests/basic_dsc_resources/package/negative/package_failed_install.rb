require 'erb'
require 'dsc_utils'
test_name 'MODULES-2559 - C68690 - Attempt to Apply DSC Package Resource with Package that Fails to Install'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'
download_url = 'http://int-resources.ops.puppetlabs.net/QA_resources/test_program/test_program_installer.exe'
install_path = 'C:\test_program'

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

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Teardown
teardown do
  step 'Remove Test Artifacts'
  on(agents, powershell("Start-Process \"#{install_path}\\uninstall.exe /S\" -Wait"))

  set_dsc_resource(
    agents,
    'file',
    dsc_module,
    :Ensure          => 'Absent',
    :Type            => 'File',
    :DestinationPath => dsc_props[:dsc_path]
  )
end

# Verify
error_msg = /Error:.*The return code 4 was not expected/m

# Setup
step 'Download Test Package'
set_dsc_resource(
  agents,
  'script',
  dsc_module,
  :GetScript  => 'return @{}',
  :TestScript => "Test-Path '#{dsc_props[:dsc_path]}'",
  :SetScript  => "(New-Object Net.WebClient).DownloadFile('#{download_url}', '#{dsc_props[:dsc_path]}')"
)

# Tests
agents.each do |agent|
  step 'Attempt to Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => 0) do |result|
    assert_match(error_msg, result.stderr, 'Expected error was not detected!')
  end
end
