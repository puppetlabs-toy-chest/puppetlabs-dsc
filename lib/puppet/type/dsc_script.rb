require 'pathname'

Puppet::Type.newtype(:dsc_script) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC Script resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ScriptResource/MSFT_ScriptResource.schema.mof
  }

  validate do
      fail('dsc_getscript is a required attribute') if self[:dsc_getscript].nil?
      fail('dsc_setscript is a required attribute') if self[:dsc_setscript].nil?
      fail('dsc_testscript is a required attribute') if self[:dsc_testscript].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "Script"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_ScriptResource"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "PSDesiredStateConfiguration"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         GetScript
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_getscript) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SetScript
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_setscript) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TestScript
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_testscript) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         Result
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_result) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_script).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
