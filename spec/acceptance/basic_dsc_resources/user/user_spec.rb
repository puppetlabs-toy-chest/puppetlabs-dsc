require 'spec_helper_acceptance'

describe 'User Tests' do

  context 'Attempt to Apply DSC User Resource with Invalid "Password" Specified' do
    # https://tickets.puppetlabs.com/browse/MODULES-2537

    dsc_type = 'user'
    dsc_module = 'PSDesiredStateConfiguration'
    dsc_props = {
      :dsc_ensure   => 'Present',
      :dsc_username => 'catsinhats',
      :dsc_password => "{'user' => 'incorrect', 'password' => ''}"
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    error_msg = /Error:.*password must not be empty/m

    windows_agents.each do | agent |
      it 'Should apply the manifest and encounter an error' do
        on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => 1) do |result|
          assert_match(error_msg, result.stderr, 'Expected error was not detected!')
        end
      end
    end
  end

  context 'Attempt to Apply DSC User Resource with Invalid Data Type for "PasswordNeverExpires" Specified' do
    # https://tickets.puppetlabs.com/browse/MODULES-2229

    dsc_type = 'user'
    dsc_module = 'PSDesiredStateConfiguration'
    dsc_props = {
      :dsc_ensure               => 'Present',
      :dsc_username             => 'goatkong',
      :dsc_passwordneverexpires => 2
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    error_msg = /Error:.*invalid value/m

    windows_agents.each do | agent |
      it 'Should apply the manifest and encounter an error' do
        on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => 1) do |result|
          assert_match(error_msg, result.stderr, 'Expected error was not detected!')
        end
      end
    end
  end

  context 'Attempt to Apply DSC User Resource with Invalid "UserName" Specified' do
    # https://tickets.puppetlabs.com/browse/MODULES-2229

    dsc_type = 'user'
    dsc_module = 'PSDesiredStateConfiguration'
    dsc_props = {
      :dsc_ensure   => 'Present',
      :dsc_username => 'not a valid user name for windows systems'
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    # Verify
    error_msg = /Error:.*The specified username is invalid/m

    windows_agents.each do | agent |
      it 'Should apply the manifest and encounter an error' do
        on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => 0) do |result|
          assert_match(error_msg, result.stderr, 'Expected error was not detected!')
        end
      end
    end
  end

  context 'Apply DSC User Resource that Removes a User' do
    # https://tickets.puppetlabs.com/browse/MODULES-2229

    dsc_type = 'user'
    dsc_module = 'PSDesiredStateConfiguration'
    dsc_props = {
      :dsc_ensure   => 'Present',
      :dsc_username => 'catmandew'
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    windows_agents.each do | agent |
      it 'Should apply the manifest successfully' do
        on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
          assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
        end
      end

      it 'Should apply the manifest to remove the user' do
        dsc_props[:dsc_ensure] = 'Absent'
        dsc_remove_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)
        on(agent, puppet('apply'), :stdin => dsc_remove_manifest, :acceptable_exit_codes => [0,2]) do |result|
          assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
        end
      end

      it 'Should verify the results' do
        assert_dsc_resource(
          agent,
          dsc_type,
          dsc_module,
          :Ensure   => 'Absent',
          :UserName => dsc_props[:dsc_username]
        )
      end
    end
  end

  context 'Apply DSC User Resource with Valid "UserName" and "Password" Specified' do
    # https://tickets.puppetlabs.com/browse/MODULES-2537

    username = 'specialcat'
    password = 'specialcatpassword'

    dsc_type = 'user'
    dsc_module = 'PSDesiredStateConfiguration'
    dsc_props = {
      :dsc_ensure   => 'Present',
      :dsc_username => username,
      :dsc_password => "{'user' => '#{username}', 'password' => '#{password}'}"
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    windows_agents.each do | agent |
      it 'Should apply a manifest with no errors' do
        on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0,2]) do |result|
          assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
        end
      end

      it 'Should verify the results' do
        assert_dsc_cred_resource(
          agent,
          username,
          password,
          dsc_type,
          dsc_module,
          :Password,
          :Ensure   => dsc_props[:dsc_ensure],
          :UserName => username
        )
      end

      it 'Should perform teardown' do
        set_dsc_resource(
          agents,
          dsc_type,
          dsc_module,
          :Ensure   => 'Absent',
          :UserName => username
        )
      end
    end
  end

  context 'Apply DSC User Resource with Valid Unicode "UserName" and "Password" Specified' do
    # https://tickets.puppetlabs.com/browse/MODULES-2537

    test_manifest_name = 'test_manifest.pp'
    username = "unicode"
    password = "\u11D4\u11D7\u11E8\u11F9\u118E\u1185\u118A\u11A0\u11A9\u11C5"

    dsc_type = 'user'
    dsc_module = 'PSDesiredStateConfiguration'
    dsc_props = {
      :dsc_ensure   => 'Present',
      :dsc_username => username,
      :dsc_password => "{'user' => '#{username}', 'password' => '#{password}'}"
    }

    dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

    windows_agents.each do | agent |
      create_remote_file(agent, "/cygdrive/c/#{test_manifest_name}", dsc_manifest)

      it 'Should apply a manifest with no errors' do
        on(agent, puppet("apply C:\\\\#{test_manifest_name}"), :acceptable_exit_codes => [0,2]) do |result|
          assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
        end
      end

      it 'Should verify the results' do
        expect_failure('Expected to fail because of MODULES-2588') do
          assert_dsc_cred_resource(
            agent,
            username,
            password,
            dsc_type,
            dsc_module,
            :Password,
            :Ensure   => dsc_props[:dsc_ensure],
            :UserName => username
          )
        end
      end

      it 'Should perform teardown' do
        set_dsc_resource(
          agents,
          dsc_type,
          dsc_module,
          :Ensure   => 'Absent',
          :UserName => username
        )
        on(agents, "rm -rf /cygdrive/c/#{test_manifest_name}")
      end
    end


  end
end