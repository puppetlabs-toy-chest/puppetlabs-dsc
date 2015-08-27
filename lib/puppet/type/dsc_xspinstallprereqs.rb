require 'pathname'

Puppet::Type.newtype(:dsc_xspinstallprereqs) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows



  end

  @doc = %q{
    The DSC xSPInstallPrereqs resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPInstallPrereqs/MSFT_xSPInstallPrereqs.schema.mof
  }

  validate do
      fail('dsc_installerpath is a required attribute') if self[:dsc_installerpath].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSPInstallPrereqs"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSPInstallPrereqs"
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
    defaultto :present
  end

  # Name:         InstallerPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_installerpath) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         OnlineMode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_onlinemode) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      provider.munge_boolean(value.to_s)
    end
  end

  # Name:         SQLNCli
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlncli) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PowerShell
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_powershell) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         NETFX
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_netfx) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IDFX
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_idfx) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Sync
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sync) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AppFabric
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_appfabric) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IDFX11
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_idfx11) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MSIPCClient
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_msipcclient) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WCFDataServices
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_wcfdataservices) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         KB2671763
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_kb2671763) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WCFDataServices56
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_wcfdataservices56) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
