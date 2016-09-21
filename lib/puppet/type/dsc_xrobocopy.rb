require 'pathname'

Puppet::Type.newtype(:dsc_xrobocopy) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xRobocopy resource type.
    Automatically generated from
    'xRobocopy/DSCResources/MSFT_xRobocopy/MSFT_xRobocopy.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_source is a required attribute') if self[:dsc_source].nil?
      fail('dsc_destination is a required attribute') if self[:dsc_destination].nil?
    end

  def dscmeta_resource_friendly_name; 'xRobocopy' end
  def dscmeta_resource_name; 'MSFT_xRobocopy' end
  def dscmeta_module_name; 'xRobocopy' end
  def dscmeta_module_version; '2.0.0.0' end

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

  # Name:         Source
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_source) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Source - Source Directory, Drive or UNC path."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Destination
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_destination) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Destination - Destination Dir, Drive or UNC path."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Files
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_files) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Files - File(s) to copy  (names/wildcards: default is all files)."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Retry
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retry) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Retry - Number of Retries on failed copies: default 1 million."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Wait
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_wait) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Wait - Wait time between retries: default is 30 seconds."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SubdirectoriesIncludingEmpty
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_subdirectoriesincludingempty) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SubdirectoriesIncludingEmpty - Copy subdirectories, including Empty ones."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Restartable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Restartable - Copy files in restartable mode."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         MultiThreaded
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_multithreaded) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MultiThreaded - Do multi-threaded copies with n threads (default 8). N must be at least 1 and not greater than 128. This option is incompatible with the /IPG and /EFSRAW options. Redirect output using /LOG option for better performance."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ExcludeFiles
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excludefiles) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExcludeFiles - Exclude Files matching given names/paths/wildcards."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogOutput
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logoutput) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogOutput - Output status to LOG file."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AppendLog
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_appendlog) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AppendLog - Determine whether to overwrite log file or append."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AdditionalArgs
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_additionalargs, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "AdditionalArgs - Robocopy has MANY configuration options. Too many to present them all as DSC parameters effectively. Use this option to set additional parameters. Each parameter should be a separate array member. This array will be combined with main argument array. For a list of options run Robocopy /??? in a shell window."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Will indicate whether Destination is in sync with Source Valid values are Present, Absent."
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


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xrobocopy).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
