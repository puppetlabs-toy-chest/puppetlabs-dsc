require 'pathname'

Puppet::Type.newtype(:dsc_xadforestproperties) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xADForestProperties resource type.
    Automatically generated from
    'xActiveDirectory/DSCResources/MSFT_xADForestProperties/MSFT_xADForestProperties.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_forestname is a required attribute') if self[:dsc_forestname].nil?
    end

  def dscmeta_resource_friendly_name; 'xADForestProperties' end
  def dscmeta_resource_name; 'MSFT_xADForestProperties' end
  def dscmeta_module_name; 'xActiveDirectory' end
  def dscmeta_module_version; '2.24.0.0' end

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

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential - Specifies the user account credentials to use to perform this task."
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

  # Name:         ForestName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_forestname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ForestName - Specifies the target Active Directory forest for the change."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServicePrincipalNameSuffix
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serviceprincipalnamesuffix, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ServicePrincipalNameSuffix - Specifies the Service Principal Name (SPN) Suffix(es) to be explicitly defined in the forest and replace existing SPNs. Cannot be used with ServicePrincipalNameSuffixToAdd or ServicePrincipalNameSuffixToRemove."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ServicePrincipalNameSuffixToAdd
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serviceprincipalnamesuffixtoadd, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ServicePrincipalNameSuffixToAdd - Specifies the Service Principal Name (SPN) Suffix(es) to be added to the forest. Cannot be used with ServicePrincipalNameSuffix."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ServicePrincipalNameSuffixToRemove
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serviceprincipalnamesuffixtoremove, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ServicePrincipalNameSuffixToRemove - Specifies the Service Principal Name (SPN) Suffix(es) to be removed from the forest. Cannot be used with ServicePrincipalNameSuffix."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         UserPrincipalNameSuffix
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_userprincipalnamesuffix, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "UserPrincipalNameSuffix - Specifies the User Principal Name (UPN) Suffix(es) to be explicitly defined in the forest and replace existing UPNs. Cannot be used with UserPrincipalNameSuffixToAdd or UserPrincipalNameSuffixToRemove."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         UserPrincipalNameSuffixToAdd
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_userprincipalnamesuffixtoadd, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "UserPrincipalNameSuffixToAdd - Specifies the User Principal Name (UPN) Suffix(es) to be added to the forest. Cannot be used with UserPrincipalNameSuffix."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         UserPrincipalNameSuffixToRemove
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_userprincipalnamesuffixtoremove, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "UserPrincipalNameSuffixToRemove - Specifies the User Principal Name (UPN) Suffix(es) to be removed from the forest. Cannot be used with UserPrincipalNameSuffix."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xadforestproperties).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
