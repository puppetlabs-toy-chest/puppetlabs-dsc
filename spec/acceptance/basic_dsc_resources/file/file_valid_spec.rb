require 'spec_helper_acceptance'

def apply_manifest(dsc_manifest, it_message, agent, command = nil)
  it "#{it_message} on #{agent}" do
    on(agent, puppet("apply #{command}"), :stdin => dsc_manifest, :acceptable_exit_codes => [0, 2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end
  end
end

def verify_dsc_file_resource (agent, dsc_type, dsc_module, dsc_props, it_message)
  it "#{it_message}" do
    assert_dsc_resource(
        agent,
        dsc_type,
        dsc_module,
        :Ensure => dsc_props[:dsc_ensure],
        :DestinationPath => dsc_props[:dsc_destinationpath],
        :Contents => dsc_props[:dsc_contents]
    )
  end
end

describe 'Apply DSC "File" resource' do

  dsc_type = 'file'
  dsc_module = 'PSDesiredStateConfiguration'
  local_files_root_path = ENV['MANIFESTS'] || 'tests/manifests'
  dsc_manifest_template_path = File.join(local_files_root_path, 'basic_dsc_resources', 'dsc_single_resource.pp.erb')

  context 'File Resource with Valid "DestinationPath" and "Contents" Specified' do
    # 'MODULES-2286 - C68557 - Apply DSC File Resource with Valid "DestinationPath" and "Contents" Specified'
    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure => 'Present',
          :dsc_destinationpath => 'C:\test.file',
          :dsc_contents => 'Cats go meow!',
      }
      dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

      apply_manifest(
          dsc_manifest,
          'Addition of File Resource with Valid "DestinationPath" and "Contents" Specified',
          agent
      )

      verify_dsc_file_resource(agent,
                               dsc_type,
                               dsc_module,
                               dsc_props,
                               'Has valid File with "DesinationPath" and "Contents"')

      dsc_props = {
          :dsc_ensure => 'Absent',
          :dsc_destinationpath => 'C:\test.file',
          :dsc_contents => 'Cats go meow!',
      }
      dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

      apply_manifest(
          dsc_manifest,
          'Removal of File Resource with Valid "DestinationPath" and "Contents" Specified',
          agent
      )

      verify_dsc_file_resource(agent,
                               dsc_type,
                               dsc_module,
                               dsc_props,
                               'Removed file with "DesinationPath" and "Contents"')
    end
  end

  context 'DSC File Resource with Valid "DestinationPath" and "SourcePath" Specified' do
    #'MODULES-2286 - C68558 - Apply DSC File Resource with Valid "DestinationPath" and "SourcePath" Specified'
    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure => 'Present',
          :dsc_destinationpath => 'C:\test.file',
          :dsc_sourcepath => 'C:\source.file'
      }
      source_file_contents = 'Dogs go bark!'
      dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

      before(:all) do
        set_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure => 'Present',
            :DestinationPath => dsc_props[:dsc_sourcepath],
            :Contents => source_file_contents
        )
      end

      after(:all) do
        set_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure => 'Absent',
            :DestinationPath => dsc_props[:dsc_destinationpath]
        )

        set_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure => 'Absent',
            :DestinationPath => dsc_props[:dsc_sourcepath]
        )
      end

      apply_manifest(
          dsc_manifest,
          'Addition of File Resource with Valid "DestinationPath", "Sourcepath" and "Contents" Specified',
          agent
      )

      it 'has has correct "Contents"' do
        assert_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure => dsc_props[:dsc_ensure],
            :DestinationPath => dsc_props[:dsc_destinationpath],
            :Contents => source_file_contents,
            )
      end
    end
  end

  context 'File resource with Unicode fields' do
    test_manifest_name = 'test_manifest.pp'

    context 'Apply DSC File Resource with Valid Unicode "Contents" Specified' do
      # 'MODULES-2286 - C68560 - Apply DSC File Resource with Valid Unicode "Contents" Specified'
      windows_agents.each do |agent|
        test_file_name = 'test.file'
        test_file_md5_sum_regex = /60d964865c387e3dde467eff47d6bbf1  \/cygdrive\/c\/#{test_file_name}/
        test_file_contents = "\u3172\u3142\u3144\u3149\u3151\u3167\u3169\u3159\u3158\u3140\u3145\u3176\u3145"
        dsc_props = {
            :dsc_ensure => 'Present',
            :dsc_destinationpath => "C:\\#{test_file_name}",
            :dsc_contents => "#{test_file_contents}"
        }
        dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

        before(:all) do
          create_remote_file(agent, "/cygdrive/c/#{test_manifest_name}", dsc_manifest)
        end

        after(:all) do
          on(agent, "rm -rf /cygdrive/c/#{test_file_name}")
          on(agent, "rm -rf /cygdrive/c/#{test_manifest_name}")
        end

        apply_manifest(
            dsc_manifest,
            'Addition of File Resource with UTF-8 "Contents" specified',
            agent,
            "C:\\\\#{test_manifest_name}"
        )

        it 'has correct hash' do
          on(agent, "md5sum /cygdrive/c/#{test_file_name}", :acceptable_exit_codes => 0) do |result|
            expect_failure('Something fishy with the contents when applied using the DSC module and puppet apply vs doing directly') do
              assert_match(test_file_md5_sum_regex, result.stdout, 'Expected file content is invalid!')
            end
          end
        end
      end
    end

    context 'File Resource with Valid Unicode "Destinationpath" Specified' do
      # 'MODULES-2286 - C68559 - Apply DSC File Resource with Valid Unicode "DestinationPath" Specified'
      windows_agents.each do |agent|
        test_file_name = "\u3172\u3142\u3144\u3149\u3151\u3167\u3169\u3159\u3158\u3140\u3145\u3176\u3145"
        dsc_props = {
            :dsc_ensure => 'Present',
            :dsc_destinationpath => "C:\\#{test_file_name}",
            :dsc_contents => ''
        }
        dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

        before(:all) do
          create_remote_file(agent, "/cygdrive/c/#{test_manifest_name}", dsc_manifest,)
        end

        after(:all) do
          on(agent, "rm -rf /cygdrive/c/#{test_file_name}")
          on(agent, "rm -rf /cygdrive/c/#{test_manifest_name}")
        end

        apply_manifest(
            dsc_manifest,
            'Addition of File Resource with UTF-8 "DestinationPath" specified',
            agent,
            "C:\\\\#{test_manifest_name}"
        )

        it 'created file with UTF-8 file name' do
          expect_failure('due to UTF-8 bug found in MODULES-2310') do
            on(agent, "test -f /cygdrive/c/#{test_file_name}", :acceptable_exit_codes => 0)
          end
        end
      end
    end

    context 'File Resource with Valid Unicode "SourcePath" Specified' do
      # 'MODULES-2286 - C68560 - Apply DSC File Resource with Valid Unicode "SourcePath" Specified'
      windows_agents.each do |agent|
        test_file_name = 'test.file'
        source_file_name = "\u3172\u3142\u3144\u3149\u3151\u3167\u3169\u3159\u3158\u3140\u3145\u3176\u3145"
        dsc_props = {
            :dsc_ensure => 'Present',
            :dsc_destinationpath => "C:\\#{test_file_name}",
            :dsc_sourcepath => "C:\\#{source_file_name}"
        }
        dsc_manifest = ERB.new(File.read(dsc_manifest_template_path), 0, '>').result(binding)

        before(:all) do
          create_remote_file(agent, "/cygdrive/c/#{test_manifest_name}", dsc_manifest)
        end

        after(:all) do
          on(agent, "rm -rf /cygdrive/c/#{test_file_name}")
          on(agent, "rm -rf /cygdrive/c/#{test_manifest_name}")
        end

        apply_manifest(
            dsc_manifest,
            'Addition of File Resource with UTF-8 "SourcePath" specified',
            agent,
            "C:\\\\#{test_manifest_name}"
        )

        it 'creates file from UTF-8 sourcepath' do
          on(agent, "test -f /cygdrive/c/#{test_file_name}", :acceptable_exit_codes => 0)
        end
      end
    end
  end
end
