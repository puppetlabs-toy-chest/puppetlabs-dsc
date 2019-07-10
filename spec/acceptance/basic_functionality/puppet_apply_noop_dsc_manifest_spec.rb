require 'spec_helper_acceptance'

describe 'Apply DSC Resource Manifest in "noop" Mode Using "puppet apply"' do
  context 'Apply noop manifest and verify no files created' do
    it 'runs noop on manifest does not create files after noop manifest application' do
      dsc_manifest = <<-Manifest
      dsc_file {'tmp_folder':
          dsc_ensure          => 'present',
          dsc_type            => 'Directory',
          dsc_destinationpath => "C:/test",
      }
    
      dsc_file {'tmp_file':
          dsc_ensure          => 'present',
          dsc_type            => 'File',
          dsc_destinationpath => "C:/test/test.txt",
          dsc_contents        => 'catcat'
      }
      Manifest
      apply_manifest(dsc_manifest, :noop => true)
      
      result = assert_dsc_resource(
            'File',
            'PSDesiredStateConfiguration',
            true, # Passing true to expect_ps_failures. We expect this to fail.
            true, # Passing true to expect_dsdc_failures. We expect dsc to fail to find the resource.
            :DestinationPath => "C:/test/test.txt",
            :Contents => 'catcat',
        )
      result_string = strip_crln(result.stdout)
      expect(result_string).to match(/cannot find the path specified/)
    end
  end
end
