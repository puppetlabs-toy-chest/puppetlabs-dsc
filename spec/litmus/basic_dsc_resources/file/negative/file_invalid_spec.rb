require 'spec_helper_acceptance_litmus'

shared_examples_for 'an error in a puppet run' do |dsc_manifest, expected_error_msg|
  it "should raise an error" do
    result = apply_manifest(dsc_manifest, :expect_failures => true)
    expect(result.stderr).to match(expected_error_msg)
  end
end

describe 'Negative file tests' do

  dsc_type = 'file'

  context 'DSC File resource with invalid data type for Force' do
      dsc_props = {
          :dsc_ensure => 'Present',
          :dsc_destinationpath => 'C:/test.file',
          :dsc_contents => 'You will never see this!',
          :dsc_force => 'cows'
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      it_should_behave_like 'an error in a puppet run', dsc_manifest, /invalid value: cows/
  end

  context 'DSC File resource with invalid data for DestinationPath' do
      dsc_props = {
          :dsc_ensure          => 'Present',
          :dsc_destinationpath => 'K:/test.file',
          :dsc_contents        => 'You will never see this!',
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      it_should_behave_like 'an error in a puppet run', dsc_manifest, /Error: The system cannot find the path specified./
  end

  context 'DSC File resource with invalid data for SourcePath' do
      dsc_props = {
          :dsc_ensure          => 'Present',
          :dsc_destinationpath => 'C:/test.file',
          :dsc_sourcepath      => 'K:/source/does_not.exist',
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      it_should_behave_like 'an error in a puppet run', dsc_manifest, /Error:.*SourcePath must be accessible for current configuration./
    end
end
