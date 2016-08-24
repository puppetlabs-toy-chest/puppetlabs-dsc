require 'erb'
require 'master_manipulator'
require 'dsc_utils'
test_name 'MODULES-2700 - C94733 - Attempt to Apply DSC Resource for Black Listed "xChrome" Module'

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'msft_xchrome'
dsc_props = {
  :dsc_language  => 'en',
  :dsc_localpath => 'C:/Windows/Temp'
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Verify
error_msg = /Error:.*resource.*dsc_msft_xchrome/

# Setup
step 'Inject "site.pp" on Master'
site_pp = create_site_pp(master, :manifest => dsc_manifest)
inject_site_pp(master, get_site_pp_path(master), site_pp)

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Run Puppet Agent'
    on(agent, puppet('agent -t --environment production'), :acceptable_exit_codes => 1) do |result|
      assert_match(error_msg, result.stderr, 'Expected error was not detected!')
    end
  end
end
