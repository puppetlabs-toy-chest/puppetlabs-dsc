require 'erb'
require 'master_manipulator'
require 'dsc_utils'
test_name 'MODULES-2296 - C68574 - Apply DSC Manifest with a Vendored Resource'

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

# ERB Manifest
dsc_type = 'xservice'
dsc_module = 'xPSDesiredStateConfiguration'
dsc_props = {
  :dsc_name        => 'w32time',
  :dsc_state       => 'Running',
  :dsc_startuptype => 'Automatic'
}

dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')
dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

# Teardown
teardown do
  confine_block(:to, :platform => 'windows') do
    step 'Remove Test Artifacts'
    set_dsc_resource(
      agents,
      dsc_type,
      dsc_module,
      :Name        => 'w32time',
      :State       => 'Stopped',
      :StartupType => 'Manual'
    )
  end
end

# Setup
step 'Inject "site.pp" on Master'
site_pp = create_site_pp(master, :manifest => dsc_manifest)
inject_site_pp(master, get_site_pp_path(master), site_pp)

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Run Puppet Agent'
    on(agent, puppet('agent -t --environment production'), :acceptable_exit_codes => [0,2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end

    step 'Verify Results'
    assert_dsc_resource(
      agent,
      dsc_type,
      dsc_module,
      :Name        => dsc_props[:dsc_name],
      :State       => dsc_props[:dsc_state],
      :StartupType => dsc_props[:dsc_startuptype]
    )
  end
end
