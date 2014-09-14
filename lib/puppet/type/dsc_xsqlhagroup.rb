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

Puppet::Type.newtype(:dsc_xsqlhagroup) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xSqlHAGroup resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xSqlPs/DSCResources/MSFT_xSqlHAGroup/MSFT_xSqlHAGroup.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSqlHAGroup"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSqlHAGroup"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSqlPs"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.1.3"
  end

  newparam(:name, :namevar => true ) do
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    desc "The name of sql availability group"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Database
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_database, :array_matching => :all) do
    desc "Array of databases on the local sql instance. Each database can belong to only one HA group."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
  end

  # Name:         ClusterName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_clustername) do
    desc "The name of windows failover cluster for the availability group"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseBackupPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasebackuppath) do
    desc "The net share for Sql replication initialization"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_instancename) do
    desc "Name of sql instance"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EndPointName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_endpointname) do
    desc "Name of EndPoint to access High Availability sql instance."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DomainCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincredential) do
    desc "Domain credential could get list of cluster nodes."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlAdministratorCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqladministratorcredential) do
    desc "Sql sa credential."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
