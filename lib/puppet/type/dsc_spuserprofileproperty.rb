require 'pathname'

Puppet::Type.newtype(:dsc_spuserprofileproperty) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPUserProfileProperty resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPUserProfileProperty/MSFT_SPUserProfileProperty.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'SPUserProfileProperty' end
  def dscmeta_resource_name; 'MSFT_SPUserProfileProperty' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.4.0.0' end

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
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The internal name of the user profile property"
    isrequired
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
    desc "Ensure - Present if the property should exist, absent if it should be removed Valid values are Present, Absent."
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

  # Name:         UserProfileService
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_userprofileservice) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserProfileService - The name of the user profile service application"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DisplayName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_displayname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DisplayName - The display name of the property"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  False
  # Values:       ["BigInteger", "Binary", "Boolean", "Date", "DateNoYear", "DateTime", "Email", "Float", "Guid", "HTML", "Integer", "Person", "String", "StringMultiValue", "TimeZone", "URL"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - The type of the property Valid values are BigInteger, Binary, Boolean, Date, DateNoYear, DateTime, Email, Float, Guid, HTML, Integer, Person, String, StringMultiValue, TimeZone, URL."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['BigInteger', 'biginteger', 'Binary', 'binary', 'Boolean', 'boolean', 'Date', 'date', 'DateNoYear', 'datenoyear', 'DateTime', 'datetime', 'Email', 'email', 'Float', 'float', 'Guid', 'guid', 'HTML', 'html', 'Integer', 'integer', 'Person', 'person', 'String', 'string', 'StringMultiValue', 'stringmultivalue', 'TimeZone', 'timezone', 'URL', 'url'].include?(value)
        fail("Invalid value '#{value}'. Valid values are BigInteger, Binary, Boolean, Date, DateNoYear, DateTime, Email, Float, Guid, HTML, Integer, Person, String, StringMultiValue, TimeZone, URL")
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
    desc "Description - The description of the property"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PolicySetting
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Mandatory", "Optin", "Optout", "Disabled"]
  newparam(:dsc_policysetting) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PolicySetting - The policy setting to apply to the property Valid values are Mandatory, Optin, Optout, Disabled."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Mandatory', 'mandatory', 'Optin', 'optin', 'Optout', 'optout', 'Disabled', 'disabled'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Mandatory, Optin, Optout, Disabled")
      end
    end
  end

  # Name:         PrivacySetting
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Public", "Contacts", "Organization", "Manager", "Private"]
  newparam(:dsc_privacysetting) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PrivacySetting - The privacy setting for the property Valid values are Public, Contacts, Organization, Manager, Private."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Public', 'public', 'Contacts', 'contacts', 'Organization', 'organization', 'Manager', 'manager', 'Private', 'private'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Public, Contacts, Organization, Manager, Private")
      end
    end
  end

  # Name:         MappingConnectionName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mappingconnectionname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MappingConnectionName - The name of the UPS connect to map this property to"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MappingPropertyName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mappingpropertyname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MappingPropertyName - The name of the property from the UPS connection to map to"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MappingDirection
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mappingdirection) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MappingDirection - The direction of the mapping, either Import or Export"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Length
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_length) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Length - The length of the field"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DisplayOrder
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_displayorder) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DisplayOrder - The display order to put the property in to the list at"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         IsEventLog
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_iseventlog) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsEventLog - Is this field used for event logging"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsVisibleOnEditor
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isvisibleoneditor) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsVisibleOnEditor - Is this field visible when editing a users profile, or hidden from editing"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsVisibleOnViewer
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isvisibleonviewer) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsVisibleOnViewer - Is this field visible when viewing a users profile"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsUserEditable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isusereditable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsUserEditable - Is this field able to be edited by a user, or only an administrator"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsAlias
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isalias) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsAlias - Is this field an alias that can be used to refer to a user by"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsSearchable
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_issearchable) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsSearchable - Is this field able to be searched upon"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         UserOverridePrivacy
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_useroverrideprivacy) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UserOverridePrivacy - Can users override the default privacy policy"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         TermStore
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_termstore) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TermStore - The name of the term store to look up managed terms from"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TermGroup
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_termgroup) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TermGroup - The name of the term store group that terms are in for this field"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TermSet
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_termset) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TermSet - The name of the term set to allow values to be selected from"
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
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsCredential if using PowerShell 5"
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

Puppet::Type.type(:dsc_spuserprofileproperty).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
