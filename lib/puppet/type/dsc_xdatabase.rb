begin
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
rescue LoadError => detail
  require 'pathname'
  lib_path = Pathname.new(__FILE__).dirname.parent.parent
  $:.unshift(lib_path)
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
end

Puppet::Type.newtype(:dsc_xdatabase) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xDatabase resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xDatabase/DSCResources/MSFT_xDatabase/MSFT_xDatabase.schema.mof
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
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xDatabase"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    defaultvalues
    defaultto :present
  end

  # Name:         Credentials
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credentials) do
    desc "Credentials to Connect to the sql server"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
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
    desc "DacPac Application Version for Registration"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
