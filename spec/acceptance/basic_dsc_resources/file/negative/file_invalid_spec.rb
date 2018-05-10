require 'spec_helper_acceptance'

shared_examples_for 'an error in a puppet run' do |agent, dsc_manifest, expected_error_msg|
  it "should raise an error" do
    result = execute_manifest_on(agent, dsc_manifest, :expect_failures => true)
    expect(result.output).to match(expected_error_msg)
  end
end

describe 'Negative file tests' do

  dsc_type = 'file'

  context 'DSC File resource with invalid data type for Force' do
    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure => 'Present',
          :dsc_destinationpath => 'C:\\test.file',
          :dsc_contents => 'You will never see this!',
          :dsc_force => 'cows'
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      it_should_behave_like 'an error in a puppet run', agent, dsc_manifest, /invalid value: cows/
    end
  end

  context 'DSC File resource with invalid data for DestinationPath' do
    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure          => 'Present',
          :dsc_destinationpath => 'K:\\test.file',
          :dsc_contents        => 'You will never see this!',
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      it_should_behave_like 'an error in a puppet run', agent, dsc_manifest, /Error: No such file or directory/
    end
  end

  context 'DSC File resource with invalid data for SourcePath' do
    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure          => 'Present',
          :dsc_destinationpath => 'C:\\test.file',
          :dsc_sourcepath      => 'K:\\source\\does_not.exist',
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      it_should_behave_like 'an error in a puppet run', agent, dsc_manifest, /Error:.*SourcePath must be accessible for current configuration./
    end
  end
end
