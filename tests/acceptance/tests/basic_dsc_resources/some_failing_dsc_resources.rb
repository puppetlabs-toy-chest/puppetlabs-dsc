require 'dsc_utils'
test_name 'FM-2624 - C68533 - Apply DSC Resource Manifest with Mix of Passing and Failing DSC Resources'

skip_test('Expected to fail due to MODULES-2194')

# Init
test_dir_name = 'test'

# In-line Manifest
test_dir_good = "C:/#{test_dir_name}"
test_dir_bad = "Q:/not/here"

dsc_manifest = <<-MANIFEST
dsc_file {'good_test_dir':
  dsc_ensure          => 'present',
  dsc_type            => 'Directory',
  dsc_destinationpath => '#{test_dir_good}'
}
dsc_file {'bad_test_dir':
  dsc_ensure          => 'present',
  dsc_type            => 'Directory',
  dsc_destinationpath => '#{test_dir_bad}'
}
MANIFEST

# Verify
error_msg = /Error:/

# Teardown
teardown do
  confine_block(:to, :platform => 'windows') do
    step 'Remove Test Artifacts'
    on(agents, "rm -rf /cygdrive/c/#{test_dir_name}")
  end
end

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Apply Manifest'
    on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
      assert_match(error_msg, result.stderr, 'Expected error was not detected!')
    end
  end
end
