require 'pathname'

Puppet::Type.newtype(:dsc_xfirewall) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xFirewall resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xNetworking/DSCResources/MSFT_xFirewall/MSFT_xFirewall.Schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xFirewall"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xFirewall"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xNetworking"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.2.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name of the Firewall Rule"
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
    desc "Localized, user-facing name of the Firewall Rule being created"
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
    desc "Name of the Firewall Group where we want to put the Firewall Rules"
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
    desc "Ensure the presence/absence of the resource"
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

  # Name:         Access
  # Type:         string
  # IsMandatory:  False
  # Values:       ["NotConfigured", "Allow", "Block"]
  newparam(:dsc_access) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Permit or Block the supplied configuration"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['NotConfigured', 'notconfigured', 'Allow', 'allow', 'Block', 'block'].include?(value)
        fail("Invalid value '#{value}'. Valid values are NotConfigured, Allow, Block")
      end
    end
  end

  # Name:         State
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_state) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Enable or disable the supplied configuration"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
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
    desc "Specifies one or more profiles to which the rule is assigned"
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
    desc "Direction of the connection"
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
    desc "Specific Port used for filter. Specified by port number, range, or keyword"
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
    desc "Local Port used for the filter"
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
    desc "Specific Protocol for filter. Specified by name, number, or range"
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
    desc "Documentation for the Rule"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ApplicationPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applicationpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path and file name of the program for which the rule is applied"
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
    desc "Specifies the short name of a Windows service to which the firewall rule applies"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
