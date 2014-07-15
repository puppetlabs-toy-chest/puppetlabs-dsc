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

      def lcm_config_folder
        if File.exists?("#{ENV['SYSTEMROOT']}\\sysnative\\Configuration")
          "#{ENV['SYSTEMROOT']}\\sysnative\\Configuration"
        elsif File.exists?("#{ENV['SYSTEMROOT']}\\System32\\Configuration")
          "#{ENV['SYSTEMROOT']}\\System32\\Configuration"
        else
          fail "Could not find the LCM Config Directory"
        end
      end

      def exists?
        set_test_dsc_parameters
        output = powershell(dsc_configuration('test'))
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
        set_original_dsc_parameters
        powershell(dsc_configuration('set'))
      end

      def destroy
        set_original_dsc_parameters
        powershell(dsc_configuration('set'))
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

      def dsc_configuration(mode)
        @param_hash = resource
        template = ERB.new(File.new(template_path + "/#{mode}_dsc_configuration.erb").read, nil, '-')
        template.result(binding)
      end

      def mof_content
        @param_hash = resource
        template = ERB.new(File.new(template_path + '/mof.erb').read, nil, '-')
        template.result(binding)
      end

      def set_test_dsc_parameters
        if resource[:dsc_ensure] == 'absent'
          resource[:dsc_ensure] = 'present'
          resource[:ensure] = 'absent'
        end
      end

      def set_original_dsc_parameters
        resource[:dsc_ensure] = resource.original_parameters[:dsc_ensure] if resource.original_parameters[:dsc_ensure]
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

      def write_mof
        begin
          mof_file_path = "#{lcm_config_folder}\\current.mof"
          File.open(native_path(mof_file_path), 'w') do |mof_file|
            mof_file.write(test_mof_content)
            mof_file.flush
          end
        rescue => e
          Puppet.warning e
        end
      end

      def native_path(path)
        path.gsub(File::SEPARATOR, File::ALT_SEPARATOR)
      end

    end
  end

end
