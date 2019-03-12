require 'pathname'

Puppet::Type.newtype(:dsc_iscsiservertarget) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC iSCSIServerTarget resource type.
    Automatically generated from
    'iSCSIDsc/DSCResources/DSR_iSCSIServerTarget/DSR_iSCSIServerTarget.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_targetname is a required attribute') if self[:dsc_targetname].nil?
    end

  def dscmeta_resource_friendly_name; 'iSCSIServerTarget' end
  def dscmeta_resource_name; 'DSR_iSCSIServerTarget' end
  def dscmeta_module_name; 'iSCSIDsc' end
  def dscmeta_module_version; '1.5.0.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         TargetName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_targetname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TargetName - Specifies the name of the iSCSI target."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Ensures that Server Target is either Absent or Present. Valid values are Present, Absent."
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

  # Name:         InitiatorIds
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_initiatorids, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "InitiatorIds - Specifies the iSCSI initiator identifiers (IDs) to which the iSCSI target is assigned."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Paths
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_paths, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Paths - Specifies the path of the virtual hard disk (VHD) files that are associated with the Server Target."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         iSNSServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isnsserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "iSNSServer - Specifies the name of an iSNS Server to register this Server Target with."
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

Puppet::Type.type(:dsc_iscsiservertarget).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
