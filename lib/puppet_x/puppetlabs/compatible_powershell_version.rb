require File.join(File.dirname(__FILE__), 'powershell_version')

module PuppetX
  module PuppetLabs
    module Dsc
      class CompatiblePowerShellVersion
        def self.compatible_version?
          powershell_version = PuppetX::PuppetLabs::Dsc::PowerShellVersion.version

          return false if powershell_version.nil?

          # We require at least PowerShell v5, where Invoke-DscResource was first
          # introduced and most bug fixes are found.
          Gem::Version.new(powershell_version) >= Gem::Version.new(5)
        end
      end
    end
  end
end