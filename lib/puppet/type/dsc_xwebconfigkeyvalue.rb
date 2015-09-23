require 'pathname'

Puppet::Type.newtype(:dsc_xwebconfigkeyvalue) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xWebConfigKeyValue resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xWebAdministration/DSCResources/MSFT_xWebConfigKeyValue/MSFT_xWebConfigKeyValue.schema.mof
  }

  validate do
      fail('dsc_websitepath is a required attribute') if self[:dsc_websitepath].nil?
      fail('dsc_configsection is a required attribute') if self[:dsc_configsection].nil?
      fail('dsc_key is a required attribute') if self[:dsc_key].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xWebConfigKeyValue"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xWebConfigKeyValue"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWebAdministration"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.7.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         WebsitePath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_websitepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path to website location(IIS or WebAdministration format)"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConfigSection
  # Type:         string
  # IsMandatory:  True
  # Values:       ["AppSettings"]
  newparam(:dsc_configsection) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Config Section to be update"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AppSettings', 'appsettings'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AppSettings")
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

  # Name:         Key
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_key) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Key for AppSettings"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Value
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_value) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Value for AppSettings"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IsAttribute
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isattribute) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "If the given key value pair is for attribute, default is element"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


end
