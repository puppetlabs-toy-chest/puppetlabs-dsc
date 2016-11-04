require 'pathname'

Puppet::Type.newtype(:dsc_xfirewall) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xFirewall resource type.
    Automatically generated from
    'xNetworking/DSCResources/MSFT_xFirewall/MSFT_xFirewall.Schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'xFirewall' end
  def dscmeta_resource_name; 'MSFT_xFirewall' end
  def dscmeta_module_name; 'xNetworking' end
  def dscmeta_module_version; '3.0.0.0' end

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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Name of the Firewall Rule"
    isrequired
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
    desc "DisplayName - Localized, user-facing name of the Firewall Rule being created"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Group
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_group) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Group - Name of the Firewall Group where we want to put the Firewall Rule"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DisplayGroup
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_displaygroup) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DisplayGroup - The current value of the Display Group of the Firewall Rule"
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
    desc "Ensure - Ensure the presence/absence of the resource Valid values are Present, Absent."
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

  # Name:         Enabled
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False"]
  newparam(:dsc_enabled) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Enabled - Enable or disable the supplied configuration Valid values are True, False."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False")
      end
    end
  end

  # Name:         Action
  # Type:         string
  # IsMandatory:  False
  # Values:       ["NotConfigured", "Allow", "Block"]
  newparam(:dsc_action) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Action - Allow or Block the supplied configuration Valid values are NotConfigured, Allow, Block."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['NotConfigured', 'notconfigured', 'Allow', 'allow', 'Block', 'block'].include?(value)
        fail("Invalid value '#{value}'. Valid values are NotConfigured, Allow, Block")
      end
    end
  end

  # Name:         Profile
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_profile, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Profile - Specifies one or more profiles to which the rule is assigned"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Direction
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Inbound", "Outbound"]
  newparam(:dsc_direction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Direction - Direction of the connection Valid values are Inbound, Outbound."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Inbound', 'inbound', 'Outbound', 'outbound'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Inbound, Outbound")
      end
    end
  end

  # Name:         RemotePort
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_remoteport, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "RemotePort - Specific Port used for filter. Specified by port number, range, or keyword"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         LocalPort
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_localport, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "LocalPort - Local Port used for the filter"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Protocol
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_protocol) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Protocol - Specific Protocol for filter. Specified by name, number, or range"
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
    desc "Description - Documentation for the Rule"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Program
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_program) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Program - Path and file name of the program for which the rule is applied"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Service
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_service) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Service - Specifies the short name of a Windows service to which the firewall rule applies"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Authentication
  # Type:         string
  # IsMandatory:  False
  # Values:       ["NotRequired", "Required", "NoEncap"]
  newparam(:dsc_authentication) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Authentication - Specifies that authentication is required on firewall rules Valid values are NotRequired, Required, NoEncap."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['NotRequired', 'notrequired', 'Required', 'required', 'NoEncap', 'noencap'].include?(value)
        fail("Invalid value '#{value}'. Valid values are NotRequired, Required, NoEncap")
      end
    end
  end

  # Name:         Encryption
  # Type:         string
  # IsMandatory:  False
  # Values:       ["NotRequired", "Required", "Dynamic"]
  newparam(:dsc_encryption) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Encryption - Specifies that encryption in authentication is required on firewall rules Valid values are NotRequired, Required, Dynamic."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['NotRequired', 'notrequired', 'Required', 'required', 'Dynamic', 'dynamic'].include?(value)
        fail("Invalid value '#{value}'. Valid values are NotRequired, Required, Dynamic")
      end
    end
  end

  # Name:         InterfaceAlias
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_interfacealias, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "InterfaceAlias - Specifies the alias of the interface that applies to the traffic"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         InterfaceType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Any", "Wired", "Wireless", "RemoteAccess"]
  newparam(:dsc_interfacetype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InterfaceType - Specifies that only network connections made through the indicated interface types are subject to the requirements of this rule Valid values are Any, Wired, Wireless, RemoteAccess."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Any', 'any', 'Wired', 'wired', 'Wireless', 'wireless', 'RemoteAccess', 'remoteaccess'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Any, Wired, Wireless, RemoteAccess")
      end
    end
  end

  # Name:         LocalAddress
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_localaddress, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "LocalAddress - Specifies that network packets with matching IP addresses match this rule"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         LocalUser
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_localuser) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LocalUser - Specifies the principals to which network traffic this firewall rule applies"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Package
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_package) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Package - Specifies the Windows Store application to which the firewall rule applies"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Platform
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_platform, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Platform - Specifies which version of Windows the associated rule applies"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         RemoteAddress
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_remoteaddress, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "RemoteAddress - Specifies that network packets with matching IP addresses match this rule"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         RemoteMachine
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_remotemachine) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RemoteMachine - Specifies that matching IPsec rules of the indicated computer accounts are created"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RemoteUser
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_remoteuser) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RemoteUser - Specifies that matching IPsec rules of the indicated user accounts are created"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DynamicTransport
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Any", "ProximityApps", "ProximitySharing", "WifiDirectPrinting", "WifiDirectDisplay", "WifiDirectDevices"]
  newparam(:dsc_dynamictransport) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DynamicTransport - Specifies a dynamic transport Valid values are Any, ProximityApps, ProximitySharing, WifiDirectPrinting, WifiDirectDisplay, WifiDirectDevices."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Any', 'any', 'ProximityApps', 'proximityapps', 'ProximitySharing', 'proximitysharing', 'WifiDirectPrinting', 'wifidirectprinting', 'WifiDirectDisplay', 'wifidirectdisplay', 'WifiDirectDevices', 'wifidirectdevices'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Any, ProximityApps, ProximitySharing, WifiDirectPrinting, WifiDirectDisplay, WifiDirectDevices")
      end
    end
  end

  # Name:         EdgeTraversalPolicy
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Block", "Allow", "DeferToUser", "DeferToApp"]
  newparam(:dsc_edgetraversalpolicy) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EdgeTraversalPolicy - Specifies that matching firewall rules of the indicated edge traversal policy are created Valid values are Block, Allow, DeferToUser, DeferToApp."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Block', 'block', 'Allow', 'allow', 'DeferToUser', 'defertouser', 'DeferToApp', 'defertoapp'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Block, Allow, DeferToUser, DeferToApp")
      end
    end
  end

  # Name:         IcmpType
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_icmptype, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "IcmpType - Specifies the ICMP type codes"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         LocalOnlyMapping
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_localonlymapping) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LocalOnlyMapping - Indicates that matching firewall rules of the indicated value are created"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LooseSourceMapping
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_loosesourcemapping) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LooseSourceMapping - Indicates that matching firewall rules of the indicated value are created"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         OverrideBlockRules
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_overrideblockrules) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "OverrideBlockRules - Indicates that matching network traffic that would otherwise be blocked are allowed"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Owner
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_owner) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Owner - Specifies that matching firewall rules of the indicated owner are created"
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

Puppet::Type.type(:dsc_xfirewall).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
