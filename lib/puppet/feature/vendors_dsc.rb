require 'pathname'
require Pathname.new(__FILE__).dirname + '../../' + 'puppet_x/puppetlabs/dsc_symlink'

Puppet.features.add(:vendors_dsc) do
  if Puppet::Util::Platform.windows?
    DscSymlink.set_symlink_folder
    true
  else
    false
  end
end
