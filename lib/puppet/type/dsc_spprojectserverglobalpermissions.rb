require 'pathname'

Puppet::Type.newtype(:dsc_spprojectserverglobalpermissions) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPProjectServerGlobalPermissions resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPProjectServerGlobalPermissions/MSFT_SPProjectServerGlobalPermissions.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_url is a required attribute') if self[:dsc_url].nil?
      fail('dsc_entityname is a required attribute') if self[:dsc_entityname].nil?
      fail('dsc_entitytype is a required attribute') if self[:dsc_entitytype].nil?
    end

  def dscmeta_resource_friendly_name; 'SPProjectServerGlobalPermissions' end
  def dscmeta_resource_name; 'MSFT_SPProjectServerGlobalPermissions' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '2.2.0.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         Url
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_url) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Url - The default zone URL of the Project site to manage the group at"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EntityName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_entityname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EntityName - The name of the user or group"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EntityType
  # Type:         string
  # IsMandatory:  True
  # Values:       ["User", "Group"]
  newparam(:dsc_entitytype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EntityType - What type of entity are you setting permissions for? Valid values are User, Group."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['User', 'user', 'Group', 'group'].include?(value)
        fail("Invalid value '#{value}'. Valid values are User, Group")
      end
    end
  end

  # Name:         AllowPermissions
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowpermissions, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "AllowPermissions - What permissions should be allowed for this entity?"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         DenyPermissions
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_denypermissions, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DenyPermissions - What permissions should be denied for this entity?"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsCredential if using PowerShell 5"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("InstallAccount", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spprojectserverglobalpermissions).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
