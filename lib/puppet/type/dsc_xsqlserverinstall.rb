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

Puppet::Type.newtype(:dsc_xsqlserverinstall) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xSqlServerInstall resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xSqlPs/DSCResources/MSFT_xSqlServerInstall/MSFT_xSqlServerInstall.schema.mof
  }

  validate do
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSqlServerInstall"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSqlServerInstall"
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

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    desc "The name of sql instance."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SourcePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcepath) do
    desc "The share path of sql server software."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SourcePathCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcepathcredential) do
    desc "The credential that vm could use to access net share of sql server software."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Features
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_features) do
    desc "List of names of Sql Server features to install"
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
    desc "Sql sa credential"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UpdateEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_updateenabled) do
    desc "Specify whether SQL server setup should discover and include product updates."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         SvcAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_svcaccount) do
    desc "Specify the startup account for the SQL server service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SysAdminAccounts
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sysadminaccounts) do
    desc "Specify logins to be members of the sysadmin role."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AgentSvcAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_agentsvcaccount) do
    desc "Specify the account for SQL server agent service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
