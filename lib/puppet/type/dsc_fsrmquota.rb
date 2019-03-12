require 'pathname'

Puppet::Type.newtype(:dsc_fsrmquota) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC FSRMQuota resource type.
    Automatically generated from
    'FSRMDsc/DSCResources/DSR_FSRMQuota/DSR_FSRMQuota.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
    end

  def dscmeta_resource_friendly_name; 'FSRMQuota' end
  def dscmeta_resource_name; 'DSR_FSRMQuota' end
  def dscmeta_module_name; 'FSRMDsc' end
  def dscmeta_module_version; '2.4.1.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - The path this FSRM Quota applies to."
    isrequired
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - An optional description for this FSRM Quota."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Specifies whether the FSRM Quota should exist. Valid values are Present, Absent."
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

  # Name:         Size
  # Type:         sint64
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_size) do
    def mof_type; 'sint64' end
    def mof_is_embedded?; false end
    desc "Size - The size in bytes of this FSRM Quota limit."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SoftLimit
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_softlimit) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SoftLimit - Controls whether this FSRM Quota has a hard or soft limit."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ThresholdPercentages
  # Type:         uint32[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_thresholdpercentages, :array_matching => :all) do
    def mof_type; 'uint32[]' end
    def mof_is_embedded?; false end
    desc "ThresholdPercentages - An array of threshold percentages in this FSRM Quota."
    validate do |value|
      unless value.kind_of?(Array) || (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
        fail("Invalid value '#{value}'. Should be an integer or an array of integers")
      end
    end
    munge do |value|
      v = PuppetX::Dsc::TypeHelpers.munge_integer(value)
      v.is_a?(Array) ? v : Array(v)
    end
  end

  # Name:         Disabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Disabled - Disables the FSRM Quota applied to this path."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Template
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_template) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Template - The name of the FSRM Quota Template to apply to this path."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MatchesTemplate
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_matchestemplate) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MatchesTemplate - Causes the template to use only the template name and ignore Size, SoftLimit and ThresholdPercentage parameters."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_fsrmquota).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
