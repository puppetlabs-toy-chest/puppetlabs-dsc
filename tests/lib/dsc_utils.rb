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
  #Init
  ps_launch = 'powershell.exe -ExecutionPolicy Bypass ' \
              '-InputFormat Text ' \
              '-OutputFormat Text ' \
              '-NoLogo ' \
              '-NoProfile ' \
              '-NonInteractive'

  #Flatten hash into formatted string.
  dsc_prop_merge = '@{'
  dsc_properties.each do |k, v|
    dsc_prop_merge << "\\\"#{k}\\\"="

    if v =~ /^\$/
      dsc_prop_merge << "\\#{v};"
    elsif v =~ /^@/
      dsc_prop_merge << "#{v.gsub(/\"/, '\\\"')};"
    elsif v =~ /^-?\d+$/
      dsc_prop_merge << "#{v};"
    else
      dsc_prop_merge << "\\\"#{v}\\\";"
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

  return "#{ps_launch} -Command \"if ( #{dsc_command} ) { exit 0 } else { exit 1 }\""
end

# Set a DSC resource on a host machine.
#
# ==== Attributes
#
# * +host+ - The target Windows host for verification.
# * +dsc_resource_type+ - The DSC resource type name to verify.
# * +dsc_module+ - The DSC module for the specified resource type.
# * +dsc_properties+ - DSC properties to verify on resource.
#
# ==== Returns
#
# +Beaker::Result+
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
def set_dsc_resource(host, dsc_resource_type, dsc_module, dsc_properties)
  # Init
  ps_command = _build_dsc_command('Set', dsc_resource_type, dsc_module, dsc_properties)

  # Execute Set Command
  on(host, ps_command, :acceptable_exit_codes => [0,1])

  # Verify State
  assert_dsc_resource(host, dsc_resource_type, dsc_module, dsc_properties)
end

module Beaker
  module DSL
    module Assertions
      # Verify the expected state of a DSC resource on a given host.
      #
      # ==== Attributes
      #
      # * +host+ - The target Windows host for verification.
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
      def assert_dsc_resource(host, dsc_resource_type, dsc_module, dsc_properties)
        # Init
        ps_command = _build_dsc_command('Test', dsc_resource_type, dsc_module, dsc_properties)

        on(host, ps_command, :acceptable_exit_codes => [0,1]) do |result|
          assert(0 == result.exit_code, 'DSC resource not in desired state!')
        end
      end
    end
  end
end
