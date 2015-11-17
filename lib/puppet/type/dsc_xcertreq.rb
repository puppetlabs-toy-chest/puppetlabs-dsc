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

  newproperty(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xCertReq')."

    def retrieve
      'xCertReq'
    end

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only'
    end
  end

  newproperty(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xCertReq')."

    def retrieve
      'MSFT_xCertReq'
    end

    validate do |value|
      fail 'dscmeta_resource_name is read-only'
    end
  end

  newparam(:dscmeta_import_resource) do
    desc "Please ignore this parameter.
      Defaults to `true`."
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newproperty(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xCertificate')."

    def retrieve
      'xCertificate'
    end

    validate do |value|
      fail 'dscmeta_module_name is read-only'
    end
  end

  newproperty(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.1.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    def retrieve
      '1.1.0.0'
    end

    validate do |value|
      fail 'dscmeta_module_version is read-only'
    end
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Subject
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_subject) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Subject - Provide the text string to use as the subject of the certificate"
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
    desc "CAServerFQDN - The FQDN of the Active Directory Certificate Authority on the local area network"
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
    desc "CARootName - The name of the certificate authority, by default this will be in format domain-servername-ca"
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
    desc "Credential - The credentials that will be used to access the template in the Certificate Authority"
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
    desc "AutoRenew - Determines if the resource will also renew a certificate within 7 days of expiration"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


end

Puppet::Type.type(:dsc_xcertreq).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
