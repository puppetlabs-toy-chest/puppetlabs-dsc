require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverinstall) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSqlServerInstall resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSqlPs/DSCResources/MSFT_xSqlServerInstall/MSFT_xSqlServerInstall.schema.mof
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
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSqlPs"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.1.3.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
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
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
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
