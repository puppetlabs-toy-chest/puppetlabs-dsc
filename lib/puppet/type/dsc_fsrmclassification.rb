require 'pathname'

Puppet::Type.newtype(:dsc_fsrmclassification) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC FSRMClassification resource type.
    Automatically generated from
    'FSRMDsc/DSCResources/DSR_FSRMClassification/DSR_FSRMClassification.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_id is a required attribute') if self[:dsc_id].nil?
    end

  def dscmeta_resource_friendly_name; 'FSRMClassification' end
  def dscmeta_resource_name; 'DSR_FSRMClassification' end
  def dscmeta_module_name; 'FSRMDsc' end
  def dscmeta_module_version; '2.4.1.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         Id
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_id) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Id - This is a unique identifier for this resource."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Continuous
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_continuous) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Continuous - Enable FSRM Classification continuous mode for new files."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ContinuousLog
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_continuouslog) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ContinuousLog - Enable FSRM Classification continuous mode logging."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ContinuousLogSize
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_continuouslogsize) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ContinuousLogSize - The maximum number of KB that can be used for the continuous mode log file."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExcludeNamespace
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_excludenamespace, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExcludeNamespace - An array of Namespaces that will be excluded from FSRM Classification."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ScheduleMonthly
  # Type:         uint32[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_schedulemonthly, :array_matching => :all) do
    def mof_type; 'uint32[]' end
    def mof_is_embedded?; false end
    desc "ScheduleMonthly - An array of days of the month the FSRM Classification should run on."
    validate do |value|
      unless value.kind_of?(Array) || (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
        fail("Invalid value '#{value}'. Should be an integer or an array of integers")
      end
    end
    munge do |value|
      v = PuppetX::Dsc::TypeHelpers.munge_integer(value)
      v.is_a?(Array) ? v : Array(v)
    end
  end

  # Name:         ScheduleWeekly
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scheduleweekly, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ScheduleWeekly - An array of named days of the week the FSRM Classification should run on."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ScheduleRunDuration
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_schedulerunduration) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "ScheduleRunDuration - The maximum number of hours the FSRM Classification can run for. Setting this to -1 will disable this."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ScheduleTime
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scheduletime) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ScheduleTime - A string containing the time of day the FSRM Classification should run at."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LastError
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_lasterror) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LastError"
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
    desc "Status"
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

Puppet::Type.type(:dsc_fsrmclassification).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
