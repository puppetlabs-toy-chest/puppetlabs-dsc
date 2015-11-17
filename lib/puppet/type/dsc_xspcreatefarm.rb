require 'pathname'

Puppet::Type.newtype(:dsc_xspcreatefarm) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSPCreateFarm resource type.
    Automatically generated from
    'xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPCreateFarm/MSFT_xSPCreateFarm.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_farmconfigdatabasename is a required attribute') if self[:dsc_farmconfigdatabasename].nil?
      fail('dsc_databaseserver is a required attribute') if self[:dsc_databaseserver].nil?
    end

  newproperty(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xSPCreateFarm')."

    def retrieve
      'xSPCreateFarm'
    end

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only'
    end
  end

  newproperty(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xSPCreateFarm')."

    def retrieve
      'MSFT_xSPCreateFarm'
    end

    validate do |value|
      fail 'dscmeta_resource_name is read-only'
    end
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

  newproperty(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xSharePoint')."

    def retrieve
      'xSharePoint'
    end

    validate do |value|
      fail 'dscmeta_module_name is read-only'
    end
  end

  newproperty(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('0.7.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    def retrieve
      '0.7.0.0'
    end

    validate do |value|
      fail 'dscmeta_module_version is read-only'
    end
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         FarmConfigDatabaseName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_farmconfigdatabasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "FarmConfigDatabaseName"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseServer
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_databaseserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseServer"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FarmAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_farmaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "FarmAccount"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("FarmAccount", value)
    end
  end

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("InstallAccount", value)
    end
  end

  # Name:         Passphrase
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_passphrase) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Passphrase"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AdminContentDatabaseName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_admincontentdatabasename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AdminContentDatabaseName"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CentralAdministrationPort
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_centraladministrationport) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "CentralAdministrationPort"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ServerRole
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Application", "Custom", "DistributedCache", "Search", "SingleServer", "SingleServerFarm", "SpecialLoad", "WebFrontEnd"]
  newparam(:dsc_serverrole) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerRole - Valid values are Application, Custom, DistributedCache, Search, SingleServer, SingleServerFarm, SpecialLoad, WebFrontEnd."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Application', 'application', 'Custom', 'custom', 'DistributedCache', 'distributedcache', 'Search', 'search', 'SingleServer', 'singleserver', 'SingleServerFarm', 'singleserverfarm', 'SpecialLoad', 'specialload', 'WebFrontEnd', 'webfrontend'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Application, Custom, DistributedCache, Search, SingleServer, SingleServerFarm, SpecialLoad, WebFrontEnd")
      end
    end
  end


end

Puppet::Type.type(:dsc_xspcreatefarm).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
