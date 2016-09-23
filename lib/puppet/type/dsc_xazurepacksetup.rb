require 'pathname'

Puppet::Type.newtype(:dsc_xazurepacksetup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xAzurePackSetup resource type.
    Automatically generated from
    'xAzurePack/DSCResources/MSFT_xAzurePackSetup/MSFT_xAzurePackSetup.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_role is a required attribute') if self[:dsc_role].nil?
      fail('dsc_action is a required attribute') if self[:dsc_action].nil?
    end

  def dscmeta_resource_friendly_name; 'xAzurePackSetup' end
  def dscmeta_resource_name; 'MSFT_xAzurePackSetup' end
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

  # Name:         Role
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Admin API", "Tenant API", "Tenant Public API", "SQL Server Extension", "MySQL Extension", "Admin Site", "Admin Authentication Site", "Tenant Site", "Tenant Authentication Site"]
  newparam(:dsc_role) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Role - The Azure Pack role to be installed or initialized. Valid values are Admin API, Tenant API, Tenant Public API, SQL Server Extension, MySQL Extension, Admin Site, Admin Authentication Site, Tenant Site, Tenant Authentication Site."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Admin API', 'admin api', 'Tenant API', 'tenant api', 'Tenant Public API', 'tenant public api', 'SQL Server Extension', 'sql server extension', 'MySQL Extension', 'mysql extension', 'Admin Site', 'admin site', 'Admin Authentication Site', 'admin authentication site', 'Tenant Site', 'tenant site', 'Tenant Authentication Site', 'tenant authentication site'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Admin API, Tenant API, Tenant Public API, SQL Server Extension, MySQL Extension, Admin Site, Admin Authentication Site, Tenant Site, Tenant Authentication Site")
      end
    end
  end

  # Name:         Action
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Install", "Initialize"]
  newparam(:dsc_action) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Action - Install or initialize. Valid values are Install, Initialize."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Install', 'install', 'Initialize', 'initialize'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Install, Initialize")
      end
    end
  end

  # Name:         SourcePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SourcePath - UNC path to the root of the source files for installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SourceFolder
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcefolder) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SourceFolder - Folder within the source path containing the source files for installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SetupCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_setupcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SetupCredential - Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SetupCredential", value)
    end
  end

  # Name:         Passphrase
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passphrase) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Passphrase - Passphrase for the Azure Pack deployment."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Passphrase", value)
    end
  end

  # Name:         SQLServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLServer - Database server for the Azure Pack databases."
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

  # Name:         EnableCeip
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableceip) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EnableCeip - Enable Customer Experience Improvement Program."
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

Puppet::Type.type(:dsc_xazurepacksetup).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
