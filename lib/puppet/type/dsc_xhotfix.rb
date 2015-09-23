require 'pathname'

Puppet::Type.newtype(:dsc_xhotfix) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xHotfix resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xWindowsUpdate/DscResources/MSFT_xWindowsUpdate/MSFT_xWindowsUpdate.schema.mof
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xHotfix"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xWindowsUpdate"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWindowsUpdate"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.1.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    desc "Specifies the path that contains the msu file for the hotfix installation."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Id
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_id) do
    desc "Specifies the Hotfix ID."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Log
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_log) do
    desc "Specifies the location of the log that contains information from the installation."
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
    desc "Specifies whether the hotfix needs to be installed or uninstalled."
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

  # Name:         Credential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    desc "Specifies the credential to use to authenticate to a UNC share if the path is on a UNC share."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
