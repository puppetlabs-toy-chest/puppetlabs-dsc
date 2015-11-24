require 'erb'
require 'master_manipulator'
require 'dsc_utils'
test_name 'MODULES-2743 - C94803 - Apply DSC Manifest that Uses a Resource from a Duplicated Module'

# Init
local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'

puppet_agent_cache_path = 'C:\ProgramData\PuppetLabs\puppet\cache\lib\puppet_x'
pe_agent_cache_path = 'C:\ProgramData\PuppetLabs\puppet\var\lib\puppet_x'

dsc_partial_source_module_path = 'dsc_resources\xPSDesiredStateConfiguration'
dsc_target_parent_path = 'C:\Users\Administrator\Documents\WindowsPowerShell'
dsc_target_module_path = "#{dsc_target_parent_path}\\Modules\\Test\\xPSDesiredStateConfiguration"

ps_test_puppet_agent_cache_path = "if ( Test-Path #{puppet_agent_cache_path} ) { exit 0 } else { exit 1 }"

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
      'file',
      'PSDesiredStateConfiguration',
      :Ensure          => 'Absent',
      :Type            => 'Directory',
      :Force           => '$true',
      :DestinationPath => dsc_target_parent_path
    )

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
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Determine Correct Source Module Path'
    is_puppet_agent = on(agent,
                         powershell(ps_test_puppet_agent_cache_path, {'EncodedCommand' => true}),
                         :accept_all_exit_codes => true).exit_code

    if is_puppet_agent == 0
      dsc_source_module_path = "#{puppet_agent_cache_path}\\#{dsc_partial_source_module_path}"
    else
      dsc_source_module_path = "#{pe_agent_cache_path}\\#{dsc_partial_source_module_path}"
    end

    step 'Copy Vendored Resource to Different Location on $PSModulePath'
    set_dsc_resource(
      agent,
      'file',
      'PSDesiredStateConfiguration',
      :Ensure          => 'Present',
      :Type            => 'Directory',
      :Recurse         => '$true',
      :Force           => '$true',
      :SourcePath      => dsc_source_module_path,
      :DestinationPath => dsc_target_module_path
    )
  end
end

step 'Inject "site.pp" on Master'
site_pp = create_site_pp(master, :manifest => dsc_manifest)
inject_site_pp(master, get_site_pp_path(master), site_pp)

# Tests
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    step 'Run Puppet Agent'
    on(agent, puppet('agent -t --environment production'), :acceptable_exit_codes => 4) do |result|
      expect_failure('Expected to fail because of MODULES-2818') do
        assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
      end
    end

    step 'Verify Results'
    # After copying the module this breaks invocation for xService resource.
    # Fall back to using the packaged Service resource for verification.
    expect_failure('Expected to fail because of MODULES-2818') do
      assert_dsc_resource(
        agent,
        'Service',
        'PSDesiredStateConfiguration',
        :Name        => dsc_props[:dsc_name],
        :State       => dsc_props[:dsc_state],
        :StartupType => dsc_props[:dsc_startuptype]
      )
    end
  end
end
