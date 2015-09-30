require 'pathname'

Puppet::Type.newtype(:dsc_xexcheventloglevel) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchEventLogLevel resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xExchange/DSCResources/MSFT_xExchEventLogLevel/MSFT_xExchEventLogLevel.schema.mof
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xExchEventLogLevel"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xExchEventLogLevel"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xExchange"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.3.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

if Puppet.version >= '4.0.0'
  autonotify(:reboot) { ['dsc_reboot'] }
end

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "The Identity parameter specifies the name of the event logging category for which you want to set the event logging level."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credentials used to establish a remote Powershell session to Exchange"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         Level
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Lowest", "Low", "Medium", "High", "Expert"]
  newparam(:dsc_level) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "The Level parameter specifies the log level for the specific event logging category."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Lowest', 'lowest', 'Low', 'low', 'Medium', 'medium', 'High', 'high', 'Expert', 'expert'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Lowest, Low, Medium, High, Expert")
      end
    end
  end


end

Puppet::Type.type(:dsc_xexcheventloglevel).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
