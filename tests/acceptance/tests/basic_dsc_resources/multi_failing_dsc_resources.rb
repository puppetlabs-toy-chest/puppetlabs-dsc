require 'dsc_utils'
test_name 'FM-2624 - C87654 - Apply DSC Resource Manifest with Multiple Failing DSC Resources'

# In-line Manifest
test_dir_bad = "Q:/not/here"

dsc_manifest = <<-MANIFEST
dsc_file {'bad_test_dir_1':
  dsc_ensure          => 'present',
  dsc_type            => 'Directory',
  dsc_destinationpath => '#{test_dir_bad}_1'
}
dsc_file {'bad_test_dir_2':
  dsc_ensure          => 'present',
  dsc_type            => 'Directory',
  dsc_destinationpath => '#{test_dir_bad}_2'
}
MANIFEST

# Verify
error_msg = /Error:/

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Apply Manifest'
    on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
      expect_failure('expected to fail due to  MODULES-2194') do
        assert_match(error_msg, result.stderr, 'Expected error was not detected!')
      end
    end
  end
end
