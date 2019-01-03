require 'pathname'

Puppet::Type.newtype(:dsc_xnetadapteradvancedproperty) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xNetAdapterAdvancedProperty resource type.
    Automatically generated from
    'xNetworking/DSCResources/MSFT_xNetAdapterAdvancedProperty/MSFT_xNetAdapterAdvancedProperty.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_registrykeyword is a required attribute') if self[:dsc_registrykeyword].nil?
    end

  def dscmeta_resource_friendly_name; 'xNetAdapterAdvancedProperty' end
  def dscmeta_resource_name; 'MSFT_xNetAdapterAdvancedProperty' end
  def dscmeta_module_name; 'xNetworking' end
  def dscmeta_module_version; '5.6.0.0' end

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

  # Name:         RegistryKeyword
  # Type:         string
  # IsMandatory:  True
  # Values:       ["*DcbxMode", "*EncapsulatedPacketTaskOffload", "*FlowControl", "*InterruptModeration", "*IPChecksumOffloadIPv4", "*JumboPacket", "*LsoV2IPv4", "*LsoV2IPv6", "*MaxRssProcessors", "*NetworkDirect", "*NumaNodeId", "*NumRssQueues", "*PacketDirect", "*PriorityVLANTag", "*QOS", "*ReceiveBuffers", "*RecvCompletionMethod", "*RoceMaxFrameSize", "*RscIPv4", "*RSS", "*RssBaseProcNumber", "*RssMaxProcNumber", "*RssOnHostVPorts", "*RSSProfile", "RxIntModeration", "RxIntModerationProfile", "*SpeedDuplex", "*Sriov", "*TCPChecksumOffloadIPv4", "*TCPChecksumOffloadIPv6", "*TCPUDPChecksumOffloadIPv4", "*TCPUDPChecksumOffloadIPv6", "*TransmitBuffers", "TxIntModerationProfile", "*UDPChecksumOffloadIPv4", "*UDPChecksumOffloadIPv6", "VlanID", "*VMQ", "*VMQVlanFiltering", "AdaptiveIFS", "ITR", "LogLinkStateEvent", "MasterSlave", "NetworkAddress", "WaitAutoNegComplete"]
  newparam(:dsc_registrykeyword) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RegistryKeyword - Specifies the registrykeyword of the property that should be in desired state. Valid values are *DcbxMode, *EncapsulatedPacketTaskOffload, *FlowControl, *InterruptModeration, *IPChecksumOffloadIPv4, *JumboPacket, *LsoV2IPv4, *LsoV2IPv6, *MaxRssProcessors, *NetworkDirect, *NumaNodeId, *NumRssQueues, *PacketDirect, *PriorityVLANTag, *QOS, *ReceiveBuffers, *RecvCompletionMethod, *RoceMaxFrameSize, *RscIPv4, *RSS, *RssBaseProcNumber, *RssMaxProcNumber, *RssOnHostVPorts, *RSSProfile, RxIntModeration, RxIntModerationProfile, *SpeedDuplex, *Sriov, *TCPChecksumOffloadIPv4, *TCPChecksumOffloadIPv6, *TCPUDPChecksumOffloadIPv4, *TCPUDPChecksumOffloadIPv6, *TransmitBuffers, TxIntModerationProfile, *UDPChecksumOffloadIPv4, *UDPChecksumOffloadIPv6, VlanID, *VMQ, *VMQVlanFiltering, AdaptiveIFS, ITR, LogLinkStateEvent, MasterSlave, NetworkAddress, WaitAutoNegComplete."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['*DcbxMode', '*dcbxmode', '*EncapsulatedPacketTaskOffload', '*encapsulatedpackettaskoffload', '*FlowControl', '*flowcontrol', '*InterruptModeration', '*interruptmoderation', '*IPChecksumOffloadIPv4', '*ipchecksumoffloadipv4', '*JumboPacket', '*jumbopacket', '*LsoV2IPv4', '*lsov2ipv4', '*LsoV2IPv6', '*lsov2ipv6', '*MaxRssProcessors', '*maxrssprocessors', '*NetworkDirect', '*networkdirect', '*NumaNodeId', '*numanodeid', '*NumRssQueues', '*numrssqueues', '*PacketDirect', '*packetdirect', '*PriorityVLANTag', '*priorityvlantag', '*QOS', '*qos', '*ReceiveBuffers', '*receivebuffers', '*RecvCompletionMethod', '*recvcompletionmethod', '*RoceMaxFrameSize', '*rocemaxframesize', '*RscIPv4', '*rscipv4', '*RSS', '*rss', '*RssBaseProcNumber', '*rssbaseprocnumber', '*RssMaxProcNumber', '*rssmaxprocnumber', '*RssOnHostVPorts', '*rssonhostvports', '*RSSProfile', '*rssprofile', 'RxIntModeration', 'rxintmoderation', 'RxIntModerationProfile', 'rxintmoderationprofile', '*SpeedDuplex', '*speedduplex', '*Sriov', '*sriov', '*TCPChecksumOffloadIPv4', '*tcpchecksumoffloadipv4', '*TCPChecksumOffloadIPv6', '*tcpchecksumoffloadipv6', '*TCPUDPChecksumOffloadIPv4', '*tcpudpchecksumoffloadipv4', '*TCPUDPChecksumOffloadIPv6', '*tcpudpchecksumoffloadipv6', '*TransmitBuffers', '*transmitbuffers', 'TxIntModerationProfile', 'txintmoderationprofile', '*UDPChecksumOffloadIPv4', '*udpchecksumoffloadipv4', '*UDPChecksumOffloadIPv6', '*udpchecksumoffloadipv6', 'VlanID', 'vlanid', '*VMQ', '*vmq', '*VMQVlanFiltering', '*vmqvlanfiltering', 'AdaptiveIFS', 'adaptiveifs', 'ITR', 'itr', 'LogLinkStateEvent', 'loglinkstateevent', 'MasterSlave', 'masterslave', 'NetworkAddress', 'networkaddress', 'WaitAutoNegComplete', 'waitautonegcomplete'].include?(value)
        fail("Invalid value '#{value}'. Valid values are *DcbxMode, *EncapsulatedPacketTaskOffload, *FlowControl, *InterruptModeration, *IPChecksumOffloadIPv4, *JumboPacket, *LsoV2IPv4, *LsoV2IPv6, *MaxRssProcessors, *NetworkDirect, *NumaNodeId, *NumRssQueues, *PacketDirect, *PriorityVLANTag, *QOS, *ReceiveBuffers, *RecvCompletionMethod, *RoceMaxFrameSize, *RscIPv4, *RSS, *RssBaseProcNumber, *RssMaxProcNumber, *RssOnHostVPorts, *RSSProfile, RxIntModeration, RxIntModerationProfile, *SpeedDuplex, *Sriov, *TCPChecksumOffloadIPv4, *TCPChecksumOffloadIPv6, *TCPUDPChecksumOffloadIPv4, *TCPUDPChecksumOffloadIPv6, *TransmitBuffers, TxIntModerationProfile, *UDPChecksumOffloadIPv4, *UDPChecksumOffloadIPv6, VlanID, *VMQ, *VMQVlanFiltering, AdaptiveIFS, ITR, LogLinkStateEvent, MasterSlave, NetworkAddress, WaitAutoNegComplete")
      end
    end
  end

  # Name:         NetworkAdapterName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_networkadaptername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NetworkAdapterName - Specifies the network adapter name."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RegistryValue
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_registryvalue) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RegistryValue - Specifies the registryvalue."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DisplayValue
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_displayvalue) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DisplayValue - Output Display value of selected RegistryKeyword."
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

Puppet::Type.type(:dsc_xnetadapteradvancedproperty).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
