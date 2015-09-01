require 'pathname'

Puppet::Type.newtype(:dsc_xspmanagedpath) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSPManagedPath resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPManagedPath/MSFT_xSPManagedPath.schema.mof
  }

  validate do
      fail('dsc_webappurl is a required attribute') if self[:dsc_webappurl].nil?
      fail('dsc_relativeurl is a required attribute') if self[:dsc_relativeurl].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSPManagedPath"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSPManagedPath"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSharePoint"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.3.1.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         WebAppUrl
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_webappurl) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstallAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RelativeUrl
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_relativeurl) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Explicit
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_explicit) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         HostHeader
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hostheader) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end


end
