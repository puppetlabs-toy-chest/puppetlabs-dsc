require 'spec_helper_acceptance'

def apply_manifest(dsc_manifest, it_message, agent, expected_error_msg)
  it "#{it_message}" do
    on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => 0) do |result|
      assert_match(expected_error_msg, result.stderr, 'Expected error was not detected!')
    end
  end
end

describe 'Negative group tests' do

  dsc_type = 'group'

  context 'Apply DSC Group Resource with Non-existent Users Specified' do
    # 'MODULES-2523 - C68583 - Attempt to Apply DSC Group Resource with Non-existent Users Specified'
    dsc_props = {
        :dsc_ensure => 'Present',
        :dsc_groupname => 'crumbs',
        :dsc_members => '["dogman","catperson"]'
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    windows_agents.each do |agent|
      apply_manifest(
          dsc_manifest,
          'Fails to apply manifest with Non-existent Users',
          agent,
          'Could not find a principal with the provided name'
      )
    end
  end

  context 'Apply DSC Group Resource with Invalid "GroupName" Specified' do
    # 'MODULES-2523 - C68582 - Attempt to Apply DSC Group Resource with Invalid "GroupName" Specified'
    dsc_props = {
        :dsc_ensure => 'Present',
        :dsc_groupname => 'meow?'
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    windows_agents.each do |agent|
      apply_manifest(
          dsc_manifest,
          'Fails to apply manifest with Invalid "GroupName" Specified',
          agent,
          'The name meow? cannot be used'
      )
    end
  end

  context 'Apply DSC Group Resource with User Collision Between "MembersToExclude" and "MembersToInclude"' do
    # 'MODULES-2523 - C68584 - Attempt to Apply DSC Group Resource with User Collision Between "MembersToExclude" and "MembersToInclude"'
    dsc_props = {
        :dsc_ensure           => 'Present',
        :dsc_groupname        => 'Tension',
        :dsc_memberstoinclude => '["Administrator","Guest"]',
        :dsc_memberstoexclude => '["Administrator","Guest"]'
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    windows_agents.each do |agent|
      apply_manifest(
          dsc_manifest,
          'User Collision Between "MembersToExclude" and "MembersToInclude"',
          agent,
          'The same principal must not be included in both MembersToInclude and MembersToExclude'
      )
    end
  end
end
