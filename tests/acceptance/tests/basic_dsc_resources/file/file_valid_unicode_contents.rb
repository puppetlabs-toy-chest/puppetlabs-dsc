require 'erb'
require 'dsc_utils'
test_name 'MODULES-2286 - C68560 - Apply DSC File Resource with Valid Unicode "Contents" Specified'

confine(:to, :platform => 'windows')

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'
test_manifest_name = 'test_manifest.pp'
test_file_name = 'test.file'
test_file_contents = "\u3172\u3142\u3144\u3149\u3151\u3167\u3169\u3159\u3158\u3140\u3145\u3176\u3145"

# ERB Manifest
dsc_type = 'file'
dsc_module = 'PSDesiredStateConfiguration'
dsc_props = {
  :dsc_ensure          => 'Present',
  :dsc_destinationpath => "C:\\#{test_file_name}"
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Verify
test_file_md5_sum_regex = /6ba9d431f246339d2e659e71c6d1eb6a  \/cygdrive\/c\/#{test_file_name}/

# Teardown
teardown do
  step 'Remove Test Artifacts'
  on(agents, "rm -rf /cygdrive/c/#{test_file_name}")
  on(agents, "rm -rf /cygdrive/c/#{test_manifest_name}")
end

# Setup
create_remote_file(agents, "/cygdrive/c/#{test_manifest_name}", dsc_manifest)

# Tests
agents.each do |agent|
  step 'Apply Manifest'
  on(agent, puppet("apply C:\\\\#{test_manifest_name}"), :acceptable_exit_codes => [0,2]) do |result|
    expect_failure('Expected to fail because of MODULES-2310') do
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end
  end

  step 'Verify Results'
  on(agent, "md5sum /cygdrive/c/#{test_file_name}", :acceptable_exit_codes => 1) do |result|
    expect_failure('Expected to fail because of MODULES-2310') do
      assert_match(test_file_md5_sum_regex, result.stdout, 'Expected file content is invalid!')
    end
  end
end
