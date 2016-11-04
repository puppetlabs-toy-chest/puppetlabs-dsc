require 'pathname'

Puppet::Type.newtype(:dsc_xadcomputer) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xADComputer resource type.
    Automatically generated from
    'xActiveDirectory/DSCResources/MSFT_xADComputer/MSFT_xADComputer.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_computername is a required attribute') if self[:dsc_computername].nil?
    end

  def dscmeta_resource_friendly_name; 'xADComputer' end
  def dscmeta_resource_name; 'MSFT_xADComputer' end
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

  # Name:         ComputerName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_computername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ComputerName - Specifies the name of the computer"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Location
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_location) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Location - Specifies the location of the computer, such as an office number"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DnsHostName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dnshostname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DnsHostName - Specifies the fully qualified domain name (FQDN) of the computer"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServicePrincipalNames
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serviceprincipalnames, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ServicePrincipalNames - Specifies the service principal names for the computer account"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         UserPrincipalName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_userprincipalname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserPrincipalName - Specifies the UPN assigned to the computer account"
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
    desc "DisplayName - Specifies the display name of the computer"
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
    desc "Path - Specifies the X.500 path of the Organizational Unit (OU) or container where the computer is located"
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
    desc "Description - Specifies a description of the computer object"
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
    desc "Enabled - Specifies if the computer account is enabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Manager
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_manager) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Manager - Specifies the user or group Distinguished Name that manages the computer object"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainController - Specifies the Active Directory Domain Services instance to connect to perform the task"
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
    desc "DomainAdministratorCredential - Specifies the user account credentials to use to perform the task"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("DomainAdministratorCredential", value)
    end
  end

  # Name:         RequestFile
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requestfile) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RequestFile - Specifies the full path to the Offline Domain Join Request file to create."
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

  # Name:         DistinguishedName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_distinguishedname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DistinguishedName - Returns the X.500 path of the computer object"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SID
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SID - Returns the security identifier of the computer object"
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

Puppet::Type.type(:dsc_xadcomputer).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
