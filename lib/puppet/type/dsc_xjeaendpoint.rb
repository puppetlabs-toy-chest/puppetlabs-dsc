require 'pathname'

Puppet::Type.newtype(:dsc_xjeaendpoint) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xJeaEndPoint resource type.
    Automatically generated from
    'xJea/DSCResources/MSFT_xJeaEndpoint/MSFT_xJeaEndpoint.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xJeaEndPoint')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xJeaEndPoint'
    end

    defaultto 'xJeaEndPoint'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xJeaEndpoint')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xJeaEndpoint'
    end

    defaultto 'MSFT_xJeaEndpoint'
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
    desc "A read-only value that is the DSC Module Name ('xJea')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xJea'
    end

    defaultto 'xJea'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('0.3.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '0.3.0.0'
    end

    defaultto '0.3.0.0'
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Name of the JEA toolkit to be generated"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Toolkit
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_toolkit, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Toolkit - List of Jea Toolkits to make available via this endpoint"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         SecurityDescriptorSddl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_securitydescriptorsddl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SecurityDescriptorSddl - Sddl to define who can access this JeaEndpoint"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Group
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_group, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Group - List of local groups that this Endpoints JeaSessionAccount should be a member of"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Valid values are Present, Absent."
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

  # Name:         CleanAll
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cleanall) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CleanAll"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


end

Puppet::Type.type(:dsc_xjeaendpoint).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
