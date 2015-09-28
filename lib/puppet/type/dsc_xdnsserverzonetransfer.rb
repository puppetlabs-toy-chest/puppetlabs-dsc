require 'pathname'

Puppet::Type.newtype(:dsc_xdnsserverzonetransfer) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xDnsServerZoneTransfer resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xDnsServer/DSCResources/MSFT_xDnsServerZoneTransfer/MSFT_xDnsServerZoneTransfer.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xDnsServerZoneTransfer"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xDnsServerZoneTransfer"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xDnsServer"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name of the DNS zone"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Any", "Named", "Specific"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type of transfer allowed"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Any', 'any', 'Named', 'named', 'Specific', 'specific'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Any, Named, Specific")
      end
    end
  end

  # Name:         SecondaryServer
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_secondaryserver, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "IP address or DNS name of DNS servers where zone information can be transfered"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end


end
