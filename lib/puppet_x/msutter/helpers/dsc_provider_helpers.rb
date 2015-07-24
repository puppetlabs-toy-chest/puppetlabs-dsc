module PuppetX
  module Msutter
    module Helpers
      module DscProviderHelpers

        def self.included(provider)
          provider.extend(DscProviderHelpers)

          provider.confine :operatingsystem => :windows

          provider.commands :powershell =>
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

        def native_path(path)
          path.gsub(File::SEPARATOR, File::ALT_SEPARATOR)
        end

      end
    end
  end

end
