begin
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
rescue LoadError => detail
  require 'pathname'
  lib_path = Pathname.new(__FILE__).dirname.parent.parent
  $:.unshift(lib_path)
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
end

Puppet::Type.newtype(:dsc_xsmbshare) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xSmbShare resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xSmbShare/DscResources/MSFT_xSmbShare/MSFT_xSmbShare.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSmbShare"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSmbShare"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSmbShare"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    defaultvalues
    defaultto :present
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    desc "Name of the SMB Share"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_path) do
    desc "Path to the share"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    desc "Description of the share"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ChangeAccess
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_changeaccess, :array_matching => :all) do
    desc "Specifies which user will be granted modify permission to access the share"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
  end

  # Name:         ConcurrentUserLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_concurrentuserlimit) do
    desc "Specifies the maximum number of concurrently connected users that the new SMB share may accommodate. If this parameter is set to zero (0), then the number of users is unlimited. The default value is zero (0)."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         EncryptData
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_encryptdata) do
    desc "Indicates that the share is encrypted."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         FolderEnumerationMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["AccessBased", "Unrestricted"]
  newparam(:dsc_folderenumerationmode) do
    desc "Specifies which files and folders in the new SMB share are visible to users."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AccessBased', 'accessbased', 'Unrestricted', 'unrestricted'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AccessBased, Unrestricted")
      end
    end
  end

  # Name:         FullAccess
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fullaccess, :array_matching => :all) do
    desc "Specifies which accounts are granted full permission to access the share."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
  end

  # Name:         NoAccess
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_noaccess, :array_matching => :all) do
    desc "Specifies which accounts are denied access to the share."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
  end

  # Name:         ReadAccess
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_readaccess, :array_matching => :all) do
    desc "Specifies which user is granted read permission to access the share."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    desc "Specifies if the share should be added or removed"
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

  # Name:         ShareState
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sharestate) do
    desc "Specfies the state of the share"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ShareType
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sharetype) do
    desc "Specfies the type of the share"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ShadowCopy
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_shadowcopy) do
    desc "Specifies if this share is a ShadowCopy"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Special
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_special) do
    desc "Specifies if this share is a Special Share. Admin share, default shares, IPC$ share are examples."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
