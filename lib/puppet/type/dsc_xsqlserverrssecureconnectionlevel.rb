require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverrssecureconnectionlevel) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSQLServerRSSecureConnectionLevel resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSQLServer/DSCResources/MSFT_xSQLServerRSSecureConnectionLevel/MSFT_xSQLServerRSSecureConnectionLevel.schema.mof
  }

  validate do
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
      fail('dsc_secureconnectionlevel is a required attribute') if self[:dsc_secureconnectionlevel].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSQLServerRSSecureConnectionLevel"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSQLServerRSSecureConnectionLevel"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSQLServer"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.3.0.0"
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
    desc "SQL instance to set secure connection level for."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SecureConnectionLevel
  # Type:         uint16
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_secureconnectionlevel) do
    desc "SQL Server Reporting Service secure connection level."
    isrequired
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         SQLAdminCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqladmincredential) do
    desc "Credential with administrative permissions to the SQL instance."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
