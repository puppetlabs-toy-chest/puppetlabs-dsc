require 'spec_helper_acceptance'

def apply_manifest(dsc_manifest, it_message, agent)
  it "#{it_message} on #{agent}" do
    on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => [0, 2]) do |result|
      assert_no_match(/Error:/, result.stderr, 'Unexpected error was detected!')
    end
  end
end

def verify_dsc_package_resource (agent, dsc_type, dsc_module, dsc_props, it_message)
  it "#{it_message}" do
    if (dsc_props[:dsc_returncode] == nil)
      assert_dsc_resource(
          agent,
          dsc_type,
          dsc_module,
          :Ensure => dsc_props[:dsc_ensure],
          :Path => dsc_props[:dsc_path],
          :Name => dsc_props[:dsc_name],
          :ProductId => dsc_props[:dsc_productid]
      )
    else
      assert_dsc_resource(
          agent,
          dsc_type,
          dsc_module,
          :Ensure => dsc_props[:dsc_ensure],
          :Path => dsc_props[:dsc_path],
          :Name => dsc_props[:dsc_name],
          :ProductId => dsc_props[:dsc_productid],
          :ReturnCode => "[uint32[]]@(#{dsc_props[:dsc_returncode]})"
      )
    end
  end
end

describe 'Apply DSC Package resource' do

  dsc_type = 'package'
  dsc_module = 'PSDesiredStateConfiguration'

  context 'Apply DSC Package Resource that Installs EXE Package' do
    # 'MODULES-2559 - C68684 - Apply DSC Package Resource with Valid "Arguments" Specified'

    download_url = 'http://int-resources.ops.puppetlabs.net/QA_resources/7zip/7z920.exe'
    install_path = 'C:\7zip'

    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure => 'Present',
          :dsc_path => "C:\\7zip.exe",
          :dsc_name => '7-Zip 9.20',
          :dsc_productid => '',
          :dsc_arguments => "/S /D=#{install_path}"
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      before(:all) do
        set_dsc_resource(
            agent,
            'script',
            dsc_module,
            :GetScript => 'return @{}',
            :TestScript => "Test-Path '#{dsc_props[:dsc_path]}'",
            :SetScript => "(New-Object Net.WebClient).DownloadFile('#{download_url}', '#{dsc_props[:dsc_path]}')"
        )
      end

      after(:all) do
        on(agent, "cmd /c \"#{install_path}\\Uninstall.exe /S\"")

        set_dsc_resource(
            agent,
            'file',
            dsc_module,
            :Ensure => 'Absent',
            :Type => 'File',
            :DestinationPath => dsc_props[:dsc_path]
        )
      end

      apply_manifest(dsc_manifest, 'Applies manifest that installs package', agent)

      verify_dsc_package_resource(agent,
                                  dsc_type,
                                  dsc_module,
                                  dsc_props,
                                  'Package installed')
    end
  end

  context 'Apply DSC Package Resource that Installs and Uninstalls MSI Package' do
    # 'MODULES-2559 - C68682 - Apply DSC Package Resource that Uninstalls Package'

    download_url = 'http://int-resources.ops.puppetlabs.net/QA_resources/python/python-2.7.10.msi'

    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure => 'Present',
          :dsc_path => "C:\\python.msi",
          :dsc_name => 'Python 2.7.10',
          :dsc_productid => 'E2B51919-207A-43EB-AE78-733F9C6797C2'
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      before(:all) do
        set_dsc_resource(
            agent,
            'script',
            dsc_module,
            :GetScript => 'return @{}',
            :TestScript => "Test-Path '#{dsc_props[:dsc_path]}'",
            :SetScript => "(New-Object Net.WebClient).DownloadFile('#{download_url}', '#{dsc_props[:dsc_path]}')"
        )
      end

      after(:all) do
        set_dsc_resource(
            agent,
            'file',
            dsc_module,
            :Ensure => 'Absent',
            :Type => 'File',
            :DestinationPath => dsc_props[:dsc_path]
        )
      end

      apply_manifest(dsc_manifest, 'Applies manifest that installs package', agent)

      verify_dsc_package_resource(agent,
                                  dsc_type,
                                  dsc_module,
                                  dsc_props,
                                  'Package installed')

      dsc_props = {
          :dsc_ensure => 'Absent',
          :dsc_path => "C:\\python.msi",
          :dsc_name => 'Python 2.7.10',
          :dsc_productid => 'E2B51919-207A-43EB-AE78-733F9C6797C2'
      }

      dsc_remove_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(dsc_remove_manifest, 'Applies manifest that removes package', agent)

      verify_dsc_package_resource(agent,
                                  dsc_type,
                                  dsc_module,
                                  dsc_props,
                                  'Package removed')
    end
  end

  context 'Apply DSC Package Resource with Non-Zero "ReturnCode" Specified' do
    # 'MODULES-2559 - C92336 - Apply DSC Package Resource with Non-Zero "ReturnCode" Specified'

    local_files_root_path = ENV['FILES'] || 'spec/files'
    local_installer_file_path = File.join(local_files_root_path, 'test_installer', 'test_program_installer.exe')
    install_path = 'C:\test_program'
    uninstall_reg_key_path = 'Software\Microsoft\Windows\CurrentVersion\Uninstall\TestProgram'
    ps_uninstall_command = "Remove-Item -Recurse -Path HKLM:\\#{uninstall_reg_key_path}"

    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure => 'Present',
          :dsc_path => "C:\\test_program_installer.exe",
          :dsc_name => 'Test Program',
          :dsc_productid => '',
          :dsc_arguments => "/S /D=#{install_path}",
          :dsc_returncode => '4'
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      before(:all) do
        scp_to(agent, local_installer_file_path, dsc_props[:dsc_path])
      end

      after(:all) do
        _exec_dsc_script(agent, "if ( #{ps_uninstall_command} ) { exit 0 } else { exit 1 }")

        set_dsc_resource(
            agent,
            'file',
            dsc_module,
            :Ensure => 'Absent',
            :Type => 'File',
            :DestinationPath => dsc_props[:dsc_path]
        )

        set_dsc_resource(
            agent,
            'file',
            dsc_module,
            :Ensure => 'Absent',
            :Type => 'Directory',
            :Force => '$true',
            :Recurse => '$true',
            :DestinationPath => install_path
        )
      end

      apply_manifest(dsc_manifest, 'Applies manifest that installs package', agent)

      verify_dsc_package_resource(agent,
                                  dsc_type,
                                  dsc_module,
                                  dsc_props,
                                  'Package installed with expected return code')
    end
  end
end

