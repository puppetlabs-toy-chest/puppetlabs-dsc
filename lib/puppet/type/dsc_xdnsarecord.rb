require 'pathname'

Puppet::Type.newtype(:dsc_xdnsarecord) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDnsARecord resource type.
    Automatically generated from
    'xDnsServer/DSCResources/MSFT_xDnsARecord/MSFT_xDnsARecord.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_zone is a required attribute') if self[:dsc_zone].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xDnsARecord')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xDnsARecord'
    end

    defaultto 'xDnsARecord'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xDnsARecord')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xDnsARecord'
    end

    defaultto 'MSFT_xDnsARecord'
  end

  newparam(:dscmeta_import_resource) do
    desc "Please ignore this parameter.
      Defaults to `true`."
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xDnsServer')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xDnsServer'
    end

    defaultto 'xDnsServer'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.3.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '1.3.0.0'
    end

    defaultto '1.3.0.0'
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
    desc "Name"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Zone
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_zone) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Zone"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Target
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_target) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Target"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xdnsarecord).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
