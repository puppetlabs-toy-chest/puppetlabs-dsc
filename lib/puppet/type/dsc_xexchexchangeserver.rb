require 'pathname'

Puppet::Type.newtype(:dsc_xexchexchangeserver) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchExchangeServer resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchExchangeServer/MSFT_xExchExchangeServer.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xExchExchangeServer' end
  def dscmeta_resource_name; 'MSFT_xExchExchangeServer' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.27.0.0' end

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
    desc "Identity - The Identity parameter specifies the GUID, distinguished name (DN), or name of the server."
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
    desc "Credential - Credentials used to establish a remote PowerShell session to Exchange."
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
    desc "AllowServiceRestart - Whether it is OK to restart the Information Store service after licensing the server. Defaults to $false."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         CustomerFeedbackEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_customerfeedbackenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "CustomerFeedbackEnabled - The CustomerFeedbackEnabled parameter specifies whether the Exchange server is enrolled in the Microsoft Customer Experience Improvement Program (CEIP). The CEIP collects anonymous information about how you use Exchange and problems that you might encounter. If you decide not to participate in the CEIP, the servers are opted-out automatically."
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
    desc "DomainController - The DomainController parameter specifies the domain controller that's used by this cmdlet to read data from or write data to Active Directory. You identify the domain controller by its fully qualified domain name (FQDN). For example, dc01.contoso.com."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ErrorReportingEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_errorreportingenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ErrorReportingEnabled - The ErrorReportingEnabled parameter specifies whether error reporting is enabled."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         InternetWebProxy
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internetwebproxy) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InternetWebProxy - The InternetWebProxy parameter specifies the web proxy server that the Exchange server uses to reach the internet. A valid value for this parameter is the URL of the web proxy server."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InternetWebProxyBypassList
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_internetwebproxybypasslist, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "InternetWebProxyBypassList - The InternetWebProxyBypassList parameter specifies a list of servers that bypass the web proxy server specified by the InternetWebProxy parameter. You identify the servers by their FQDN (for example, server01.contoso.com)."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         MonitoringGroup
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_monitoringgroup) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MonitoringGroup - The MonitoringGroup parameter specifies how to add your Exchange servers to monitoring groups. You can add your servers to an existing group or create a monitoring group based on location or deployment, or to partition monitoring responsibility among your servers."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProductKey
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_productkey) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProductKey - The ProductKey parameter specifies the server product key."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StaticConfigDomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_staticconfigdomaincontroller) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "StaticConfigDomainController - The StaticConfigDomainController parameter specifies whether to configure a domain controller to be used by the server via Directory Service Access (DSAccess)."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         StaticDomainControllers
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_staticdomaincontrollers, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "StaticDomainControllers - The StaticDomainControllers parameter specifies whether to configure a list of domain controllers to be used by the server via DSAccess."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         StaticExcludedDomainControllers
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_staticexcludeddomaincontrollers, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "StaticExcludedDomainControllers - The StaticExcludedDomainControllers parameter specifies whether to exclude a list of domain controllers from being used by the server."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         StaticGlobalCatalogs
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_staticglobalcatalogs, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "StaticGlobalCatalogs - The StaticGlobalCatalogs parameter specifies whether to configure a list of global catalogs to be used by the server via DSAccess."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         WorkloadManagementPolicy
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_workloadmanagementpolicy) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WorkloadManagementPolicy - The *-ResourcePolicy, *-WorkloadManagementPolicy and *-WorkloadPolicy system workload management cmdlets have been deprecated. System workload management settings should be customized only under the direction of Microsoft Customer Service and Support."
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

Puppet::Type.type(:dsc_xexchexchangeserver).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
