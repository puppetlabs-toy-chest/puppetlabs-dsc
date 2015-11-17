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

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xExchJetstress')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xExchJetstress'
    end

    defaultto 'xExchJetstress'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xExchJetstress')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xExchJetstress'
    end

    defaultto 'MSFT_xExchJetstress'
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


end

Puppet::Type.type(:dsc_xexchjetstress).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
