require 'pathname'

Puppet::Type.newtype(:dsc_xwineventlog) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xWinEventLog resource type.
    Automatically generated from
    'xWinEventLog/DSCResources/MSFT_xWinEventLog/MSFT_xWinEventLog.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_logname is a required attribute') if self[:dsc_logname].nil?
    end

  def dscmeta_resource_friendly_name; 'xWinEventLog' end
  def dscmeta_resource_name; 'MSFT_xWinEventLog' end
  def dscmeta_module_name; 'xWinEventLog' end
  def dscmeta_module_version; '1.1.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         PsDscRunAsCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_psdscrunascredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "PsDscRunAsCredential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         LogName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_logname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogName - Name of the event log"
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
    desc "MaximumSizeInBytes - sizethat the event log file is allowed to be When the file reaches this maximum size it is considered full"
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         IsEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsEnabled"
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
    desc "LogMode - Valid values are AutoBackup, Circular, Retain."
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
    desc "SecurityDescriptor"
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
    desc "LogFilePath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xwineventlog).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
