require 'pathname'

Puppet::Type.newtype(:dsc_xwebconfigpropertycollection) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xWebConfigPropertyCollection resource type.
    Automatically generated from
    'xWebAdministration/DSCResources/MSFT_xWebConfigPropertyCollection/MSFT_xWebConfigPropertyCollection.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_websitepath is a required attribute') if self[:dsc_websitepath].nil?
      fail('dsc_filter is a required attribute') if self[:dsc_filter].nil?
      fail('dsc_collectionname is a required attribute') if self[:dsc_collectionname].nil?
      fail('dsc_itemname is a required attribute') if self[:dsc_itemname].nil?
      fail('dsc_itemkeyname is a required attribute') if self[:dsc_itemkeyname].nil?
      fail('dsc_itemkeyvalue is a required attribute') if self[:dsc_itemkeyvalue].nil?
      fail('dsc_itempropertyname is a required attribute') if self[:dsc_itempropertyname].nil?
    end

  def dscmeta_resource_friendly_name; 'xWebConfigPropertyCollection' end
  def dscmeta_resource_name; 'MSFT_xWebConfigPropertyCollection' end
  def dscmeta_module_name; 'xWebAdministration' end
  def dscmeta_module_version; '2.5.0.0' end

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

  # Name:         WebsitePath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_websitepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WebsitePath - Path to website location (IIS or WebAdministration format)."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Filter
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_filter) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Filter - Filter used to locate property collection to update."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CollectionName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_collectionname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CollectionName - Name of the property collection to update."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ItemName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_itemname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ItemName - Name of the property collection item to update."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ItemKeyName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_itemkeyname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ItemKeyName - Name of the key of the property collection item to update."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ItemKeyValue
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_itemkeyvalue) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ItemKeyValue - Value of the key of the property collection item to update."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ItemPropertyName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_itempropertyname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ItemPropertyName - Name of the property of the property collection item to update."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ItemPropertyValue
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_itempropertyvalue) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ItemPropertyValue - Value of the property of the property collection item to update."
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
    desc "Ensure - Indicates if the property and value of the property collection item should be present or absent. Defaults to Present. Valid values are Present, Absent."
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


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xwebconfigpropertycollection).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
