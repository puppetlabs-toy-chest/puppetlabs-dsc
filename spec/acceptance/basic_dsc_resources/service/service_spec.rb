require 'spec_helper_acceptance'

describe 'Service tests' do

  context 'Attempt to Apply DSC Service Resource with Incompatible "StartupType" and "State"' do
    # https://tickets.puppetlabs.com/browse/MODULES-2336

    dsc_type = 'service'
    dsc_props = {
      :dsc_name        => 'w32time',
      :dsc_state       => 'Running',
      :dsc_startuptype => 'Disabled'
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    # Verify
    error_msg = /Error\:.*Dsc_service\[service_test\]:.*Cannot start and disable a service/m

    windows_agents.each do | agent |
      it 'Should apply the manifest and encounter an error' do
        on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
          assert_match(error_msg, result.stderr, 'Expected error was not detected!')
        end
      end
    end
  end

  context 'Attempt to Apply DSC Service Resource with Invalid "Name" Specified' do
    # https://tickets.puppetlabs.com/browse/MODULES-2336

    dsc_type = 'service'
    dsc_props = {
      :dsc_name        => 'makebelieve',
      :dsc_state       => 'Running',
      :dsc_startuptype => 'Automatic'
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    error_msg = /Error: PowerShell DSC resource MSFT_ServiceResource.*Dsc_service\[service_test\].*The service 'makebelieve' does not exist/m

    windows_agents.each do | agent |
      it 'Should apply the manifest and encounter an error.' do
        on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
          assert_match(error_msg, result.stderr, 'Expected error was not detected!')
        end
      end
    end
  end

  context 'Apply DSC Service Resource that Removes a Service' do
    # https://tickets.puppetlabs.com/browse/MODULES-2511
    dsc_type = 'service'
    dsc_module = 'PSDesiredStateConfiguration'
    dsc_props = {
      :dsc_ensure => 'Absent',
      :dsc_name   => 'puppet'
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    windows_agents.each do | agent |
      it 'Should apply a manifest with no errors.' do
        on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
          assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
        end
      end

      it 'Should verify results' do
        expect_failure('Expected to fail because of MODULES-2512') do
          assert_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure => dsc_props[:dsc_ensure],
            :Name   => dsc_props[:dsc_name]
          )
        end
      end
    end
  end

  context 'Apply DSC Service Resource with Valid "Name", "StartupType" and "State" Specified' do
    # https://tickets.puppetlabs.com/browse/MODULES-2264

    dsc_type = 'service'
    dsc_module = 'PSDesiredStateConfiguration'
    dsc_props = {
      :dsc_name        => 'w32time',
      :dsc_state       => 'Running',
      :dsc_startuptype => 'Automatic'
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    windows_agents.each do | agent |
      it 'Should apply a manifest with no errors' do
        on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
          assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
        end
      end

      it 'Should verify results' do
        assert_dsc_resource(
          agent,
          dsc_type,
          dsc_module,
          :Name        => dsc_props[:dsc_name],
          :State       => dsc_props[:dsc_state],
          :StartupType => dsc_props[:dsc_startuptype]
        )
      end

      it 'Should perform cleanup' do
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
  end

end
