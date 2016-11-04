require 'pathname'

Puppet::Type.newtype(:dsc_xexchdatabaseavailabilitygroup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchDatabaseAvailabilityGroup resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchDatabaseAvailabilityGroup/MSFT_xExchDatabaseAvailabilityGroup.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'xExchDatabaseAvailabilityGroup' end
  def dscmeta_resource_name; 'MSFT_xExchDatabaseAvailabilityGroup' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.11.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         PsDscRunAsCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_psdscrunascredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "PsDscRunAsCredential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         AutoDagTotalNumberOfServers
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagtotalnumberofservers) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "AutoDagTotalNumberOfServers"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         AlternateWitnessDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_alternatewitnessdirectory) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AlternateWitnessDirectory"
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AlternateWitnessServer"
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
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AutoDagAutoReseedEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AutoDagDatabaseCopiesPerDatabase
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagdatabasecopiesperdatabase) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "AutoDagDatabaseCopiesPerDatabase"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         AutoDagDatabaseCopiesPerVolume
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagdatabasecopiespervolume) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "AutoDagDatabaseCopiesPerVolume"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         AutoDagDatabasesRootFolderPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagdatabasesrootfolderpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AutoDagDatabasesRootFolderPath"
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
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AutoDagDiskReclaimerEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AutoDagTotalNumberOfDatabases
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagtotalnumberofdatabases) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "AutoDagTotalNumberOfDatabases"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         AutoDagVolumesRootFolderPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autodagvolumesrootfolderpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AutoDagVolumesRootFolderPath"
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
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DatabaseAvailabilityGroupIpAddresses"
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatacenterActivationMode - Valid values are Off, DagOnly."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainController"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FileSystem
  # Type:         string
  # IsMandatory:  False
  # Values:       ["NTFS", "ReFS"]
  newparam(:dsc_filesystem) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FileSystem - Valid values are NTFS, ReFS."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['NTFS', 'ntfs', 'ReFS', 'refs'].include?(value)
        fail("Invalid value '#{value}'. Valid values are NTFS, ReFS")
      end
    end
  end

  # Name:         ManualDagNetworkConfiguration
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_manualdagnetworkconfiguration) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ManualDagNetworkConfiguration"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         NetworkCompression
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Disabled", "Enabled", "InterSubnetOnly", "SeedOnly"]
  newparam(:dsc_networkcompression) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NetworkCompression - Valid values are Disabled, Enabled, InterSubnetOnly, SeedOnly."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NetworkEncryption - Valid values are Disabled, Enabled, InterSubnetOnly, SeedOnly."
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
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ReplayLagManagerEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ReplicationPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_replicationport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "ReplicationPort"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SkipDagValidation
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_skipdagvalidation) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SkipDagValidation"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         WitnessDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_witnessdirectory) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WitnessDirectory"
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WitnessServer"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xexchdatabaseavailabilitygroup).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
