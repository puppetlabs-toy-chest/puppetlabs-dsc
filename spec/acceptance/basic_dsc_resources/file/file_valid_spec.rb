require 'spec_helper_acceptance'

def verify_dsc_file_resource (agent, dsc_type, dsc_module, dsc_props)
  assert_dsc_resource(
      agent,
      dsc_type,
      dsc_module,
      :Ensure => dsc_props[:dsc_ensure],
      :DestinationPath => dsc_props[:dsc_destinationpath],
      :Contents => dsc_props[:dsc_contents]
  )
end

describe 'Apply DSC "File" resource' do

  dsc_type = 'file'
  dsc_module = 'PSDesiredStateConfiguration'

  context 'A File Resource with Valid "DestinationPath" and "Contents" Specified' do
    before(:all) do
      @work_dir = SecureRandom.uuid
      @dsc_destinationpath = "C:\\#{@work_dir}\\test1.file"
      on(windows_agents, "mkdir -p /cygdrive/c/#{@work_dir}", :accept_all_exit_codes => true)
    end

    after(:all) do
      on(windows_agents, "rm -rf /cygdrive/c/#{@work_dir}", :accept_all_exit_codes => true)
    end

    windows_agents.each do |agent|
      it "should create and remove a file resource on #{agent.name}" do
        # Create the file
        dsc_props = {
            :dsc_ensure => 'Present',
            :dsc_destinationpath => @dsc_destinationpath,
            :dsc_contents => 'Cats go meow!',
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

        execute_manifest_on(agent, dsc_manifest, :expect_changes => true)
        verify_dsc_file_resource(agent, dsc_type, dsc_module, dsc_props)

        # Remove the file
        dsc_props = {
            :dsc_ensure => 'Absent',
            :dsc_destinationpath => @dsc_destinationpath,
            :dsc_contents => 'Cats go meow!',
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

        execute_manifest_on(agent, dsc_manifest, :expect_changes => true)
        verify_dsc_file_resource(agent, dsc_type, dsc_module, dsc_props)
      end
    end
  end

  context 'A DSC File Resource with Valid "DestinationPath" and "SourcePath" Specified' do
    before(:all) do
      @work_dir = SecureRandom.uuid
      @sourcepath = 'source.file'
      @destinationpath = 'test2.file'
      @source_file_contents = 'Dogs go bark!'

      create_remote_windows_directory(windows_agents, "C:\\#{@work_dir}")
      create_remote_windows_file(windows_agents, "C:\\#{@work_dir}\\#{@sourcepath}", @source_file_contents)
    end

    after(:all) do
      on(windows_agents, "rm -rf /cygdrive/c/#{@work_dir}", :accept_all_exit_codes => true)
    end

    windows_agents.each do |agent|
      it "creates a destination file from the source file on #{agent.name}" do
        dsc_props = {
            :dsc_ensure => 'Present',
            :dsc_destinationpath => "C:\\#{@work_dir}\\#{@destinationpath}",
            :dsc_sourcepath => "C:\\#{@work_dir}\\#{@sourcepath}"
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

        execute_manifest_on(agent, dsc_manifest, :expect_changes => true)

        result = on(agent, "cat /cygdrive/c/#{@work_dir}/#{@destinationpath}")
        expect(result.output.strip).to eq(@source_file_contents)
      end
    end
  end

  context 'File resource with Unicode fields' do
    # Due to round tripping UTF8 we need to set the manifest on the agent and then use puppet-apply
    context 'A DSC File Resource with Valid Unicode "Contents" Specified' do
      before(:all) do
        @work_dir = SecureRandom.uuid
        @test_file_name = 'test3.file'
        test_file_contents = "\u3172\u3142\u3144\u3149\u3151\u3167\u3169\u3159\u3158\u3140\u3145\u3176\u3145"
        dsc_props = {
            :dsc_ensure => 'Present',
            :dsc_destinationpath => "C:\\#{@work_dir}\\#{@test_file_name}",
            :dsc_contents => "#{test_file_contents}"
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)
        @test_manifest_name = 'test_manifest.pp'

        on(windows_agents, "mkdir -p /cygdrive/c/#{@work_dir}", :accept_all_exit_codes => true)
        create_remote_file(windows_agents, "/cygdrive/c/#{@work_dir}/#{@test_manifest_name}", dsc_manifest)
      end

      after(:all) do
        on(windows_agents, "rm -rf /cygdrive/c/#{@work_dir}", :accept_all_exit_codes => true)
      end

      windows_agents.each do |agent|
        it 'should not scramble UTF8 content in the destination file' do
          on(agent, puppet("apply C:\\\\#{@work_dir}\\\\#{@test_manifest_name}"), :acceptable_exit_codes => [0, 2]) do |result|
            expect(result.stderr).to_not match(/Error:/)
          end

          md5_result = on(agent, "md5sum /cygdrive/c/#{@work_dir}/#{@test_file_name}", :acceptable_exit_codes => 0)
          test_file_md5_sum_regex = /60d964865c387e3dde467eff47d6bbf1/

          if puppet_version(agent) >= '6'
            expect(md5_result.output).to match(test_file_md5_sum_regex)
          else
            # Due to UTF-8 bug found in MODULES-2310, DSC File resource doesn't handle Unicode content in puppet versions less than 6
            expect(md5_result.output).to_not match(test_file_md5_sum_regex)
          end
        end
      end
    end

    context 'File Resource with Valid Unicode "Destinationpath" Specified' do
      before(:all) do
        @work_dir = SecureRandom.uuid
        @test_manifest_name = 'test_manifest.pp'
        @test_file_name = "\u3172\u3142\u3144\u3149\u3151\u3167\u3169\u3159\u3158\u3140\u3145\u3176\u3145"
        dsc_props = {
            :dsc_ensure => 'Present',
            :dsc_destinationpath => "C:\\#{@work_dir}\\#{@test_file_name}",
            :dsc_contents => ''
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

        on(windows_agents, "mkdir -p /cygdrive/c/#{@work_dir}", :accept_all_exit_codes => true)
        create_remote_file(windows_agents, "/cygdrive/c/#{@work_dir}/#{@test_manifest_name}", dsc_manifest)
      end

      after(:all) do
        on(windows_agents, "rm -rf /cygdrive/c/#{@work_dir}", :accept_all_exit_codes => true)
      end

      windows_agents.each do |agent|
        it "should create a file with Unicode characters in the name on #{agent.name}" do
          on(agent, puppet("apply C:\\\\#{@work_dir}\\\\#{@test_manifest_name}"), :acceptable_exit_codes => [0, 2])
          if puppet_version(agent) >= '6'
            on(agent, "test -f /cygdrive/c/#{@work_dir}/#{@test_file_name}", :acceptable_exit_codes => 0)
          else
            # Due to UTF-8 bug found in MODULES-2310, DSC File resource doesn't handle Unicode content in puppet versions less than 6
            expect {on(agent, "test -f /cygdrive/c/#{@work_dir}/#{@test_file_name}", :acceptable_exit_codes => 0)}.to raise_error(Beaker::Host::CommandFailure)
          end
        end
      end
    end

    context 'File Resource with Valid Unicode "SourcePath" Specified' do
      before(:all) do
        @work_dir = SecureRandom.uuid
        @test_file_name = 'test4.file'
        @source_file_name = "\u3172\u3142\u3144\u3149\u3151\u3167\u3169\u3159\u3158\u3140\u3145\u3176\u3145"
        @source_file_contents = 'Dogs go woof!'

        dsc_props = {
            :dsc_ensure => 'Present',
            :dsc_destinationpath => "C:\\#{@work_dir}\\#{@test_file_name}",
            :dsc_sourcepath => "C:\\#{@work_dir}\\#{@source_file_name}"
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)
        @test_manifest_name = 'test_manifest.pp'

        on(windows_agents, "mkdir -p /cygdrive/c/#{@work_dir}", :accept_all_exit_codes => true)
        create_remote_file(windows_agents, "/cygdrive/c/#{@work_dir}/#{@test_manifest_name}", dsc_manifest)
        create_remote_file(windows_agents, "/cygdrive/c/#{@work_dir}/#{@source_file_name}", @source_file_contents)
      end

      after(:all) do
        on(windows_agents, "rm -rf /cygdrive/c/#{@work_dir}", :accept_all_exit_codes => true)
      end

      windows_agents.each do |agent|
        it "should create a file with Unicode characters in the SourcePath on #{agent.name}" do
          on(agent, puppet("apply C:\\\\#{@work_dir}\\\\#{@test_manifest_name}"), :acceptable_exit_codes => [0, 2]) do |result|
            if puppet_version(agent) >= '6'
              expect(result.stderr).to_not match(/Error:/)
            else
              # Due to UTF-8 bug found in MODULES-2310, DSC File resource doesn't handle Unicode content in puppet versions less than 6
              expect(result.stderr).to match(/Error:/)
            end
          end
        end
      end
    end
  end
end

