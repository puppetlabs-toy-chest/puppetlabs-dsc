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

  def dsc_parameters
    resource.parameters_with_value.select do |p|
      p.name.to_s =~ /dsc_/
    end
  end

  def template_path
    File.expand_path('../../templates', __FILE__)
  end

  def vendored_modules_path
    File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'vendor','DSCResources')).gsub(/\//,'\\')
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
