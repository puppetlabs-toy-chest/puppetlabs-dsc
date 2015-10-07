require 'pathname'
require 'json'

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

  def self.instances
    require 'pry'; binding.pry
    return []
  end

  # Get resources from DSC
  def self.prefetch(resources)

    # standard prefetch
    #   instances.each do |prov|
    #     if resource = resources[prov.name]
    #       resource.provider = prov
    #     end
    #   end

    resources.each do |name, resource|
      hash = {}

      if result = retrieve(resource)
        # naive property remap by prefixing with dsc_
        result['instance'].each do |prop|
          key = ("dsc_" + prop["Name"].downcase.strip).to_sym

          # TODO: information is lossy here b/c DSC doesn' have props & params
          # i.e. we don't care to compare something like dsc_force on the
          # DSC file because it is not actually a part of the resource
          # TODO: I think that we should always omit null values, but unsure if there's a difference b/w null and undef??
          if resource.parameters.keys.include?(key) && prop['Value']
            # TODO: when DSC value is nil, what happens? omit it from hash?
            # TODO: is any special munging required to make is / should comparable
            # i.e. with resource.parameters[key].mof_type
            hash[key] = prop['Value']
          end
        end
      end

      # TODO: generally have to ignore anything with PsCredential for insync? checks
      # TODO: absent isn't always right value to look at as it depends on the MOF definition in the valuemap
      if hash.empty? || hash[:dsc_ensure].casecmp('absent') == 0
        resource.provider = new(:ensure => :absent)
      else
        require 'pry'; binding.pry
        hash[:ensure] = :present
        hash[:name] = resource[:name]
        hash[:provider] = :powershell
        # TODO: is this just a hash... or an instance of the type??
        resource.provider = new(hash)
      end
    end
  end

  def self.vendored_modules_path
    File.expand_path(Pathname.new(__FILE__).dirname + '../../../' + 'puppet_x/dsc_resources')
  end

  def self.dsc_parameters(resource)
    resource.parameters_with_value.select do |p|
      p.name.to_s =~ /dsc_/
    end
  end

  def self.template_path
    File.expand_path('../../templates', __FILE__)
  end


  def self.powershell_args
    ['-NoProfile', '-NonInteractive', '-NoLogo', '-ExecutionPolicy', 'Bypass', '-Command']
  end

  def exists?
    version = Facter.value(:powershell_version)
    Puppet.debug "PowerShell Version: #{version}"
    script_content = self.class.ps_script_content('test', resource)
    Puppet.debug "\n" + script_content
    output = powershell(self.class.powershell_args, script_content)
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
    script_content = self.class.ps_script_content('set', resource)
    Puppet.debug "\n" + script_content
    output = powershell(self.class.powershell_args, script_content)
    Puppet.debug "Create Dsc Resource returned: #{output}"
    data = JSON.parse(output)

    fail(data['errormessage']) if !data['errormessage'].empty?

    notify_reboot_pending if data['rebootrequired'] == true

    data
  end

  def destroy
    script_content = self.class.ps_script_content('set', resource)
    Puppet.debug "\n" + script_content
    output = powershell(self.class.powershell_args, script_content)
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

  def self.retrieve(resource)
    script_content = ps_script_content('get', resource)
    Puppet.debug "\n" + script_content
    output = powershell(powershell_args, script_content)
    Puppet.debug "Get Dsc Resource returned: #{output}"
    data = JSON.parse(output)
    # TODO: parse this into something usable - good times!
    fail(data['errormessage']) if !data['errormessage'].empty?
    data
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

  def self.ps_script_content(mode, resource)
    dsc_invoke_method = mode
    @param_hash = resource
    template = ERB.new(File.new(template_path + "/invoke_dsc_resource.ps1.erb").read, nil, '-')
    template.result(binding)
  end
end
