require 'pathname'

Puppet::Type.newtype(:dsc_spuserprofileproperty) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_SPUserProfilePropertyMapping(mof_type_map, name, value)
        required = ['connectionname','propertyname','direction']
        allowed = []
        lowkey_hash = Hash[value.map { |k, v| [k.to_s.downcase, v] }]

        missing = required - lowkey_hash.keys
        unless missing.empty?
          fail "#{name} is missing the following required keys: #{missing.join(',')}"
        end

        extraneous = lowkey_hash.keys - required - allowed
        unless extraneous.empty?
          fail "#{name} includes invalid keys: #{extraneous.join(',')}"
        end

        lowkey_hash.keys.each do |key|
          if lowkey_hash[key]
            validate_mof_type(mof_type_map[key], 'MSFT_SPUserProfilePropertyMapping', key, lowkey_hash[key])
          end
        end
      end
    end

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
  def dscmeta_module_version; '3.2.0.0' end

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
  # Values:       ["Big Integer", "Binary", "Boolean", "Date", "DateNoYear", "Date Time", "Email", "Float", "HTML", "Integer", "Person", "String (Single Value)", "String (Multi Value)", "TimeZone", "Unique Identifier", "URL"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - The type of the property Valid values are Big Integer, Binary, Boolean, Date, DateNoYear, Date Time, Email, Float, HTML, Integer, Person, String (Single Value), String (Multi Value), TimeZone, Unique Identifier, URL."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Big Integer', 'big integer', 'Binary', 'binary', 'Boolean', 'boolean', 'Date', 'date', 'DateNoYear', 'datenoyear', 'Date Time', 'date time', 'Email', 'email', 'Float', 'float', 'HTML', 'html', 'Integer', 'integer', 'Person', 'person', 'String (Single Value)', 'string (single value)', 'String (Multi Value)', 'string (multi value)', 'TimeZone', 'timezone', 'Unique Identifier', 'unique identifier', 'URL', 'url'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Big Integer, Binary, Boolean, Date, DateNoYear, Date Time, Email, Float, HTML, Integer, Person, String (Single Value), String (Multi Value), TimeZone, Unique Identifier, URL")
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

  # Name:         PropertyMappings
  # Type:         MSFT_SPUserProfilePropertyMapping[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_propertymappings, :array_matching => :all) do
    def mof_type; 'MSFT_SPUserProfilePropertyMapping[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"connectionname"=>{:type=>"string"}, "propertyname"=>{:type=>"string"}, "direction"=>{:type=>"string", :values=>["Import", "Export"]}}
    end
    desc "PropertyMappings - The details about the property mapping"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "PropertyMappings value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_SPUserProfilePropertyMapping(mof_type_map, "PropertyMappings", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spuserprofileproperty).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
