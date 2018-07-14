require 'pathname'
require Pathname.new(__FILE__).dirname + '../' + 'puppet_x/puppetlabs/powershell_version'

Facter.add(:powershell_version) do
  setcode do
    platform = Puppet::Util::Platform
    platform.windows? ? PuppetX::PuppetLabs::Dsc::PowerShellVersion.version : 0
  end
end
