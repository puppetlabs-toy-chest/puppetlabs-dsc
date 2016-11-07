require 'pathname'

Puppet::Type.newtype(:dsc_spserviceappsecurity) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_SPServiceAppSecurityEntry(mof_type_map, name, value)
        required = ['accesslevel']
        allowed = ['username']
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
            validate_mof_type(mof_type_map[key], 'MSFT_SPServiceAppSecurityEntry', key, lowkey_hash[key])
          end
        end
      end
    end

  @doc = %q{
    The DSC SPServiceAppSecurity resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPServiceAppSecurity/MSFT_SPServiceAppSecurity.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_serviceappname is a required attribute') if self[:dsc_serviceappname].nil?
      fail('dsc_securitytype is a required attribute') if self[:dsc_securitytype].nil?
    end

  def dscmeta_resource_friendly_name; 'SPServiceAppSecurity' end
  def dscmeta_resource_name; 'MSFT_SPServiceAppSecurity' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.4.0.0' end

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
  end

  # Name:         ServiceAppName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_serviceappname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServiceAppName - The name of the service application you wish to apply security settings to"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SecurityType
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Administrators", "SharingPermissions"]
  newparam(:dsc_securitytype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SecurityType - Administrators will set the administrators for the service app, SharingPermissions will set those granted access through the permissions button seen in the Sharing section of the ribbon in central admin Valid values are Administrators, SharingPermissions."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Administrators', 'administrators', 'SharingPermissions', 'sharingpermissions'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Administrators, SharingPermissions")
      end
    end
  end

  # Name:         Members
  # Type:         MSFT_SPServiceAppSecurityEntry[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_members, :array_matching => :all) do
    def mof_type; 'MSFT_SPServiceAppSecurityEntry[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"username"=>{:type=>"string"}, "accesslevel"=>{:type=>"string", :values=>["Change Permissions", "Full Control", "Write", "Read"]}}
    end
    desc "Members - A list of members to set the group to. Those not in this list will be removed"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "Members value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_SPServiceAppSecurityEntry(mof_type_map, "Members", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
    end
  end

  # Name:         MembersToInclude
  # Type:         MSFT_SPServiceAppSecurityEntry[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_memberstoinclude, :array_matching => :all) do
    def mof_type; 'MSFT_SPServiceAppSecurityEntry[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"username"=>{:type=>"string"}, "accesslevel"=>{:type=>"string", :values=>["Change Permissions", "Full Control", "Write", "Read"]}}
    end
    desc "MembersToInclude - A list of members to add. Members not in this list will be left in the group"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "MembersToInclude value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_SPServiceAppSecurityEntry(mof_type_map, "MembersToInclude", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
    end
  end

  # Name:         MembersToExclude
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_memberstoexclude, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "MembersToExclude - A list of members to remove. Members not in this list will be left in the group"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
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

Puppet::Type.type(:dsc_spserviceappsecurity).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
