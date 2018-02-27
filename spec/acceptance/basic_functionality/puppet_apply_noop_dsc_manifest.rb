require 'erb'
require 'dsc_utils'
test_name 'FM-2623 - C68509 - Apply DSC Resource Manifest in "noop" Mode Using "puppet apply"'

confine(:to, :platform => 'windows')

# Init
test_dir_name = 'test'
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
test_dir_path = "C:/#{test_dir_name}"
test_file_path = "#{test_dir_path}/test.txt"
test_file_contents = 'catcat'

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_functionality', 'test_file_path.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path)).result(binding)

# Tests
agents.each do |agent|
  step 'Apply Manifest'
  on(agent, puppet('apply --noop'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify that No Changes were Made'
  expect_failure('Expect failure because nothing should have changed') do
    assert_dsc_resource(
      agent,
      'File',
      'PSDesiredStateConfiguration',
      :DestinationPath => test_file_path,
      :Contents => test_file_contents
    )
  end
end
