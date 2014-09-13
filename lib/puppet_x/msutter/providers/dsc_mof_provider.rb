module Puppet_x
  module Msutter

    module DscMofProvider

      def self.included(mof_provider)
        mof_provider.extend(DscMofProvider)

        mof_provider.desc <<-EOT
        Applies DSC Resources by generating a mof file and applying it.
        EOT

        require 'puppet_x/msutter/helpers/dsc_provider_helpers'
        mof_provider.class_eval do
          include DscProviderHelpers
        end

      end

      def exists?
        Puppet.debug "\n" + mof_test_content
        Puppet.debug "\n" + ps_script_content('set')
        write_test_mof
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
        Puppet.debug "\n" + mof_set_content
        Puppet.debug "\n" + ps_script_content('set')
        write_set_mof
        output = powershell(ps_script_content('set'))
        Puppet.debug output
      end

      def destroy
        Puppet.debug "\n" + mof_set_content
        Puppet.debug "\n" + ps_script_content('set')
        write_set_mof
        output = powershell(ps_script_content('set'))
        Puppet.debug output
      end

      def format_mof_value(mof_value)
        case
        when mof_value.class.name == 'String'
          escaped_string = mof_value.gsub('\\', '\\\\\\')
          '"' + escaped_string + '"'
        when mof_value.class.name == 'Numeric'
          "#{mof_value}"
        when [:true, :false].include?(mof_value)
          "#{mof_value.to_s}"
        when ['trueclass','falseclass'].include?(mof_value.class.name.downcase)
          "#{mof_value.to_s}"
        when mof_value.class.name == 'Array'
          res = String.new
          res << "{\n\t\t"
          res << mof_value.collect{|m| format_mof_value(m)}.join(",\n\t\t")
          res << "\n\t}"
          res
        else
          fail "unsupported type #{mof_value.class} of value '#{dsc_value}'"
        end
      end

      def ps_script_content(mode)
        @param_hash = resource
        template = ERB.new(File.new(template_path + "/#{mode}_dsc_mof.erb").read, nil, '-')
        template.result(binding)
      end

      def mof_test_content
        set_test_dsc_parameters
        @param_hash = resource
        template = ERB.new(File.new(template_path + '/mof.erb').read, nil, '-')
        template.result(binding)
      end

      def mof_set_content
        set_original_dsc_parameters
        @param_hash = resource
        template = ERB.new(File.new(template_path + '/mof.erb').read, nil, '-')
        template.result(binding)
      end

      def write_test_mof
        begin
          mof_file_path = "#{lcm_config_folder}\\current.mof"
          File.open(native_path(mof_file_path), 'w') do |mof_file|
            mof_file.write(mof_test_content)
            mof_file.flush
          end
        rescue => e
          Puppet.warning e
        end
      end

      def write_set_mof
        begin
          mof_file_path = "#{lcm_config_folder}\\localhost.mof"
          File.open(native_path(mof_file_path), 'w') do |mof_file|
            mof_file.write(mof_set_content)
            mof_file.flush
          end
        rescue => e
          Puppet.warning e
        end
      end

    end
  end

end
