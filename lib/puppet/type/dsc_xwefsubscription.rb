require 'pathname'

Puppet::Type.newtype(:dsc_xwefsubscription) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xWEFSubscription resource type.
    Automatically generated from
    'xWindowsEventForwarding/DSCResources/MSFT_xWEFSubscription/MSFT_xWEFSubscription.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_subscriptionid is a required attribute') if self[:dsc_subscriptionid].nil?
    end

  def dscmeta_resource_friendly_name; 'xWEFSubscription' end
  def dscmeta_resource_name; 'MSFT_xWEFSubscription' end
  def dscmeta_module_name; 'xWindowsEventForwarding' end
  def dscmeta_module_version; '1.0.0.0' end

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

  # Name:         SubscriptionID
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_subscriptionid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SubscriptionID - Name of the Subscription"
    isrequired
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
    desc "Ensure - Determines whether to validate or remove the scubscription Valid values are Present, Absent."
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

  # Name:         SubscriptionType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["CollectorInitiated", "SourceInitiated"]
  newparam(:dsc_subscriptiontype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SubscriptionType - Type of Subscription to create Valid values are CollectorInitiated, SourceInitiated."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['CollectorInitiated', 'collectorinitiated', 'SourceInitiated', 'sourceinitiated'].include?(value)
        fail("Invalid value '#{value}'. Valid values are CollectorInitiated, SourceInitiated")
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
    desc "Description - Description of the Collector subscription"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Enabled
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_enabled) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Enabled - Sets whether the subscription will be enabled, default true Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
      end
    end
  end

  # Name:         DeliveryMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Push", "Pull"]
  newparam(:dsc_deliverymode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DeliveryMode - Configures whether the collector will pull events from source nodes or if the source nodes will push events to the collector, default push Valid values are Push, Pull."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Push', 'push', 'Pull', 'pull'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Push, Pull")
      end
    end
  end

  # Name:         MaxItems
  # Type:         sint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxitems) do
    def mof_type; 'sint32' end
    def mof_is_embedded?; false end
    desc "MaxItems - The number of events that can occur on the source before they are submitted to the collector, default 1"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxLatencyTime
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxlatencytime) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "MaxLatencyTime - The maximum amount of time that can pass before events are submitted to the collector, default 20000"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         HeartBeatInterval
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_heartbeatinterval) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "HeartBeatInterval - Frequency to verify connectivity, default 20000"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ReadExistingEvents
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_readexistingevents) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReadExistingEvents - Should the collector read existing or only new events, default false Valid values are true, false."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
      end
    end
  end

  # Name:         TransportName
  # Type:         string
  # IsMandatory:  False
  # Values:       ["HTTP", "HTTPS"]
  newparam(:dsc_transportname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TransportName - Determines whether to require SSL, default HTTP Valid values are HTTP, HTTPS."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['HTTP', 'http', 'HTTPS', 'https'].include?(value)
        fail("Invalid value '#{value}'. Valid values are HTTP, HTTPS")
      end
    end
  end

  # Name:         TransportPort
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_transportport) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TransportPort - Set the port number that WinRM should use to make a connection, default 5985"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ContentFormat
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_contentformat) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ContentFormat - Format that event logs will be submitted in, default RenderedText"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Locale
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_locale) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Locale - Sets the subscription Locale, default en-US"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogFile
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logfile) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogFile - Sets the event log that the collected events will be written to, default ForwardedEvents"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CredentialsType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Default", "Basic", "Negotiate", "Digest"]
  newparam(:dsc_credentialstype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CredentialsType - Sets the credential type used for authenticating to WinRM, default Default Valid values are Default, Basic, Negotiate, Digest."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Default', 'default', 'Basic', 'basic', 'Negotiate', 'negotiate', 'Digest', 'digest'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Default, Basic, Negotiate, Digest")
      end
    end
  end

  # Name:         AllowedSourceNonDomainComputers
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowedsourcenondomaincomputers, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "AllowedSourceNonDomainComputers - This parameter has not been fully implemented, only required for source initiated scenarios, provide XML to set IssuerCAList, AllowedSubjectList, or DeniedSubjectList if this will be used, default empty string"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         AllowedSourceDomainComputers
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowedsourcedomaincomputers) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AllowedSourceDomainComputers - In Source Initiated scenario this SDDL determines who can push events, default O:NSG:NSD:(A;;GA;;;DC)(A;;GA;;;NS) which equates to Domain Computers and Network Service"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Query
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_query, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Query - Expects an array of hashtables that set which events should be collected, default is all application and system logs"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Address
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_address, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Address - Expects an array of source node FQDNs, default source.wef.test to prevent errors when only staging test subscription"
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

Puppet::Type.type(:dsc_xwefsubscription).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
