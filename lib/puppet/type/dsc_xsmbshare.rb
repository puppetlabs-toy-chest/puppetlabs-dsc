require 'pathname'

Puppet::Type.newtype(:dsc_xsmbshare) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSmbShare resource type.
    Automatically generated from
    'xSmbShare/DscResources/MSFT_xSmbShare/MSFT_xSmbShare.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xSmbShare' end
  def dscmeta_resource_name; 'MSFT_xSmbShare' end
  def dscmeta_module_name; 'xSmbShare' end
  def dscmeta_module_version; '2.0.0.0' end

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
    desc "Name - Name of the SMB Share"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - Path to the share"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - Description of the share"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ChangeAccess
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_changeaccess, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ChangeAccess - Specifies which user will be granted modify permission to access the share"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ConcurrentUserLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_concurrentuserlimit) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ConcurrentUserLimit - Specifies the maximum number of concurrently connected users that the new SMB share may accommodate. If this parameter is set to zero (0), then the number of users is unlimited. The default value is zero (0)."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EncryptData
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_encryptdata) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EncryptData - Indicates that the share is encrypted."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         FolderEnumerationMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["AccessBased", "Unrestricted"]
  newparam(:dsc_folderenumerationmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FolderEnumerationMode - Specifies which files and folders in the new SMB share are visible to users. Valid values are AccessBased, Unrestricted."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AccessBased', 'accessbased', 'Unrestricted', 'unrestricted'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AccessBased, Unrestricted")
      end
    end
  end

  # Name:         FullAccess
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fullaccess, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "FullAccess - Specifies which accounts are granted full permission to access the share."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         NoAccess
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_noaccess, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "NoAccess - Specifies which accounts are denied access to the share."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ReadAccess
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_readaccess, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ReadAccess - Specifies which user is granted read permission to access the share."
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
    desc "Ensure - Specifies if the share should be added or removed Valid values are Present, Absent."
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

  # Name:         ShareState
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sharestate) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ShareState - Specfies the state of the share"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ShareType
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sharetype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ShareType - Specfies the type of the share"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ShadowCopy
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_shadowcopy) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ShadowCopy - Specifies if this share is a ShadowCopy"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Special
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_special) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Special - Specifies if this share is a Special Share. Admin share, default shares, IPC$ share are examples."
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

Puppet::Type.type(:dsc_xsmbshare).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
