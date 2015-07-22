# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_xgroup) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  provide :mof, :parent => Puppet::Type.type(:base_dsc).provider(:mof)

  @doc = %q{
    The DSC xGroup resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xPSDesiredStateConfiguration/DSCResources/MSFT_xGroupResource/MSFT_xGroupResource.schema.mof
  }

  validate do
      fail('dsc_groupname is a required attribute') if self[:dsc_groupname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xGroup"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xGroupResource"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xPSDesiredStateConfiguration"
  end

  newparam(:dscmeta_module_version) do
    defaultto "3.0.2.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    defaultvalues
    defaultto :present
  end

  # Name:         GroupName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_groupname) do
    isrequired
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

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Members
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_members, :array_matching => :all) do
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         MembersToInclude
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_memberstoinclude, :array_matching => :all) do
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         MembersToExclude
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_memberstoexclude, :array_matching => :all) do
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Credential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
