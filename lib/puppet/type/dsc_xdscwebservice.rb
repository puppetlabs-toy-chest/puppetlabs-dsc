require 'pathname'

Puppet::Type.newtype(:dsc_xdscwebservice) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDSCWebService resource type.
    Automatically generated from
    'xPSDesiredStateConfiguration/DSCResources/MSFT_xDSCWebService/MSFT_xDSCWebService.Schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_endpointname is a required attribute') if self[:dsc_endpointname].nil?
    end

  def dscmeta_resource_friendly_name; 'xDSCWebService' end
  def dscmeta_resource_name; 'MSFT_xDSCWebService' end
  def dscmeta_module_name; 'xPSDesiredStateConfiguration' end
  def dscmeta_module_version; '5.0.0.0' end

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

  # Name:         EndpointName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_endpointname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EndpointName"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CertificateThumbPrint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_certificatethumbprint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CertificateThumbPrint - Can take the value AllowUnencryptedTraffic for setting up a non SSL based endpoint"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Port
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_port) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "Port"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         PhysicalPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_physicalpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PhysicalPath"
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
    desc "Ensure - Valid values are Present, Absent."
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

  # Name:         State
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Started", "Stopped"]
  newparam(:dsc_state) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "State - Valid values are Started, Stopped."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Started', 'started', 'Stopped', 'stopped'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Started, Stopped")
      end
    end
  end

  # Name:         DatabasePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabasePath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ModulePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_modulepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ModulePath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConfigurationPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_configurationpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConfigurationPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DSCServerUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dscserverurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DSCServerUrl"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RegistrationKeyPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_registrationkeypath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RegistrationKeyPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AcceptSelfSignedCertificates
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_acceptselfsignedcertificates) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AcceptSelfSignedCertificates"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         UseSecurityBestPractices
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usesecuritybestpractices) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UseSecurityBestPractices - This property will ensure that the Pull Server is created with the most secure practices"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisableSecurityBestPractices
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["SecureTLSProtocols"]
  newparam(:dsc_disablesecuritybestpractices, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DisableSecurityBestPractices - Valid values are SecureTLSProtocols."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['SecureTLSProtocols', 'securetlsprotocols'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are SecureTLSProtocols")
        end
      end
      if value.kind_of?(String)
        unless ['SecureTLSProtocols', 'securetlsprotocols'].include?(value)
          fail("Invalid value #{value}. Valid values are SecureTLSProtocols")
        end
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

Puppet::Type.type(:dsc_xdscwebservice).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
