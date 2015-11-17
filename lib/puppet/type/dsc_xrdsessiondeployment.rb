require 'pathname'

Puppet::Type.newtype(:dsc_xrdsessiondeployment) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xRDSessionDeployment resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xRemoteDesktopSessionHost/DSCResources/MSFT_xRDSessionDeployment/MSFT_xRDSessionDeployment.schema.mof
  }

  validate do
      fail('dsc_sessionhost is a required attribute') if self[:dsc_sessionhost].nil?
      fail('dsc_connectionbroker is a required attribute') if self[:dsc_connectionbroker].nil?
      fail('dsc_webaccessserver is a required attribute') if self[:dsc_webaccessserver].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xRDSessionDeployment"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xRDSessionDeployment"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xRemoteDesktopSessionHost"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.1.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         SessionHost
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_sessionhost) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Specifies the FQDN of a server to host the RD Session Host role service. "
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectionBroker
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_connectionbroker) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Specifies the FQDN of a server to host the RD Connection Broker role service."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WebAccessServer
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_webaccessserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Specifies the FQDN of a server to host the RD Web Access role service. "
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xrdsessiondeployment).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
