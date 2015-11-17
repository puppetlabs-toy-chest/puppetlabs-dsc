require 'pathname'

Puppet::Type.newtype(:dsc_xdatabaseserver) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDatabaseServer resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xDatabase/DSCResources/MSFT_xDatabaseServer/MSFT_xDatabaseServer.schema.mof
  }

  validate do
      fail('dsc_loginmode is a required attribute') if self[:dsc_loginmode].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xDatabaseServer"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xDatabaseServer"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xDatabase"
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

  # Name:         LoginMode
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Windows", "Mixed"]
  newparam(:dsc_loginmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Windows', 'windows', 'Mixed', 'mixed'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Windows, Mixed")
      end
    end
  end


end

Puppet::Type.type(:dsc_xdatabaseserver).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
