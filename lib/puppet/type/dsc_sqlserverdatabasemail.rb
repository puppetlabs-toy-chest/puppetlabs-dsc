require 'pathname'

Puppet::Type.newtype(:dsc_sqlserverdatabasemail) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SqlServerDatabaseMail resource type.
    Automatically generated from
    'SqlServerDsc/DSCResources/MSFT_SqlServerDatabaseMail/MSFT_SqlServerDatabaseMail.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_accountname is a required attribute') if self[:dsc_accountname].nil?
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
    end

  def dscmeta_resource_friendly_name; 'SqlServerDatabaseMail' end
  def dscmeta_resource_name; 'MSFT_SqlServerDatabaseMail' end
  def dscmeta_module_name; 'SqlServerDsc' end
  def dscmeta_module_version; '11.1.0.0' end

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

  # Name:         AccountName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_accountname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AccountName - The name of the Database Mail account."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceName - The name of the SQL instance to be configured."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EmailAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_emailaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EmailAddress - The e-mail address from which mail will originate."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MailServerName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mailservername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MailServerName - The fully qualified domain name of the mail server name to which e-mail are sent."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProfileName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_profilename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProfileName - The profile name of the Database Mail."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
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
    desc "Ensure - Specifies the desired state of the Database Mail. When set to 'Present', the Database Mail will be created. When set to 'Absent', the Database Mail will be removed. Default value is 'Present'. Valid values are Present, Absent."
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

  # Name:         ServerName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_servername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerName - The hostname of the SQL Server to be configured. Defaults to $env:COMPUTERNAME."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DisplayName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_displayname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DisplayName - The display name of the outgoing mail server. Default value is the same value assigned to parameter MailServerName."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReplyToAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_replytoaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReplyToAddress - The e-mail address to which the receiver of e-mails will reply to. Default value is the same e-mail address assigned to parameter EmailAddress."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - The description of the Database Mail."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LoggingLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Normal", "Extended", "Verbose"]
  newparam(:dsc_logginglevel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LoggingLevel - The logging level that the Database Mail will use. If not specified the default logging level is 'Extended'. Valid values are Normal, Extended, Verbose."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Normal', 'normal', 'Extended', 'extended', 'Verbose', 'verbose'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Normal, Extended, Verbose")
      end
    end
  end

  # Name:         TcpPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tcpport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "TcpPort - The TCP port used for communication. Default value is port 25."
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

Puppet::Type.type(:dsc_sqlserverdatabasemail).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
