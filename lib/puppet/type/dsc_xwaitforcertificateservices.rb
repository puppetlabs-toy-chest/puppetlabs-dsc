require 'pathname'

Puppet::Type.newtype(:dsc_xwaitforcertificateservices) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xWaitForCertificateServices resource type.
    Automatically generated from
    'xCertificate/DSCResources/MSFT_xWaitForCertificateServices/MSFT_xWaitForCertificateServices.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_caserverfqdn is a required attribute') if self[:dsc_caserverfqdn].nil?
      fail('dsc_carootname is a required attribute') if self[:dsc_carootname].nil?
    end

  def dscmeta_resource_friendly_name; 'xWaitForCertificateServices' end
  def dscmeta_resource_name; 'MSFT_xWaitForCertificateServices' end
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

  # Name:         CAServerFQDN
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_caserverfqdn) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CAServerFQDN - The FQDN of the Active Directory Certificate Service Certificate Authority to wait for."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CARootName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_carootname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CARootName - The name of the Active Directory Certificate Service Certificate Authority to wait for."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RetryIntervalSeconds
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retryintervalseconds) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RetryIntervalSeconds - Specifies the number of seconds to wait for the Active Directory Certificate Service Certificate Authority to become available. Defaults to 10 seconds."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RetryCount
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_retrycount) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RetryCount - The number of times to loop the retry interval while waiting for the Active Directory Certificate Service Certificate Authority. Defaults to 60 retries."
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

Puppet::Type.type(:dsc_xwaitforcertificateservices).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
