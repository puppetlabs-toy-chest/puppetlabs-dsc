require 'pathname'

Puppet::Type.newtype(:dsc_adcsocspextension) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC AdcsOcspExtension resource type.
    Automatically generated from
    'ActiveDirectoryCSDsc/DSCResources/MSFT_AdcsOcspExtension/MSFT_AdcsOcspExtension.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_issingleinstance is a required attribute') if self[:dsc_issingleinstance].nil?
    end

  def dscmeta_resource_friendly_name; 'AdcsOcspExtension' end
  def dscmeta_resource_name; 'MSFT_AdcsOcspExtension' end
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

  # Name:         IsSingleInstance
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Yes"]
  newparam(:dsc_issingleinstance) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IsSingleInstance - Specifies the resource is a single instance, the value must be 'Yes'. Valid values are Yes."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Yes', 'yes'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Yes")
      end
    end
  end

  # Name:         OcspUriPath
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ocspuripath, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "OcspUriPath - Specifies the address of the OCSP responder from where revocation of this certificate can be checked."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         RestartService
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartservice) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RestartService - Specifies if the CertSvc service should be restarted to immediately apply the settings."
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
    desc "Ensure - Specifies if the OCSP responder URI should be present or absent. Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_adcsocspextension).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
