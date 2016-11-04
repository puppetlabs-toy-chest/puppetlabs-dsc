require 'pathname'

Puppet::Type.newtype(:dsc_xexchjetstress) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchJetstress resource type.
    Automatically generated from
    'xExchange/DSCResources/MSFT_xExchJetstress/MSFT_xExchJetstress.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_type is a required attribute') if self[:dsc_type].nil?
    end

  def dscmeta_resource_friendly_name; 'xExchJetstress' end
  def dscmeta_resource_name; 'MSFT_xExchJetstress' end
  def dscmeta_module_name; 'xExchange' end
  def dscmeta_module_version; '1.11.0.0' end

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

  # Name:         Type
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Performance", "Stress", "DatabaseBackup", "SoftRecovery"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - Specifies the Type which was defined in the JetstressConfig.xml file. Valid values are Performance, Stress, DatabaseBackup, or SoftRecovery. Defaults to Performance. Valid values are Performance, Stress, DatabaseBackup, SoftRecovery."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Performance', 'performance', 'Stress', 'stress', 'DatabaseBackup', 'databasebackup', 'SoftRecovery', 'softrecovery'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Performance, Stress, DatabaseBackup, SoftRecovery")
      end
    end
  end

  # Name:         JetstressPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_jetstresspath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "JetstressPath - The path to the folder where Jetstress is installed, and which contains JetstressCmd.exe"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         JetstressParams
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_jetstressparams) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "JetstressParams - Command line parameters to pass into JetstressCmd.exe"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MaxWaitMinutes
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxwaitminutes) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxWaitMinutes - The maximum amount of time that the Scheduled Task which runs Jetstress can execute for. Defaults to 0, which means there is no time limit."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MinAchievedIOPS
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minachievediops) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MinAchievedIOPS - The minimum value reported in the Achieved Transactional I/O per Second section of the Jetstress report for the run to be considered successful. Defaults to 0."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xexchjetstress).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
