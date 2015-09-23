require 'pathname'

Puppet::Type.newtype(:dsc_xspcreatefarm) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSPCreateFarm resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPCreateFarm/MSFT_xSPCreateFarm.schema.mof
  }

  validate do
      fail('dsc_farmconfigdatabasename is a required attribute') if self[:dsc_farmconfigdatabasename].nil?
      fail('dsc_databaseserver is a required attribute') if self[:dsc_databaseserver].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSPCreateFarm"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSPCreateFarm"
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

  # Name:         FarmConfigDatabaseName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_farmconfigdatabasename) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseServer
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_databaseserver) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FarmAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_farmaccount) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
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

  # Name:         Passphrase
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passphrase) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AdminContentDatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_admincontentdatabasename) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
