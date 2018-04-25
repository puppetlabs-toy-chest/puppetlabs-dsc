require 'spec_helper_acceptance'

def apply_manifest(dsc_manifest, it_message, agent, command = nil)
  it "#{it_message} on #{agent}" do
    on(agent, puppet("apply #{command}"), :stdin => dsc_manifest, :acceptable_exit_codes => [0, 2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end
  end
end

def verify_directory_resource(dsc_type, dsc_module, agent, dsc_props, it_message)
  it "#{it_message}" do
    assert_dsc_resource(
        agent,
        dsc_type,
        dsc_module,
        :Ensure => dsc_props[:dsc_ensure],
        :Type => dsc_props[:dsc_type],
        :DestinationPath => dsc_props[:dsc_destinationpath]
    )
  end
end

describe 'Apply DSC "File" (directory) resource' do

  dsc_type = 'file'
  dsc_module = 'PSDesiredStateConfiguration'

  context 'Create and Remove Directory Resource with Valid "DestinationPath" Specified' do
    # 'MODULES-2286 - C68564 - Apply DSC File (Directory) Resource with Valid "DestinationPath" Specified'
    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure => 'Present',
          :dsc_type => 'Directory',
          :dsc_destinationpath => 'C:\test_dir',
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(
          dsc_manifest,
          'Adds directory with valid "destinationpath" specified',
          agent
      )
      verify_directory_resource(dsc_type, dsc_module, agent, dsc_props, 'created correct directory')

      dsc_props = {
          :dsc_ensure => 'Absent',
          :dsc_type => 'Directory',
          :dsc_destinationpath => 'C:\test_dir',
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(
          dsc_manifest,
          'Removes directory with valid "destinationpath" specified',
          agent
      )

      verify_directory_resource(dsc_type, dsc_module, agent, dsc_props, 'removed created directory')
    end
  end

  context 'Apply DSC File (Directory) Resource with "Recurse" Enabled' do
    # MODULES-2286 - C68566 - Apply DSC File (Directory) Resource with "Recurse" Enabled
    windows_agents.each do |agent|
      sub_dir_name = "sub_dir_test_"
      dsc_props = {
          :dsc_ensure => 'Present',
          :dsc_type => 'Directory',
          :dsc_destinationpath => 'C:\test_dir',
          :dsc_sourcepath => 'C:\source_dir',
          :dsc_recurse => 'true'
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      before(:all) do
        3.times do |n|
          set_dsc_resource(
              agent,
              dsc_type,
              dsc_module,
              :Ensure => 'Present',
              :Type => dsc_props[:dsc_type],
              :DestinationPath => "#{dsc_props[:dsc_sourcepath]}\\#{sub_dir_name}#{n}"
          )
        end
      end

      after(:all) do
        set_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure => 'Absent',
            :Type => dsc_props[:dsc_type],
            :DestinationPath => dsc_props[:dsc_destinationpath],
            :Force => '$true',
            :Recurse => '$true'
        )
        set_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure => 'Absent',
            :Type => dsc_props[:dsc_type],
            :DestinationPath => dsc_props[:dsc_sourcepath],
            :Force => '$true',
            :Recurse => '$true'
        )
      end

      apply_manifest(
          dsc_manifest,
          'Adds directory with Resource with "Recurse" Enabled',
          agent
      )

      it 'created directories with recurse enabled' do
        3.times do |n|
          assert_dsc_resource(
              agent,
              dsc_type,
              dsc_module,
              :Ensure => dsc_props[:dsc_ensure],
              :Type => dsc_props[:dsc_type],
              :DestinationPath => "#{dsc_props[:dsc_destinationpath]}\\#{sub_dir_name}#{n}"
          )
        end
      end
    end
  end

  context 'Apply DSC File (Directory) Resource with Valid Unicode "DestinationPath" Specified' do
    windows_agents.each do |agent|
      test_manifest_name = 'test_manifest.pp'
      test_dir_name = "\u1134\u1169\u1185\u1173\u112D\u1117\u1114\u1135\u114E"
      dsc_props = {
          :dsc_ensure          => 'Present',
          :dsc_type            => 'Directory',
          :dsc_destinationpath => "C:\\#{test_dir_name}"
      }
      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      before(:all) do
        create_remote_file(agent, "/cygdrive/c/#{test_manifest_name}", dsc_manifest)
      end

      after(:all) do
        on(agent, "rm -rf /cygdrive/c/#{test_dir_name}")
        on(agent, "rm -rf /cygdrive/c/#{test_manifest_name}")
      end

      apply_manifest(
          dsc_manifest,
          'Addition of File (Directory) Resource with Valid Unicode "DestinationPath" Specified',
          agent,
          "C:\\\\#{test_manifest_name}"
      )

      it 'verifies file (directory) with UTF-8 DestinationPath exists' do
        expect_failure('due to UTF-8 bug found in MODULES-2310') do
          on(agent, "test -f /cygdrive/c/#{test_dir_name}", :acceptable_exit_codes => 0)
        end
      end
    end
  end
end


