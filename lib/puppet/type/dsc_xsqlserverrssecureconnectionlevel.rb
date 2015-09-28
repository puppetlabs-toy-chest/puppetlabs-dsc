require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverrssecureconnectionlevel) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
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
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
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
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqladmincredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential with administrative permissions to the SQL instance."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SQLAdminCredential", value)
    end
  end


end
