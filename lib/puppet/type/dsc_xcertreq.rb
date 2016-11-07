require 'pathname'

Puppet::Type.newtype(:dsc_xcertreq) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xCertReq resource type.
    Automatically generated from
    'xCertificate/DSCResources/MSFT_xCertReq/MSFT_xCertReq.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_subject is a required attribute') if self[:dsc_subject].nil?
    end

  def dscmeta_resource_friendly_name; 'xCertReq' end
  def dscmeta_resource_name; 'MSFT_xCertReq' end
  def dscmeta_module_name; 'xCertificate' end
  def dscmeta_module_version; '2.2.0.0' end

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

  # Name:         Subject
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_subject) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Subject - Provide the text string to use as the subject of the certificate."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CAServerFQDN
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_caserverfqdn) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CAServerFQDN - The FQDN of the Active Directory Certificate Authority on the local area network."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CARootName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_carootname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CARootName - The name of the certificate authority, by default this will be in format domain-servername-ca."
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
    desc "Credential - The credentials that will be used to access the template in the Certificate Authority."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         AutoRenew
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autorenew) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AutoRenew - Determines if the resource will also renew a certificate within 7 days of expiration."
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

Puppet::Type.type(:dsc_xcertreq).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
