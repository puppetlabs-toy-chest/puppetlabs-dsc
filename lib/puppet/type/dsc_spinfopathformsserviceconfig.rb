require 'pathname'

Puppet::Type.newtype(:dsc_spinfopathformsserviceconfig) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPInfoPathFormsServiceConfig resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPInfoPathFormsServiceConfig/MSFT_SPInfoPathFormsServiceConfig.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_ensure is a required attribute') if self[:dsc_ensure].nil?
    end

  def dscmeta_resource_friendly_name; 'SPInfoPathFormsServiceConfig' end
  def dscmeta_resource_name; 'MSFT_SPInfoPathFormsServiceConfig' end
  def dscmeta_module_name; 'SharePointDsc' end
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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Present ensures the settings are applied Valid values are Present, Absent."
    isrequired
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

  # Name:         AllowUserFormBrowserEnabling
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowuserformbrowserenabling) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowUserFormBrowserEnabling - True sets the InfoPath Forms Service to allow users to browse forms"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowUserFormBrowserRendering
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowuserformbrowserrendering) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowUserFormBrowserRendering - True sets the InfoPath Forms Service to render forms in the browser"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         MaxDataConnectionTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxdataconnectiontimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxDataConnectionTimeout - Sets the maximum connection timeout in milliseconds"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DefaultDataConnectionTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_defaultdataconnectiontimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DefaultDataConnectionTimeout - Sets the default connection timeout in milliseconds"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxDataConnectionResponseSize
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxdataconnectionresponsesize) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxDataConnectionResponseSize - Sets the maximum response size in kb for the user response"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RequireSslForDataConnections
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requiresslfordataconnections) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RequireSslForDataConnections - True sets the InfoPath Forms Service to require SSL for its connections"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowEmbeddedSqlForDataConnections
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowembeddedsqlfordataconnections) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowEmbeddedSqlForDataConnections - True sets the InfoPath Forms Service to allow embedded SQL sonnections in Forms"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowUdcAuthenticationForDataConnections
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowudcauthenticationfordataconnections) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowUdcAuthenticationForDataConnections - True sets the InfoPath Forms Service to allow User Defined connections"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowUserFormCrossDomainDataConnections
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowuserformcrossdomaindataconnections) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowUserFormCrossDomainDataConnections - True sets the InfoPath Forms Service to allow Cross-Domain connections"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         MaxPostbacksPerSession
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxpostbackspersession) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "MaxPostbacksPerSession - Maximum number of postback allowed per session"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxUserActionsPerPostback
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxuseractionsperpostback) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "MaxUserActionsPerPostback - Maximum number of actions that can be triggered per postback"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ActiveSessionsTimeout
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_activesessionstimeout) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "ActiveSessionsTimeout - Timeout in minutes for active sessions"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxSizeOfUserFormState
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxsizeofuserformstate) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "MaxSizeOfUserFormState - Maximum size of user session data"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsCredential if using PowerShell 5"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("InstallAccount", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spinfopathformsserviceconfig).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
