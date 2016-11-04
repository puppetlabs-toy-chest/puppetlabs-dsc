require 'pathname'

Puppet::Type.newtype(:dsc_xrdsessioncollectionconfiguration) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xRDSessionCollectionConfiguration resource type.
    Automatically generated from
    'xRemoteDesktopSessionHost/DSCResources/MSFT_xRDSessionCollectionConfiguration/MSFT_xRDSessionCollectionConfiguration.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_collectionname is a required attribute') if self[:dsc_collectionname].nil?
    end

  def dscmeta_resource_friendly_name; 'xRDSessionCollectionConfiguration' end
  def dscmeta_resource_name; 'MSFT_xRDSessionCollectionConfiguration' end
  def dscmeta_module_name; 'xRemoteDesktopSessionHost' end
  def dscmeta_module_version; '1.3.0.0' end

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

  # Name:         CollectionName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_collectionname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CollectionName - Specifies the name of a session collection. "
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ActiveSessionLimitMin
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_activesessionlimitmin) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ActiveSessionLimitMin - Specifies the maximum time, in minutes, an active session runs. After this period, the RD Session Host server ends the session. "
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         AuthenticateUsingNLA
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authenticateusingnla) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AuthenticateUsingNLA - Indicates whether to use Network Level Authentication (NLA). If this value is $True, Remote Desktop uses NLA to authenticate a user before the user sees a logon screen. "
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AutomaticReconnectionEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_automaticreconnectionenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AutomaticReconnectionEnabled - Indicates whether the Remote Desktop client attempts to reconnect after a connection interruption. "
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BrokenConnectionAction
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_brokenconnectionaction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "BrokenConnectionAction - Specifies an action for an RD Session Host server to take after a connection interruption. The acceptable values for this parameter are: None, Disconnect, LogOff."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ClientDeviceRedirectionOptions
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_clientdeviceredirectionoptions) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ClientDeviceRedirectionOptions - Specifies a type of client device to be redirected to an RD Session Host server in this session collection. The acceptable values for this parameter are: None, AudioVideoPlayBack, AudioRecording, COMPort, PlugAndPlayDevice, SmartCard, Clipboard, LPTPort, Drive, TimeZone.  You can use binary-or to combine two or more values of this enum to specify multiple client device types."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ClientPrinterAsDefault
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_clientprinterasdefault) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ClientPrinterAsDefault - Indicates whether to use the client printer or server printer as the default printer. If this value is $True, use the client printer as default. If this value is $False, use the server as default."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ClientPrinterRedirected
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_clientprinterredirected) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ClientPrinterRedirected - Indicates whether to use client printer redirection, which routes print jobs from the Remote Desktop session to a printer attached to the client computer."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CollectionDescription
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_collectiondescription) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CollectionDescription - Specifies a description of the session collection. "
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectionBroker
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectionbroker) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectionBroker - Specifies the Remote Desktop Connection Broker (RD Connection Broker) server for a Remote Desktop deployment."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CustomRdpProperty
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_customrdpproperty) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CustomRdpProperty - Specifies Remote Desktop Protocol (RDP) settings to include in the .rdp files for all Windows Server 2012 RemoteApp programs and remote desktops published in this collection. "
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DisconnectedSessionLimitMin
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disconnectedsessionlimitmin) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DisconnectedSessionLimitMin - Specifies a length of time, in minutes. After client disconnection from a session for this period, the RD Session Host ends the session."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EncryptionLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_encryptionlevel) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EncryptionLevel - Specifies the level of data encryption used for a Remote Desktop session. The acceptable values for this parameter are: Low, ClientCompatible, High, FipsCompliant. The default value is ClientCompatible."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IdleSessionLimitMin
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_idlesessionlimitmin) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "IdleSessionLimitMin - Specifies the length of time, in minutes, to wait before an RD Session Host logs off or disconnects an idle session. The BrokenConnectionAction parameter determines whether to log off or disconnect. "
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxRedirectedMonitors
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxredirectedmonitors) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxRedirectedMonitors - Specifies the maximum number of client monitors that an RD Session Host server can redirect to a remote session. The highest value for this parameter is 16."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RDEasyPrintDriverEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rdeasyprintdriverenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RDEasyPrintDriverEnabled - Specifies whether to enable the Remote Desktop Easy Print driver."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SecurityLayer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_securitylayer) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SecurityLayer - Specifies which security protocol to use. The acceptable values for this parameter are:  RDP, Negotiate, SSL.  The default value is Negotiate."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TemporaryFoldersDeletedOnExit
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_temporaryfoldersdeletedonexit) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "TemporaryFoldersDeletedOnExit - Specifies whether to delete temporary folders from the RD Session Host server for a disconnected session. "
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         UserGroup
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usergroup) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserGroup - Specifies a domain group authorized to connect to the RD Session Host servers in a session collection. "
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

Puppet::Type.type(:dsc_xrdsessioncollectionconfiguration).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
