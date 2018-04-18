require 'spec_helper_acceptance'

def apply_manifest(it_message, agent, dsc_manifest)
  it "#{it_message}" do
    on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end
  end
end

describe 'Group tests' do

  dsc_type = 'group'
  dsc_module = 'PSDesiredStateConfiguration'

  context 'Group Resource with Valid "GroupName" and "Members" Specified' do
    # 'MODULES-2523 - C68578 - Apply DSC Group Resource with Valid "GroupName" and "Members" Specified'
    dsc_props = {
        :dsc_ensure    => 'Present',
        :dsc_groupname => 'TestGroupMembers',
        :dsc_members   => '["Administrator","Guest"]'
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    after(:all) do
      set_dsc_resource(
          agents,
          dsc_type,
          dsc_module,
          :Ensure    => 'Absent',
          :GroupName  => dsc_props[:dsc_groupname]
      )
    end

    windows_agents.each do |agent|
      apply_manifest(
          'Applies Group manifest with Valid "GroupName" and "Members" Specified',
          agent,
          dsc_manifest
      )

      it 'New group with Groupname and Members present' do
        assert_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure    => dsc_props[:dsc_ensure],
            :GroupName => dsc_props[:dsc_groupname],
            :Members   => '@("Administrator","Guest")'
        )
      end
    end
  end

  context 'Apply DSC Group Resource that Removes a Group' do
    # 'MODULES-2523 - C68580 - Apply DSC Group Resource that Removes a Group'
    windows_agents.each do |agent|
      before(:all) do
        set_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure    => 'Present',
            :GroupName => 'RemoveGroup'
        )
      end

      dsc_props = {
          :dsc_ensure    => 'Absent',
          :dsc_groupname => 'RemoveGroup'
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(
          'Applies Group Resource that removes a Group',
          agent,
          dsc_manifest
      )

      it 'Removes the Group' do
        assert_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure    => dsc_props[:dsc_ensure],
            :GroupName => dsc_props[:dsc_groupname]
        )
      end
    end
  end

  context 'Apply DSC Group Resource with Valid Unicode "GroupName" Specified' do
    # 'MODULES-2523 - C68585 - Apply DSC Group Resource with Valid Unicode "GroupName" Specified
    windows_agents.each do |agent|
      test_manifest_name = 'test_manifest.pp'

      dsc_props = {
          :dsc_ensure    => 'Present',
          :dsc_groupname => "\u1134\u1169\u1185\u1173\u112D\u1117\u1114\u1135\u114E"
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      before(:all) do
        create_remote_file(agents, "/cygdrive/c/#{test_manifest_name}", dsc_manifest)
      end

      after(:all) do
        set_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure    => 'Absent',
            :GroupName  => dsc_props[:dsc_groupname]
        )
        on(agents, "rm -rf /cygdrive/c/#{test_manifest_name}")
      end

      apply_manifest(
          'Applies Group Resource with Valid Unicode "GroupName"',
          agent,
          dsc_manifest
      )

      expect_failure('Expected to fail because of MODULES-2593') do
        assert_dsc_resource(
            agent,
            dsc_type,
            dsc_module,
            :Ensure    => dsc_props[:dsc_ensure],
            :GroupName => dsc_props[:dsc_groupname]
        )
      end
    end
  end
end
