require 'pathname'

Puppet::Type.newtype(:dsc_xdatabase) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDatabase resource type.
    Automatically generated from
    'xDatabase/DSCResources/MSFT_xDatabase/MSFT_xDatabase.schema.mof'

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
    desc "A read-only value that is the DSC Resource Friendly Name ('xDatabase')."

    def retrieve
      'xDatabase'
    end

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only'
    end
  end

  newproperty(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xDatabase')."

    def retrieve
      'MSFT_xDatabase'
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
    desc "A read-only value for the DSC Module Version ('1.3.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    def retrieve
      '1.3.0.0'
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
    newvalue(:absent)  { provider.destroy }
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

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Valid values are Present, Absent."
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

  # Name:         BacPacPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_bacpacpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "BacPacPath - Path to BacPac, if this is specified resore is performed"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
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

  # Name:         DacPacPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dacpacpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DacPacPath - Path to DacPac, if this is specified dacpac deployment is performed"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DacPacApplicationName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dacpacapplicationname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DacPacApplicationName - DacPac Application Name for Registration"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DacPacApplicationVersion
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dacpacapplicationversion) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DacPacApplicationVersion - DacPac Application Version for Registration"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xdatabase).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
