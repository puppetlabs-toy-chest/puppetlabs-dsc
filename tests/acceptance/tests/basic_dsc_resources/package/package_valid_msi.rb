require 'erb'
require 'dsc_utils'
test_name 'MODULES-2559 - C68594 - Apply DSC Package Resource with Valid "Name", "Path" and "ProductID" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'
download_url = 'http://int-resources.ops.puppetlabs.net/QA_resources/python/python-2.7.10.msi'

# ERB Manifest
dsc_type = 'package'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure    => 'Present',
  :dsc_path      => "C:\\python.msi",
  :dsc_name      => 'Python 2.7.10',
  :dsc_productid => 'E2B51919-207A-43EB-AE78-733F9C6797C2'
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
    :Ensure    => 'Absent',
    :Path      => dsc_props[:dsc_path],
    :Name      => dsc_props[:dsc_name],
    :ProductId => dsc_props[:dsc_productid]
  )

  set_dsc_resource(
    agents,
    'file',
    dsc_module,
    :Ensure          => 'Absent',
    :Type            => 'File',
    :DestinationPath => dsc_props[:dsc_path]
  )
end

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
  step 'Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  assert_dsc_resource(
    agent,
    dsc_type,
    dsc_module,
    :Ensure    => dsc_props[:dsc_ensure],
    :Path      => dsc_props[:dsc_path],
    :Name      => dsc_props[:dsc_name],
    :ProductId => dsc_props[:dsc_productid]
  )
end
