require 'pathname'

Puppet::Type.newtype(:dsc_xadobjectpermissionentry) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xADObjectPermissionEntry resource type.
    Automatically generated from
    'xActiveDirectory/DSCResources/MSFT_xADObjectPermissionEntry/MSFT_xADObjectPermissionEntry.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
      fail('dsc_identityreference is a required attribute') if self[:dsc_identityreference].nil?
      fail('dsc_accesscontroltype is a required attribute') if self[:dsc_accesscontroltype].nil?
      fail('dsc_objecttype is a required attribute') if self[:dsc_objecttype].nil?
      fail('dsc_activedirectorysecurityinheritance is a required attribute') if self[:dsc_activedirectorysecurityinheritance].nil?
      fail('dsc_inheritedobjecttype is a required attribute') if self[:dsc_inheritedobjecttype].nil?
    end

  def dscmeta_resource_friendly_name; 'xADObjectPermissionEntry' end
  def dscmeta_resource_name; 'MSFT_xADObjectPermissionEntry' end
  def dscmeta_module_name; 'xActiveDirectory' end
  def dscmeta_module_version; '2.24.0.0' end

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

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Indicates if the access will be added (Present) or will be removed (Absent). Default is 'Present'. Valid values are Present, Absent."
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

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - Active Directory path of the target object to add or remove the permission entry, specified as a Distinguished Name."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IdentityReference
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identityreference) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IdentityReference - Indicates the identity of the principal for the permission entry. Use the notation <Domain>\\<SamAccountName> for the identity."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ActiveDirectoryRights
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["AccessSystemSecurity", "CreateChild", "Delete", "DeleteChild", "DeleteTree", "ExtendedRight", "GenericAll", "GenericExecute", "GenericRead", "GenericWrite", "ListChildren", "ListObject", "ReadControl", "ReadProperty", "Self", "Synchronize", "WriteDacl", "WriteOwner", "WriteProperty"]
  newparam(:dsc_activedirectoryrights, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ActiveDirectoryRights - A combination of one or more of the ActiveDirectoryRights enumeration values that specifies the rights of the access rule. Default is 'GenericAll'. Valid values are AccessSystemSecurity, CreateChild, Delete, DeleteChild, DeleteTree, ExtendedRight, GenericAll, GenericExecute, GenericRead, GenericWrite, ListChildren, ListObject, ReadControl, ReadProperty, Self, Synchronize, WriteDacl, WriteOwner, WriteProperty."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['AccessSystemSecurity', 'accesssystemsecurity', 'CreateChild', 'createchild', 'Delete', 'delete', 'DeleteChild', 'deletechild', 'DeleteTree', 'deletetree', 'ExtendedRight', 'extendedright', 'GenericAll', 'genericall', 'GenericExecute', 'genericexecute', 'GenericRead', 'genericread', 'GenericWrite', 'genericwrite', 'ListChildren', 'listchildren', 'ListObject', 'listobject', 'ReadControl', 'readcontrol', 'ReadProperty', 'readproperty', 'Self', 'self', 'Synchronize', 'synchronize', 'WriteDacl', 'writedacl', 'WriteOwner', 'writeowner', 'WriteProperty', 'writeproperty'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are AccessSystemSecurity, CreateChild, Delete, DeleteChild, DeleteTree, ExtendedRight, GenericAll, GenericExecute, GenericRead, GenericWrite, ListChildren, ListObject, ReadControl, ReadProperty, Self, Synchronize, WriteDacl, WriteOwner, WriteProperty")
        end
      end
      if value.kind_of?(String)
        unless ['AccessSystemSecurity', 'accesssystemsecurity', 'CreateChild', 'createchild', 'Delete', 'delete', 'DeleteChild', 'deletechild', 'DeleteTree', 'deletetree', 'ExtendedRight', 'extendedright', 'GenericAll', 'genericall', 'GenericExecute', 'genericexecute', 'GenericRead', 'genericread', 'GenericWrite', 'genericwrite', 'ListChildren', 'listchildren', 'ListObject', 'listobject', 'ReadControl', 'readcontrol', 'ReadProperty', 'readproperty', 'Self', 'self', 'Synchronize', 'synchronize', 'WriteDacl', 'writedacl', 'WriteOwner', 'writeowner', 'WriteProperty', 'writeproperty'].include?(value)
          fail("Invalid value #{value}. Valid values are AccessSystemSecurity, CreateChild, Delete, DeleteChild, DeleteTree, ExtendedRight, GenericAll, GenericExecute, GenericRead, GenericWrite, ListChildren, ListObject, ReadControl, ReadProperty, Self, Synchronize, WriteDacl, WriteOwner, WriteProperty")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         AccessControlType
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Allow", "Deny"]
  newparam(:dsc_accesscontroltype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AccessControlType - Indicates whether to Allow or Deny access to the target object. Valid values are Allow, Deny."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow', 'allow', 'Deny', 'deny'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow, Deny")
      end
    end
  end

  # Name:         ObjectType
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_objecttype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ObjectType - The schema GUID of the object to which the access rule applies. If the permission entry shouldn't be restricted to a specific object type, use the zero guid: 00000000-0000-0000-0000-000000000000."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ActiveDirectorySecurityInheritance
  # Type:         string
  # IsMandatory:  True
  # Values:       ["All", "Children", "Descendents", "None", "SelfAndChildren"]
  newparam(:dsc_activedirectorysecurityinheritance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActiveDirectorySecurityInheritance - One of the 'ActiveDirectorySecurityInheritance' enumeration values that specifies the inheritance type of the access rule. Valid values are All, Children, Descendents, None, SelfAndChildren."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['All', 'all', 'Children', 'children', 'Descendents', 'descendents', 'None', 'none', 'SelfAndChildren', 'selfandchildren'].include?(value)
        fail("Invalid value '#{value}'. Valid values are All, Children, Descendents, None, SelfAndChildren")
      end
    end
  end

  # Name:         InheritedObjectType
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_inheritedobjecttype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InheritedObjectType - The schema GUID of the child object type that can inherit this access rule. If the permission entry shouldn't be restricted to a specific inherited object type, use the zero guid: 00000000-0000-0000-0000-000000000000."
    isrequired
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

Puppet::Type.type(:dsc_xadobjectpermissionentry).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
