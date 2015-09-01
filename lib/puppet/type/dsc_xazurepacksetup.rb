require 'pathname'

Puppet::Type.newtype(:dsc_xazurepacksetup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xAzurePackSetup resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackSetup/MSFT_xAzurePackSetup.schema.mof
  }

  validate do
      fail('dsc_role is a required attribute') if self[:dsc_role].nil?
      fail('dsc_action is a required attribute') if self[:dsc_action].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xAzurePackSetup"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xAzurePackSetup"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xAzurePack"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.1.4.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Role
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Admin API", "Tenant API", "Tenant Public API", "SQL Server Extension", "MySQL Extension", "Admin Site", "Admin Authentication Site", "Tenant Site", "Tenant Authentication Site"]
  newparam(:dsc_role) do
    desc "The Azure Pack role to be installed or initialized."
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
    desc "Install or initialize."
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
    desc "UNC path to the root of the source files for installation."
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
    desc "Folder within the source path containing the source files for installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SetupCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_setupcredential) do
    desc "Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Passphrase
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passphrase) do
    desc "Passphrase for the Azure Pack deployment."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlserver) do
    desc "Database server for the Azure Pack databases."
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
    desc "Database instance for the Azure Pack databases."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         dbUser
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dbuser) do
    desc "SQL user to be used to create the database if the SetupCredential cannot be used."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EnableCeip
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableceip) do
    desc "Enable Customer Experience Improvement Program."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
