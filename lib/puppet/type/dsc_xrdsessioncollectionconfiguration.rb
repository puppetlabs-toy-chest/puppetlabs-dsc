begin
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
rescue LoadError => detail
  require 'pathname'
  lib_path = Pathname.new(__FILE__).dirname.parent.parent
  $:.unshift(lib_path)
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
end

Puppet::Type.newtype(:dsc_xrdsessioncollectionconfiguration) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xRDSessionCollectionConfiguration resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xRemoteDesktopSessionHost/DSCResources/MSFT_xRDSessionCollectionConfiguration/MSFT_xRDSessionCollectionConfiguration.schema.mof
  }

  validate do
      fail('dsc_collectionname is a required attribute') if self[:dsc_collectionname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xRDSessionCollectionConfiguration"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xRDSessionCollectionConfiguration"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xRemoteDesktopSessionHost"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0"
  end

  newparam(:name, :namevar => true ) do
  end

  # Name:         CollectionName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_collectionname) do
    desc "Specifies the name of a session collection. "
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
    desc "Specifies the maximum time, in minutes, an active session runs. After this period, the RD Session Host server ends the session. "
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         AuthenticateUsingNLA
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authenticateusingnla) do
    desc "Indicates whether to use Network Level Authentication (NLA). If this value is $True, Remote Desktop uses NLA to authenticate a user before the user sees a logon screen. "
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         AutomaticReconnectionEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_automaticreconnectionenabled) do
    desc "Indicates whether the Remote Desktop client attempts to reconnect after a connection interruption. "
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         BrokenConnectionAction
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_brokenconnectionaction) do
    desc "Specifies an action for an RD Session Host server to take after a connection interruption. The acceptable values for this parameter are: None, Disconnect, LogOff."
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
    desc "Specifies a type of client device to be redirected to an RD Session Host server in this session collection. The acceptable values for this parameter are: None, AudioVideoPlayBack, AudioRecording, COMPort, PlugAndPlayDevice, SmartCard, Clipboard, LPTPort, Drive, TimeZone.  You can use binary-or to combine two or more values of this enum to specify multiple client device types."
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
    desc "Indicates whether to use the client printer or server printer as the default printer. If this value is $True, use the client printer as default. If this value is $False, use the server as default."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         ClientPrinterRedirected
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_clientprinterredirected) do
    desc "Indicates whether to use client printer redirection, which routes print jobs from the Remote Desktop session to a printer attached to the client computer."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         CollectionDescription
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_collectiondescription) do
    desc "Specifies a description of the session collection. "
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
    desc "Specifies the Remote Desktop Connection Broker (RD Connection Broker) server for a Remote Desktop deployment."
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
    desc "Specifies Remote Desktop Protocol (RDP) settings to include in the .rdp files for all Windows Server 2012 RemoteApp programs and remote desktops published in this collection. "
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
    desc "Specifies a length of time, in minutes. After client disconnection from a session for this period, the RD Session Host ends the session."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         EncryptionLevel
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_encryptionlevel) do
    desc "Specifies the level of data encryption used for a Remote Desktop session. The acceptable values for this parameter are: Low, ClientCompatible, High, FipsCompliant. The default value is ClientCompatible."
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
    desc "Specifies the length of time, in minutes, to wait before an RD Session Host logs off or disconnects an idle session. The BrokenConnectionAction parameter determines whether to log off or disconnect. "
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         MaxRedirectedMonitors
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxredirectedmonitors) do
    desc "Specifies the maximum number of client monitors that an RD Session Host server can redirect to a remote session. The highest value for this parameter is 16."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         RDEasyPrintDriverEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rdeasyprintdriverenabled) do
    desc "Specifies whether to enable the Remote Desktop Easy Print driver."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         SecurityLayer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_securitylayer) do
    desc "Specifies which security protocol to use. The acceptable values for this parameter are:  RDP, Negotiate, SSL.  The default value is Negotiate."
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
    desc "Specifies whether to delete temporary folders from the RD Session Host server for a disconnected session. "
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         UserGroup
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usergroup) do
    desc "Specifies a domain group authorized to connect to the RD Session Host servers in a session collection. "
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
