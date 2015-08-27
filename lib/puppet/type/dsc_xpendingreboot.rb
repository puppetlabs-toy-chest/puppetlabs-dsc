require 'pathname'

Puppet::Type.newtype(:dsc_xpendingreboot) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xPendingReboot resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xPendingReboot/DSCResources/MSFT_xPendingReboot/MSFT_xPendingReboot.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xPendingReboot"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xPendingReboot"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xPendingReboot"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.1.0.2"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ComponentBasedServicing
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_componentbasedservicing) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         WindowsUpdate
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_windowsupdate) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         PendingFileRename
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pendingfilerename) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         PendingComputerRename
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pendingcomputerrename) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         CcmClientSDK
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ccmclientsdk) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end


end
