require 'pathname'

Puppet::Type.newtype(:dsc_xfirewallprofile) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xFirewallProfile resource type.
    Automatically generated from
    'xNetworking/DSCResources/MSFT_xFirewallProfile/MSFT_xFirewallProfile.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xFirewallProfile' end
  def dscmeta_resource_name; 'MSFT_xFirewallProfile' end
  def dscmeta_module_name; 'xNetworking' end
  def dscmeta_module_version; '5.1.0.0' end

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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Domain", "Public", "Private"]
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the firewall profile to configure. Valid values are Domain, Public, Private."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Domain', 'domain', 'Public', 'public', 'Private', 'private'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Domain, Public, Private")
      end
    end
  end

  # Name:         AllowInboundRules
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_allowinboundrules) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AllowInboundRules - Specifies that the firewall blocks inbound traffic. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end

  # Name:         AllowLocalFirewallRules
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_allowlocalfirewallrules) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AllowLocalFirewallRules - Specifies that the local firewall rules should be merged into the effective policy along with Group Policy settings. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end

  # Name:         AllowLocalIPsecRules
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_allowlocalipsecrules) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AllowLocalIPsecRules - Specifies that the local IPsec rules should be merged into the effective policy along with Group Policy settings. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end

  # Name:         AllowUnicastResponseToMulticast
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_allowunicastresponsetomulticast) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AllowUnicastResponseToMulticast - Allows unicast responses to multi-cast traffic. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end

  # Name:         AllowUserApps
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_allowuserapps) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AllowUserApps - Specifies that traffic from local user applications is allowed through the firewall. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end

  # Name:         AllowUserPorts
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_allowuserports) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AllowUserPorts - Specifies that traffic is allowed through local user ports. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end

  # Name:         DefaultInboundAction
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Block", "Allow", "NotConfigured"]
  newparam(:dsc_defaultinboundaction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DefaultInboundAction - Specifies how to filter inbound traffic. Valid values are Block, Allow, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Block', 'block', 'Allow', 'allow', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Block, Allow, NotConfigured")
      end
    end
  end

  # Name:         DefaultOutboundAction
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Block", "Allow", "NotConfigured"]
  newparam(:dsc_defaultoutboundaction) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DefaultOutboundAction - Specifies how to filter outbound traffic. Valid values are Block, Allow, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Block', 'block', 'Allow', 'allow', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Block, Allow, NotConfigured")
      end
    end
  end

  # Name:         DisabledInterfaceAliases
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disabledinterfacealiases, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DisabledInterfaceAliases - Specifies a list of interfaces on which firewall settings are excluded."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Enabled
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_enabled) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Enabled - Specifies that devolution is activated. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end

  # Name:         EnableStealthModeForIPsec
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_enablestealthmodeforipsec) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EnableStealthModeForIPsec - Enables stealth mode for IPsec traffic. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end

  # Name:         LogAllowed
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_logallowed) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogAllowed - Specifies how to log the allowed packets in the location specified by the LogFileName parameter. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end

  # Name:         LogBlocked
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_logblocked) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogBlocked - Specifies how to log the dropped packets in the location specified by the LogFileName parameter. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end

  # Name:         LogFileName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logfilename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogFileName - Specifies the path and filename of the file to which Windows Server writes log entries."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogIgnored
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_logignored) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogIgnored - Specifies how to log the ignored packets in the location specified by the LogFileName parameter. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end

  # Name:         LogMaxSizeKilobytes
  # Type:         uint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logmaxsizekilobytes) do
    def mof_type; 'uint64' end
    def mof_is_embedded?; false end
    desc "LogMaxSizeKilobytes - Specifies the maximum file size of the log, in kilobytes. The acceptable values for this parameter are: 1 through 32767."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NotifyOnListen
  # Type:         string
  # IsMandatory:  False
  # Values:       ["True", "False", "NotConfigured"]
  newparam(:dsc_notifyonlisten) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NotifyOnListen - Allows the notification of listening for inbound connections by a service. Valid values are True, False, NotConfigured."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['True', 'true', 'False', 'false', 'NotConfigured', 'notconfigured'].include?(value)
        fail("Invalid value '#{value}'. Valid values are True, False, NotConfigured")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xfirewallprofile).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
