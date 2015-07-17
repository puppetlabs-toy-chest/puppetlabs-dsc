# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_xjeatoolkit) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  provide :mof, :parent => Puppet::Type.type(:base_dsc).provider(:mof)

  @doc = %q{
    The DSC xJeaToolKit resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xJea/DSCResources/MSFT_xJeaToolkit/MSFT_xJeaToolkit.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xJeaToolKit"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xJeaToolkit"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xJea"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.2.16.1"
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
    desc "Name of the JEA toolkit to be generated"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CommandSpecs
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_commandspecs) do
    desc "CSV formated list of command specifications"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ScriptDirectory
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scriptdirectory, :array_matching => :all) do
    desc "array of script directories that can be run"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Applications
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applications, :array_matching => :all) do
    desc "Array of executables that are allowed to run"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
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


end
