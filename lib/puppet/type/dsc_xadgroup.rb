require 'pathname'

Puppet::Type.newtype(:dsc_xadgroup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xADGroup resource type.
    Automatically generated from
    'xActiveDirectory/DSCResources/MSFT_xADGroup/MSFT_xADGroup.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_groupname is a required attribute') if self[:dsc_groupname].nil?
    end

  def dscmeta_resource_friendly_name; 'xADGroup' end
  def dscmeta_resource_name; 'MSFT_xADGroup' end
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

  # Name:         GroupName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_groupname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "GroupName - Name of the Active Directory group"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         GroupScope
  # Type:         string
  # IsMandatory:  False
  # Values:       ["DomainLocal", "Global", "Universal"]
  newparam(:dsc_groupscope) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "GroupScope - Active Directory group scope Valid values are DomainLocal, Global, Universal."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['DomainLocal', 'domainlocal', 'Global', 'global', 'Universal', 'universal'].include?(value)
        fail("Invalid value '#{value}'. Valid values are DomainLocal, Global, Universal")
      end
    end
  end

  # Name:         Category
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Security", "Distribution"]
  newparam(:dsc_category) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Category - Active Directory group category Valid values are Security, Distribution."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Security', 'security', 'Distribution', 'distribution'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Security, Distribution")
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
    desc "Path - Location of the group within Active Directory expressed as a Distinguished Name"
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
    desc "Ensure - Should this resource be present or absent Valid values are Present, Absent."
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

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - Description of the Active Directory group"
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
    desc "DisplayName - Display name of the Active Directory group"
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
    desc "Credential - Credentials used to enact the change upon"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
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

  # Name:         Members
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_members, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Members - Active Directory group membership should match membership exactly"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         MembersToInclude
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_memberstoinclude, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "MembersToInclude - Active Directory group should include these members"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         MembersToExclude
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_memberstoexclude, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "MembersToExclude - Active Directory group should NOT include these members"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         MembershipAttribute
  # Type:         string
  # IsMandatory:  False
  # Values:       ["SamAccountName", "DistinguishedName", "ObjectGUID", "SID"]
  newparam(:dsc_membershipattribute) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MembershipAttribute - Active Directory attribute used to perform membership operations Valid values are SamAccountName, DistinguishedName, ObjectGUID, SID."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['SamAccountName', 'samaccountname', 'DistinguishedName', 'distinguishedname', 'ObjectGUID', 'objectguid', 'SID', 'sid'].include?(value)
        fail("Invalid value '#{value}'. Valid values are SamAccountName, DistinguishedName, ObjectGUID, SID")
      end
    end
  end

  # Name:         ManagedBy
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_managedby) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ManagedBy - Active Directory managed by attribute specified as a DistinguishedName"
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
    desc "Notes - Active Directory group notes field"
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

Puppet::Type.type(:dsc_xadgroup).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
