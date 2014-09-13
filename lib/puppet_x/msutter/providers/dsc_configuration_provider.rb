module Puppet_x
  module Msutter

    module DscConfigurationProvider

      def self.included(configuration_provider)
        configuration_provider.extend(DscConfigurationProvider)

        configuration_provider.defaultfor :operatingsystem => :windows

        configuration_provider.desc <<-EOT
        Applies DSC Resources by generating a configuration file and applying it.
        EOT

        require 'puppet_x/msutter/helpers/dsc_provider_helpers'
        configuration_provider.class_eval do
          include DscProviderHelpers
        end

      end

      def exists?
        Puppet.debug "\n" + ps_script_content('test')
        set_test_dsc_parameters
        output = powershell(ps_script_content('test'))
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
        Puppet.debug "\n" + ps_script_content('set')
        output = powershell(ps_script_content('set'))
        Puppet.debug output
      end

      def destroy
        Puppet.debug "\n" + ps_script_content('set')
        output = powershell(ps_script_content('set'))
        Puppet.debug output
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

      def ps_script_content(mode)
        @param_hash = resource
        template = ERB.new(File.new(template_path + "/#{mode}_dsc_configuration.erb").read, nil, '-')
        template.result(binding)
      end

    end
  end

end
