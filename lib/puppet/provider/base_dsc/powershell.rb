require 'puppet_x/msutter/helpers/dsc_provider_helpers'

Puppet::Type.type(:base_dsc).provide(:powershell) do

  include PuppetX::Msutter::Helpers::DscProviderHelpers

  confine :operatingsystem => :windows
  defaultfor :operatingsystem => :windows
  desc <<-EOT
Applies DSC Resources by generating a configuration file and applying it.
EOT

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
    template = ERB.new(File.new(template_path + "/invoke_dsc_resource.erb").read, nil, '-')
    template.result(binding)
  end
end
