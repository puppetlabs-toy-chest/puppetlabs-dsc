require 'pathname'

Puppet::Type.newtype(:dsc_xspinstall) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSPInstall resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPInstall/MSFT_xSPInstall.schema.mof
  }

  validate do
      fail('dsc_binarydir is a required attribute') if self[:dsc_binarydir].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSPInstall"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSPInstall"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
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

  # Name:         BinaryDir
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_binarydir) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProductKey
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_productkey) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
