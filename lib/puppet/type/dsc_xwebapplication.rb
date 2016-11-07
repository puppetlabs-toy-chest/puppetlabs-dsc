require 'pathname'

Puppet::Type.newtype(:dsc_xwebapplication) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_xWebApplicationAuthenticationInformation(mof_type_map, name, value)
        required = []
        allowed = ['anonymous','basic','digest','windows']
        lowkey_hash = Hash[value.map { |k, v| [k.to_s.downcase, v] }]

        missing = required - lowkey_hash.keys
        unless missing.empty?
          fail "#{name} is missing the following required keys: #{missing.join(',')}"
        end

        extraneous = lowkey_hash.keys - required - allowed
        unless extraneous.empty?
          fail "#{name} includes invalid keys: #{extraneous.join(',')}"
        end

        lowkey_hash.keys.each do |key|
          if lowkey_hash[key]
            validate_mof_type(mof_type_map[key], 'MSFT_xWebApplicationAuthenticationInformation', key, lowkey_hash[key])
          end
        end
      end
    end

  @doc = %q{
    The DSC xWebApplication resource type.
    Automatically generated from
    'xWebAdministration/DSCResources/MSFT_xWebApplication/MSFT_xWebApplication.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_website is a required attribute') if self[:dsc_website].nil?
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'xWebApplication' end
  def dscmeta_resource_name; 'MSFT_xWebApplication' end
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

  # Name:         Website
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_website) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Website - Name of website with which web application is associated"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Name of web application"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WebAppPool
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_webapppool) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WebAppPool - Web application pool for the web application"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PhysicalPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_physicalpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PhysicalPath - Physical path for the web application directory"
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
    desc "Ensure - Whether web application should be present or absent Valid values are Present, Absent."
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

  # Name:         SslFlags
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["", "Ssl", "SslNegotiateCert", "SslRequireCert", "Ssl128"]
  newparam(:dsc_sslflags, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "SslFlags - SSLFlags for the application Valid values are , Ssl, SslNegotiateCert, SslRequireCert, Ssl128."
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

  # Name:         AuthenticationInfo
  # Type:         MSFT_xWebApplicationAuthenticationInformation
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authenticationinfo) do
    def mof_type; 'MSFT_xWebApplicationAuthenticationInformation' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"anonymous"=>{:type=>"boolean"}, "basic"=>{:type=>"boolean"}, "digest"=>{:type=>"boolean"}, "windows"=>{:type=>"boolean"}}
    end
    desc "AuthenticationInfo - Hashtable containing authentication information (Anonymous, Basic, Digest, Windows)"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_xWebApplicationAuthenticationInformation(mof_type_map, "AuthenticationInfo", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)
    end
  end

  # Name:         PreloadEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_preloadenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "PreloadEnabled - Allows a Application to automatically start without a request"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ServiceAutoStartEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serviceautostartenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ServiceAutoStartEnabled - Enables Autostart on a Application."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ServiceAutoStartProvider
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serviceautostartprovider) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServiceAutoStartProvider - Adds a AutostartProvider"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ApplicationType
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applicationtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ApplicationType - Adds a AutostartProvider ApplicationType"
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

Puppet::Type.type(:dsc_xwebapplication).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
