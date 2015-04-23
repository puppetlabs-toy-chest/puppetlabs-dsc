# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_xwineventlog) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  provide :mof, :parent => Puppet::Type.type(:base_dsc).provider(:mof)

  @doc = %q{
    The DSC xWinEventLog resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xWinEventLog/DSCResources/MSFT_xWinEventLog/MSFT_xWinEventLog.schema.mof
  }

  validate do
      fail('dsc_logname is a required attribute') if self[:dsc_logname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xWinEventLog"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xWinEventLog"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWinEventLog"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.0.0.1"
  end

  newparam(:name, :namevar => true ) do
  end

  # Name:         LogName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_logname) do
    desc "Name of the event log"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaximumSizeInBytes
  # Type:         sint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumsizeinbytes) do
    desc "sizethat the event log file is allowed to be When the file reaches this maximum size it is considered full"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value || value.to_i >= 0
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         IsEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isenabled) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         LogMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["AutoBackup", "Circular", "Retain"]
  newparam(:dsc_logmode) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['AutoBackup', 'autobackup', 'Circular', 'circular', 'Retain', 'retain'].include?(value)
        fail("Invalid value '#{value}'. Valid values are AutoBackup, Circular, Retain")
      end
    end
  end

  # Name:         SecurityDescriptor
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_securitydescriptor) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
