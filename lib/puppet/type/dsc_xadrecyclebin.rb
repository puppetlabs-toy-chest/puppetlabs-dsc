require 'pathname'

Puppet::Type.newtype(:dsc_xadrecyclebin) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows



  end

  @doc = %q{
    The DSC xADRecycleBin resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADRecycleBin/MSFT_xADRecycleBin.schema.mof
  }

  validate do
      fail('dsc_forestfqdn is a required attribute') if self[:dsc_forestfqdn].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xADRecycleBin"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xADRecycleBin"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xActiveDirectory"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.5.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto :present
  end

  # Name:         ForestFQDN
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_forestfqdn) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EnterpriseAdministratorCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enterpriseadministratorcredential) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RecycleBinEnabled
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recyclebinenabled) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ForestMode
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forestmode) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
