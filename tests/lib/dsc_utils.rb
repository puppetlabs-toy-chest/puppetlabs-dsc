# Configure the DSC LCM on a host.
#
# ==== Attributes
#
# * +hosts+ - A Windows Beaker host(s) running PowerShell DSC.
# * +refresh_mode+ - The desired LCM refresh mode. (Disabled, Push, Pull)
#
# ==== Returns
#
# +nil+
#
# ==== Raises
#
# +nil+
#
# ==== Examples
#
# configure_lcm(agents, 'Disabled')
def configure_lcm(hosts, refresh_mode = 'Disabled')
  # Init
  dsc_conf_manifest = <<-MANIFEST
  dsc::lcm_config {'configure_lcm':
    refresh_mode => '#{refresh_mode}'
  }
  MANIFEST

  # Configure
  on(hosts, puppet('apply'), :stdin => dsc_conf_manifest, :acceptable_exit_codes => [0,2]) do |result|
    assert_no_match(/Error:/, result.stderr, 'Failed to configure the DSC LCM!')
  end
end

# Build a PowerShell DSC command string.
#
# ==== Attributes
#
# * +dsc_method+ - The method (set, test) to use for the DSC command.
# * +dsc_resource_type+ - The DSC resource type name to verify.
# * +dsc_module+ - The DSC module for the specified resource type.
# * +dsc_properties+ - DSC properties to verify on resource.
#
# ==== Returns
#
# +nil+
#
# ==== Raises
#
# +nil+
#
# ==== Examples
#
# _build_dsc_command('Set',
#                    'File',
#                    'PSDesiredStateConfiguration',
#                    :DestinationPath=>'C:\test.txt',
#                    :Contents=>'catcat')
def _build_dsc_command(dsc_method, dsc_resource_type, dsc_module, dsc_properties)
  #Flatten hash into formatted string.
  dsc_prop_merge = '@{'
  dsc_properties.each do |k, v|
    dsc_prop_merge << "\"#{k}\"="

    if v =~ /^\$/
      dsc_prop_merge << "#{v};"
    elsif v =~ /^@/
      dsc_prop_merge << "#{v};"
    elsif v =~ /^(-|\[)?\d+$/
      dsc_prop_merge << "#{v};"
    elsif v =~ /^\[.+\].+$/     #This is for wacky type conversions
      dsc_prop_merge << "#{v};"
    else
      dsc_prop_merge << "\"#{v}\";"
    end
  end

  dsc_prop_merge.chop!
  dsc_prop_merge << '}'

  #Compose strings for PS command.
  dsc_command = "Invoke-DscResource -Name #{dsc_resource_type} " \
                "-Method #{dsc_method} " \
                "-ModuleName #{dsc_module} " \
                "-Verbose " \
                "-Property #{dsc_prop_merge}"

  return "if ( #{dsc_command} ) { exit 0 } else { exit 1 }"
end

# Execute a PowerShell script on a remote machine.
#
# ==== Attributes
#
# * +hosts+ - A Windows Beaker host(s) running PowerShell.
# * +ps_script+ - A PowerShell script to execute on the remote host.
#
# ==== Returns
#
# +Beaker::Result+
#
# ==== Raises
#
# +nil+
#
# ==== Examples
#
# _exec_dsc_script(master, 'Write-Host Hello')
def _exec_dsc_script(hosts, ps_script, &block)
  #Init
  temp_script = 'temp.ps1'
  utf8_bom = "\xEF\xBB\xBF"
  ps_launch = 'powershell.exe -ExecutionPolicy Bypass ' \
              '-NoLogo ' \
              '-NoProfile ' \
              "-File C:/#{temp_script}"

  block_on(hosts) do |host|
    #Create remote file with UTF-8 BOM
    create_remote_file(host, "/cygdrive/c/#{temp_script}", utf8_bom + ps_script)

    #Execute PowerShell script on host
    @result = on(host, ps_launch, :accept_all_exit_codes => true)

    #Also, let additional checking be performed by the caller.
    if block_given?
      case block.arity
        #block with arity of 0, just hand back yourself
        when 0
          yield self
        #block with arity of 1 or greater, hand back the result object
        else
          yield @result
      end
    end
    @result
  end
end

# Set a DSC resource on a host machine.
#
# ==== Attributes
#
# * +hosts+ - The target Windows host(s) for verification.
# * +dsc_resource_type+ - The DSC resource type name to verify.
# * +dsc_module+ - The DSC module for the specified resource type.
# * +dsc_properties+ - DSC properties to set on resource.
#
# ==== Returns
#
# +nil+
#
# ==== Raises
#
# +Minitest::Assertion+ - DSC failed to be set.
#
# ==== Examples
#
# set_dsc_resource('agents'
#                  'File',
#                  'PSDesiredStateConfiguration',
#                  :DestinationPath=>'C:\test.txt',
#                  :Contents=>'catcat')
def set_dsc_resource(hosts, dsc_resource_type, dsc_module, dsc_properties)
  # Init
  ps_script = _build_dsc_command('Set', dsc_resource_type, dsc_module, dsc_properties)

  _exec_dsc_script(hosts, ps_script)

  # Verify State
  assert_dsc_resource(hosts, dsc_resource_type, dsc_module, dsc_properties)
end

module Beaker
  module DSL
    module Assertions
      # Verify the expected state of a DSC resource on a given host.
      #
      # ==== Attributes
      #
      # * +hosts+ - The target Windows host(s) for verification.
      # * +dsc_resource_type+ - The DSC resource type name to verify.
      # * +dsc_module+ - The DSC module for the specified resource type.
      # * +dsc_properties+ - DSC properties to verify on resource.
      #
      # ==== Returns
      #
      # +nil+
      #
      # ==== Raises
      #
      # +Minitest::Assertion+ - DSC resource not in desired state.
      #
      # ==== Examples
      #
      # assert_dsc_resource(agents,
      #                     'File',
      #                     'PSDesiredStateConfiguration',
      #                     :DestinationPath=>'C:\test.txt',
      #                     :Contents=>'catcat')
      def assert_dsc_resource(hosts, dsc_resource_type, dsc_module, dsc_properties)
        # Init
        ps_script = _build_dsc_command('Test', dsc_resource_type, dsc_module, dsc_properties)

        _exec_dsc_script(hosts, ps_script) do |result|
          assert(0 == result.exit_code, 'DSC resource not in desired state!')
        end
      end

      # Verify that the PowerShell script.
      #
      # ==== Attributes
      #
      # * +host+ - The target Windows host(s) for verification.
      # * +user+ - A valid user account on target Windows host(s).
      # * +password+ - The password for the associated user account.
      # * +dsc_cred_param+ - The DSC resource parameter that requires a 'PSCredential' object.
      # * +dsc_resource_type+ - The DSC resource type name to verify.
      # * +dsc_module+ - The DSC module for the specified resource type.
      # * +dsc_properties+ - DSC properties to verify on resource.
      #
      # ==== Returns
      #
      # +nil+
      #
      # ==== Raises
      #
      # +Minitest::Assertion+ - DSC resource not in desired state.
      #
      # ==== Examples
      #
      # assert_dsc_cred_resource(agents,
      #                          'user1',
      #                          'secret',
      #                          'Password',
      #                          'User',
      #                          'PSDesiredStateConfiguration',
      #                          :UserName=>'user1',
      #                          :FullName=>'User One')
      def assert_dsc_cred_resource(hosts,
                                   user,
                                   password,
                                   dsc_resource_type,
                                   dsc_module,
                                   dsc_cred_param,
                                   dsc_properties)
        #Init
        ps_script = <<-SCRIPT
$secpasswd = ConvertTo-SecureString '#{password}' -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential ('#{user}', $secpasswd)\n
SCRIPT

        #Add credential to DSC properties
        dsc_properties[dsc_cred_param] = '$credentials'
        ps_script << _build_dsc_command('Test', dsc_resource_type, dsc_module, dsc_properties)

        _exec_dsc_script(hosts, ps_script) do |result|
          assert(0 == result.exit_code, 'DSC resource not in desired state!')
        end
      end
    end
  end
end
