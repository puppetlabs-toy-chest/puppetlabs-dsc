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
  def dscmeta_module_version; '2.9.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         DomainName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_domainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainName"
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
    desc "UserName"
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
    desc "Password"
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
    desc "Ensure - Valid values are Present, Absent."
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
    desc "CommonName"
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
    desc "UserPrincipalName"
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
    desc "DisplayName"
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
    desc "Path"
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
    desc "GivenName"
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
    desc "Initials"
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
    desc "Surname"
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
    desc "Description"
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
    desc "StreetAddress"
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
    desc "POBox"
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
    desc "City"
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
    desc "State"
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
    desc "PostalCode"
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
    desc "Country"
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
    desc "Department"
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
    desc "Division"
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
    desc "Company"
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
    desc "Office"
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
    desc "JobTitle"
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
    desc "EmailAddress"
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
    desc "EmployeeID"
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
    desc "EmployeeNumber"
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
    desc "HomeDirectory"
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
    desc "HomeDrive"
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
    desc "HomePage"
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
    desc "ProfilePath"
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
    desc "LogonScript"
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
    desc "Notes"
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
    desc "OfficePhone"
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
    desc "MobilePhone"
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
    desc "Fax"
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
    desc "HomePhone"
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
    desc "Pager"
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
    desc "IPPhone"
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
    desc "Manager"
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
    desc "Enabled"
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
    desc "CannotChangePassword"
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
    desc "PasswordNeverExpires"
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
    desc "DomainController"
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
    desc "DomainAdministratorCredential"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("DomainAdministratorCredential", value)
    end
  end

  # Name:         DistinguishedName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_distinguishedname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DistinguishedName - "
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
