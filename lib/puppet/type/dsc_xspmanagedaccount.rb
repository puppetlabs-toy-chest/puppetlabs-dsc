require 'pathname'

Puppet::Type.newtype(:dsc_xspmanagedaccount) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSPManagedAccount resource type.
    Automatically generated from
    'xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPManagedAccount/MSFT_xSPManagedAccount.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_accountname is a required attribute') if self[:dsc_accountname].nil?
    end

  def dscmeta_resource_friendly_name; 'xSPManagedAccount' end
  def dscmeta_resource_name; 'MSFT_xSPManagedAccount' end
  def dscmeta_module_name; 'xSharePoint' end
  def dscmeta_module_version; '0.12.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         AccountName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_accountname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AccountName - The username of the account"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Account
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_account) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Account - The credential with password of the account"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Account", value)
    end
  end

  # Name:         EmailNotification
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_emailnotification) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EmailNotification - How many days before a password change should an email be sent"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         PreExpireDays
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_preexpiredays) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "PreExpireDays - How many days before a password expires should it be changed"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Schedule
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_schedule) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Schedule - What is the schedule for the password reset"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsAccount if using PowerShell 5"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("InstallAccount", value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xspmanagedaccount).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
