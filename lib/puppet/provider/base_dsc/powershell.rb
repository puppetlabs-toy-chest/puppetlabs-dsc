require 'pathname'
require 'json'
if Puppet::Util::Platform.windows?
  require_relative '../../../puppet_x/puppetlabs/powershell_manager'
  require_relative '../../../puppet_x/puppetlabs/compatible_powershell_version'
end

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

  PUPPET_UPGRADE_MSG = <<-UPGRADE
  Currently, the dsc module has reduced functionality on this agent
  due to one or more of the following conditions:
  - Puppet 3.x (non-x64 version)
    Puppet 3.x uses a Ruby version that requires a library to support a colored
    console. Unfortunately this library prevents the PowerShell module from
    using a shared PowerShell process to dramatically improve the performance of
    resource application.
  To enable these improvements, it is suggested to upgrade to any x64 version of
  Puppet (including 3.x), or to a Puppet version newer than 3.x.
  UPGRADE

  DSC_MODULE_POWERSHELL_UPGRADE_MSG = <<-UPGRADE
  Currently, the dsc module has reduced functionality on this agent
  due to one or more of the following conditions:
  - A PowerShell less than 5.0
    The dsc module requires PowerShell v5.0 or greater to function. THe cmdlet
    Invoke-DscResource was introduced in v5.0, and is necessary for the dsc module
    to work
  To enable these improvements, it is suggested to upgrade to any x64 version of
  Puppet (including 3.x), or to a Puppet version newer than 3.x and ensure you
  have at least PowerShell v5.0 installed.
  UPGRADE

  def self.upgrade_message
    Puppet.warning PUPPET_UPGRADE_MSG if !@upgrade_warning_issued
    @upgrade_warning_issued = true
  end

  def self.vendored_modules_path
    File.expand_path(Pathname.new(__FILE__).dirname + '../../../' + 'puppet_x/dsc_resources')
  end

  def dsc_parameters
    resource.parameters_with_value.select do |p|
      p.name.to_s =~ /dsc_/
    end
  end

  def self.template_path
    File.expand_path('../../templates/dsc', __FILE__)
  end

  def self.powershell_args
    ps_args = ['-NoProfile', '-NonInteractive', '-NoLogo', '-ExecutionPolicy', 'Bypass']
    ps_args << '-Command' if !PuppetX::Dsc::PowerShellManager.supported?
    ps_args
  end

  def ps_manager
    debug_output = Puppet::Util::Log.level == :debug
    manager_args = "#{command(:powershell)} #{self.class.powershell_args().join(' ')}"
    PuppetX::Dsc::PowerShellManager.instance(manager_args, debug_output)
  end

  COMMAND_TIMEOUT = 1200000 # 20 minutes

  def exists?
    version = Facter.value(:powershell_version)
    Puppet.debug "PowerShell Version: #{version}"
    script_content = ps_script_content('test')
    Puppet.debug "\n" + script_content
    
    fail DSC_MODULE_POWERSHELL_UPGRADE_MSG if !PuppetX::Dsc::PowerShellManager.compatible_version_of_powershell?

    if !PuppetX::Dsc::PowerShellManager.supported?
      self.class.upgrade_message
      output = powershell(self.class.powershell_args, script_content)
    else
      output = ps_manager.execute(script_content, COMMAND_TIMEOUT)[:stdout]
    end
    Puppet.debug "Dsc Resource returned: #{output}"
    data = JSON.parse(output)
    fail(data['errormessage']) if !data['errormessage'].empty?
    exists = data['indesiredstate']
    Puppet.debug "Dsc Resource Exists?: #{exists}"
    Puppet.debug "dsc_ensure: #{resource[:dsc_ensure]}" if resource.parameters.has_key?(:dsc_ensure)
    Puppet.debug "ensure: #{resource[:ensure]}"
    exists
  end

  def create
    script_content = ps_script_content('set')
    Puppet.debug "\n" + script_content

    fail DSC_MODULE_POWERSHELL_UPGRADE_MSG if !PuppetX::Dsc::PowerShellManager.compatible_version_of_powershell?

    if !PuppetX::Dsc::PowerShellManager.supported?
      self.class.upgrade_message
      output = powershell(self.class.powershell_args, script_content)
    else
      output = ps_manager.execute(script_content, COMMAND_TIMEOUT)[:stdout]
    end
    Puppet.debug "Create Dsc Resource returned: #{output}"
    data = JSON.parse(output)

    fail(data['errormessage']) if !data['errormessage'].empty?

    notify_reboot_pending if data['rebootrequired'] == true

    data
  end

  def destroy
    script_content = ps_script_content('set')
    Puppet.debug "\n" + script_content

    fail DSC_MODULE_POWERSHELL_UPGRADE_MSG if !PuppetX::Dsc::PowerShellManager.compatible_version_of_powershell?

    if !PuppetX::Dsc::PowerShellManager.supported?
      self.class.upgrade_message
      output = powershell(self.class.powershell_args, script_content)
    else
      output = ps_manager.execute(script_content, COMMAND_TIMEOUT)[:stdout]
    end
    Puppet.debug "Destroy Dsc Resource returned: #{output}"
    data = JSON.parse(output)

    fail(data['errormessage']) if !data['errormessage'].empty?

    notify_reboot_pending if data['rebootrequired'] == true

    data
  end

  def notify_reboot_pending
    Puppet.info "A reboot is required to progress further. Notifying Puppet."

    reboot_resource = resource.catalog.resource(:reboot, 'dsc_reboot')
    unless reboot_resource
      Puppet.warning "No reboot resource found in the graph that has 'dsc_reboot' as its name. Cannot signal reboot to Puppet."
      return
    end

    if reboot_resource.provider.respond_to?(:reboot_required)
      # internal API used to let reboot resource knows a reboot is pending
      reboot_resource.provider.reboot_required = true
    else
      Puppet.warning "Reboot module must be updated, since resource does not have :reboot_required method implemented. Cannot signal reboot to Puppet."
      return
    end
  end

  def self.format_dsc_value(dsc_value)
    case
    when dsc_value.class.name == 'String'
      "'#{escape_quotes(dsc_value)}'"
    when dsc_value.class.ancestors.include?(Numeric)
      "#{dsc_value}"
    when [:true, :false].include?(dsc_value)
      "$#{dsc_value.to_s}"
    when ['trueclass','falseclass'].include?(dsc_value.class.name.downcase)
      "$#{dsc_value.to_s}"
    when dsc_value.class.name == 'Array'
      "@(" + dsc_value.collect{|m| format_dsc_value(m)}.join(', ') + ")"
    when dsc_value.class.name == 'Hash'
      "@{" + dsc_value.collect{|k, v| format_dsc_value(k) + ' = ' + format_dsc_value(v)}.join('; ') + "}"
    else
      fail "unsupported type #{dsc_value.class} of value '#{dsc_value}'"
    end
  end

  def self.escape_quotes(text)
    text.gsub("'", "''")
  end

  def ps_script_content(mode)
    self.class.ps_script_content(mode, resource, self)
  end

  def self.ps_script_content(mode, resource, provider)
    dsc_invoke_method = mode
    @param_hash = resource
    template = ERB.new(File.new(template_path + "/invoke_dsc_resource.ps1.erb").read, nil, '-')
    template.result(binding)
  end
end
