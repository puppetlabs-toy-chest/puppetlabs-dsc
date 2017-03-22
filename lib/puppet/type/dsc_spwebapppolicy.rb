require 'pathname'

Puppet::Type.newtype(:dsc_spwebapppolicy) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_SPWebPolicyPermissions(mof_type_map, name, value)
        required = []
        allowed = ['username','permissionlevel','identitytype','actassystemaccount']
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
            validate_mof_type(mof_type_map[key], 'MSFT_SPWebPolicyPermissions', key, lowkey_hash[key])
          end
        end
      end
    end

  @doc = %q{
    The DSC SPWebAppPolicy resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPWebAppPolicy/MSFT_SPWebAppPolicy.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_webappurl is a required attribute') if self[:dsc_webappurl].nil?
    end

  def dscmeta_resource_friendly_name; 'SPWebAppPolicy' end
  def dscmeta_resource_name; 'MSFT_SPWebAppPolicy' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.6.0.0' end

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

  # Name:         WebAppUrl
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_webappurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WebAppUrl - The URL of the web application"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Members
  # Type:         MSFT_SPWebPolicyPermissions[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_members, :array_matching => :all) do
    def mof_type; 'MSFT_SPWebPolicyPermissions[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"username"=>{:type=>"string"}, "permissionlevel"=>{:type=>"string[]", :values=>["Deny All", "Deny Write", "Full Read", "Full Control"]}, "identitytype"=>{:type=>"string", :values=>["Claims", "Native"]}, "actassystemaccount"=>{:type=>"boolean"}}
    end
    desc "Members - Exact list of accounts that will have to get Web Policy permissions"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "Members value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_SPWebPolicyPermissions(mof_type_map, "Members", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
    end
  end

  # Name:         MembersToInclude
  # Type:         MSFT_SPWebPolicyPermissions[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_memberstoinclude, :array_matching => :all) do
    def mof_type; 'MSFT_SPWebPolicyPermissions[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"username"=>{:type=>"string"}, "permissionlevel"=>{:type=>"string[]", :values=>["Deny All", "Deny Write", "Full Read", "Full Control"]}, "identitytype"=>{:type=>"string", :values=>["Claims", "Native"]}, "actassystemaccount"=>{:type=>"boolean"}}
    end
    desc "MembersToInclude - List of all accounts that must be in the Web Policy group"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "MembersToInclude value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_SPWebPolicyPermissions(mof_type_map, "MembersToInclude", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
    end
  end

  # Name:         MembersToExclude
  # Type:         MSFT_SPWebPolicyPermissions[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_memberstoexclude, :array_matching => :all) do
    def mof_type; 'MSFT_SPWebPolicyPermissions[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"username"=>{:type=>"string"}, "permissionlevel"=>{:type=>"string[]", :values=>["Deny All", "Deny Write", "Full Read", "Full Control"]}, "identitytype"=>{:type=>"string", :values=>["Claims", "Native"]}, "actassystemaccount"=>{:type=>"boolean"}}
    end
    desc "MembersToExclude - List of all accounts that are not allowed to have any Web Policy permissions"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "MembersToExclude value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_SPWebPolicyPermissions(mof_type_map, "MembersToExclude", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
    end
  end

  # Name:         SetCacheAccountsPolicy
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_setcacheaccountspolicy) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SetCacheAccountsPolicy - Include the Cache Accounts in the policy or not"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
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

Puppet::Type.type(:dsc_spwebapppolicy).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
