require 'pathname'

Puppet::Type.newtype(:dsc_xiismodule) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xIisModule resource type.
    Automatically generated from
    'xWebAdministration/DSCResources/MSFT_xIisModule/MSFT_xIisModule.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xIisModule')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xIisModule'
    end

    defaultto 'xIisModule'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xIisModule')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xIisModule'
    end

    defaultto 'MSFT_xIisModule'
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
    desc "A read-only value that is the DSC Module Name ('xWebAdministration')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xWebAdministration'
    end

    defaultto 'xWebAdministration'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.7.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '1.7.0.0'
    end

    defaultto '1.7.0.0'
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - The path to the module, usually a dll, to be added to IIS."
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
    desc "Name - The logical name of the module to add to IIS."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RequestPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requestpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RequestPath - The allowed request Path example: *.php"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Verb
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_verb, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Verb - The supported verbs for the module."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         SiteName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sitename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SiteName - The IIS Site to register the module."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
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
    desc "Ensure - Should the module be present or absent. Valid values are Present, Absent."
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

  # Name:         ModuleType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["FastCgiModule"]
  newparam(:dsc_moduletype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ModuleType - The type of the module. Valid values are FastCgiModule."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['FastCgiModule', 'fastcgimodule'].include?(value)
        fail("Invalid value '#{value}'. Valid values are FastCgiModule")
      end
    end
  end

  # Name:         EndPointSetup
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_endpointsetup) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EndPointSetup - The End Point is setup.  Such as a Fast Cgi endpoint."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


end

Puppet::Type.type(:dsc_xiismodule).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
