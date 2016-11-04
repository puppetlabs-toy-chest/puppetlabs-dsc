require 'pathname'

Puppet::Type.newtype(:dsc_xcertificateimport) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xCertificateImport resource type.
    Automatically generated from
    'xCertificate/DSCResources/MSFT_xCertificateImport/MSFT_xCertificateImport.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_thumbprint is a required attribute') if self[:dsc_thumbprint].nil?
      fail('dsc_location is a required attribute') if self[:dsc_location].nil?
      fail('dsc_store is a required attribute') if self[:dsc_store].nil?
    end

  def dscmeta_resource_friendly_name; 'xCertificateImport' end
  def dscmeta_resource_name; 'MSFT_xCertificateImport' end
  def dscmeta_module_name; 'xCertificate' end
  def dscmeta_module_version; '2.2.0.0' end

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

  # Name:         Thumbprint
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_thumbprint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Thumbprint - The thumbprint (unique identifier) of the certificate you're importing."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Path
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - The path to the CER file you want to import."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Location
  # Type:         string
  # IsMandatory:  True
  # Values:       ["LocalMachine", "CurrentUser"]
  newparam(:dsc_location) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Location - The Windows Certificate Store Location to import the certificate to. Valid values are LocalMachine, CurrentUser."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['LocalMachine', 'localmachine', 'CurrentUser', 'currentuser'].include?(value)
        fail("Invalid value '#{value}'. Valid values are LocalMachine, CurrentUser")
      end
    end
  end

  # Name:         Store
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_store) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Store - The Windows Certificate Store Name to import the certificate to."
    isrequired
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
    desc "Ensure - Specifies whether the certificate should be present or absent. Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_xcertificateimport).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
