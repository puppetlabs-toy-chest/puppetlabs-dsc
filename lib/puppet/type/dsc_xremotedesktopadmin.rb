require 'pathname'

Puppet::Type.newtype(:dsc_xremotedesktopadmin) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xRemoteDesktopAdmin resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xRemoteDesktopAdmin/DSCResources/xRemoteDesktopAdmin/xRemoteDesktopAdmin.schema.mof
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
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xRemoteDesktopAdmin"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0.2"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
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
