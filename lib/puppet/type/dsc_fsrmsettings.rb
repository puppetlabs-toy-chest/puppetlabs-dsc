require 'pathname'

Puppet::Type.newtype(:dsc_fsrmsettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC FSRMSettings resource type.
    Automatically generated from
    'FSRMDsc/DSCResources/DSR_FSRMSettings/DSR_FSRMSettings.schema.mof'

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

  def dscmeta_resource_friendly_name; 'FSRMSettings' end
  def dscmeta_resource_name; 'DSR_FSRMSettings' end
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

  # Name:         SmtpServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_smtpserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SmtpServer - Specifies the fully qualified domain name (FQDN) or IP address of the SMTP server that FSRM uses to send email."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AdminEmailAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adminemailaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AdminEmailAddress - Specifies a semicolon-separated list of email addresses for the recipients of any email that the server sends to the administrator."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FromEmailAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fromemailaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FromEmailAddress - Specifies the default email address from which FSRM sends email messages."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CommandNotificationLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_commandnotificationlimit) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "CommandNotificationLimit - Specifies the minimum number of seconds between individual running events of a command-type notification."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EmailNotificationLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_emailnotificationlimit) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EmailNotificationLimit - Specifies the minimum number of seconds between individual running events of an email-type notification."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EventNotificationLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_eventnotificationlimit) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EventNotificationLimit - Specifies the minimum number of seconds between individual running events of an event-type notification."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
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

Puppet::Type.type(:dsc_fsrmsettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
