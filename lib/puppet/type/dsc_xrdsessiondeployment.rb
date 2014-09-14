begin
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
rescue LoadError => detail
  require 'pathname'
  lib_path = Pathname.new(__FILE__).dirname.parent.parent
  $:.unshift(lib_path)
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
end

Puppet::Type.newtype(:dsc_xrdsessiondeployment) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xRDSessionDeployment resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xRemoteDesktopSessionHost/DSCResources/MSFT_xRDSessionDeployment/MSFT_xRDSessionDeployment.schema.mof
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
      value.to_s.downcase.to_bool
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
