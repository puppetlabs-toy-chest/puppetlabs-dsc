require 'pathname'

Puppet::Type.newtype(:dsc_xvmhost) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xVMHost resource type.
    Automatically generated from
    'xHyper-V/DSCResources/MSFT_xVMHost/MSFT_xVMHost.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_issingleinstance is a required attribute') if self[:dsc_issingleinstance].nil?
    end

  def dscmeta_resource_friendly_name; 'xVMHost' end
  def dscmeta_resource_name; 'MSFT_xVMHost' end
  def dscmeta_module_name; 'xHyper-V' end
  def dscmeta_module_version; '3.9.0.0' end

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

  # Name:         IsSingleInstance
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Yes"]
  newparam(:dsc_issingleinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IsSingleInstance - Specifies the resource is a single instance, the value must be 'Yes'. Valid values are Yes."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Yes', 'yes'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Yes")
      end
    end
  end

  # Name:         EnableEnhancedSessionMode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableenhancedsessionmode) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableEnhancedSessionMode - Indicates whether users can use enhanced mode when they connect to virtual machines on this server by using Virtual Machine Connection."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         FibreChannelWwnn
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fibrechannelwwnn) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FibreChannelWwnn - Specifies the default value of the World Wide Node Name on the Hyper-V host."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FibreChannelWwpnMaximum
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fibrechannelwwpnmaximum) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FibreChannelWwpnMaximum - Specifies the maximum value that can be used to generate World Wide Port Names on the Hyper-V host."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FibreChannelWwpnMinimum
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fibrechannelwwpnminimum) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FibreChannelWwpnMinimum - Specifies the minimum value that can be used to generate the World Wide Port Names on the Hyper-V host."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MacAddressMaximum
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_macaddressmaximum) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MacAddressMaximum - Specifies the maximum MAC address using a valid hexadecimal value."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MacAddressMinimum
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_macaddressminimum) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MacAddressMinimum - Specifies the minimum MAC address using a valid hexadecimal value."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaximumStorageMigrations
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumstoragemigrations) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaximumStorageMigrations - Specifies the maximum number of storage migrations that can be performed at the same time on the Hyper-V host."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaximumVirtualMachineMigrations
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumvirtualmachinemigrations) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaximumVirtualMachineMigrations - Specifies the maximum number of live migrations that can be performed at the same time on the Hyper-V host."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NumaSpanningEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_numaspanningenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "NumaSpanningEnabled - Specifies whether virtual machines on the Hyper-V host can use resources from more than one NUMA node."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ResourceMeteringSaveIntervalMinute
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_resourcemeteringsaveintervalminute) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ResourceMeteringSaveIntervalMinute - Specifies how often the Hyper-V host saves the data that tracks resource usage. The range is a minimum of 60 minutes to a maximum of 1440 (24 hours)."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         UseAnyNetworkForMigration
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_useanynetworkformigration) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UseAnyNetworkForMigration - Specifies how networks are selected for incoming live migration traffic."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         VirtualHardDiskPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_virtualharddiskpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VirtualHardDiskPath - Specifies the default folder to store virtual hard disks on the Hyper-V host."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         VirtualMachineMigrationAuthenticationType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["CredSSP", "Kerberos"]
  newparam(:dsc_virtualmachinemigrationauthenticationtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VirtualMachineMigrationAuthenticationType - Specifies the type of authentication to be used for live migrations. The acceptable values for this parameter are 'Kerberos' and 'CredSSP'. Valid values are CredSSP, Kerberos."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['CredSSP', 'credssp', 'Kerberos', 'kerberos'].include?(value)
        fail("Invalid value '#{value}'. Valid values are CredSSP, Kerberos")
      end
    end
  end

  # Name:         VirtualMachineMigrationPerformanceOption
  # Type:         string
  # IsMandatory:  False
  # Values:       ["TCPIP", "Compression", "SMB"]
  newparam(:dsc_virtualmachinemigrationperformanceoption) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VirtualMachineMigrationPerformanceOption - Specifies the performance option to use for live migration. The acceptable values for this parameter are 'TCPIP', 'Compression' and 'SMB'. Valid values are TCPIP, Compression, SMB."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['TCPIP', 'tcpip', 'Compression', 'compression', 'SMB', 'smb'].include?(value)
        fail("Invalid value '#{value}'. Valid values are TCPIP, Compression, SMB")
      end
    end
  end

  # Name:         VirtualMachinePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_virtualmachinepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VirtualMachinePath - Specifies the default folder to store virtual machine configuration files on the Hyper-V host."
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

Puppet::Type.type(:dsc_xvmhost).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
