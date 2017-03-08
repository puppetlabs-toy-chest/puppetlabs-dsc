require 'pathname'

Puppet::Type.newtype(:dsc_spproductupdate) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPProductUpdate resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPProductUpdate/MSFT_SPProductUpdate.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_setupfile is a required attribute') if self[:dsc_setupfile].nil?
    end

  def dscmeta_resource_friendly_name; 'SPProductUpdate' end
  def dscmeta_resource_name; 'MSFT_SPProductUpdate' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.5.0.0' end

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

  # Name:         SetupFile
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_setupfile) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SetupFile - The name of the update setup file"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ShutdownServices
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_shutdownservices) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ShutdownServices - Shutdown SharePoint services to speed up installation"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BinaryInstallDays
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["mon", "tue", "wed", "thu", "fri", "sat", "sun"]
  newparam(:dsc_binaryinstalldays, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "BinaryInstallDays - Specify on which dates the installation is allowed Valid values are mon, tue, wed, thu, fri, sat, sun."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['mon', 'mon', 'tue', 'tue', 'wed', 'wed', 'thu', 'thu', 'fri', 'fri', 'sat', 'sat', 'sun', 'sun'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are mon, tue, wed, thu, fri, sat, sun")
        end
      end
      if value.kind_of?(String)
        unless ['mon', 'mon', 'tue', 'tue', 'wed', 'wed', 'thu', 'thu', 'fri', 'fri', 'sat', 'sat', 'sun', 'sun'].include?(value)
          fail("Invalid value #{value}. Valid values are mon, tue, wed, thu, fri, sat, sun")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         BinaryInstallTime
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_binaryinstalltime) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "BinaryInstallTime - Specify in which time frame the installation is allowed"
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
    desc "Ensure - Present to install SharePoint. Absent is currently not supported Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_spproductupdate).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
