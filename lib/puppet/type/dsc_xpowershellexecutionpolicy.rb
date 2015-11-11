require 'pathname'

Puppet::Type.newtype(:dsc_xpowershellexecutionpolicy) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xPowerShellExecutionPolicy resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xPowerShellExecutionPolicy/DSCResources/xPowerShellExecutionPolicy/xPowerShellExecutionPolicy.schema.mof
  }

  validate do
      fail('dsc_executionpolicy is a required attribute') if self[:dsc_executionpolicy].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xPowerShellExecutionPolicy"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "xPowerShellExecutionPolicy"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xPowerShellExecutionPolicy"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

if Puppet.version >= '4.0.0'
  autonotify(:reboot) { ['dsc_reboot'] }
end

  # Name:         ExecutionPolicy
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Bypass", "Restricted", "AllSigned", "RemoteSigned", "Unrestricted"]
  newparam(:dsc_executionpolicy) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Changes the user preference for the Windows PowerShell execution policy."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Bypass', 'bypass', 'Restricted', 'restricted', 'AllSigned', 'allsigned', 'RemoteSigned', 'remotesigned', 'Unrestricted', 'unrestricted'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Bypass, Restricted, AllSigned, RemoteSigned, Unrestricted")
      end
    end
  end


end

Puppet::Type.type(:dsc_xpowershellexecutionpolicy).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
