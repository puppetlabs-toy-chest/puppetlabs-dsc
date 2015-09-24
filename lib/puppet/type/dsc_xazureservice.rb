require 'pathname'

Puppet::Type.newtype(:dsc_xazureservice) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xAzureService resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xAzure/DSCResources/MSFT_xAzureService/MSFT_xAzureService.schema.mof
  }

  validate do
      fail('dsc_servicename is a required attribute') if self[:dsc_servicename].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xAzureService"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xAzureService"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xAzure"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.1.3"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         ServiceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_servicename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Specifies a name for the new cloud service that is unique to the subscription."
    isrequired
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
    desc "Specifies whether the service should be present or absent."
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

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Specifies the Azure Affinity Group for the service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AffinityGroup
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_affinitygroup) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Specifies a description for the service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Label
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_label) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Specifies a label for the service."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
