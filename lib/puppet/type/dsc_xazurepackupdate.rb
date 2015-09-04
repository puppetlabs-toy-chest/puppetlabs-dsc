require 'pathname'

Puppet::Type.newtype(:dsc_xazurepackupdate) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xAzurePackUpdate resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackUpdate/MSFT_xAzurePackUpdate.schema.mof
  }

  validate do
      fail('dsc_role is a required attribute') if self[:dsc_role].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xAzurePackUpdate"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xAzurePackUpdate"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "The Azure Pack role to be updated."
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

  # Name:         SourcePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Folder within the source path containing the source files for installation."
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
    desc "Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SetupCredential", value)
    end
  end


end
