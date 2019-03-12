require 'pathname'

Puppet::Type.newtype(:dsc_adcsenrollmentpolicywebservice) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC AdcsEnrollmentPolicyWebService resource type.
    Automatically generated from
    'ActiveDirectoryCSDsc/DSCResources/MSFT_AdcsEnrollmentPolicyWebService/MSFT_AdcsEnrollmentPolicyWebService.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_authenticationtype is a required attribute') if self[:dsc_authenticationtype].nil?
    end

  def dscmeta_resource_friendly_name; 'AdcsEnrollmentPolicyWebService' end
  def dscmeta_resource_name; 'MSFT_AdcsEnrollmentPolicyWebService' end
  def dscmeta_module_name; 'ActiveDirectoryCSDsc' end
  def dscmeta_module_version; '3.2.0.0' end

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

  # Name:         AuthenticationType
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Certificate", "Kerberos", "UserName"]
  newparam(:dsc_authenticationtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AuthenticationType - Specifies the authentication type used by the Certificate Enrollment Policy Web Service. Valid values are Certificate, Kerberos, UserName."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Certificate', 'certificate', 'Kerberos', 'kerberos', 'UserName', 'username'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Certificate, Kerberos, UserName")
      end
    end
  end

  # Name:         SslCertThumbprint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sslcertthumbprint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SslCertThumbprint - Specifies the thumbprint of the certificate used by Internet Information Service (IIS) to enable support for required Secure Sockets Layer (SSL)."
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
    desc "Credential - If the Certificate Enrollment Policy Web service is configured to use Standalone certification authority, then an account that is a member of the local Administrators on the CA is required. If the Certificate Enrollment Policy Web service is configured to use an Enterprise CA, then an account that is a member of Domain Admins is required."
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

  # Name:         KeyBasedRenewal
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_keybasedrenewal) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "KeyBasedRenewal - Configures the Certificate Enrollment Policy Web Service to operate in key-based renewal mode. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Specifies whether the Certificate Enrollment Policy Web feature should be installed or uninstalled. Defaults to Present. Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_adcsenrollmentpolicywebservice).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
