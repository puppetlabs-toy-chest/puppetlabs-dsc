# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_xvhdfile) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  provide :mof, :parent => Puppet::Type.type(:base_dsc).provider(:mof)

  @doc = %q{
    The DSC xVhdFile resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xHyper-V/DSCResources/MSFT_xVhdFileDirectory/MSFT_xVhdFileDirectory.schema.mof
  }

  validate do
      fail('dsc_vhdpath is a required attribute') if self[:dsc_vhdpath].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xVhdFile"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xVhdFileDirectory"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xHyper-V"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.1"
  end

  newparam(:name, :namevar => true ) do
  end

  # Name:         VhdPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_vhdpath) do
    desc "Path to the VHD"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FileDirectory
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_filedirectory, :array_matching => :all) do
    desc "The FileDirectory objects to copy to the VHD"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end


end
