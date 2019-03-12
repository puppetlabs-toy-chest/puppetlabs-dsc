require 'pathname'

Puppet::Type.newtype(:dsc_fsrmfilescreentemplateaction) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC FSRMFileScreenTemplateAction resource type.
    Automatically generated from
    'FSRMDsc/DSCResources/DSR_FSRMFileScreenTemplateAction/DSR_FSRMFileScreenTemplateAction.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_type is a required attribute') if self[:dsc_type].nil?
    end

  def dscmeta_resource_friendly_name; 'FSRMFileScreenTemplateAction' end
  def dscmeta_resource_name; 'DSR_FSRMFileScreenTemplateAction' end
  def dscmeta_module_name; 'FSRMDsc' end
  def dscmeta_module_version; '2.4.1.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the FSRM File Screen Template that this Action is attached to."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Email", "Event", "Command", "Report"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - The type of FSRM Action. Valid values are Email, Event, Command, Report."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Email', 'email', 'Event', 'event', 'Command', 'command', 'Report', 'report'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Email, Event, Command, Report")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Specifies whether the FSRM Action should exist. Valid values are Present, Absent."
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

  # Name:         Subject
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_subject) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Subject - The subject of the e-mail sent. Required when Type is Email."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Body
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_body) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Body - The body text of the e-mail or event. Required when Type is Email or Event."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MailTo
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mailto) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MailTo - The mail to of the e-mail sent. Required when Type is Email."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MailCC
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mailcc) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MailCC - The mail CC of the e-mail sent. Required when Type is Email."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MailBCC
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mailbcc) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MailBCC - The mail BCC of the e-mail sent. Required when Type is Email."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EventType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Information", "Warning", "Error"]
  newparam(:dsc_eventtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EventType - The type of event created. Required when Type is Event. Valid values are None, Information, Warning, Error."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Information', 'information', 'Warning', 'warning', 'Error', 'error'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Information, Warning, Error")
      end
    end
  end

  # Name:         Command
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_command) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Command - The Command to execute. Required when Type is Command."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CommandParameters
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_commandparameters) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CommandParameters - The Command Parameters. Required when Type is Command."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         KillTimeOut
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_killtimeout) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "KillTimeOut - Int containing kill timeout of the command. Required when Type is Command."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RunLimitInterval
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_runlimitinterval) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "RunLimitInterval - Int containing the run limit interval of the command. Required when Type is Command."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SecurityLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "LocalService", "NetworkService", "LocalSystem"]
  newparam(:dsc_securitylevel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SecurityLevel - The security level the command runs under. Required when Type is Command. Valid values are None, LocalService, NetworkService, LocalSystem."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'LocalService', 'localservice', 'NetworkService', 'networkservice', 'LocalSystem', 'localsystem'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, LocalService, NetworkService, LocalSystem")
      end
    end
  end

  # Name:         ShouldLogError
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_shouldlogerror) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ShouldLogError - Boolean specifying if command errors should be logged. Required when Type is Command."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         WorkingDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_workingdirectory) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WorkingDirectory - The working directory of the command. Required when Type is Command."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReportTypes
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reporttypes, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ReportTypes - Array of Reports to create. Required when Type is Report."
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

Puppet::Type.type(:dsc_fsrmfilescreentemplateaction).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
