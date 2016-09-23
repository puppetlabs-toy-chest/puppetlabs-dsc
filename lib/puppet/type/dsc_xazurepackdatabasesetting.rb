require 'pathname'

Puppet::Type.newtype(:dsc_xazurepackdatabasesetting) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xAzurePackDatabaseSetting resource type.
    Automatically generated from
    'xAzurePack/DSCResources/MSFT_xAzurePackDatabaseSetting/MSFT_xAzurePackDatabaseSetting.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_namespace is a required attribute') if self[:dsc_namespace].nil?
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_sqlserver is a required attribute') if self[:dsc_sqlserver].nil?
    end

  def dscmeta_resource_friendly_name; 'xAzurePackDatabaseSetting' end
  def dscmeta_resource_name; 'MSFT_xAzurePackDatabaseSetting' end
  def dscmeta_module_name; 'xAzurePack' end
  def dscmeta_module_version; '1.4.0.0' end

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

  # Name:         Namespace
  # Type:         string
  # IsMandatory:  True
  # Values:       ["AdminSite", "TenantSite"]
  newparam(:dsc_namespace) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Namespace - Specifies the namespace. Valid values are AdminSite, TenantSite."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AdminSite', 'adminsite', 'TenantSite', 'tenantsite'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AdminSite, TenantSite")
      end
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Specifies the name of the setting."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Value
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_value) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Value - Specifies the value of the setting."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AzurePackAdminCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_azurepackadmincredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "AzurePackAdminCredential - Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("AzurePackAdminCredential", value)
    end
  end

  # Name:         SQLServer
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_sqlserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLServer - Database server for the Azure Pack databases."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLInstance
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLInstance - Database instance for the Azure Pack databases."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         dbUser
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dbuser) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "dbUser - SQL user to be used to create the database if the SetupCredential cannot be used."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("dbUser", value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xazurepackdatabasesetting).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
