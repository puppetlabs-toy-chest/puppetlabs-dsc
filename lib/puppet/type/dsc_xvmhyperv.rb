require 'pathname'

Puppet::Type.newtype(:dsc_xvmhyperv) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xVMHyperV resource type.
    Automatically generated from
    'xHyper-V/DSCResources/MSFT_xVMHyperV/MSFT_xVMHyperV.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xVMHyperV' end
  def dscmeta_resource_name; 'MSFT_xVMHyperV' end
  def dscmeta_module_name; 'xHyper-V' end
  def dscmeta_module_version; '3.5.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
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
    desc "Name - Name of the VM"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         VhdPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_vhdpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VhdPath - VHD associated with the VM"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SwitchName
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_switchname, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "SwitchName - Virtual switch(es) associated with the VM"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         State
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Running", "Paused", "Off"]
  newparam(:dsc_state) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "State - State of the VM. Valid values are Running, Paused, Off."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Running', 'running', 'Paused', 'paused', 'Off', 'off'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Running, Paused, Off")
      end
    end
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - Folder where the VM data will be stored"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Generation
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_generation) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Generation - Virtual machine generation"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         StartupMemory
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_startupmemory) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "StartupMemory - Startup RAM for the VM."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MinimumMemory
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minimummemory) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "MinimumMemory - Minimum RAM for the VM. This enables dynamic memory."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaximumMemory
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximummemory) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "MaximumMemory - Maximum RAM for the VM. This enable dynamic memory."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MACAddress
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_macaddress, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "MACAddress - MAC address(es) of the VM NICs."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ProcessorCount
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_processorcount) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ProcessorCount - Processor count for the VM"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         WaitForIP
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_waitforip) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "WaitForIP - Waits for VM to get valid IP address."
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
    desc "RestartIfNeeded - If specified, shutdowns and restarts the VM as needed for property changes"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Should the VM be created or deleted Valid values are Present, Absent."
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

  # Name:         Notes
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_notes) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Notes - Notes about the VM."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SecureBoot
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_secureboot) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SecureBoot - Enable secure boot for Generation 2 VMs."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EnableGuestService
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableguestservice) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableGuestService - Enable Guest Service Interface for the VM."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ID
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_id) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ID - VM unique ID"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Status
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_status) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Status - Status of the VM"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CPUUsage
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cpuusage) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "CPUUsage - CPU Usage of the VM"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MemoryAssigned
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_memoryassigned) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "MemoryAssigned - Memory assigned to the VM"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Uptime
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_uptime) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Uptime - Uptime of the VM"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CreationTime
  # Type:         datetime
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_creationtime) do
    def mof_type; 'datetime' end
    def mof_is_embedded?; false end
    desc "CreationTime - Creation time of the VM"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HasDynamicMemory
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hasdynamicmemory) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "HasDynamicMemory - Does VM has dynamic memory enabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         NetworkAdapters
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_networkadapters, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "NetworkAdapters - Network adapters' IP addresses of the VM"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xvmhyperv).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
