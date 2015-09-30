require 'pathname'

Puppet::Type.newtype(:dsc_xexchjetstress) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xExchJetstress resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xExchange/DSCResources/MSFT_xExchJetstress/MSFT_xExchJetstress.schema.mof
  }

  validate do
      fail('dsc_type is a required attribute') if self[:dsc_type].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xExchJetstress"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xExchJetstress"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xExchange"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.3.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

if Puppet.version >= '4.0.0'
  autonotify(:reboot) { ['dsc_reboot'] }
end

  # Name:         Type
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Performance", "Stress", "DatabaseBackup", "SoftRecovery"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Specifies the Type which was defined in the JetstressConfig.xml file. Valid values are Performance, Stress, DatabaseBackup, or SoftRecovery. Defaults to Performance."
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
    desc "The path to the folder where Jetstress is installed, and which contains JetstressCmd.exe"
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
    desc "Command line parameters to pass into JetstressCmd.exe"
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
    desc "The maximum amount of time that the Scheduled Task which runs Jetstress can execute for. Defaults to 0, which means there is no time limit."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         MinAchievedIOPS
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_minachievediops) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "The minimum value reported in the Achieved Transactional I/O per Second section of the Jetstress report for the run to be considered successful. Defaults to 0."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end


end

Puppet::Type.type(:dsc_xexchjetstress).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
