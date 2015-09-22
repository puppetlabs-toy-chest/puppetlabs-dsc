require 'pathname'

Puppet::Type.newtype(:dsc_xspclearremotesessions) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSPClearRemoteSessions resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPClearRemoteSessions/MSFT_xSPClearRemoteSessions.schema.mof
  }

  validate do
      fail('dsc_clearremotesessions is a required attribute') if self[:dsc_clearremotesessions].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSPClearRemoteSessions"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSPClearRemoteSessions"
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

  # Name:         ClearRemoteSessions
  # Type:         boolean
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_clearremotesessions) do
    isrequired
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


end
