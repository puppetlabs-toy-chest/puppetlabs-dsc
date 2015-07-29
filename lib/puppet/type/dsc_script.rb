# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_script) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC Script resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-wmf-4/PSDesiredStateConfiguration/DSCResources/MSFT_ScriptResource/MSFT_ScriptResource.schema.mof
  }

  validate do
      fail('dsc_getscript is a required attribute') if self[:dsc_getscript].nil?
      fail('dsc_setscript is a required attribute') if self[:dsc_setscript].nil?
      fail('dsc_testscript is a required attribute') if self[:dsc_testscript].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "Script"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_ScriptResource"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "PSDesiredStateConfiguration"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto :present
  end

  # Name:         GetScript
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_getscript) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SetScript
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_setscript) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TestScript
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_testscript) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
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

  # Name:         Result
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_result) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
