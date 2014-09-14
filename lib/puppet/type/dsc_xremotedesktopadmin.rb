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

Puppet::Type.newtype(:dsc_xremotedesktopadmin) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xRemoteDesktopAdmin resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xRemoteDesktopAdmin/DSCResources/MSFT_xRemoteDesktopAdmin/MSFT_xRemoteDesktopAdmin.schema.mof
  }

  validate do
      fail('dsc_ensure is a required attribute') if self[:dsc_ensure].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xRemoteDesktopAdmin"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xRemoteDesktopAdmin"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xRemoteDesktopAdmin"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    defaultvalues
    defaultto :present
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    desc "Determines whether or not the computer should accept remote connections.  Present sets the value to Enabled and Absent sets the value to Disabled."
    isrequired
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

  # Name:         UserAuthentication
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Secure", "NonSecure"]
  newparam(:dsc_userauthentication) do
    desc "User Authentication.  Setting this value to Secure configures the machine to require NLA."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Secure', 'secure', 'NonSecure', 'nonsecure'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Secure, NonSecure")
      end
    end
  end


end
