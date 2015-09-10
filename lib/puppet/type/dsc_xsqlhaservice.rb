require 'pathname'

Puppet::Type.newtype(:dsc_xsqlhaservice) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSqlHAService resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSqlPs/DSCResources/MSFT_xSqlHAService/MSFT_xSqlHAService.schema.mof
  }

  validate do
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSqlHAService"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSqlHAService"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSqlPs"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.1.3.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "The name of Sql instance."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SqlAdministratorCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqladministratorcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Sql sa credential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
    end
  end

  # Name:         ServiceCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_servicecredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Domain credential to run sql service"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
    end
  end


end
