require 'dsc_utils'
test_name 'FM-2624 - C68526 - Apply DSC Resource Manifest with "requires" on Puppet Resource Type'

confine(:to, :platform => 'windows')

# Init
test_dir_name = 'test'

# In-line Manifest
test_dir_path = "C:/#{test_dir_name}"
test_file_path = "#{test_dir_path}/test.txt"
test_file_contents = 'catcat'

dsc_manifest = <<-MANIFEST
dsc_file {'tmp_file':
  dsc_ensure          => 'present',
  dsc_type            => 'File',
  dsc_destinationpath => '#{test_file_path}',
  dsc_contents        => '#{test_file_contents}',
  require             => File['#{test_dir_path}']
}
file {'#{test_dir_path}':
  ensure => 'directory'
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
