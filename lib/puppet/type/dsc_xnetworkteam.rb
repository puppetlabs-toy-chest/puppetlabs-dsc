require 'pathname'

Puppet::Type.newtype(:dsc_xnetworkteam) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xNetworkTeam resource type.
    Automatically generated from
    'xNetworking/DSCResources/MSFT_xNetworkTeam/MSFT_xNetworkTeam.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'xNetworkTeam' end
  def dscmeta_resource_name; 'MSFT_xNetworkTeam' end
  def dscmeta_module_name; 'xNetworking' end
  def dscmeta_module_version; '3.0.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         PsDscRunAsCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_psdscrunascredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "PsDscRunAsCredential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TeamingMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["SwitchIndependent", "LACP", "Static"]
  newparam(:dsc_teamingmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TeamingMode - Valid values are SwitchIndependent, LACP, Static."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['SwitchIndependent', 'switchindependent', 'LACP', 'lacp', 'Static', 'static'].include?(value)
        fail("Invalid value '#{value}'. Valid values are SwitchIndependent, LACP, Static")
      end
    end
  end

  # Name:         LoadBalancingAlgorithm
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Dynamic", "HyperVPort", "IPAddresses", "MacAddresses", "TransportPorts"]
  newparam(:dsc_loadbalancingalgorithm) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LoadBalancingAlgorithm - Valid values are Dynamic, HyperVPort, IPAddresses, MacAddresses, TransportPorts."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Dynamic', 'dynamic', 'HyperVPort', 'hypervport', 'IPAddresses', 'ipaddresses', 'MacAddresses', 'macaddresses', 'TransportPorts', 'transportports'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Dynamic, HyperVPort, IPAddresses, MacAddresses, TransportPorts")
      end
    end
  end

  # Name:         TeamMembers
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_teammembers, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "TeamMembers"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Valid values are Present, Absent."
    validate do |value|
      resource[:ensure] = value.downcase
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Present', 'present', 'Absent', 'absent'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Present, Absent")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xnetworkteam).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
