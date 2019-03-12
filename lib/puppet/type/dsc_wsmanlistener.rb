require 'pathname'

Puppet::Type.newtype(:dsc_wsmanlistener) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC WSManListener resource type.
    Automatically generated from
    'WSManDsc/DSCResources/DSR_WSManListener/DSR_WSManListener.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_transport is a required attribute') if self[:dsc_transport].nil?
    end

  def dscmeta_resource_friendly_name; 'WSManListener' end
  def dscmeta_resource_name; 'DSR_WSManListener' end
  def dscmeta_module_name; 'WSManDsc' end
  def dscmeta_module_version; '2.3.0.0' end

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

  # Name:         Transport
  # Type:         string
  # IsMandatory:  True
  # Values:       ["HTTP", "HTTPS"]
  newparam(:dsc_transport) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Transport - The transport type of WS-Man Listener. Valid values are HTTP, HTTPS."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['HTTP', 'http', 'HTTPS', 'https'].include?(value)
        fail("Invalid value '#{value}'. Valid values are HTTP, HTTPS")
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
    desc "Ensure - Specifies whether the WS-Man Listener should exist. Valid values are Present, Absent."
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

  # Name:         Port
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_port) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "Port - The port the WS-Man Listener should use. Defaults to 5985 for HTTP and 5986 for HTTPS listeners."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Address
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_address) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Address - The Address that the WS-Man Listener will be bound to. The default is * (any address)."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Issuer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_issuer) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Issuer - The Issuer of the certificate to use for the HTTPS WS-Man Listener if a thumbprint is not specified."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SubjectFormat
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Both", "FQDNOnly", "NameOnly"]
  newparam(:dsc_subjectformat) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SubjectFormat - The format used to match the certificate subject to use for an HTTPS WS-Man Listener if a thumbprint is not specified. Valid values are Both, FQDNOnly, NameOnly."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Both', 'both', 'FQDNOnly', 'fqdnonly', 'NameOnly', 'nameonly'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Both, FQDNOnly, NameOnly")
      end
    end
  end

  # Name:         MatchAlternate
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_matchalternate) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MatchAlternate - Should the FQDN/Name be used to also match the certificate alternate subject for an HTTPS WS-Man Listener if a thumbprint is not specified."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DN
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dn) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DN - This is a Distinguished Name component that will be used to identify the certificate to use for the HTTPS WS-Man Listener if a thumbprint is not specified."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Hostname
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hostname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Hostname - The host name that a HTTPS WS-Man Listener will be bound to. If not specified it will default to the computer name of the node."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Enabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Enabled - Returns true if the existing WS-Man Listener is enabled."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         URLPrefix
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_urlprefix) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "URLPrefix - The URL Prefix of the existing WS-Man Listener."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CertificateThumbprint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_certificatethumbprint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CertificateThumbprint - The Thumbprint of the certificate to use for the HTTPS WS-Man Listener."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_wsmanlistener).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
