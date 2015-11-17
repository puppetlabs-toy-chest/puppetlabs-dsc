require 'pathname'

Puppet::Type.newtype(:dsc_xremotedesktopadmin) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xRemoteDesktopAdmin resource type.
    Automatically generated from
    'xRemoteDesktopAdmin/DSCResources/xRemoteDesktopAdmin/xRemoteDesktopAdmin.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_ensure is a required attribute') if self[:dsc_ensure].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xRemoteDesktopAdmin')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xRemoteDesktopAdmin'
    end

    defaultto 'xRemoteDesktopAdmin'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('xRemoteDesktopAdmin')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'xRemoteDesktopAdmin'
    end

    defaultto 'xRemoteDesktopAdmin'
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
    desc "A read-only value that is the DSC Module Name ('xRemoteDesktopAdmin')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xRemoteDesktopAdmin'
    end

    defaultto 'xRemoteDesktopAdmin'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.1.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '1.1.0.0'
    end

    defaultto '1.1.0.0'
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Determines whether or not the computer should accept remote connections.  Present sets the value to Enabled and Absent sets the value to Disabled. Valid values are Present, Absent."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserAuthentication - User Authentication.  Setting this value to Secure configures the machine to require NLA. Valid values are Secure, NonSecure."
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

Puppet::Type.type(:dsc_xremotedesktopadmin).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
