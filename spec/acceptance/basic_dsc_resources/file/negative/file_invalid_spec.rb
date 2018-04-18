require 'spec_helper_acceptance'

def apply_manifest(dsc_manifest, it_message, agent, acceptable_exit_codes, expected_error_msg)
  it "#{it_message} on #{agent}" do
    on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => acceptable_exit_codes) do |result|
      assert_match(expected_error_msg, result.stderr, 'Expected error was not detected!')
    end
  end
end

describe 'Negative file tests' do

  dsc_type = 'file'

  context 'Apply DSC Invalid File Resources ' do
    windows_agents.each do |agent|
      # 'MODULES-2286 - C68788 - Attempt to Apply DSC File Resource with Invalid Data Type for "Force" Specified'
      dsc_props = {
          :dsc_ensure => 'Present',
          :dsc_destinationpath => 'C:\\test.file',
          :dsc_contents => 'You will never see this!',
          :dsc_force => 'cows'
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(
          dsc_manifest,
          'Fails to apply manifest with invalid data type for "Force"',
          agent,
          1,
          /invalid value: cows/
      )
    end

    windows_agents.each do |agent|
      # 'MODULES-2286 - C68569 - Attempt to Apply DSC File Resource with Invalid "DestinationPath" Specified'
      dsc_props = {
          :dsc_ensure          => 'Present',
          :dsc_destinationpath => 'K:\\test.file',
          :dsc_contents        => 'You will never see this!',
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(
          dsc_manifest,
          'Fails to Apply DSC File Resource with Invalid "DestinationPath"',
          agent,
          0,
          /Error: No such file or directory/
      )
    end

    windows_agents.each do |agent|
      # 'MODULES-2286 - C68571 - Attempt to Apply DSC File Resource with Invalid "SourcePath" Specified'
      dsc_props = {
          :dsc_ensure          => 'Present',
          :dsc_destinationpath => 'C:\\test.file',
          :dsc_sourcepath      => 'K:\\source\\does_not.exist',
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(
          dsc_manifest,
          'Fails to Apply DSC File Resource with Invalid "SourcePath"',
          agent,
          0,
          /Error:.*SourcePath must be accessible for current configuration./
      )
    end
  end
end
