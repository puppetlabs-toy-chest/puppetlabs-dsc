module Puppetx
  module Msutter

    module DscProviderHelpers

      def self.included(prov)
        prov.extend(DscProviderHelpers)

        prov.desc <<-EOT
        Applies DSC Resources.
          EOT

        prov.confine :operatingsystem => :windows

        prov.commands :powershell =>
        if File.exists?("#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe")
          "#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe"
        elsif File.exists?("#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe")
          "#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe"
        else
          'powershell.exe'
        end
      end

      def exists?
        output = powershell(test_dsc_configuration)
        Puppet.debug "Command output: #{output}"
        if ['true','false'].include?(output.to_s.strip.downcase)
          check = (output.to_s.strip.downcase == 'true')
          Puppet.debug "Dsc Resource Exists?: #{check}"
          Puppet.debug "dsc_ensure: #{resource[:dsc_ensure]}"
          Puppet.debug "ensure: #{resource[:ensure]}"
          check
        else
          fail(output)
        end
      end

      def create
        powershell(start_dsc_configuration)
      end

      def destroy
        powershell(start_dsc_configuration)
      end

      def format_dsc_value(dsc_value)
        case
        when dsc_value.class.name == 'String'
          "'#{dsc_value}'"
        when dsc_value.class.name == 'Numeric'
          "#{dsc_value}"
        when [:true, :false].include?(dsc_value)
          "$#{dsc_value.to_s}"
        when ['trueclass','falseclass'].include?(dsc_value.class.name.downcase)
          "$#{dsc_value.to_s}"
        when dsc_value.class.name == 'Array'
          dsc_value.collect{|m| format_dsc_value(m)}.join(', ')
        else
          fail "unsupported type #{dsc_value.class} of value '#{dsc_value}'"
        end
      end

      def test_dsc_configuration
        @param_hash = resource
        template = ERB.new(File.new(template_path + '/test_dsc_configuration.erb').read, nil, '-')
        template.result(binding)
      end

      def start_dsc_configuration
        @param_hash = resource
        template = ERB.new(File.new(template_path + '/start_dsc_configuration.erb').read, nil, '-')
        template.result(binding)
      end

      def dsc_parameters
        resource.parameters_with_value.select do |p|
          p.name.to_s =~ /dsc_/
        end
      end

      def template_path
        File.expand_path('../templates', __FILE__)
      end

      def args
        '-NoProfile -NonInteractive -NoLogo -ExecutionPolicy Bypass -ErrorAction Stop'
      end

    end
  end

  # class String
  #   def to_bool
  #     return true if self =~ (/^(true|t|yes|y|1)$/i)
  #     return false if self.empty? || self =~ (/^(false|f|no|n|0)$/i)

  #     raise ArgumentError.new "invalid value: #{self}"
  #   end
  # end

end
