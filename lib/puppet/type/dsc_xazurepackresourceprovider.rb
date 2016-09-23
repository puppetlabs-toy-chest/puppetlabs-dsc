require 'pathname'

Puppet::Type.newtype(:dsc_xazurepackresourceprovider) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xAzurePackResourceProvider resource type.
    Automatically generated from
    'xAzurePack/DSCResources/MSFT_xAzurePackResourceProvider/MSFT_xAzurePackResourceProvider.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xAzurePackResourceProvider' end
  def dscmeta_resource_name; 'MSFT_xAzurePackResourceProvider' end
  def dscmeta_module_name; 'xAzurePack' end
  def dscmeta_module_version; '1.4.0.0' end

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

  # Name:         AuthenticationSite
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authenticationsite) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AuthenticationSite - URL of the authentication site."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AdminUri
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adminuri) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AdminUri - Specifies the URI of the Windows Azure Pack administrator API."
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
    desc "Name - Specifies the name of a resource provider."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AzurePackAdminCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_azurepackadmincredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "AzurePackAdminCredential - Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("AzurePackAdminCredential", value)
    end
  end

  # Name:         DisplayName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_displayname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DisplayName - Specifies the display name of a resource provider."
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
    desc "Enabled - Enables the resource provider."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         PassthroughEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passthroughenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "PassthroughEnabled - Indicates whether the resource provider supports API pass-through."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowAnonymousAccess
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowanonymousaccess) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowAnonymousAccess - Specifies the URI of the Windows Azure Pack administrator API."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowMultipleInstances
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowmultipleinstances) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowMultipleInstances - Indicates that the cmdlet allows multiple instances of the resource provider."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AdminForwardingAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adminforwardingaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AdminForwardingAddress - Specifies an administrative forwarding address for a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AdminAuthenticationMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Basic", "Windows"]
  newparam(:dsc_adminauthenticationmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AdminAuthenticationMode - Specifies the administrative authentication mode for a resource provider. Valid values are None, Basic, Windows."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Basic', 'basic', 'Windows', 'windows'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Basic, Windows")
      end
    end
  end

  # Name:         AdminAuthenticationUser
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adminauthenticationuser) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "AdminAuthenticationUser - Specifies, as a PSCredential object, an administrative user name and password to connect to a resource provider."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("AdminAuthenticationUser", value)
    end
  end

  # Name:         AdminAuthenticationUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adminauthenticationusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AdminAuthenticationUsername - Output for the administrative user name."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TenantForwardingAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tenantforwardingaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TenantForwardingAddress - Specifies the tenant forwarding address of a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TenantAuthenticationMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Basic", "Windows"]
  newparam(:dsc_tenantauthenticationmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TenantAuthenticationMode - Specifies the tenant authentication mode for a resource provider. Valid values are None, Basic, Windows."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Basic', 'basic', 'Windows', 'windows'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Basic, Windows")
      end
    end
  end

  # Name:         TenantAuthenticationUser
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tenantauthenticationuser) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "TenantAuthenticationUser - Specifies, as a PSCredential object, a tenant user name and password to connect to a resource provider."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("TenantAuthenticationUser", value)
    end
  end

  # Name:         TenantAuthenticationUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tenantauthenticationusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TenantAuthenticationUsername - Output for the tenant user name."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TenantSourceUriTemplate
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tenantsourceuritemplate) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TenantSourceUriTemplate - Specifies the tenant source URI template of a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TenantTargetUriTemplate
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tenanttargeturitemplate) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TenantTargetUriTemplate - Specifies the tenant target URI template of a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UsageForwardingAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usageforwardingaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UsageForwardingAddress - Specifies the tenant forwarding address of a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UsageAuthenticationMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Basic", "Windows"]
  newparam(:dsc_usageauthenticationmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UsageAuthenticationMode - Specifies the usage authentication mode for a resource provider. Valid values are None, Basic, Windows."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Basic', 'basic', 'Windows', 'windows'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Basic, Windows")
      end
    end
  end

  # Name:         UsageAuthenticationUser
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usageauthenticationuser) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "UsageAuthenticationUser - Specifies, as a PSCredential object, a usage user name and password to connect to a resource provider."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("UsageAuthenticationUser", value)
    end
  end

  # Name:         UsageAuthenticationUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usageauthenticationusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UsageAuthenticationUsername - Output for the usage user name."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HealthCheckForwardingAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_healthcheckforwardingaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "HealthCheckForwardingAddress - Specifies the health check forwarding address for a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HealthCheckAuthenticationMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Basic", "Windows"]
  newparam(:dsc_healthcheckauthenticationmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "HealthCheckAuthenticationMode - Specifies the health check authentication mode for a resource provider. Valid values are None, Basic, Windows."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Basic', 'basic', 'Windows', 'windows'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Basic, Windows")
      end
    end
  end

  # Name:         HealthCheckAuthenticationUser
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_healthcheckauthenticationuser) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "HealthCheckAuthenticationUser - Specifies, as a PSCredential object, a health check user name and password to connect to a resource provider."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("HealthCheckAuthenticationUser", value)
    end
  end

  # Name:         HealthCheckAuthenticationUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_healthcheckauthenticationusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "HealthCheckAuthenticationUsername - Output for the health check user name."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         NotificationForwardingAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_notificationforwardingaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NotificationForwardingAddress - Specifies the notification forwarding address of a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         NotificationAuthenticationMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "Basic", "Windows"]
  newparam(:dsc_notificationauthenticationmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NotificationAuthenticationMode - Specifies the notification authentication mode for a resource provider. Valid values are None, Basic, Windows."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'Basic', 'basic', 'Windows', 'windows'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, Basic, Windows")
      end
    end
  end

  # Name:         NotificationAuthenticationUser
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_notificationauthenticationuser) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "NotificationAuthenticationUser - Specifies, as a PSCredential object, a notification user name and password to connect to a resource provider."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("NotificationAuthenticationUser", value)
    end
  end

  # Name:         NotificationAuthenticationUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_notificationauthenticationusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NotificationAuthenticationUsername - Output for the notification user name."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstanceId
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_instanceid) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceId - Specifies an ID for an instance of a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstanceDisplayName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_instancedisplayname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceDisplayName - Specifies a display name for an instance of a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxQuotaUpdateBatchSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxquotaupdatebatchsize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MaxQuotaUpdateBatchSize - Specifies the number of subscriptions that can be updated in a single request."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SubscriptionStatusPollingInterval
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_subscriptionstatuspollinginterval) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SubscriptionStatusPollingInterval - Specifies the time interval at which the management service polls the resource provider for subscription status updates."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Type
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Standard", "UsageProvider", "CloudServiceProvider"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - Specifies the type of the resource provider. Valid values are Standard, UsageProvider, CloudServiceProvider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Standard', 'standard', 'UsageProvider', 'usageprovider', 'CloudServiceProvider', 'cloudserviceprovider'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Standard, UsageProvider, CloudServiceProvider")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xazurepackresourceprovider).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
