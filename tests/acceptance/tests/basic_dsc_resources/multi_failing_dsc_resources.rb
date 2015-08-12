require 'dsc_utils'
test_name 'FM-2624 - C87654 - Apply DSC Resource Manifest with Multiple Failing DSC Resources'

confine(:to, :platform => 'windows')

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
error_msg_1 = /Error: The system cannot find the path specified\. The related file\/directory is: Q:\/not\/here_1\./
error_msg_2 = /Error: The system cannot find the path specified\. The related file\/directory is: Q:\/not\/here_2\./

# Tests
agents.each do |agent|
  step 'Apply Manifest'
  on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => 0) do |result|
    assert_match(error_msg_1, result.stderr, 'Expected error was not detected!')
    assert_match(error_msg_2, result.stderr, 'Expected error was not detected!')
  end
end
