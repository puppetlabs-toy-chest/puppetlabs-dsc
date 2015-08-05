require 'puppet/file_system'
require 'fileutils'
require 'win32/registry' if Puppet::Util::Platform.windows?
Puppet::Type.type(:base_dsc).provide(:powershell) do
  confine :operatingsystem => :windows
  defaultfor :operatingsystem => :windows

  commands :powershell =>
    if File.exists?("#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe")
      "#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe"
    elsif File.exists?("#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe")
      "#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe"
    else
      'powershell.exe'
    end

  desc <<-EOT
Applies DSC Resources by generating a configuration file and applying it.
EOT

  def initialize(value={})
    super(value)
    set_symlink_folder
  end

  # do nothing by default on non-Windows
  def set_symlink_folder; end

  if Puppet::Util::Platform.windows?
    # Ensure the symlink folder exists and is pointing to the proper location.
    # This also ensures the directory structure is in place prior to creating
    # the symlink, otherwise the symlink creation fails.
    def set_symlink_folder
      puppet_modules_vendor_folder = "#{get_program_files_dir}\\WindowsPowerShell\\Modules\\PuppetVendoredModules"
      return if Puppet::FileSystem.symlink?(puppet_modules_vendor_folder) &&
                Puppet::FileSystem.readlink(puppet_modules_vendor_folder) == vendored_modules_path

      recreate_link = false

      if Puppet::FileSystem.exist?(puppet_modules_vendor_folder)
        if Puppet::FileSystem.symlink?(puppet_modules_vendor_folder)
          recreate_link = true
          Puppet::FileSystem.unlink(puppet_modules_vendor_folder)
        else
          recreate_link = true
          FileUtils.mv puppet_modules_vendor_folder, "#{puppet_modules_vendor_folder}.#{Time.now.utc.strftime("%Y%m%d_%H%M%S_%L")}"
        end
      end

      if recreate_link || !Puppet::FileSystem.symlink?(puppet_modules_vendor_folder)
        Puppet.debug "Creating symlink at '#{puppet_modules_vendor_folder}' \n pointed to '#{vendored_modules_path}'."
        Puppet::FileSystem.dir_mkpath(puppet_modules_vendor_folder) if !Puppet::FileSystem.dir_exist?(puppet_modules_vendor_folder)
        Puppet::FileSystem.symlink(vendored_modules_path, puppet_modules_vendor_folder,{ :force => true})
      end
    end

    # Get the non-x86 program files path, no matter whether the process is
    # a 32 bit or 64 bit process. Shut off registry redirection and query
    # the ProgramFilesDir key to retrieve the program files value.
    def get_program_files_dir
      program_files_dir = nil
      begin
        hive = Win32::Registry::HKEY_LOCAL_MACHINE
        hive.open('SOFTWARE\Microsoft\Windows\CurrentVersion', Win32::Registry::KEY_READ | 0x100) do |reg|
          program_files_dir = reg['ProgramFilesDir']
        end
      rescue Win32::Registry::Error => e
        Puppet.warning "Error occurred attempting to read program files directory from registry, using default. \n Message: #{e.message}"
        program_files_dir = 'C:\Program Files'
      end

      program_files_dir
    end
  end

  def dsc_parameters
    resource.parameters_with_value.select do |p|
      p.name.to_s =~ /dsc_/
    end
  end

  def template_path
    File.expand_path('../../templates', __FILE__)
  end

  def vendored_modules_path
    File.expand_path(File.join(__FILE__, '..', '..', '..', '..', 'puppet_x', 'dsc_resources')).gsub(/\//,'\\')
  end

  def powershell_args
    ['-NoProfile', '-NonInteractive', '-NoLogo', '-ExecutionPolicy', 'Bypass', '-Command']
  end

  def exists?
    script_content = ps_script_content('test')
    Puppet.debug "\n" + script_content
    output = powershell(powershell_args, script_content)
    if ['true','false'].include?(output.to_s.strip.downcase)
      check = (output.to_s.strip.downcase == 'true')
      Puppet.debug "Dsc Resource Exists?: #{check}"
      Puppet.debug "dsc_ensure: #{resource[:dsc_ensure]}" if resource.parameters.has_key?(:dsc_ensure)
      Puppet.debug "ensure: #{resource[:ensure]}"
      check
    else
      fail(output)
    end
  end

  def create
    script_content = ps_script_content('set')
    Puppet.debug "\n" + script_content
    output = powershell(powershell_args, script_content)
    Puppet.debug "Dsc Resource Return: #{output}"
  end

  def destroy
    script_content = ps_script_content('set')
    Puppet.debug "\n" + script_content
    output = powershell(powershell_args, script_content)
    Puppet.debug "Dsc Resource Return: #{output}"
  end

  def munge_boolean(value)
    return true if value =~ (/^(true|t|yes|y|1)$/i)
    return false if value.empty? || value =~ (/^(false|f|no|n|0)$/i)

    raise ArgumentError.new "invalid value: #{value}"
  end

  def format_dsc_value(dsc_value)
    case
    when dsc_value.class.name == 'String'
      "'#{dsc_value}'"
    when dsc_value.class.ancestors.include?(Numeric)
      "#{dsc_value}"
    when [:true, :false].include?(dsc_value)
      "$#{dsc_value.to_s}"
    when ['trueclass','falseclass'].include?(dsc_value.class.name.downcase)
      "$#{dsc_value.to_s}"
    when dsc_value.class.name == 'Array'
      "@(" + dsc_value.collect{|m| format_dsc_value(m)}.join(', ') + ")"
    else
      fail "unsupported type #{dsc_value.class} of value '#{dsc_value}'"
    end
  end

  def ps_script_content(mode)
    dsc_invoke_method = mode
    @param_hash = resource
    template = ERB.new(File.new(template_path + "/invoke_dsc_resource.ps1.erb").read, nil, '-')
    template.result(binding)
  end
end
