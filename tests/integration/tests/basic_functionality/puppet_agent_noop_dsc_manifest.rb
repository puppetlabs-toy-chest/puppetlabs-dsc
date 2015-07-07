require 'erb'
require 'master_manipulator'
require 'dsc_utils'
test_name 'FM-2623 - C68510 - Apply DSC Resource Manifest in "noop" Mode Using "puppet agent"'

# Init
test_dir_name = 'test'
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
test_dir_path = "C:/#{test_dir_name}"
test_file_path = "#{test_dir_path}/test.txt"
test_file_contents = 'catcat'

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_functionality', 'test_file_path.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path)).result(binding)

# Setup
step 'Inject "site.pp" on Master'
site_pp = create_site_pp(master, :manifest => dsc_manifest)
inject_site_pp(master, get_site_pp_path(master), site_pp)

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Run Puppet Agent'
    on(agent, puppet('agent -t --noop --environment production'), :acceptable_exit_codes => [0,2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end

    step 'Verify that No Changes were Made'
    test_dsc_resource(agent, 'File', :expect_failure? => true, :DestinationPath => test_file_path, :Contents => test_file_contents)
  end
end
