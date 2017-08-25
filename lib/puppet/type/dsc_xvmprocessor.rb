require 'pathname'

Puppet::Type.newtype(:dsc_xvmprocessor) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xVMProcessor resource type.
    Automatically generated from
    'xHyper-V/DSCResources/MSFT_xVMProcessor/MSFT_xVMProcessor.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_vmname is a required attribute') if self[:dsc_vmname].nil?
    end

  def dscmeta_resource_friendly_name; 'xVMProcessor' end
  def dscmeta_resource_name; 'MSFT_xVMProcessor' end
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

  # Name:         VMName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_vmname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VMName - Specifies the name of the virtual machine on which the processor is to be configured."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EnableHostResourceProtection
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enablehostresourceprotection) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableHostResourceProtection - Specifies whether to enable host resource protection."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExposeVirtualizationExtensions
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_exposevirtualizationextensions) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ExposeVirtualizationExtensions - Specifies whether nested virtualization is enabled."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         HwThreadCountPerCore
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hwthreadcountpercore) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "HwThreadCountPerCore - Specifies the maximum thread core per processor core."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Maximum
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximum) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "Maximum - Specifies the maximum percentage of resources available to the virtual machine processor to be configured. Allowed values range from 0 to 100."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaximumCountPerNumaNode
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumcountpernumanode) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaximumCountPerNumaNode - Specifies the maximum number of processors per NUMA node to be configured for the virtual machine."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaximumCountPerNumaSocket
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumcountpernumasocket) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaximumCountPerNumaSocket - Specifies the maximum number of sockets per NUMA node to be configured for the virtual machine."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RelativeWeight
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_relativeweight) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RelativeWeight - Specifies the priority for allocating the physical computer's processing power to this virtual machine relative to others. Allowed values range from 1 to 10000."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Reserve
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reserve) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "Reserve - Specifies the percentage of processor resources to be reserved for this virtual machine. Allowed values range from 0 to 100."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ResourcePoolName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_resourcepoolname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ResourcePoolName - Specifies the name of the processor resource pool to be used."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CompatibilityForMigrationEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_compatibilityformigrationenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CompatibilityForMigrationEnabled - Specifies whether the virtual processors features are to be limited for compatibility when migrating the virtual machine to another host."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CompatibilityForOlderOperatingSystemsEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_compatibilityforolderoperatingsystemsenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CompatibilityForOlderOperatingSystemsEnabled - Specifies whether the virtual processor's features are to be limited for compatibility with older operating systems."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RestartIfNeeded
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartifneeded) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RestartIfNeeded - If specified, shutdowns and restarts the VM if needed for property changes."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xvmprocessor).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
