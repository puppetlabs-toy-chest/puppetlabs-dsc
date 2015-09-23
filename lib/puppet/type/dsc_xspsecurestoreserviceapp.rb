require 'pathname'

Puppet::Type.newtype(:dsc_xspsecurestoreserviceapp) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSPSecureStoreServiceApp resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPSecureStoreServiceApp/MSFT_xSPSecureStoreServiceApp.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSPSecureStoreServiceApp"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSPSecureStoreServiceApp"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSharePoint"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.3.1.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ApplicationPool
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applicationpool) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AuditingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_auditingenabled) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AuditlogMaxSize
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_auditlogmaxsize) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         DatabaseCredentials
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasecredentials) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasename) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabasePassword
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasepassword) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databaseserver) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databaseusername) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FailoverDatabaseServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_failoverdatabaseserver) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PartitionMode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_partitionmode) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Sharing
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sharing) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         InstallAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
