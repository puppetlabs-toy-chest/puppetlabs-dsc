require 'pathname'

Puppet::Type.newtype(:dsc_xclusternetwork) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xClusterNetwork resource type.
    Automatically generated from
    'xFailOverCluster/DSCResources/MSFT_xClusterNetwork/MSFT_xClusterNetwork.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_address is a required attribute') if self[:dsc_address].nil?
      fail('dsc_addressmask is a required attribute') if self[:dsc_addressmask].nil?
    end

  def dscmeta_resource_friendly_name; 'xClusterNetwork' end
  def dscmeta_resource_name; 'MSFT_xClusterNetwork' end
  def dscmeta_module_name; 'xFailOverCluster' end
  def dscmeta_module_version; '1.8.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
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

  # Name:         Address
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_address) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Address - The address for the cluster network in the format '10.0.0.0'."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AddressMask
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_addressmask) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AddressMask - The address mask for the cluster network in the format '255.255.255.0'."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the cluster network. If the cluster network name is not in desired state it will be renamed to match this name."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Role
  # Type:         string
  # IsMandatory:  False
  # Values:       ["0", "1", "3"]
  newparam(:dsc_role) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Role - he role of the cluster network. If the cluster network role is not in desired state it will change to match this role. Valid values are 0, 1, 3."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['0', '0', '1', '1', '3', '3'].include?(value)
        fail("Invalid value '#{value}'. Valid values are 0, 1, 3")
      end
    end
  end

  # Name:         Metric
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_metric) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Metric - The metric number for the cluster network. If the cluster network metric number is not in desired state it will be changed to match this metric number."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xclusternetwork).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
