require 'pathname'

Puppet::Type.newtype(:dsc_runbookdirectory) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC RunbookDirectory resource type.
    Automatically generated from
    'xSCSMA/DSCResources/MSFT_xRunbookDirectory/MSFT_xRunbookDirectory.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_runbookpath is a required attribute') if self[:dsc_runbookpath].nil?
      fail('dsc_webserviceendpoint is a required attribute') if self[:dsc_webserviceendpoint].nil?
    end

  def dscmeta_resource_friendly_name; 'RunbookDirectory' end
  def dscmeta_resource_name; 'MSFT_xRunbookDirectory' end
  def dscmeta_module_name; 'xSCSMA' end
  def dscmeta_module_version; '1.4.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:published) { provider.create }
    newvalue(:draft) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :published }
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

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Published", "Draft", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - The import state of runbooks found at RunbookPath. This can be Published, Draft, or Absent Valid values are Published, Draft, Absent."
    validate do |value|
      resource[:ensure] = value.downcase
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Published', 'published', 'Draft', 'draft', 'Absent', 'absent'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Published, Draft, Absent")
      end
    end
  end

  # Name:         RunbookPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_runbookpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RunbookPath - Path to Runbook(s) to be imported. Accepts wildcards."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Matches
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_matches) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Matches - Describes the validity of the imported Runbook(s)."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         WebServiceEndpoint
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_webserviceendpoint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WebServiceEndpoint - URL of SMA's web service endpoint."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Port
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_port) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Port - Port of the SMA web site. Defaults to the SMA default of 9090."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_runbookdirectory).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
