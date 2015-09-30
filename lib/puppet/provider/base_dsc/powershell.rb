require 'pathname'
require Pathname.new(__FILE__).dirname + '../../../' + 'puppet/feature/vendors_dsc'
require 'json'

Puppet::Type.type(:base_dsc).provide(:powershell) do
  confine :operatingsystem => :windows
  defaultfor :operatingsystem => :windows
  has_features :vendors_dsc

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


  def powershell_args
    ['-NoProfile', '-NonInteractive', '-NoLogo', '-ExecutionPolicy', 'Bypass', '-Command']
  end

  def exists?
    version = Facter.value(:powershell_version)
    Puppet.debug "PowerShell Version: #{version}"
    script_content = ps_script_content('test')
    Puppet.debug "\n" + script_content
    output = powershell(powershell_args, script_content)
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
    output = powershell(powershell_args, script_content)
    Puppet.debug "Create Dsc Resource returned: #{output}"
    data = JSON.parse(output)

    fail(data['errormessage']) if !data['errormessage'].empty?

    notify_status if data['rebootrequired'] == true

    data
  end

  def destroy
    script_content = ps_script_content('set')
    Puppet.debug "\n" + script_content
    output = powershell(powershell_args, script_content)
    Puppet.debug "Destroy Dsc Resource returned: #{output}"
    data = JSON.parse(output)

    fail(data['errormessage']) if !data['errormessage'].empty?

    notify_status if data['rebootrequired'] == true

    data
  end

  def notify_status
    Puppet.info "A reboot is required to progress further. Notifying Puppet."

    catalog_resource = resource.catalog.resources.find_all do |r|
      r.is_a?(Puppet::Type.type(:reboot)) && r.name == 'dsc_reboot'
    end

    unless catalog_resource.any?
      Puppet.warning "No reboot resource found in the graph that has 'dsc_reboot' as it's name. Cannot signal reboot to Puppet."
      return
    end

    target_resource = resolve_resource(catalog_resource[0])

    if target_resource.respond_to?(:reboot_required)
      target_resource.reboot_required
    else
      Puppet.warning "Reboot resource does not have :reboot_required method implemented. Cannot signal reboot to Puppet."
      return
    end
  end

  def resolve_resource(reference)
    if reference.is_a?(Puppet::Type)
      # Probably from a unit test, use the resource as-is
      return reference
    end

    if reference.is_a?(Puppet::Resource)
      # Already part resolved - puppet apply?
      # join it to the catalog where we live and ask it to resolve
      reference.catalog = resource.catalog
      return reference.resolve
    end

    if reference.is_a?(String)
      # 3.3.0 catalogs you need to resolve like so
      return resource.catalog.resource(reference)
    end

    # If we got here, panic
    raise "Don't know how to convert '#{reference.inspect}' of class #{reference.class} into a resource"
  end

  def format_dsc_value(dsc_value)
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

  def escape_quotes(text)
    text.gsub("'", "''")
  end

  def ps_script_content(mode)
    dsc_invoke_method = mode
    @param_hash = resource
    template = ERB.new(File.new(template_path + "/invoke_dsc_resource.ps1.erb").read, nil, '-')
    template.result(binding)
  end
end
