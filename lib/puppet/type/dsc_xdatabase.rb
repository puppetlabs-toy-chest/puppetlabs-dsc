require 'pathname'

Puppet::Type.newtype(:dsc_xdatabase) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xDatabase resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xDatabase/DSCResources/MSFT_xDatabase/MSFT_xDatabase.schema.mof
  }

  validate do
      fail('dsc_databasename is a required attribute') if self[:dsc_databasename].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xDatabase"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xDatabase"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xDatabase"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.2.0"
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
    desc "Credentials to Connect to the sql server"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
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
    desc "Sql Server Name"
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
    desc "Sql Server Version For DacFx"
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
    desc "Path to BacPac, if this is specified resore is performed"
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
    desc "Name of the Database"
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
    desc "Path to DacPac, if this is specified dacpac deployment is performed"
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
    desc "DacPac Application Name for Registration"
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
    desc "DacPac Application Version for Registration"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
