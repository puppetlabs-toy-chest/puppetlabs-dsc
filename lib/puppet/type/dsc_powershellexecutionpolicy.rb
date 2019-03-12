require 'pathname'

Puppet::Type.newtype(:dsc_powershellexecutionpolicy) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC PowerShellExecutionPolicy resource type.
    Automatically generated from
    'ComputerManagementDsc/DSCResources/MSFT_PowerShellExecutionPolicy/MSFT_PowerShellExecutionPolicy.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_executionpolicyscope is a required attribute') if self[:dsc_executionpolicyscope].nil?
    end

  def dscmeta_resource_friendly_name; 'PowerShellExecutionPolicy' end
  def dscmeta_resource_name; 'MSFT_PowerShellExecutionPolicy' end
  def dscmeta_module_name; 'ComputerManagementDsc' end
  def dscmeta_module_version; '6.2.0.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         ExecutionPolicyScope
  # Type:         string
  # IsMandatory:  True
  # Values:       ["CurrentUser", "LocalMachine", "MachinePolicy", "Process", "UserPolicy"]
  newparam(:dsc_executionpolicyscope) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExecutionPolicyScope - Defines the scope for the preference of the Windows PowerShell execution policy. Valid values are CurrentUser, LocalMachine, MachinePolicy, Process, UserPolicy."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['CurrentUser', 'currentuser', 'LocalMachine', 'localmachine', 'MachinePolicy', 'machinepolicy', 'Process', 'process', 'UserPolicy', 'userpolicy'].include?(value)
        fail("Invalid value '#{value}'. Valid values are CurrentUser, LocalMachine, MachinePolicy, Process, UserPolicy")
      end
    end
  end

  # Name:         ExecutionPolicy
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Bypass", "Restricted", "AllSigned", "RemoteSigned", "Unrestricted"]
  newparam(:dsc_executionpolicy) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExecutionPolicy - Changes the preference for the Windows PowerShell execution policy. Valid values are Bypass, Restricted, AllSigned, RemoteSigned, Unrestricted."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Bypass', 'bypass', 'Restricted', 'restricted', 'AllSigned', 'allsigned', 'RemoteSigned', 'remotesigned', 'Unrestricted', 'unrestricted'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Bypass, Restricted, AllSigned, RemoteSigned, Unrestricted")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_powershellexecutionpolicy).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
