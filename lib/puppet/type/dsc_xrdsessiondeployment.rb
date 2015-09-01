require 'pathname'

Puppet::Type.newtype(:dsc_xrdsessiondeployment) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xRDSessionDeployment resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xRemoteDesktopSessionHost/DSCResources/MSFT_xRDSessionDeployment/MSFT_xRDSessionDeployment.schema.mof
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
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xRemoteDesktopSessionHost"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0"
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
    desc "Specifies the FQDN of a server to host the RD Web Access role service. "
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
