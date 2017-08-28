require 'pathname'

Puppet::Type.newtype(:dsc_sppowerpointautomationserviceapp) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPPowerPointAutomationServiceApp resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPPowerPointAutomationServiceApp/MSFT_SPPowerPointAutomationServiceApp.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPPowerPointAutomationServiceApp' end
  def dscmeta_resource_name; 'MSFT_SPPowerPointAutomationServiceApp' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.8.0.0' end

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
    desc "Name - The name of the service application"
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
    desc "ProxyName - The name of the service application proxy"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
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
    desc "ApplicationPool - The name of the application pool to run the service app in"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CacheExpirationPeriodInSeconds
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_cacheexpirationperiodinseconds) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "CacheExpirationPeriodInSeconds - Specifies the maximum time, in seconds, that items remain in the back-end server cache. The default value is 600 seconds (10 minutes)."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaximumConversionsPerWorker
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maximumconversionsperworker) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaximumConversionsPerWorker - Specifies the maximum number of presentations that a conversion worker process can convert before recycling. The default value is 5."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         WorkerKeepAliveTimeoutInSeconds
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_workerkeepalivetimeoutinseconds) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "WorkerKeepAliveTimeoutInSeconds - Specifies the maximum time, in seconds, that a conversion worker process can be unresponsive before being terminated. The default value is 120 seconds."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         WorkerProcessCount
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_workerprocesscount) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "WorkerProcessCount - Specifies the number of active instances of the conversion worker process on each back-end. This value must be less than the Windows Communication Foundation (WCF) connection limit for this computer. The default value is 3."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         WorkerTimeoutInSeconds
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_workertimeoutinseconds) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "WorkerTimeoutInSeconds - Specifies the maximum time, in seconds, that a conversion worker process is given for any single conversion. The default is 300 seconds (5 minutes)."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Ensure the crawl rule is Present or Absent Valid values are Present, Absent."
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

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run thsi resource as, use PsDscRunAsCredential if using PowerShell 5"
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

Puppet::Type.type(:dsc_sppowerpointautomationserviceapp).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
