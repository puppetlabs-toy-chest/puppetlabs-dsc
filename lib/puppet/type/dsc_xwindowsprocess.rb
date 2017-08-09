require 'pathname'

Puppet::Type.newtype(:dsc_xwindowsprocess) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xWindowsProcess resource type.
    Automatically generated from
    'xPSDesiredStateConfiguration/DSCResources/MSFT_xWindowsProcess/MSFT_xWindowsProcess.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
      fail('dsc_arguments is a required attribute') if self[:dsc_arguments].nil?
    end

  def dscmeta_resource_friendly_name; 'xWindowsProcess' end
  def dscmeta_resource_name; 'MSFT_xWindowsProcess' end
  def dscmeta_module_name; 'xPSDesiredStateConfiguration' end
  def dscmeta_module_version; '6.4.0.0' end

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

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - The full path or file name to the process executable to start or stop."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Arguments
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_arguments) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Arguments - A string of arguments to pass to the process executable. Pass in an empty string if no arguments are needed."
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
    desc "Credential - The credential to run the process under."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Indicates whether the process is present (running) or absent (not running). Valid values are Present, Absent."
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

  # Name:         StandardOutputPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_standardoutputpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StandardOutputPath - The path to write the standard output stream to."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StandardErrorPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_standarderrorpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StandardErrorPath - The path to write the standard error stream to."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StandardInputPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_standardinputpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StandardInputPath - The path to receive standard input from."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WorkingDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_workingdirectory) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WorkingDirectory - The directory to run the processes under."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PagedMemorySize
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pagedmemorysize) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "PagedMemorySize - The amount of paged memory, in bytes, allocated for the process."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NonPagedMemorySize
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_nonpagedmemorysize) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "NonPagedMemorySize - The amount of nonpaged memory, in bytes, allocated for the process."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         VirtualMemorySize
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_virtualmemorysize) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "VirtualMemorySize - The amount of virtual memory, in bytes, allocated for the process."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         HandleCount
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_handlecount) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "HandleCount - The number of handles opened by the process."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ProcessId
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_processid) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ProcessId - The unique identifier of the process."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ProcessCount
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_processcount) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ProcessCount - The number of instances of the given process that are currently running."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xwindowsprocess).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
