require 'pathname'

Puppet::Type.newtype(:dsc_xcertificateexport) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xCertificateExport resource type.
    Automatically generated from
    'xCertificate/DSCResources/MSFT_xCertificateExport/MSFT_xCertificateExport.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
    end

  def dscmeta_resource_friendly_name; 'xCertificateExport' end
  def dscmeta_resource_name; 'MSFT_xCertificateExport' end
  def dscmeta_module_name; 'xCertificate' end
  def dscmeta_module_version; '3.0.0.0' end

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

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - The path to the file you that will contain the exported certificate."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Thumbprint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_thumbprint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Thumbprint - The thumbprint of the certificate to export. Certificate selector parameter."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FriendlyName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_friendlyname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FriendlyName - The friendly name of the certificate to export. Certificate selector parameter."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Subject
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_subject) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Subject - The subject of the certificate to export. Certificate selector parameter."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DNSName
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dnsname, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DNSName - The subject alternative name of the certificate to export must contain these values. Certificate selector parameter."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Issuer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_issuer) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Issuer - The issuer of the certificate to export. Certificate selector parameter."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         KeyUsage
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_keyusage, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "KeyUsage - The key usage of the certificate to export must contain these values. Certificate selector parameter."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         EnhancedKeyUsage
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enhancedkeyusage, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "EnhancedKeyUsage - The enhanced key usage of the certificate to export must contain these values. Certificate selector parameter."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Store
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_store) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Store - The Windows Certificate Store Name to search for the certificate to export from. Certificate selector parameter. Defaults to 'My'."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AllowExpired
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowexpired) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowExpired - Allow an expired certificate to be exported. Certificate selector parameter."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         MatchSource
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_matchsource) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MatchSource - Causes an existing exported certificate to be compared with the certificate identified for export and re-exported if it does not match."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Cert", "P7B", "SST", "PFX"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - Specifies the type of certificate to export. Valid values are Cert, P7B, SST, PFX."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Cert', 'cert', 'P7B', 'p7b', 'SST', 'sst', 'PFX', 'pfx'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Cert, P7B, SST, PFX")
      end
    end
  end

  # Name:         ChainOption
  # Type:         string
  # IsMandatory:  False
  # Values:       ["BuildChain", "EndEntityCertOnly"]
  newparam(:dsc_chainoption) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ChainOption - Specifies the options for building a chain when exporting a PFX certificate. Valid values are BuildChain, EndEntityCertOnly."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['BuildChain', 'buildchain', 'EndEntityCertOnly', 'endentitycertonly'].include?(value)
        fail("Invalid value '#{value}'. Valid values are BuildChain, EndEntityCertOnly")
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
    desc "Password - Specifies the password used to protect an exported PFX file."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Password", value)
    end
  end

  # Name:         ProtectTo
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_protectto, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ProtectTo - Specifies an array of strings for the username or group name that can access the private key of an exported PFX file without any password."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         IsExported
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isexported) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsExported - Returns true if the certificate file already exists and therefore has been exported."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xcertificateexport).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
