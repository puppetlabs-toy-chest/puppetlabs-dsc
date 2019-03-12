require 'pathname'

Puppet::Type.newtype(:dsc_fsrmclassificationrule) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC FSRMClassificationRule resource type.
    Automatically generated from
    'FSRMDsc/DSCResources/DSR_FSRMClassificationRule/DSR_FSRMClassificationRule.schema.mof'

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

  def dscmeta_resource_friendly_name; 'FSRMClassificationRule' end
  def dscmeta_resource_name; 'DSR_FSRMClassificationRule' end
  def dscmeta_module_name; 'FSRMDsc' end
  def dscmeta_module_version; '2.4.1.0' end

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
    desc "Name - The name of the FSRM Classification Rule."
    isrequired
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
    desc "Description - The description for the FSRM Classification Rule."
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
    desc "Ensure - Specifies whether the FSRM Classification Rule should exist. Valid values are Present, Absent."
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

  # Name:         Property
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_property) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Property - Specifies the name of a classification property definition to set."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PropertyValue
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_propertyvalue) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PropertyValue - Specifies the property value that the rule will assign."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ClassificationMechanism
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_classificationmechanism) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ClassificationMechanism - Specifies the name of a valid classification mechanism available on the server for assigning the property value."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ContentRegularExpression
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_contentregularexpression, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ContentRegularExpression - An array of regular expressions for pattern matching."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ContentString
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_contentstring, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ContentString - An array of strings for the content classifier to search for."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ContentStringCaseSensitive
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_contentstringcasesensitive, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ContentStringCaseSensitive - An array of case sensitive strings for the content classifier to search for."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Disabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Disabled - Indicates that the classification rule is disabled."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Flags
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_flags, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Flags - An array of flags that defines the possible states of the rule."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Parameters
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_parameters, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Parameters - An array of parameters in the format <name>=<value> that can be used by the File Classification Infrastructure."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Namespace
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_namespace, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Namespace - An array of namespaces where the rule is applied."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ReevaluateProperty
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Never", "Overwrite", "Aggregate"]
  newparam(:dsc_reevaluateproperty) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReevaluateProperty - Specifies the evaluation policy of the rule. Valid values are Never, Overwrite, Aggregate."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Never', 'never', 'Overwrite', 'overwrite', 'Aggregate', 'aggregate'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Never, Overwrite, Aggregate")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_fsrmclassificationrule).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
