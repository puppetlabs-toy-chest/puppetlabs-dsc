require 'erb'
require 'dsc_utils'
require 'securerandom'
require 'master_manipulator'
test_name 'MODULES-2538 - C89507 - Apply DSC Manifest for Creating a MySql Database Server'

# Init
mysql_msi_file = 'mysql-installer.msi'
sqlserver_dl_url = 'http://int-resources.ops.puppetlabs.net/QA_resources/microsoft_sql/mysql-installer-community-5.6.17.0.msi'
sqlserver_dl_version = '5.6.17.0'
sqlserver_dl_path = "C:\\#{mysql_msi_file}"
user = 'Admin' + SecureRandom.hex(2)
user_password = 'P@ssw0rd!'
mysql_instance = ('MYSQL' + SecureRandom.hex(2)).upcase
database_name = 'DB' + SecureRandom.hex(3)

# Teardown
teardown do
  step 'Remove Test Artifacts'
  confine_block(:to, :platform => 'windows') do
    expect_failure('expected to fail due to xMySQL DSC module releasing breaking changes from v2.x') do
      set_dsc_cred_resource(
          agents,
          user,
          user_password,
          'xMySqlServer',
          'xMySql',
          :RootPassword,
          :Ensure => 'Absent',
          :ServiceName => mysql_instance,
      )
    end
    on(agents, "rm -rf /cygdrive/c/#{mysql_msi_file}")
    on(agents, "rm -rf /cygdrive/c/temp.ps1")
  end
end

pp1 = <<-MANIFEST
dsc_script{ 'download_sqlserver_msi':
  dsc_getscript  => 'return @{}',
  dsc_testscript => "Test-Path '#{sqlserver_dl_path}'",
  dsc_setscript  => "(New-Object Net.WebClient).DownloadFile('#{sqlserver_dl_url}', '#{sqlserver_dl_path}')"
}
->
dsc_package {'mysql_source':
  dsc_path      => "#{sqlserver_dl_path}",
  dsc_productid => '437AC169-780B-47A9-86F6-14D43C8F596B',
  dsc_name      => "MySQL Installer",
  dsc_ensure    => 'Present',
}
->
dsc_user {'create_admin_user_#{user}':
  dsc_ensure    => 'Present',
  dsc_username  => '#{user}',
  dsc_disabled  => 'false',
  dsc_password  => {'user' => '#{user}', 'password' => '#{user_password}'},
}
->
dsc_group {'add_#{user}_to_admin_group':
  dsc_ensure    => 'Present',
  dsc_groupname => 'Administrators',
  dsc_memberstoinclude   => ['#{user}']
}
->
dsc_xmysqlserver {'mysql':
  dsc_ensure        => 'Present',
  dsc_rootpassword  => {'user' => '#{user}', 'password' => '#{user_password}'},
  dsc_mysqlversion  => '#{sqlserver_dl_version}',
}
MANIFEST

step 'Inject "site.pp" on Master'
site_pp = create_site_pp(master, :manifest => pp1)
inject_site_pp(master, get_site_pp_path(master), site_pp)

step 'Run Puppet Agent to create mysql instance'
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    on(agent, puppet('agent -t --environment production'), :stdin => pp1, :accept_all_exit_codes => true) do |result|
      expect_failure('expected to fail due to xMySQL DSC module releasing breaking changes from v2.x') do
        assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
      end
    end
  end
end

pp2 = <<-MANIFEST
dsc_xmysqlserver {'mysql':
  dsc_ensure        => 'Present',
  dsc_rootpassword  => {'user' => '#{user}', 'password' => '#{user_password}'},
}
->
dsc_xmysqldatabase {'create_database_#{database_name}':
  dsc_ensure  => 'Present',
  dsc_name    => '#{database_name}',
  dsc_connectioncredential => {'user' => '#{user}', 'password' => '#{user_password}'},
}
->
dsc_xmysqluser {'create_sqluser_#{user}':
  dsc_name => '#{user}',
  dsc_credential => {'user' => '#{user}', 'password' => '#{user_password}'},
  dsc_ensure => 'Present',
  dsc_connectioncredential => {'user' => '#{user}', 'password' => '#{user_password}'},
}
->
dsc_xmysqlgrant {'granting_#{user}_to_#{database_name}':
  dsc_username => '#{user}',
  dsc_databasename => '#{database_name}',
  dsc_permissiontype => 'ALL PRIVILEGES',
  dsc_ensure => 'Present',
  dsc_connectioncredential => {'user' => '#{user}', 'password' => '#{user_password}'},
}
MANIFEST

step 'Inject "site.pp" on Master'
site_pp = create_site_pp(master, :manifest => pp2)
inject_site_pp(master, get_site_pp_path(master), site_pp)

step 'Create mysql database'
confine_block(:to, :platform => 'windows') do
  agents.each do |agent|
    on(agent, puppet('agent -t --environment production'), :stdin => pp2, :accept_all_exit_codes => true) do |result|
      expect_failure('expected to fail due to xMySQL DSC module releasing breaking changes from v2.x') do
        assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
      end
    end
  end

  step 'Verify Results'
  expect_failure('expected to fail due to xMySQL DSC module releasing breaking changes from v2.x') do
    assert_dsc_cred_resource(
      agent,
      user,
      user_password,
      'xMySqlDatabase',
      'xMySql',
      :ConnectionCredential,
      :Ensure => 'Present',
      :Name => database_name,
    )
  end
end
