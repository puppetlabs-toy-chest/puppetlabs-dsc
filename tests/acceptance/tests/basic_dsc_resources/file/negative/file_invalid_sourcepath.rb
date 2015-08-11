require 'erb'
require 'dsc_utils'
test_name 'MODULES-2286 - C68571 - Attempt to Apply DSC File Resource with Invalid "SourcePath" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'file'
dsc_props = {
  :dsc_ensure          => 'Present',
  :dsc_destinationpath => 'C:\test.file',
  :dsc_sourcepath      => 'K:\source\does_not.exist',
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Verify
error_msg = /Error:.*SourcePath must be accessible for current configuration./

# Tests
agents.each do |agent|
  step 'Attempt to Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => 0) do |result|
    assert_match(error_msg, result.stderr, 'Expected error was not detected!')
  end
end
