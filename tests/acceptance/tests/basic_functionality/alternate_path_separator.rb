require 'erb'
require 'dsc_utils'
test_name 'FM-2623 - C68680 - Apply DSC Resource Manifest Containing Alternate Path Separators'

# Init
test_dir_name = 'test'
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
test_dir_path = "C:\\#{test_dir_name}"
test_file_path = "#{test_dir_path}\\test.txt"
test_file_contents = 'catcat'

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_functionality', 'test_file_path.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path)).result(binding)

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
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end

    step 'Verify Results'
    # Expected failure due to MODULES-1960 not being implemented yet.
    test_dsc_resource(agent, 'File', :expect_failure? => true, :DestinationPath => test_file_path.gsub("\\", '/'), :Contents => test_file_contents)
  end
end
