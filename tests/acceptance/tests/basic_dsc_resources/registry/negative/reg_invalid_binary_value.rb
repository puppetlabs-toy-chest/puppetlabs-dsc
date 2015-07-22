require 'erb'
require 'dsc_utils'
test_name 'MODULES-2230 - C68710 - Attempt to Apply DSC Registry Resource with Invalid "ValueData" Specified Binary Type'

# Init
test_dir_name = 'test'
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'registry'
dsc_props = {
  :dsc_ensure    => 'Present',
  :dsc_key       => 'HKEY_LOCAL_MACHINE\SOFTWARE\TestKey',
  :dsc_valuename => 'BadBinaryValue',
  :dsc_valuedata => 'This is not binary!',
  :dsc_valuetype => 'Binary'
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Verify
error_msg = /Convert property 'valuedata' value from type 'STRING' to/

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Attempt to Apply Manifest'
    expect_failure('Expected to fail because of MODULES-2194') do
      on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
        assert_no_match(error_msg, result.stderr, 'Unexpected error was detected!')
      end
    end
  end
end
