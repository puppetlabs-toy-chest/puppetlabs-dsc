require 'pathname'

Puppet::Type.newtype(:dsc_xaddomaindefaultpasswordpolicy) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xADDomainDefaultPasswordPolicy resource type.
    Automatically generated from
    'xActiveDirectory/DSCResources/MSFT_xADDomainDefaultPasswordPolicy/MSFT_xADDomainDefaultPasswordPolicy.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_domainname is a required attribute') if self[:dsc_domainname].nil?
    end

  def dscmeta_resource_friendly_name; 'xADDomainDefaultPasswordPolicy' end
  def dscmeta_resource_name; 'MSFT_xADDomainDefaultPasswordPolicy' end
  def dscmeta_module_name; 'xActiveDirectory' end
  def dscmeta_module_version; '2.14.0.0' end

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

  # Name:         DomainName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_domainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainName - Name of the domain to which the password policy will be applied"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ComplexityEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_complexityenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ComplexityEnabled - Whether password complexity is enabled for the default password policy"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LockoutDuration
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_lockoutduration) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "LockoutDuration - Length of time that an account is locked after the number of failed login attempts (minutes)"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LockoutObservationWindow
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_lockoutobservationwindow) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "LockoutObservationWindow - Maximum time between two unsuccessful login attempts before the counter is reset to 0 (minutes)"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LockoutThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_lockoutthreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "LockoutThreshold - Number of unsuccessful login attempts that are permitted before an account is locked out"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MinPasswordAge
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minpasswordage) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MinPasswordAge - Minimum length of time that you can have the same password (minutes)"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxPasswordAge
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxpasswordage) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxPasswordAge - Maximum length of time that you can have the same password (minutes)"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MinPasswordLength
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minpasswordlength) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MinPasswordLength - Minimum number of characters that a password must contain"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         PasswordHistoryCount
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passwordhistorycount) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "PasswordHistoryCount - Number of previous passwords to remember"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ReversibleEncryptionEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reversibleencryptionenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ReversibleEncryptionEnabled - Whether the directory must store passwords using reversible encryption"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainController - Active Directory domain controller to enact the change upon"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential - Credentials used to access the domain"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xaddomaindefaultpasswordpolicy).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
