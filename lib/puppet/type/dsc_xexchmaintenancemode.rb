require 'pathname'

Puppet::Type.newtype(:dsc_xexchmaintenancemode) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchMaintenanceMode resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchMaintenanceMode/MSFT_xExchMaintenanceMode.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_enabled is a required attribute') if self[:dsc_enabled].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xExchMaintenanceMode')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xExchMaintenanceMode'
    end

    defaultto 'xExchMaintenanceMode'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xExchMaintenanceMode')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xExchMaintenanceMode'
    end

    defaultto 'MSFT_xExchMaintenanceMode'
  end

  newparam(:dscmeta_import_resource) do
    desc "Please ignore this parameter.
      Defaults to `true`."
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xExchange')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xExchange'
    end

    defaultto 'xExchange'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.4.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '1.4.0.0'
    end

    defaultto '1.4.0.0'
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Enabled
  # Type:         boolean
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_enabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Enabled - Whether the server should be put into Maintenance Mode. When Enabled is set to True, the server will be put in Maintenance Mode. If False, the server will be taken out of Maintenance Mode."
    isrequired
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credential - Credentials used to establish a remote Powershell session to Exchange"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         AdditionalComponentsToActivate
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_additionalcomponentstoactivate, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "AdditionalComponentsToActivate - When taking a server out of Maintenance Mode, the following components will be set to Active by default: ServerWideOffline, UMCallRouter, HighAvailability, Monitoring, RecoveryActionsEnabled. This parameter specifies an additional list of components to set to Active."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DomainController - The DomainController parameter specifies the fully qualified domain name (FQDN) of the domain controller that writes this configuration change to Active Directory."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MovePreferredDatabasesBack
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_movepreferreddatabasesback) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "MovePreferredDatabasesBack - Whether to move back databases with an Activation Preference of one for this server after taking the server out of Maintenance Mode. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SetInactiveComponentsFromAnyRequesterToActive
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_setinactivecomponentsfromanyrequestertoactive) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SetInactiveComponentsFromAnyRequesterToActive - Whether components that were set to Inactive by outside Requesters should also be set to Active when exiting Maintenance Mode. Defaults to False."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         UpgradedServerVersion
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_upgradedserverversion) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UpgradedServerVersion - Optional string to specify what the server version will be after applying a Cumulative Update. If the server is already at this version, requests to put the server in Maintenance Mode will be ignored. Version should be in the format ##.#.####.#, as in 15.0.1104.5."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xexchmaintenancemode).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
