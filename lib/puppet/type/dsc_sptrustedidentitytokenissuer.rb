require 'pathname'

Puppet::Type.newtype(:dsc_sptrustedidentitytokenissuer) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_SPClaimTypeMapping(mof_type_map, name, value)
        required = ['incomingclaimtype']
        allowed = ['name','localclaimtype']
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
            validate_mof_type(mof_type_map[key], 'MSFT_SPClaimTypeMapping', key, lowkey_hash[key])
          end
        end
      end
    end

  @doc = %q{
    The DSC SPTrustedIdentityTokenIssuer resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPTrustedIdentityTokenIssuer/MSFT_SPTrustedIdentityTokenIssuer.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPTrustedIdentityTokenIssuer' end
  def dscmeta_resource_name; 'MSFT_SPTrustedIdentityTokenIssuer' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.5.0.0' end

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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Name of the SPTrustedIdentityTokenIssuer"
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
    desc "Description - Description of the SPTrustedIdentityTokenIssuer"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Realm
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_realm) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Realm - Default Realm that is passed to identity provider"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SignInUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signinurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SignInUrl - URL of the identity provider where user is redirected to for authentication"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IdentifierClaim
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_identifierclaim) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IdentifierClaim - Identity claim type that uniquely identifies the user"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ClaimsMappings
  # Type:         MSFT_SPClaimTypeMapping[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_claimsmappings, :array_matching => :all) do
    def mof_type; 'MSFT_SPClaimTypeMapping[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"name"=>{:type=>"string"}, "incomingclaimtype"=>{:type=>"string"}, "localclaimtype"=>{:type=>"string"}}
    end
    desc "ClaimsMappings - Array of MSFT_SPClaimTypeMapping to use with cmdlet New-SPClaimTypeMapping"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "ClaimsMappings value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_SPClaimTypeMapping(mof_type_map, "ClaimsMappings", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
    end
  end

  # Name:         SigningCertificateThumbPrint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_signingcertificatethumbprint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SigningCertificateThumbPrint - Thumbprint of the signing certificate to use with this SPTrustedIdentityTokenIssuer. It must match the thumbprint of a certificate located in store LocalMachine\\My"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ClaimProviderName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_claimprovidername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ClaimProviderName - Name of a claims provider to set with this SPTrustedIdentityTokenIssuer"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProviderSignOutUri
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_providersignouturi) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProviderSignOutUri - Sign-out URL"
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
    desc "Ensure - Present if the SPTrustedIdentityTokenIssuer should be created, or Absent if it should be removed Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_sptrustedidentitytokenissuer).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
