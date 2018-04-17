require 'spec_helper_acceptance'

def apply_manifest(dsc_manifest, it_message, agent)
  it "#{it_message} on #{agent}" do
    #require 'pry'; binding.pry
    on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0, 2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end
  end
end

def verify_environment_variable(dsc_type, dsc_module, agent, dsc_props, it_message)
  it "#{it_message}" do
    assert_dsc_resource(
        agent,
        dsc_type,
        dsc_module,
        :Ensure => dsc_props[:dsc_ensure],
        :Name => dsc_props[:dsc_name]
    )
  end
end

def verify_environment_variable_with_path(dsc_type, dsc_module, agent, dsc_props, it_message)
  it "#{it_message}" do
    assert_dsc_resource(
        agent,
        dsc_type,
        dsc_module,
        :Ensure => dsc_props[:dsc_ensure],
        :Name => dsc_props[:dsc_name],
        :Value => dsc_props[:dsc_value],
        :Path => "$#{dsc_props[:dsc_path]}"
    )
  end
end

describe 'Apply DSC "Environment" Resources' do

  dsc_type = 'environment'
  dsc_module = 'PSDesiredStateConfiguration'

  context 'can add and remove an environment variable with no value' do
    # MODULES-2501 - C68554 - Apply DSC Environment Resource that Deletes Environment Variable
    # MODULES-2501 - C68551 - Apply DSC Environment Resource with No "Value" Specified
    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure => 'present',
          :dsc_name => 'delete'
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(dsc_manifest, 'can add an environment variable', agent)
      verify_environment_variable(dsc_type, dsc_module , agent, dsc_props, 'environment variable is present')

      dsc_props = {
          :dsc_ensure => 'absent',
          :dsc_name => 'delete'
      }
      dsc_delete_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(dsc_delete_manifest, 'can remove an environment variable', agent)
      verify_environment_variable(dsc_type, dsc_module , agent, dsc_props, 'environment variable is removed')
    end
  end

  context 'can add and update and remove an environment variable with a value' do
    # MODULES-2501 - C68549 - Apply DSC Environment Resource for Existing Environment Variable
    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure => 'present',
          :dsc_name => 'update',
          :dsc_value => 'initial value',
          :dsc_path => false
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(dsc_manifest, 'can add an environment variable with a value', agent)
      verify_environment_variable_with_path(dsc_type, dsc_module , agent, dsc_props, 'environment variable is present')

      dsc_props = {
          :dsc_ensure => 'present',
          :dsc_name => 'update',
          :dsc_value => 'new_value',
          :dsc_path => false
      }
      dsc_update_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(dsc_update_manifest, 'can change the value', agent)
      verify_environment_variable_with_path(dsc_type, dsc_module , agent, dsc_props, 'environment variable value has changed')

      dsc_props = {
          :dsc_ensure => 'absent',
          :dsc_name => 'update',
          :dsc_path => false
      }
      dsc_delete_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(dsc_delete_manifest, 'can remove the environment variable', agent)
      verify_environment_variable_with_path(dsc_type, dsc_module , agent, dsc_props, 'environment variable is removed')
    end
  end

  context 'can add and remove an environment variable with PATH' do
    # MODULES-2501 - C68552 - Apply DSC Environment Resource that Updates the "PATH" Environment Variable
    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure => 'Present',
          :dsc_name => 'PATH',
          :dsc_value => 'C:\\kittens',
          :dsc_path => true
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(dsc_manifest, 'can add an environment variable with path', agent)
      verify_environment_variable_with_path(dsc_type, dsc_module , agent, dsc_props, 'environment variable is present')

      dsc_props = {
          :dsc_ensure => 'absent',
          :dsc_name => 'PATH',
          :dsc_value => 'C:\\kittens',
          :dsc_path => true
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(dsc_manifest, 'can remove an environment variable with a path', agent)
      verify_environment_variable_with_path(dsc_type, dsc_module , agent, dsc_props, 'environment variable is removed')
    end
  end
end
