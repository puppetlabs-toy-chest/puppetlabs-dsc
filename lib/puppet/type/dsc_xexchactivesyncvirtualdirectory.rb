require 'pathname'

Puppet::Type.newtype(:dsc_xexchactivesyncvirtualdirectory) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchActiveSyncVirtualDirectory resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchActiveSyncVirtualDirectory/MSFT_xExchActiveSyncVirtualDirectory.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_identity is a required attribute') if self[:dsc_identity].nil?
    end

  def dscmeta_resource_friendly_name; 'xExchActiveSyncVirtualDirectory' end
  def dscmeta_resource_name; 'MSFT_xExchActiveSyncVirtualdirectory' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.19.0.0' end

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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         Identity
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_identity) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Identity"
    isrequired
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
    desc "Credential"
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

  # Name:         AllowServiceRestart
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowservicerestart) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowServiceRestart"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AutoCertBasedAuth
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autocertbasedauth) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AutoCertBasedAuth"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AutoCertBasedAuthThumbprint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autocertbasedauththumbprint) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AutoCertBasedAuthThumbprint"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AutoCertBasedAuthHttpsBindings
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autocertbasedauthhttpsbindings, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "AutoCertBasedAuthHttpsBindings"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ActiveSyncServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_activesyncserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ActiveSyncServer"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         BadItemReportingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_baditemreportingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "BadItemReportingEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BasicAuthEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_basicauthenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "BasicAuthEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ClientCertAuth
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Ignore", "Accepted", "Required"]
  newparam(:dsc_clientcertauth) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ClientCertAuth - Valid values are Ignore, Accepted, Required."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Ignore', 'ignore', 'Accepted', 'accepted', 'Required', 'required'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Ignore, Accepted, Required")
      end
    end
  end

  # Name:         CompressionEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_compressionenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CompressionEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainController"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ExtendedProtectionFlags
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["None", "Proxy", "NoServiceNameCheck", "AllowDotlessSpn", "ProxyCohosting"]
  newparam(:dsc_extendedprotectionflags, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExtendedProtectionFlags - Valid values are None, Proxy, NoServiceNameCheck, AllowDotlessSpn, ProxyCohosting."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['None', 'none', 'Proxy', 'proxy', 'NoServiceNameCheck', 'noservicenamecheck', 'AllowDotlessSpn', 'allowdotlessspn', 'ProxyCohosting', 'proxycohosting'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are None, Proxy, NoServiceNameCheck, AllowDotlessSpn, ProxyCohosting")
        end
      end
      if value.kind_of?(String)
        unless ['None', 'none', 'Proxy', 'proxy', 'NoServiceNameCheck', 'noservicenamecheck', 'AllowDotlessSpn', 'allowdotlessspn', 'ProxyCohosting', 'proxycohosting'].include?(value)
          fail("Invalid value #{value}. Valid values are None, Proxy, NoServiceNameCheck, AllowDotlessSpn, ProxyCohosting")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ExtendedProtectionSPNList
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_extendedprotectionspnlist, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExtendedProtectionSPNList"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ExtendedProtectionTokenChecking
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Allow", "Require"]
  newparam(:dsc_extendedprotectiontokenchecking) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExtendedProtectionTokenChecking - Valid values are None, Allow, Require."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Allow', 'allow', 'Require', 'require'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Allow, Require")
      end
    end
  end

  # Name:         ExternalAuthenticationMethods
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externalauthenticationmethods, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ExternalAuthenticationMethods"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ExternalUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_externalurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ExternalUrl"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstallIsapiFilter
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installisapifilter) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "InstallIsapiFilter"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         InternalAuthenticationMethods
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internalauthenticationmethods, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "InternalAuthenticationMethods"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         InternalUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internalurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InternalUrl"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MobileClientCertificateAuthorityURL
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mobileclientcertificateauthorityurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MobileClientCertificateAuthorityURL"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MobileClientCertificateProvisioningEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mobileclientcertificateprovisioningenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MobileClientCertificateProvisioningEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         MobileClientCertTemplateName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mobileclientcerttemplatename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MobileClientCertTemplateName"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RemoteDocumentsActionForUnknownServers
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Allow", "Block"]
  newparam(:dsc_remotedocumentsactionforunknownservers) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RemoteDocumentsActionForUnknownServers - Valid values are Allow, Block."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Allow', 'allow', 'Block', 'block'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Allow, Block")
      end
    end
  end

  # Name:         RemoteDocumentsAllowedServers
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_remotedocumentsallowedservers, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "RemoteDocumentsAllowedServers"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         RemoteDocumentsBlockedServers
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_remotedocumentsblockedservers, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "RemoteDocumentsBlockedServers"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         RemoteDocumentsInternalDomainSuffixList
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_remotedocumentsinternaldomainsuffixlist, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "RemoteDocumentsInternalDomainSuffixList"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         SendWatsonReport
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sendwatsonreport) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SendWatsonReport"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         WindowsAuthEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_windowsauthenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "WindowsAuthEnabled"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xexchactivesyncvirtualdirectory).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
