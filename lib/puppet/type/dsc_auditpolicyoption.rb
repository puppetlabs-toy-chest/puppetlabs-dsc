require 'pathname'

Puppet::Type.newtype(:dsc_auditpolicyoption) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC AuditPolicyOption resource type.
    Automatically generated from
    'AuditPolicyDsc/DSCResources/MSFT_AuditPolicyOption/MSFT_AuditPolicyOption.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_value is a required attribute') if self[:dsc_value].nil?
    end

  def dscmeta_resource_friendly_name; 'AuditPolicyOption' end
  def dscmeta_resource_name; 'MSFT_AuditPolicyOption' end
  def dscmeta_module_name; 'AuditPolicyDsc' end
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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       ["CrashOnAuditFail", "FullPrivilegeAuditing", "AuditBaseObjects", "AuditBaseDirectories"]
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the audit policy option to set. Valid values are CrashOnAuditFail, FullPrivilegeAuditing, AuditBaseObjects, AuditBaseDirectories."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['CrashOnAuditFail', 'crashonauditfail', 'FullPrivilegeAuditing', 'fullprivilegeauditing', 'AuditBaseObjects', 'auditbaseobjects', 'AuditBaseDirectories', 'auditbasedirectories'].include?(value)
        fail("Invalid value '#{value}'. Valid values are CrashOnAuditFail, FullPrivilegeAuditing, AuditBaseObjects, AuditBaseDirectories")
      end
    end
  end

  # Name:         Value
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Enabled", "Disabled"]
  newparam(:dsc_value) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Value - The value to set the audit policy option to. Valid values are Enabled, Disabled."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Enabled', 'enabled', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Enabled, Disabled")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_auditpolicyoption).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
