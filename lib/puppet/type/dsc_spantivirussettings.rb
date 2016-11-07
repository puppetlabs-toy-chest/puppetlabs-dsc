require 'pathname'

Puppet::Type.newtype(:dsc_spantivirussettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPAntivirusSettings resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPAntivirusSettings/MSFT_SPAntivirusSettings.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_scanondownload is a required attribute') if self[:dsc_scanondownload].nil?
    end

  def dscmeta_resource_friendly_name; 'SPAntivirusSettings' end
  def dscmeta_resource_name; 'MSFT_SPAntivirusSettings' end
  def dscmeta_module_name; 'SharePointDsc' end
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

  # Name:         ScanOnDownload
  # Type:         boolean
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_scanondownload) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ScanOnDownload - Should documents be scanned before being downloaded"
    isrequired
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ScanOnUpload
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scanonupload) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ScanOnUpload - Should documents be scanned on upload"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowDownloadInfected
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowdownloadinfected) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowDownloadInfected - Should documents that are infected be allowed to be downloaded"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AttemptToClean
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_attempttoclean) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AttemptToClean - Should infected documents be handed to the AV engine to attempt cleaning"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         TimeoutDuration
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_timeoutduration) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "TimeoutDuration - What is the timeout for an AV scan in seconds"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NumberOfThreads
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_numberofthreads) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "NumberOfThreads - How many concurrent threads should the AV engine be able to run on a server"
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

Puppet::Type.type(:dsc_spantivirussettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
