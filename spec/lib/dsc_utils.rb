def locate_dsc_module(expect_ps_failure)
  # Init
  module_paths = run_shell('puppet config print modulepath').stdout.delete("\n").delete("\r").split(';')
  # Search the available module paths.
  module_paths.each do |module_path|
    dsc_module_path = "#{module_path}/dsc".tr('\\', '/')
    ps_command = "Test-Path -Type Container -Path '#{dsc_module_path}'"
    run_shell("powershell.exe -NoProfile -Nologo -Command \"if ( #{ps_command} ) { exit 0 } else { exit 1 }\"", expect_failures: expect_ps_failure) do |result|
      if result.exit_code == 0
        return dsc_module_path
      end
    end
  end
  # Return nothing if module is not installed.
  ''
end

def locate_dsc_vendor_resources(expect_ps_failure)
  # Init
  libdir_path = run_shell('puppet config print libdir').stdout.rstrip.tr('\\', '/')
  dsc_module_path = locate_dsc_module(expect_ps_failure)

  vendor_resource_path = 'puppet_x/dsc_resources'
  dsc_vendor_paths = ["#{libdir_path}/#{vendor_resource_path}",
                      "#{dsc_module_path}/lib/#{vendor_resource_path}"]

  # Search the available vendor paths.
  dsc_vendor_paths.each do |dsc_vendor_path|
    ps_command = "Test-Path -Type Container -Path '#{dsc_vendor_path}'"
    run_shell("powershell.exe -NoProfile -NoLogo -Command \"if ( #{ps_command} ) { exit 0 } else { exit 1 }\"", expect_failures: expect_ps_failure) do |result|
      if result.exit_code == 0
        return dsc_vendor_path
      end
    end
  end
  # Return nothing if module is not installed.
  ''
end

def get_dsc_vendor_resource_abs_path(dsc_module, expect_ps_failure)
  dsc_vendor_path = locate_dsc_vendor_resources(expect_ps_failure)
  dsc_vendor_module_path = "#{dsc_vendor_path}/#{dsc_module}/#{dsc_module}.psd1"

  ps_command = "Test-Path -Type Leaf -Path '#{dsc_vendor_module_path}'"

  run_shell("powershell.exe -NoProfile -NoLogo -Command \"if ( #{ps_command} ) { exit 0 } else { exit 1 }\"", expect_failures: expect_ps_failure) do |result|
    if result.exit_code == 0
      return dsc_vendor_module_path
    end
  end

  # If the vendored module is not found just return the DSC module name.
  dsc_module
end

def _build_dsc_command(dsc_method, dsc_resource_type, dsc_module, dsc_properties)
  # Flatten hash into formatted string.
  dsc_prop_merge = '@{'
  dsc_properties.each do |k, v|
    dsc_prop_merge << "\"#{k}\"="

    dsc_prop_merge << if v =~ %r{^\$}
                        "#{v};"
                      elsif v =~ %r{^@}
                        "#{v};"
                      elsif v =~ %r{^(-|\[)?\d+$}
                        "#{v};"
                      elsif v =~ %r{^\[.+\].+$?} # This is for wacky type conversions
                        "#{v};"
                      else
                        "\"#{v}\";"
                      end
  end

  dsc_prop_merge.chop!
  dsc_prop_merge << '}'

  # Compose strings for PS command.
  dsc_command = "Invoke-DscResource -Name #{dsc_resource_type} " \
                "-Method #{dsc_method} " \
                "-ModuleName #{dsc_module} " \
                '-Verbose ' \
                "-Property #{dsc_prop_merge}"

  "if (#{dsc_command}) { exit 0 } else { exit 1 }"
end

def _exec_dsc_script(ps_script, expect_ps_failure, &block)
  # Init
  temp_script = 'temp.ps1'
  utf8_ps_script = "\xEF\xBB\xBF".force_encoding('UTF-8') + ps_script.force_encoding('UTF-8')
  ps_launch = "& C:/temp/#{temp_script}"

  # Create remote file with UTF-8 BOM
  create_windows_file('C:/temp', temp_script, utf8_ps_script)

  # Execute PowerShell script on host
  result = run_shell("powershell.exe -NoProfile -NoLogo -Command \"#{ps_launch}\"", expect_failures: expect_ps_failure)

  # Also, let additional checking be performed by the caller.
  if block_given?
    case block.arity
      # block with arity of 0, just hand back yourself
    when 0
      yield self
      # block with arity of 1 or greater, hand back the result object
    else
      yield result
    end
  end
  result
end

def assert_dsc_resource(dsc_resource_type, dsc_module, dsc_properties, expect_ps_failure = false, expect_dsc_failure = false)
  dsc_full_module_path = get_dsc_vendor_resource_abs_path(dsc_module, expect_ps_failure)
  ps_script = _build_dsc_command('Test', dsc_resource_type, dsc_full_module_path, dsc_properties)
  _exec_dsc_script(ps_script, expect_ps_failure) do |result|
    if expect_dsc_failure
      expect(result.exit_code).not_to eq(0)
    else
      expect(result.exit_code).to eq(0)
    end
    return result
  end
end
