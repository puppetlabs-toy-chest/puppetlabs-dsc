require 'pathname'

Puppet::Type.newtype(:dsc_xexchexchangecertificate) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchExchangeCertificate resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchExchangeCertificate/MSFT_xExchExchangeCertificate.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_thumbprint is a required attribute') if self[:dsc_thumbprint].nil?
    end

  def dscmeta_resource_friendly_name; 'xExchExchangeCertificate' end
  def dscmeta_resource_name; 'MSFT_xExchExchangeCertificate' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.27.0.0' end

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

  # Name:         Thumbprint
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_thumbprint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Thumbprint - Thumbprint of the certificate to work on."
    isrequired
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
    desc "Credential - Credentials used to establish a remote PowerShell session to Exchange."
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
    desc "Ensure - Whether the certificate should be present or not. Valid values are Present, Absent."
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

  # Name:         AllowExtraServices
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowextraservices) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowExtraServices - Get-ExchangeCertificate sometimes displays more services than are actually enabled. Setting this to true allows tests to pass in that situation as long as the requested services are present."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CertCreds
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_certcreds) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "CertCreds - Credentials containing the password to the .pfx file in CertFilePath."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("CertCreds", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         CertFilePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_certfilepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CertFilePath - The file path to the certificate .pfx file that should be imported."
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
    desc "DomainController - The DomainController parameter specifies the domain controller that's used by this cmdlet to read data from or write data to Active Directory. You identify the domain controller by its fully qualified domain name (FQDN). For example, dc01.contoso.com."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DoNotRequireSsl
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_donotrequiressl) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DoNotRequireSsl - Setting DoNotRequireSsl to True prevents DSC from enabling the Require SSL setting on the Default Web Site when you enable the certificate for IIS. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         NetworkServiceAllowed
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_networkserviceallowed) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "NetworkServiceAllowed - Setting NetworkServiceAllowed to True gives the built-in Network Service account permission to read the certificate's private key without enabling the certificate for SMTP. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Services
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_services, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Services - The Services parameter specifies the Exchange services that the certificate is enabled for."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xexchexchangecertificate).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
