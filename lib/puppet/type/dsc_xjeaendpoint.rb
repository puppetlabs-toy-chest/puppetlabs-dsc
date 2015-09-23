require 'pathname'

Puppet::Type.newtype(:dsc_xjeaendpoint) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xJeaEndPoint resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xJea/DSCResources/MSFT_xJeaEndpoint/MSFT_xJeaEndpoint.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xJeaEndPoint"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xJeaEndpoint"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xJea"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.2.16.5"
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
    desc "Name of the JEA toolkit to be generated"
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
    desc "List of Jea Toolkits to make available via this endpoint"
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
    desc "Sddl to define who can access this JeaEndpoint"
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
    desc "List of local groups that this Endpoints JeaSessionAccount should be a member of"
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
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


end
