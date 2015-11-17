require 'pathname'

Puppet::Type.newtype(:dsc_xdhcpserverscope) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDhcpServerScope resource type.
    Automatically generated from
    'xDhcpServer/DSCResources/MSFT_xDhcpServerScope/MSFT_xDhcpServerScope.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_ipstartrange is a required attribute') if self[:dsc_ipstartrange].nil?
      fail('dsc_ipendrange is a required attribute') if self[:dsc_ipendrange].nil?
    end

  newproperty(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xDhcpServerScope')."

    def retrieve
      'xDhcpServerScope'
    end

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only'
    end
  end

  newproperty(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xDhcpServerScope')."

    def retrieve
      'MSFT_xDhcpServerScope'
    end

    validate do |value|
      fail 'dscmeta_resource_name is read-only'
    end
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

  newproperty(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xDhcpServer')."

    def retrieve
      'xDhcpServer'
    end

    validate do |value|
      fail 'dscmeta_module_name is read-only'
    end
  end

  newproperty(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.2').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    def retrieve
      '1.2'
    end

    validate do |value|
      fail 'dscmeta_module_version is read-only'
    end
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         IPStartRange
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_ipstartrange) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IPStartRange - Starting address to set for this scope"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IPEndRange
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_ipendrange) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IPEndRange - Ending address to set for this scope"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Name of DHCP Scope"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SubnetMask
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_subnetmask) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SubnetMask - Subnet mask for the scope specified in IP address format"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LeaseDuration
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_leaseduration) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LeaseDuration - Time interval for which an IP address should be leased"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         State
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Active", "Inactive"]
  newparam(:dsc_state) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "State - Whether scope should be active or inactive Valid values are Active, Inactive."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Active', 'active', 'Inactive', 'inactive'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Active, Inactive")
      end
    end
  end

  # Name:         AddressFamily
  # Type:         string
  # IsMandatory:  False
  # Values:       ["IPv4"]
  newparam(:dsc_addressfamily) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AddressFamily - Address family type Valid values are IPv4."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['IPv4', 'ipv4'].include?(value)
        fail("Invalid value '#{value}'. Valid values are IPv4")
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
    desc "Ensure - Whether scope should be set or removed Valid values are Present, Absent."
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

  # Name:         ScopeID
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scopeid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ScopeID - ScopeId for the given scope"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xdhcpserverscope).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
