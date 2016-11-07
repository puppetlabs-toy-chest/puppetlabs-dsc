require 'pathname'

Puppet::Type.newtype(:dsc_xaduser) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xADUser resource type.
    Automatically generated from
    'xActiveDirectory/DSCResources/MSFT_xADUser/MSFT_xADUser.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_domainname is a required attribute') if self[:dsc_domainname].nil?
      fail('dsc_username is a required attribute') if self[:dsc_username].nil?
    end

  def dscmeta_resource_friendly_name; 'xADUser' end
  def dscmeta_resource_name; 'MSFT_xADUser' end
  def dscmeta_module_name; 'xActiveDirectory' end
  def dscmeta_module_version; '2.14.0.0' end

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

  # Name:         DomainName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_domainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainName - Name of the domain where the user account is located (only used if password is managed)"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UserName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_username) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserName - Specifies the Security Account Manager (SAM) account name of the user (ldapDisplayName 'sAMAccountName')"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Password
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_password) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Password - Specifies a new password value for the account"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Password", value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Specifies whether the user account is created or deleted Valid values are Present, Absent."
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

  # Name:         CommonName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_commonname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CommonName - Specifies the common nane assigned to the user account (ldapDisplayName 'cn')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UserPrincipalName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_userprincipalname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserPrincipalName - Specifies the UPN assigned to the user account (ldapDisplayName 'userPrincipalName')"
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
    desc "DisplayName - Specifies the display name of the object (ldapDisplayName 'displayName')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - Specifies the X.500 path of the Organizational Unit (OU) or container where the new object is created"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         GivenName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_givenname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "GivenName - Specifies the user's given name (ldapDisplayName 'givenName')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Initials
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_initials) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Initials - Specifies the initials that represent part of a user's name (ldapDisplayName 'initials')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Surname
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_surname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Surname - Specifies the user's last name or surname (ldapDisplayName 'sn')"
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
    desc "Description - Specifies a description of the object (ldapDisplayName 'description')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StreetAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_streetaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StreetAddress - Specifies the user's street address (ldapDisplayName 'streetAddress')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         POBox
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pobox) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "POBox - Specifies the user's post office box number (ldapDisplayName 'postOfficeBox')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         City
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_city) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "City - Specifies the user's town or city (ldapDisplayName 'l')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         State
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_state) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "State - Specifies the user's or Organizational Unit's state or province (ldapDisplayName 'st')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PostalCode
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_postalcode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PostalCode - Specifies the user's postal code or zip code (ldapDisplayName 'postalCode')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Country
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_country) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Country - Specifies the country or region code for the user's language of choice (ldapDisplayName 'c')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Department
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_department) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Department - Specifies the user's department (ldapDisplayName 'department')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Division
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_division) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Division - Specifies the user's division (ldapDisplayName 'division')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Company
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_company) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Company - Specifies the user's company (ldapDisplayName 'company')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Office
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_office) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Office - Specifies the location of the user's office or place of business (ldapDisplayName 'physicalDeliveryOfficeName')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         JobTitle
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_jobtitle) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "JobTitle - Specifies the user's title (ldapDisplayName 'title')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EmailAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_emailaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EmailAddress - Specifies the user's e-mail address (ldapDisplayName 'mail')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EmployeeID
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_employeeid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EmployeeID - Specifies the user's employee ID (ldapDisplayName 'employeeID')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EmployeeNumber
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_employeenumber) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EmployeeNumber - Specifies the user's employee number (ldapDisplayName 'employeeNumber')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HomeDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_homedirectory) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "HomeDirectory - Specifies a user's home directory path (ldapDisplayName 'homeDirectory')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HomeDrive
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_homedrive) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "HomeDrive - Specifies a drive that is associated with the UNC path defined by the HomeDirectory property (ldapDisplayName 'homeDrive')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HomePage
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_homepage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "HomePage - Specifies the URL of the home page of the object (ldapDisplayName 'wWWHomePage')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProfilePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_profilepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProfilePath - Specifies a path to the user's profile (ldapDisplayName 'profilePath')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogonScript
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logonscript) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogonScript - Specifies a path to the user's log on script (ldapDisplayName 'scriptPath')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Notes
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_notes) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Notes - Specifies the notes attached to the user's accoutn (ldapDisplayName 'info')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         OfficePhone
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_officephone) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "OfficePhone - Specifies the user's office telephone number (ldapDisplayName 'telephoneNumber')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MobilePhone
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mobilephone) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MobilePhone - Specifies the user's mobile phone number (ldapDisplayName 'mobile')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Fax
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fax) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Fax - Specifies the user's fax phone number (ldapDisplayName 'facsimileTelephoneNumber')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HomePhone
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_homephone) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "HomePhone - Specifies the user's home telephone number (ldapDisplayName 'homePhone')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Pager
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pager) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Pager - Specifies the user's pager number (ldapDisplayName 'pager')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IPPhone
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ipphone) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IPPhone - Specifies the user's IP telephony phone number (ldapDisplayName 'ipPhone')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Manager
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_manager) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Manager - Specifies the user's manager specified as a Distinguished Name (ldapDisplayName 'manager')"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Enabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Enabled - Specifies if the account is enabled (default True)"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CannotChangePassword
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cannotchangepassword) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CannotChangePassword - Specifies whether the account password can be changed"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         PasswordNeverExpires
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passwordneverexpires) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "PasswordNeverExpires - Specifies whether the password of an account can expire"
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
    desc "DomainController - Specifies the Active Directory Domain Services instance to use to perform the task."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DomainAdministratorCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domainadministratorcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "DomainAdministratorCredential - Specifies the user account credentials to use to perform this task"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("DomainAdministratorCredential", value)
    end
  end

  # Name:         PasswordAuthentication
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Default", "Negotiate"]
  newparam(:dsc_passwordauthentication) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PasswordAuthentication - Specifies the authentication context type used when testing passwords Valid values are Default, Negotiate."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Default', 'default', 'Negotiate', 'negotiate'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Default, Negotiate")
      end
    end
  end

  # Name:         DistinguishedName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_distinguishedname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DistinguishedName - Returns the X.500 path of the object"
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

Puppet::Type.type(:dsc_xaduser).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
