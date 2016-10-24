require 'pathname'

Puppet::Type.newtype(:dsc_xadcscertificationauthority) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xAdcsCertificationAuthority resource type.
    Automatically generated from
    'xAdcsDeployment/DSCResources/MSFT_xAdcsCertificationAuthority/MSFT_xAdcsCertificationAuthority.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_catype is a required attribute') if self[:dsc_catype].nil?
    end

  def dscmeta_resource_friendly_name; 'xAdcsCertificationAuthority' end
  def dscmeta_resource_name; 'MSFT_xAdcsCertificationAuthority' end
  def dscmeta_module_name; 'xAdcsDeployment' end
  def dscmeta_module_version; '0.2.0.0' end

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

  # Name:         CAType
  # Type:         string
  # IsMandatory:  True
  # Values:       ["EnterpriseRootCA", "EnterpriseSubordinateCA", "StandaloneRootCA", "StandaloneSubordinateCA"]
  newparam(:dsc_catype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CAType - Specifies the type of certification authority to install. The possible values are EnterpriseRootCA, EnterpriseSubordinateCA, StandaloneRootCA, or StandaloneSubordinateCA. Valid values are EnterpriseRootCA, EnterpriseSubordinateCA, StandaloneRootCA, StandaloneSubordinateCA."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['EnterpriseRootCA', 'enterpriserootca', 'EnterpriseSubordinateCA', 'enterprisesubordinateca', 'StandaloneRootCA', 'standalonerootca', 'StandaloneSubordinateCA', 'standalonesubordinateca'].include?(value)
        fail("Invalid value '#{value}'. Valid values are EnterpriseRootCA, EnterpriseSubordinateCA, StandaloneRootCA, StandaloneSubordinateCA")
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
    desc "Credential - To install an enterprise certification authority, the computer must be joined to an Active Directory Domain Services domain and a user account that is a member of the Enterprise Admin group is required. To install a standalone certification authority, the computer can be in a workgroup or AD DS domain. If the computer is in a workgroup, a user account that is a member of Administrators is required. If the computer is in an AD DS domain, a user account that is a member of Domain Admins is required."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Specifies whether the Certificate Authority should be installed or uninstalled. Valid values are Present, Absent."
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

  # Name:         CACommonName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cacommonname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CACommonName - Specifies the certification authority common name."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CADistinguishedNameSuffix
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cadistinguishednamesuffix) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CADistinguishedNameSuffix - Specifies the certification authority distinguished name suffix."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CertFile
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_certfile) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CertFile - Specifies the file name of certification authority PKCS 12 formatted certificate file."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CertFilePassword
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_certfilepassword) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "CertFilePassword - Specifies the password for certification authority certificate file."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("CertFilePassword", value)
    end
  end

  # Name:         CertificateID
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_certificateid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CertificateID - Specifies the thumbprint or serial number of certification authority certificate."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CryptoProviderName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cryptoprovidername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CryptoProviderName - The name of the cryptographic service provider  or key storage provider that is used to generate or store the private key for the CA."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasedirectory) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseDirectory - Specifies the folder location of the certification authority database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HashAlgorithmName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hashalgorithmname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "HashAlgorithmName - Specifies the signature hash algorithm used by the certification authority."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IgnoreUnicode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ignoreunicode) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IgnoreUnicode - Specifies that Unicode characters are allowed in certification authority name string."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         KeyContainerName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_keycontainername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "KeyContainerName - Specifies the name of an existing private key container."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         KeyLength
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_keylength) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "KeyLength - Specifies the name of an existing private key container."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LogDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logdirectory) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogDirectory - Specifies the folder location of the certification authority database log."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         OutputCertRequestFile
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_outputcertrequestfile) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "OutputCertRequestFile - Specifies the folder location for certificate request file."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         OverwriteExistingCAinDS
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_overwriteexistingcainds) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "OverwriteExistingCAinDS - Specifies that the computer object in the Active Directory Domain Service domain should be overwritten with the same computer name."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         OverwriteExistingDatabase
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_overwriteexistingdatabase) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "OverwriteExistingDatabase - Specifies that the existing certification authority database should be overwritten."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         OverwriteExistingKey
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_overwriteexistingkey) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "OverwriteExistingKey - Overwrite existing key container with the same name"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ParentCA
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_parentca) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ParentCA - Specifies the configuration string of the parent certification authority that will certify this CA."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ValidityPeriod
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Hours", "Days", "Months", "Years"]
  newparam(:dsc_validityperiod) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ValidityPeriod - Specifies the validity period of the certification authority certificate in hours, days, weeks, months or years. If this is a subordinate CA, do not use this parameter, because the validity period is determined by the parent CA. Valid values are Hours, Days, Months, Years."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Hours', 'hours', 'Days', 'days', 'Months', 'months', 'Years', 'years'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Hours, Days, Months, Years")
      end
    end
  end

  # Name:         ValidityPeriodUnits
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_validityperiodunits) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ValidityPeriodUnits - Validity period of the certification authority certificate. If this is a subordinate CA, do not specify this parameter because the validity period is determined by the parent CA."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xadcscertificationauthority).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
