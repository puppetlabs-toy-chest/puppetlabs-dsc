require 'pathname'
require Pathname.new(__FILE__).dirname + '../' + 'puppet_x/puppetlabs/powershell_version'

Facter.add(:powershell_version) do
  setcode do
    if Puppet::Util::Platform.windows?
      version = PuppetX::PowerShell::PowerShellVersion.version
      version
    end
  end
end
