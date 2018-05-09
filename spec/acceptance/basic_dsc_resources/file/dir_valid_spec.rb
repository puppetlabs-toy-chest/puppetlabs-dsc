require 'spec_helper_acceptance'

def verify_directory_resource(dsc_type, dsc_module, agent, dsc_props)
  assert_dsc_resource(
      agent,
      dsc_type,
      dsc_module,
      :Ensure => dsc_props[:dsc_ensure],
      :Type => dsc_props[:dsc_type],
      :DestinationPath => dsc_props[:dsc_destinationpath]
  )
end

describe 'Apply DSC "File" (directory) resource' do

  dsc_type = 'file'
  dsc_module = 'PSDesiredStateConfiguration'

  context 'A Directory Resource with Valid "DestinationPath" Specified' do
    before(:all) do
      @dsc_destinationpath = 'C:\test_dir'
      on(windows_agents, "rm -rf /cygdrive/c/test_dir", :accept_all_exit_codes => true)
    end

    after(:all) do
      on(windows_agents, "rm -rf /cygdrive/c/test_dir", :accept_all_exit_codes => true)
    end

    windows_agents.each do |agent|
      it "should create and remove a directory resource on #{agent.name}" do
        # Create the directory
        dsc_props = {
            :dsc_ensure => 'Present',
            :dsc_type => 'Directory',
            :dsc_destinationpath => @dsc_destinationpath,
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

        execute_manifest_on(agent, dsc_manifest, :expect_changes => true)
        verify_directory_resource(dsc_type, dsc_module, agent, dsc_props)

        # Destroy the directory
        dsc_props = {
            :dsc_ensure => 'Absent',
            :dsc_type => 'Directory',
            :dsc_destinationpath => @dsc_destinationpath,
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

        execute_manifest_on(agent, dsc_manifest, :expect_changes => true)
        verify_directory_resource(dsc_type, dsc_module, agent, dsc_props)
      end
    end
  end

  context 'DSC File (Directory) Resource with "Recurse" Enabled' do
    before(:all) do
      @sourcepath = 'source_dir'
      @destinationpath = 'test_dir'
      sub_dir_name = "sub_dir_test_"
      @test_dirs = 3.times.map { |n| "#{sub_dir_name}#{n}" }

      on(windows_agents, "mkdir -p /cygdrive/c/#{@sourcepath}", :accept_all_exit_codes => true)
      on(windows_agents, "mkdir -p /cygdrive/c/#{@sourcepath}/#{@test_dirs[0]}", :accept_all_exit_codes => true)
      on(windows_agents, "mkdir -p /cygdrive/c/#{@sourcepath}/#{@test_dirs[1]}", :accept_all_exit_codes => true)
      on(windows_agents, "mkdir -p /cygdrive/c/#{@sourcepath}/#{@test_dirs[2]}", :accept_all_exit_codes => true)

      on(windows_agents, "rm -rf /cygdrive/c/#{@destinationpath}", :accept_all_exit_codes => true)
    end

    after(:all) do
      on(windows_agents, "rm -rf /cygdrive/c/#{@sourcepath}", :accept_all_exit_codes => true)
      on(windows_agents, "rm -rf /cygdrive/c/#{@destinationpath}", :accept_all_exit_codes => true)
    end

    windows_agents.each do |agent|
      it "creates directories from source to destination recursively on #{agent.name}" do
        dsc_props = {
            :dsc_ensure => 'Present',
            :dsc_type => 'Directory',
            :dsc_destinationpath => 'C:\\' + @destinationpath,
            :dsc_sourcepath => 'C:\\' + @sourcepath,
            :dsc_recurse => 'true'
        }
        dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

        execute_manifest_on(agent, dsc_manifest, :expect_changes => true)

        @test_dirs.each do |testdir|
          expect(agent.file_exist?("/cygdrive/c/#{@destinationpath}/#{testdir}")).to be true
        end
      end
    end
  end

  context 'DSC File (Directory) Resource with Valid Unicode "DestinationPath" Specified' do
    before(:all) do
      @test_manifest_name = 'test_manifest.pp'
      @test_dir_name = "\u1134\u1169\u1185\u1173\u112D\u1117\u1114\u1135\u114E"
      dsc_props = {
          :dsc_ensure          => 'Present',
          :dsc_type            => 'Directory',
          :dsc_destinationpath => "C:\\#{@test_dir_name}"
      }
      @dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      create_remote_file(windows_agents, "/cygdrive/c/#{@test_manifest_name}", @dsc_manifest)
    end

    after(:all) do
      on(windows_agents, "rm -rf /cygdrive/c/#{@test_dir_name}")
      on(windows_agents, "rm -rf /cygdrive/c/#{@test_manifest_name}")
    end

    windows_agents.each do |agent|
      it "should create a directory with Unicode characters in the name on #{agent.name}" do
        on(agent, puppet("apply C:\\\\#{@test_manifest_name}"), :acceptable_exit_codes => [0, 2]) do |result|
          expect(result.stderr).to_not match(/Error:/)
        end

        # Due to UTF-8 bug found in MODULES-2310, DSC File resource doesn't handle Unicode names
        expect { on(agent, "test -f /cygdrive/c/#{@test_dir_name}", :acceptable_exit_codes => 0) }.to raise_error(Beaker::Host::CommandFailure)
      end
    end
  end
end
