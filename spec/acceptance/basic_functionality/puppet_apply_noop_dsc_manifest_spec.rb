require 'spec_helper_acceptance'

describe 'Apply DSC Resource Manifest in "noop" Mode Using "puppet apply"' do
  #FM-2623 - C68509 - Apply DSC Resource Manifest in "noop" Mode Using "puppet apply"
  test_dir_name = 'test'
  test_dir_path = "C:/#{test_dir_name}"
  test_file_path = "#{test_dir_path}/test.txt"
  test_file_contents = 'catcat'

  dsc_manifest = test_file_path_manifest(test_dir_path, test_file_path, test_file_contents)

  context 'Apply noop manifest and verify no files created' do
    windows_agents.each do |agent|
      it 'runs noop on manifest' do
        on(agent, puppet('apply --noop'), :stdin => dsc_manifest, :acceptable_exit_codes => [0, 2]) do |result|
          assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
        end
      end

      it 'does not create files after noop manifest application' do
        expect_failure('Expect failure because nothing should have changed') do
          assert_dsc_resource(
              agent,
              'File',
              'PSDesiredStateConfiguration',
              :DestinationPath => test_file_path,
              :Contents => test_file_contents
          )
        end
      end
    end
  end
end

