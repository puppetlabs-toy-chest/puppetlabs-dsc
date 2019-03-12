require 'pathname'

Puppet::Type.newtype(:dsc_netipinterface) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC NetIPInterface resource type.
    Automatically generated from
    'NetworkingDsc/DSCResources/MSFT_NetIPInterface/MSFT_NetIPInterface.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_interfacealias is a required attribute') if self[:dsc_interfacealias].nil?
      fail('dsc_addressfamily is a required attribute') if self[:dsc_addressfamily].nil?
    end

  def dscmeta_resource_friendly_name; 'NetIPInterface' end
  def dscmeta_resource_name; 'MSFT_NetIPInterface' end
  def dscmeta_module_name; 'NetworkingDsc' end
  def dscmeta_module_version; '7.0.0.0' end

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

  # Name:         InterfaceAlias
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_interfacealias) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InterfaceAlias - Alias of the network interface to configure."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AddressFamily
  # Type:         string
  # IsMandatory:  True
  # Values:       ["IPv4", "IPv6"]
  newparam(:dsc_addressfamily) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AddressFamily - IP address family on the interface to configure. Valid values are IPv4, IPv6."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['IPv4', 'ipv4', 'IPv6', 'ipv6'].include?(value)
        fail("Invalid value '#{value}'. Valid values are IPv4, IPv6")
      end
    end
  end

  # Name:         AdvertiseDefaultRoute
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_advertisedefaultroute) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AdvertiseDefaultRoute - Specifies the default router advertisement for an interface. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Advertising
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_advertising) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Advertising - Specifies the router advertisement value for the IP interface. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         AutomaticMetric
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_automaticmetric) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AutomaticMetric - Specifies the value for automatic metric calculation. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Dhcp
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_dhcp) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Dhcp - Specifies the Dynamic Host Configuration Protocol (DHCP) value for an IP interface. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         DirectedMacWolPattern
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_directedmacwolpattern) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DirectedMacWolPattern - Specifies the wake-up packet value for an IP interface. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         EcnMarking
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Disabled", "UseEct1", "UseEct0", "AppDecide"]
  newparam(:dsc_ecnmarking) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EcnMarking - Specifies the value for Explicit Congestion Notification (ECN) marking. Valid values are Disabled, UseEct1, UseEct0, AppDecide."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Disabled', 'disabled', 'UseEct1', 'useect1', 'UseEct0', 'useect0', 'AppDecide', 'appdecide'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Disabled, UseEct1, UseEct0, AppDecide")
      end
    end
  end

  # Name:         ForceArpNdWolPattern
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_forcearpndwolpattern) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ForceArpNdWolPattern - Specifies the Wake On LAN (WOL) value for the IP interface. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         Forwarding
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_forwarding) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Forwarding - Specifies the packet forwarding value for the IP interface. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         IgnoreDefaultRoutes
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_ignoredefaultroutes) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IgnoreDefaultRoutes - Specifies a value for Default Route advertisements. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         ManagedAddressConfiguration
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_managedaddressconfiguration) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ManagedAddressConfiguration - Specifies the value for managed address configuration. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         NeighborUnreachabilityDetection
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_neighborunreachabilitydetection) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NeighborUnreachabilityDetection - Specifies the value for Neighbor Unreachability Detection (NUD). Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         OtherStatefulConfiguration
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_otherstatefulconfiguration) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "OtherStatefulConfiguration - Specifies the value for configuration other than addresses. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         RouterDiscovery
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled", "ControlledByDHCP"]
  newparam(:dsc_routerdiscovery) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RouterDiscovery - Specifies the value for router discovery for an IP interface. Valid values are Enabled, Disabled, ControlledByDHCP."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled', 'ControlledByDHCP', 'controlledbydhcp'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled, ControlledByDHCP")
      end
    end
  end

  # Name:         WeakHostReceive
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_weakhostreceive) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WeakHostReceive - Specifies the receive value for a weak host model. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end

  # Name:         WeakHostSend
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_weakhostsend) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WeakHostSend - Specifies the send value for a weak host model. Valid values are Enabled, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_netipinterface).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
