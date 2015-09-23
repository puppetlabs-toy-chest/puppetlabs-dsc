require 'pathname'

Puppet::Type.newtype(:dsc_xiisfeaturedelegation) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xIisFeatureDelegation resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xWebAdministration/DSCResources/MSFT_xIisFeatureDelegation/MSFT_xIisFeatureDelegation.schema.mof
  }

  validate do
      fail('dsc_sectionname is a required attribute') if self[:dsc_sectionname].nil?
      fail('dsc_overridemode is a required attribute') if self[:dsc_overridemode].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xIisFeatureDelegation"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xIisFeatureDelegation"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWebAdministration"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.7.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         SectionName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_sectionname) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         OverrideMode
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Allow", "Deny"]
  newparam(:dsc_overridemode) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow', 'allow', 'Deny', 'deny'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow, Deny")
      end
    end
  end


end
