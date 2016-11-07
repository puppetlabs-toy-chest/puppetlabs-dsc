require 'pathname'

Puppet::Type.newtype(:dsc_spworkmanagementserviceapp) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPWorkManagementServiceApp resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPWorkManagementServiceApp/MSFT_SPWorkManagementServiceApp.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPWorkManagementServiceApp' end
  def dscmeta_resource_name; 'MSFT_SPWorkManagementServiceApp' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.4.0.0' end

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
    desc "Name - The name of the work management service application"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProxyName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_proxyname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProxyName - The proxy name, if not specified will be /Name of service app/ Proxy"
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
    desc "Ensure - Present to ensure the app exists, Absent to ensure it is removed Valid values are Present, Absent."
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

  # Name:         ApplicationPool
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applicationpool) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ApplicationPool - The name of the application pool this will run in"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MinimumTimeBetweenEwsSyncSubscriptionSearches
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minimumtimebetweenewssyncsubscriptionsearches) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MinimumTimeBetweenEwsSyncSubscriptionSearches - The minimum amount of time bween EWS sync subscription searches"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MinimumTimeBetweenProviderRefreshes
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minimumtimebetweenproviderrefreshes) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MinimumTimeBetweenProviderRefreshes - The minimum time between provider refreshes"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MinimumTimeBetweenSearchQueries
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minimumtimebetweensearchqueries) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MinimumTimeBetweenSearchQueries - The minimum time between search queries"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NumberOfSubscriptionSyncsPerEwsSyncRun
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_numberofsubscriptionsyncsperewssyncrun) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "NumberOfSubscriptionSyncsPerEwsSyncRun - The number of subscription syncronisations per EWS sync run"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NumberOfUsersEwsSyncWillProcessAtOnce
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_numberofusersewssyncwillprocessatonce) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "NumberOfUsersEwsSyncWillProcessAtOnce - How many users will EWS calls include at once"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NumberOfUsersPerEwsSyncBatch
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_numberofusersperewssyncbatch) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "NumberOfUsersPerEwsSyncBatch - How many users are included in a batch for EWS"
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
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spworkmanagementserviceapp).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
