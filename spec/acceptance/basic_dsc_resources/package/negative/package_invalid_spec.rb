require 'spec_helper_acceptance'

def apply_manifest(dsc_manifest, it_message, agent, acceptable_exit_codes, expected_error_msg)
  it "#{it_message} on #{agent}" do
    on(agent, puppet('apply'), :stdin => dsc_manifest, :acceptable_exit_codes => acceptable_exit_codes) do |result|
      assert_match(expected_error_msg, result.stderr, 'Expected error was not detected!')
    end
  end
end

describe 'Negative package tests' do
  dsc_module = 'PSDesiredStateConfiguration'
  dsc_type = 'package'
  uninstall_reg_key_path = 'Software\Microsoft\Windows\CurrentVersion\Uninstall\TestProgram'
  ps_uninstall_command = "Remove-Item -Recurse -Path HKLM:\\#{uninstall_reg_key_path}"
  install_path = 'C:\test_program'
  local_files_root_path = ENV['FILES'] || 'spec/files'
  local_installer_file_path = File.join(local_files_root_path, 'test_installer', 'test_program_installer.exe')

  context 'Apply DSC Invalid Package Resources ' do
    windows_agents.each do |agent|
      # 'MODULES-2559 - C68690 - Attempt to Apply DSC Package Resource with Package that Fails to Install'
      dsc_props = {
          :dsc_ensure     => 'Present',
          :dsc_path       => "C:\\test_program_installer.exe",
          :dsc_name       => 'Test Program',
          :dsc_productid  => '',
          :dsc_arguments  => "/S /D=#{install_path}"
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      before(:all) do
        scp_to(agents, local_installer_file_path, dsc_props[:dsc_path])
      end

      after(:all) do
        _exec_dsc_script(agents, "if ( #{ps_uninstall_command} ) { exit 0 } else { exit 1 }")

        set_dsc_resource(
            agent,
            'file',
            dsc_module,
            :Ensure          => 'Absent',
            :Type            => 'File',
            :DestinationPath => dsc_props[:dsc_path]
        )

        set_dsc_resource(
            agent,
            'file',
            dsc_module,
            :Ensure          => 'Absent',
            :Type            => 'Directory',
            :Force           => '$true',
            :Recurse         => '$true',
            :DestinationPath => install_path
        )
      end

      apply_manifest(
          dsc_manifest,
          'Fails to apply manifest with package that does not install',
          agent,
          0,
          /Error:.*The return code 4 was not expected/
      )
    end
  end

  context 'Apply DSC Invalid MSI Package' do
    # 'MODULES-2559 - C68689 - Attempt to Apply DSC Package Resource with Invalid MSI Package Specified'
    download_url = 'http://int-resources.ops.puppetlabs.net/QA_resources/7zip/7z920.exe'

    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure    => 'Present',
          :dsc_path      => "C:\\python.msi",
          :dsc_name      => 'Python 2.7.10',
          :dsc_productid => 'B2E52010-307C-53EF-BF77-822E0B6707B1'
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      before(:all) do
        set_dsc_resource(
            agent,
            'script',
            dsc_module,
            :GetScript  => 'return @{}',
            :TestScript => "Test-Path '#{dsc_props[:dsc_path]}'",
            :SetScript  => "(New-Object Net.WebClient).DownloadFile('#{download_url}', '#{dsc_props[:dsc_path]}')"
        )
      end

      after(:all) do
        set_dsc_resource(
            agent,
            'file',
            dsc_module,
            :Ensure          => 'Absent',
            :Type            => 'File',
            :DestinationPath => dsc_props[:dsc_path]
        )
      end

      apply_manifest(
          dsc_manifest,
          'Fails to apply manifest with invalid msi package',
          agent,
          0,
          /Error:.*The specified Name .* and IdentifyingNumber .* do not match Name .* and IdentifyingNumber/
      )
    end
  end

  context 'Apply DSC Manifest with Invalid Package Path' do
    # 'MODULES-2559 - C68686 - Attempt to Apply DSC Package Resource with Invalid "Path" Specified'
    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure    => 'Present',
          :dsc_path      => "C:\\not_here_python.msi",
          :dsc_name      => 'Python 2.7.10',
          :dsc_productid => 'E2B51919-207A-43EB-AE78-733F9C6797C2'
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      apply_manifest(
          dsc_manifest,
          'Fails to apply manifest with invalid package path',
          agent,
          0,
          /Error:.*The given Path .* could not be found/
      )
    end
  end

  context 'Apply DSC Manifest with Invalid Product ID' do
    # 'MODULES-2559 - C68687 - Attempt to Apply DSC Package Resource with Invalid "ProductID" Specified'
    download_url = 'http://int-resources.ops.puppetlabs.net/QA_resources/python/python-2.7.10.msi'

    windows_agents.each do |agent|
      dsc_props = {
          :dsc_ensure    => 'Present',
          :dsc_path      => "C:\\python.msi",
          :dsc_name      => 'Python 2.7.10',
          :dsc_productid => 'B2E52010-307C-53EF-BF77-822E0B6707B1'
      }

      dsc_manifest = single_dsc_resource_manifest(dsc_type, dsc_props)

      before(:all) do
        set_dsc_resource(
            agent,
            'script',
            dsc_module,
            :GetScript  => 'return @{}',
            :TestScript => "Test-Path '#{dsc_props[:dsc_path]}'",
            :SetScript  => "(New-Object Net.WebClient).DownloadFile('#{download_url}', '#{dsc_props[:dsc_path]}')"
        )
      end

      after(:all) do
        set_dsc_resource(
            agent,
            'file',
            dsc_module,
            :Ensure          => 'Absent',
            :Type            => 'File',
            :DestinationPath => dsc_props[:dsc_path]
        )
      end

      apply_manifest(
          dsc_manifest,
          'Fails to apply manifest with invalid product id',
          agent,
          0,
          /Error:.*The specified Name .* and IdentifyingNumber .* do not match Name .* and IdentifyingNumber/
      )
    end
  end
end
