require 'pathname'

Puppet::Type.newtype(:dsc_xazurepackresourceprovider) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xAzurePackResourceProvider resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackResourceProvider/MSFT_xAzurePackResourceProvider.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xAzurePackResourceProvider"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xAzurePackResourceProvider"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xAzurePack"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.1.4.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         AuthenticationSite
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authenticationsite) do
    desc "URL of the authentication site."
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
    desc "Specifies the URI of the Windows Azure Pack administrator API."
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
    desc "Specifies the name of a resource provider."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AzurePackAdminCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_azurepackadmincredential) do
    desc "Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DisplayName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_displayname) do
    desc "Specifies the display name of a resource provider."
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
    desc "Enables the resource provider."
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
    desc "Indicates whether the resource provider supports API pass-through."
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
    desc "Specifies the URI of the Windows Azure Pack administrator API."
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
    desc "Indicates that the cmdlet allows multiple instances of the resource provider."
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
    desc "Specifies an administrative forwarding address for a resource provider."
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
    desc "Specifies the administrative authentication mode for a resource provider."
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
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adminauthenticationuser) do
    desc "Specifies, as a PSCredential object, an administrative user name and password to connect to a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AdminAuthenticationUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adminauthenticationusername) do
    desc "Output for the administrative user name."
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
    desc "Specifies the tenant forwarding address of a resource provider."
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
    desc "Specifies the tenant authentication mode for a resource provider."
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
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tenantauthenticationuser) do
    desc "Specifies, as a PSCredential object, a tenant user name and password to connect to a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TenantAuthenticationUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tenantauthenticationusername) do
    desc "Output for the tenant user name."
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
    desc "Specifies the tenant source URI template of a resource provider."
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
    desc "Specifies the tenant target URI template of a resource provider."
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
    desc "Specifies the tenant forwarding address of a resource provider."
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
    desc "Specifies the usage authentication mode for a resource provider."
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
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usageauthenticationuser) do
    desc "Specifies, as a PSCredential object, a usage user name and password to connect to a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UsageAuthenticationUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usageauthenticationusername) do
    desc "Output for the usage user name."
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
    desc "Specifies the health check forwarding address for a resource provider."
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
    desc "Specifies the health check authentication mode for a resource provider."
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
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_healthcheckauthenticationuser) do
    desc "Specifies, as a PSCredential object, a health check user name and password to connect to a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HealthCheckAuthenticationUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_healthcheckauthenticationusername) do
    desc "Output for the health check user name."
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
    desc "Specifies the notification forwarding address of a resource provider."
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
    desc "Specifies the notification authentication mode for a resource provider."
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
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_notificationauthenticationuser) do
    desc "Specifies, as a PSCredential object, a notification user name and password to connect to a resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         NotificationAuthenticationUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_notificationauthenticationusername) do
    desc "Output for the notification user name."
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
    desc "Specifies an ID for an instance of a resource provider."
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
    desc "Specifies a display name for an instance of a resource provider."
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
    desc "Specifies the number of subscriptions that can be updated in a single request."
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
    desc "Specifies the time interval at which the management service polls the resource provider for subscription status updates."
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
    desc "Specifies the type of the resource provider."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Standard', 'standard', 'UsageProvider', 'usageprovider', 'CloudServiceProvider', 'cloudserviceprovider'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Standard, UsageProvider, CloudServiceProvider")
      end
    end
  end


end
