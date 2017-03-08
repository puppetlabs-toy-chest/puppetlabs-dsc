require 'pathname'

Puppet::Type.newtype(:dsc_spuserprofilesyncconnection) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPUserProfileSyncConnection resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPUserProfileSyncConnection/MSFT_SPUserProfileSyncConnection.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPUserProfileSyncConnection' end
  def dscmeta_resource_name; 'MSFT_SPUserProfileSyncConnection' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.5.0.0' end

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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the connection"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Forest
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forest) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Forest - The name of the AD forest to read from"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UserProfileService
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_userprofileservice) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserProfileService - The name of the user profile service that this connection is attached to"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectionCredentials
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectioncredentials) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "ConnectionCredentials - The credentials to connect to Active Directory with"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("ConnectionCredentials", value)
    end
  end

  # Name:         IncludedOUs
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_includedous, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "IncludedOUs - A listo f the OUs to import users from"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ExcludedOUs
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excludedous, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExcludedOUs - A list of the OUs to ignore users from"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Server
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_server) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Server - The specific AD server to connect to"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UseSSL
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usessl) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UseSSL - Should SSL be used for the connection"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Force
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_force) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Force - Set to true to run the set method on every call to this resource"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ConnectionType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["ActiveDirectory", "BusinessDataCatalog"]
  newparam(:dsc_connectiontype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectionType - The type of the connection - currently only Active Directory is supported Valid values are ActiveDirectory, BusinessDataCatalog."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['ActiveDirectory', 'activedirectory', 'BusinessDataCatalog', 'businessdatacatalog'].include?(value)
        fail("Invalid value '#{value}'. Valid values are ActiveDirectory, BusinessDataCatalog")
      end
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
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spuserprofilesyncconnection).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
