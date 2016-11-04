require 'pathname'

Puppet::Type.newtype(:dsc_xsslsettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSSLSettings resource type.
    Automatically generated from
    'xWebAdministration/DSCResources/MSFT_xSSLSettings/MSFT_xSSLSettings.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'xSSLSettings' end
  def dscmeta_resource_name; 'MSFT_xSSLSettings' end
  def dscmeta_module_name; 'xWebAdministration' end
  def dscmeta_module_version; '1.15.0.0' end

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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Name of website in which to modify the SSL Settings"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Bindings
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["", "Ssl", "SslNegotiateCert", "SslRequireCert", "Ssl128"]
  newparam(:dsc_bindings, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Bindings - The Bindings in which to modify for the website Valid values are , Ssl, SslNegotiateCert, SslRequireCert, Ssl128."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['', '', 'Ssl', 'ssl', 'SslNegotiateCert', 'sslnegotiatecert', 'SslRequireCert', 'sslrequirecert', 'Ssl128', 'ssl128'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are , Ssl, SslNegotiateCert, SslRequireCert, Ssl128")
        end
      end
      if value.kind_of?(String)
        unless ['', '', 'Ssl', 'ssl', 'SslNegotiateCert', 'sslnegotiatecert', 'SslRequireCert', 'sslrequirecert', 'Ssl128', 'ssl128'].include?(value)
          fail("Invalid value #{value}. Valid values are , Ssl, SslNegotiateCert, SslRequireCert, Ssl128")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Whether the bindings should be present or absent Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_xsslsettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
