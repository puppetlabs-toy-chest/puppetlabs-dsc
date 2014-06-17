module Utils
  module DscProviderHelpers

    def self.included(parent)
      parent.extend(DscProviderHelpers)
      
      parent.desc <<-EOT
      Applies DSC Resources.
        EOT

      parent.confine :operatingsystem => :windows

      parent.commands :powershell =>
      if File.exists?("#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe")
        "#{ENV['SYSTEMROOT']}\\sysnative\\WindowsPowershell\\v1.0\\powershell.exe"
      elsif File.exists?("#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe")
        "#{ENV['SYSTEMROOT']}\\system32\\WindowsPowershell\\v1.0\\powershell.exe"
      else
        'powershell.exe'
      end

    end

    def exists?
      output = powershell([test_dsc_configuration])
      check = (output.to_s.strip.downcase == 'true')
      Puppet.debug "Dsc Resource Exists?: #{check}"
      check
    end

    def dsc_test_parameters
      dtp = dsc_set_parameters.clone
      dtp[:ensure] = 'Present' if dtp.has_key?(:ensure)
      dtp
    end

    def dsc_set_parameters
      dsp = resource.original_parameters.clone
      dsp.delete(:name)
      dsp.delete(:before)
      dsp.delete(:require)
      dsp.delete(:subscribe)
      dsp.delete(:notify)
      dsp
    end

    def create
      powershell(start_dsc_configuration)
    end

    def destroy
      powershell(start_dsc_configuration)
    end

    def test_dsc_configuration
      @param_hash = resource
      template = ERB.new(File.new(helper_path + '/test_dsc_configuration.erb').read, nil, '-')
      template.result(binding)
    end

    def start_dsc_configuration
      @param_hash = resource
      template = ERB.new(File.new(helper_path + '/start_dsc_configuration.erb').read, nil, '-')
      template.result(binding)
    end

    private

    def helper_path
      File.expand_path('..', __FILE__)
    end

    def args
      '-NoProfile -NonInteractive -NoLogo -ExecutionPolicy Bypass'
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