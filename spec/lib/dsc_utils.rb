# Discover the path to the DSC module on a host.
#
# ==== Attributes
#
# * +host+ - A host with the DSC module installed. If an array of hosts is provided then
#   then only the first host will be used to determine the DSC module path.
#
# ==== Returns
#
# +string+ - The fully qualified path to the DSC module on the host. Empty string if
#   the DSC module is not installed on the host.
#
# ==== Raises
#
# +nil+
#
# ==== Examples
#
# locate_dsc_module(agent)
def locate_dsc_module(host)
  # Init
  host = host.kind_of?(Array) ? host[0] : host
  module_paths = host.puppet['modulepath'].split(host[:pathseparator])

  # Search the available module paths.
  module_paths.each do |module_path|
    dsc_module_path = "#{module_path}/dsc".gsub('\\', '/')
    ps_command = "Test-Path -Type Container -Path #{dsc_module_path}"

    if host.is_powershell?
      on(host, powershell("if ( #{ps_command} ) { exit 0 } else { exit 1 }"), :accept_all_exit_codes => true) do |result|
        if result.exit_code == 0
          return dsc_module_path
        end
      end
    else
      on(host, "test -d #{dsc_module_path}", :accept_all_exit_codes => true) do |result|
        if result.exit_code == 0
          return dsc_module_path
        end
      end
    end
  end

  # Return nothing if module is not installed.
  return ''
end

# Discover the path to the DSC module's vendored resources.
#
# ==== Attributes
#
# * +host+ - A host with the DSC module installed. If an array of hosts is provided then
#   then only the first host will be used to determine the DSC module path.
#
# ==== Returns
#
# +string+ - The fully qualified path to the DSC module on the host. Empty string if
#   the DSC module is not installed on the host.
#
# ==== Raises
#
# +nil+
#
# ==== Examples
#
# locate_dsc_vendor_resources(agent)
def locate_dsc_vendor_resources(host)
  # Init
  host = host.kind_of?(Array) ? host[0] : host
  libdir_path = on(host, puppet('config print libdir')).stdout.rstrip.gsub('\\', '/')
  dsc_module_path = locate_dsc_module(host)

  vendor_resource_path = 'puppet_x/dsc_resources'
  dsc_vendor_paths = ["#{libdir_path}/#{vendor_resource_path}",
                      "#{dsc_module_path}/lib/#{vendor_resource_path}"]

  # Search the available vendor paths.
  dsc_vendor_paths.each do |dsc_vendor_path|
    ps_command = "Test-Path -Type Container -Path #{dsc_vendor_path}"

    if host.is_powershell?
      on(host, powershell("if ( #{ps_command} ) { exit 0 } else { exit 1 }"), :accept_all_exit_codes => true) do |result|
        if result.exit_code == 0
          return dsc_vendor_path
        end
      end
    else
      on(host, "test -d #{dsc_vendor_path}", :accept_all_exit_codes => true) do |result|
        if result.exit_code == 0
          return dsc_vendor_path
        end
      end
    end
  end

  # Return nothing if module is not installed.
  return ''
end

# Get the absolute path to a vendored module's "pds1" file. If the module requested is
#   not found or has not been vendored then the requested DSC module name will be
#   returned.
#
# ==== Attributes
#
# * +host+ - A host with the DSC module installed. If an array of hosts is provided then
#     then only the first host will be used to determine the DSC module path.
# * +dsc_module+ - The DSC module for the specified resource type.
#
# ==== Returns
#
# +string+ - The fully qualified path to the DSC module on the host. Empty string if
#   the DSC module is not installed on the host.
#
# ==== Raises
#
# +nil+
#
# ==== Examples
#
# get_dsc_vendor_resource_abs_path(agent, dsc_module)
def get_dsc_vendor_resource_abs_path(host, dsc_module)
  # Init
  host = host.kind_of?(Array) ? host[0] : host
  dsc_vendor_path = locate_dsc_vendor_resources(host)
  dsc_vendor_module_path = "#{dsc_vendor_path}/#{dsc_module}/#{dsc_module}.psd1"

  ps_command = "Test-Path -Type Leaf -Path #{dsc_vendor_module_path}"

  if host.is_powershell?
    on(host, powershell("if ( #{ps_command} ) { exit 0 } else { exit 1 }"), :accept_all_exit_codes => true) do |result|
      if result.exit_code == 0
        return dsc_vendor_module_path
      end
    end
  else
    on(host, "test -f #{dsc_vendor_module_path}", :accept_all_exit_codes => true) do |result|
      if result.exit_code == 0
        return dsc_vendor_module_path
      end
    end
  end

  # If the vendored module is not found just return the DSC module name.
  return dsc_module
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

  return "try { if ( #{dsc_command} ) { exit 0 } else { exit 1 } } catch { Write-Host $_.Exception.Message; exit 1 }"
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
  utf8_ps_script = "\xEF\xBB\xBF".force_encoding('UTF-8') + ps_script.force_encoding('UTF-8')
  ps_launch = 'powershell.exe -ExecutionPolicy Bypass ' \
              '-NoLogo ' \
              '-NoProfile ' \
              "-File C:/#{temp_script}"

  block_on(hosts) do |host|
    #Create remote file with UTF-8 BOM
    create_remote_file(host, "/cygdrive/c/#{temp_script}", utf8_ps_script)

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
        dsc_full_module_path = get_dsc_vendor_resource_abs_path(hosts, dsc_module)
        ps_script = _build_dsc_command('Test', dsc_resource_type, dsc_full_module_path, dsc_properties)

        _exec_dsc_script(hosts, ps_script) do |result|
          assert(0 == result.exit_code, 'DSC resource not in desired state!')
        end
      end
    end
  end
end
