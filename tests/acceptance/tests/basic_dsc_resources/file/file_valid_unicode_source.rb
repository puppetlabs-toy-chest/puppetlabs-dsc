require 'erb'
require 'dsc_utils'
test_name 'MODULES-2286 - C68561 - Apply DSC File Resource with Valid Unicode "SourcePath" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'
test_manifest_name = 'test_manifest.pp'
test_manifest_path = "C:\\#{test_manifest_name}"
test_file_name = 'test.file'
source_file_name = "\u3172\u3142\u3144\u3149\u3151\u3167\u3169\u3159\u3158\u3140\u3145\u3176\u3145"

# ERB Manifest
dsc_type = 'file'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure          => 'Present',
  :dsc_type            => 'File',
  :dsc_destinationpath => 'C:/test.file',
  :dsc_sourcepath      => "C:\\#{source_file_name}"
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
    :Ensure          => 'Absent',
    :Type            => dsc_props[:dsc_type],
    :DestinationPath => dsc_props[:dsc_destinationpath]
  )
  set_dsc_resource(
    agents,
    dsc_type,
    dsc_module,
    :Ensure          => 'Absent',
    :Type            => dsc_props[:dsc_type],
    :DestinationPath => dsc_props[:dsc_sourcepath]
  )
  set_dsc_resource(
    agents,
    dsc_type,
    dsc_module,
    :Ensure          => 'Absent',
    :Type            => 'File',
    :DestinationPath => test_manifest_path
  )
end

# Verify
source_file_contents = 'Valid data!'

# Setup
create_remote_file(agents, "/#{test_manifest_name}", dsc_manifest)
set_dsc_resource(
  agents,
  dsc_type,
  dsc_module,
  :Ensure          => 'Present',
  :Type            => dsc_props[:dsc_type],
  :Contents        => source_file_contents,
  :DestinationPath => dsc_props[:dsc_sourcepath]
)

# Tests
agents.each do |agent|
  step 'Apply Manifest'
  on(agent, puppet("apply #{test_manifest_path}"), :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  expect_failure('Expected to fail because of MODULES-2310') do
    assert_dsc_resource(
      agent,
      dsc_type,
      dsc_module,
      :Ensure          => dsc_props[:dsc_ensure],
      :Type            => dsc_props[:dsc_type],
      :Contents        => source_file_contents,
      :DestinationPath => dsc_props[:dsc_destinationpath]
    )
  end
end
