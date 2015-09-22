require 'pathname'

Puppet::Type.newtype(:dsc_xdatabaselogin) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xDatabaseLogin resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xDatabase/DSCResources/MSFT_xDatabaseLogin/MSFT_xDatabaseLogin.schema.mof
  }

  validate do
      fail('dsc_loginname is a required attribute') if self[:dsc_loginname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xDatabaseLogin"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xDatabaseLogin"
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

  # Name:         LoginName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_loginname) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LoginPassword
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_loginpassword) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlAuthType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Windows", "SQL"]
  newparam(:dsc_sqlauthtype) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Windows', 'windows', 'SQL', 'sql'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Windows, SQL")
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

  # Name:         SqlConnectionCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlconnectioncredential) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
