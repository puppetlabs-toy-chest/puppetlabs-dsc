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

      private

      def dsc_test_parameters
        # set ensure to present to test if this resource exists
        dtp = dsc_set_parameters.clone
        dtp[:ensure] = :present if dtp.has_key?(:ensure)
        dtp[:dsc_ensure] = 'present' if dtp.has_key?(:dsc_ensure)
        dtp
      end

      def dsc_set_parameters
        dsp = resource.original_parameters.clone
        # filter on dsc params and ensure
        dsp.select do |k,v|
          k =~ /dsc_/ || k == :ensure
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


      def template_path
        File.expand_path('../templates', __FILE__)
      end

      def args
        '-NoProfile -NonInteractive -NoLogo -ExecutionPolicy Bypass -ErrorAction Stop'
      end

    end
  end

  class String
    def to_bool
      return true if self =~ (/^(true|t|yes|y|1)$/i)
      return false if self.empty? || self =~ (/^(false|f|no|n|0)$/i)

      raise ArgumentError.new "invalid value: #{self}"
    end
  end

end
