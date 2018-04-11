require 'dsc_utils'
test_name 'FM-2624 - C68527 - Apply DSC Resource Manifest with "before" on Puppet Resource Type'

confine(:to, :platform => 'windows')

# Init
test_dir_name = 'test'

# In-line Manifest
test_dir_path = "C:/#{test_dir_name}"
test_file_path = "#{test_dir_path}/test.txt"
test_file_contents = 'catcat'

dsc_manifest = <<-MANIFEST
file {'#{test_file_path}':
  ensure  => 'file',
  content => '#{test_file_contents}'
}
dsc_file {'tmp_folder':
  dsc_ensure          => 'present',
  dsc_type            => 'Directory',
  dsc_destinationpath => '#{test_dir_path}',
  before              => File['#{test_file_path}']
}
MANIFEST

# Teardown
teardown do
  step 'Remove Test Artifacts'
  on(agents, "rm -rf /cygdrive/c/#{test_dir_name}")
end

# Tests
agents.each do |agent|
  step 'Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
  end

  step 'Verify Results'
  assert_dsc_resource(
    agent,
    'File',
    'PSDesiredStateConfiguration',
    :DestinationPath => test_file_path,
    :Contents => test_file_contents
  )
end
