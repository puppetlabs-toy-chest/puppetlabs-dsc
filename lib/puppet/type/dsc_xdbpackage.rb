require 'pathname'

Puppet::Type.newtype(:dsc_xdbpackage) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDBPackage resource type.
    Automatically generated from
    'xDatabase/DSCResources/MSFT_xDBPackage/MSFT_xDBPackage.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_databasename is a required attribute') if self[:dsc_databasename].nil?
    end

  newproperty(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xDBPackage')."

    def retrieve
      'xDBPackage'
    end

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only'
    end
  end

  newproperty(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xDBPackage')."

    def retrieve
      'MSFT_xDBPackage'
    end

    validate do |value|
      fail 'dscmeta_resource_name is read-only'
    end
  end

  newparam(:dscmeta_import_resource) do
    desc "Please ignore this parameter.
      Defaults to `true`."
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newproperty(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xDatabase')."

    def retrieve
      'xDatabase'
    end

    validate do |value|
      fail 'dscmeta_module_name is read-only'
    end
  end

  newproperty(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.4.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    def retrieve
      '1.4.0.0'
    end

    validate do |value|
      fail 'dscmeta_module_version is read-only'
    end
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Credentials
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credentials) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credentials - Credentials to Connect to the sql server"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credentials", value)
    end
  end

  # Name:         DatabaseName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_databasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseName - Name of the Database"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlServer - Sql Server Name"
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
    desc "Path - Path to BacPac/DacPac"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  False
  # Values:       ["DACPAC", "BACPAC"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - Type for backup(Extract id done for DACPAC and Import for BACPAC) Valid values are DACPAC, BACPAC."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['DACPAC', 'dacpac', 'BACPAC', 'bacpac'].include?(value)
        fail("Invalid value '#{value}'. Valid values are DACPAC, BACPAC")
      end
    end
  end

  # Name:         SqlServerVersion
  # Type:         string
  # IsMandatory:  False
  # Values:       ["2008-R2", "2012", "2014"]
  newparam(:dsc_sqlserverversion) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SqlServerVersion - Sql Server Version For DacFx Valid values are 2008-R2, 2012, 2014."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['2008-R2', '2008-r2', '2012', '2012', '2014', '2014'].include?(value)
        fail("Invalid value '#{value}'. Valid values are 2008-R2, 2012, 2014")
      end
    end
  end


end

Puppet::Type.type(:dsc_xdbpackage).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
