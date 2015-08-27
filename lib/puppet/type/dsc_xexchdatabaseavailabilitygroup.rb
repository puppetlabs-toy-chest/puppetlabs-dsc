require 'pathname'

Puppet::Type.newtype(:dsc_xexchdatabaseavailabilitygroup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows



  end

  @doc = %q{
    The DSC xExchDatabaseAvailabilityGroup resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xExchange/DSCResources/MSFT_xExchDatabaseAvailabilityGroup/MSFT_xExchDatabaseAvailabilityGroup.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xExchDatabaseAvailabilityGroup"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xExchDatabaseAvailabilityGroup"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xExchange"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.2.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto :present
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

  # Name:         Credential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AutoDagTotalNumberOfServers
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagtotalnumberofservers) do
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value || value.to_i >= 0
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         AlternateWitnessDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_alternatewitnessdirectory) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AlternateWitnessServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_alternatewitnessserver) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AutoDagAutoReseedEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagautoreseedenabled) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         AutoDagDatabaseCopiesPerDatabase
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagdatabasecopiesperdatabase) do
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value || value.to_i >= 0
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         AutoDagDatabaseCopiesPerVolume
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagdatabasecopiespervolume) do
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value || value.to_i >= 0
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         AutoDagDatabasesRootFolderPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagdatabasesrootfolderpath) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AutoDagDiskReclaimerEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagdiskreclaimerenabled) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         AutoDagTotalNumberOfDatabases
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagtotalnumberofdatabases) do
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value || value.to_i >= 0
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         AutoDagVolumesRootFolderPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagvolumesrootfolderpath) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseAvailabilityGroupIpAddresses
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databaseavailabilitygroupipaddresses, :array_matching => :all) do
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         DatacenterActivationMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Off", "DagOnly"]
  newparam(:dsc_datacenteractivationmode) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Off', 'off', 'DagOnly', 'dagonly'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Off, DagOnly")
      end
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ManualDagNetworkConfiguration
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_manualdagnetworkconfiguration) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         NetworkCompression
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Disabled", "Enabled", "InterSubnetOnly", "SeedOnly"]
  newparam(:dsc_networkcompression) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Disabled', 'disabled', 'Enabled', 'enabled', 'InterSubnetOnly', 'intersubnetonly', 'SeedOnly', 'seedonly'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Disabled, Enabled, InterSubnetOnly, SeedOnly")
      end
    end
  end

  # Name:         NetworkEncryption
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Disabled", "Enabled", "InterSubnetOnly", "SeedOnly"]
  newparam(:dsc_networkencryption) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Disabled', 'disabled', 'Enabled', 'enabled', 'InterSubnetOnly', 'intersubnetonly', 'SeedOnly', 'seedonly'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Disabled, Enabled, InterSubnetOnly, SeedOnly")
      end
    end
  end

  # Name:         ReplayLagManagerEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_replaylagmanagerenabled) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         ReplicationPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_replicationport) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         SkipDagValidation
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skipdagvalidation) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         WitnessDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_witnessdirectory) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WitnessServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_witnessserver) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
