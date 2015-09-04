require 'pathname'

Puppet::Type.newtype(:dsc_xwineventlog) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xWinEventLog resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xWinEventLog/DSCResources/MSFT_xWinEventLog/MSFT_xWinEventLog.schema.mof
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
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWinEventLog"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0.0.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         LogName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_logname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'sint64' end
    def mof_is_embedded?; false end
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
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LogMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["AutoBackup", "Circular", "Retain"]
  newparam(:dsc_logmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogFilePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logfilepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
