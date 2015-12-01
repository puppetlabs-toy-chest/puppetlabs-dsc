require 'pathname'

Puppet::Type.newtype(:dsc_xspinstallprereqs) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSPInstallPrereqs resource type.
    Automatically generated from
    'xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPInstallPrereqs/MSFT_xSPInstallPrereqs.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_installerpath is a required attribute') if self[:dsc_installerpath].nil?
    end

  def dscmeta_resource_friendly_name; 'xSPInstallPrereqs' end
  def dscmeta_resource_name; 'MSFT_xSPInstallPrereqs' end
  def dscmeta_module_name; 'xSharePoint' end
  def dscmeta_module_version; '0.7.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         InstallerPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_installerpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstallerPath"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         OnlineMode
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_onlinemode) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "OnlineMode"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SQLNCli
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlncli) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLNCli"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PowerShell
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_powershell) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PowerShell"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         NETFX
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_netfx) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NETFX"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IDFX
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_idfx) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IDFX"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Sync
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sync) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Sync"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AppFabric
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_appfabric) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AppFabric"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IDFX11
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_idfx11) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "IDFX11"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MSIPCClient
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_msipcclient) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MSIPCClient"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WCFDataServices
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_wcfdataservices) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WCFDataServices"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         KB2671763
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_kb2671763) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "KB2671763"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WCFDataServices56
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_wcfdataservices56) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WCFDataServices56"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         KB2898850
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_kb2898850) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "KB2898850"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MSVCRT12
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_msvcrt12) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MSVCRT12"
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
    desc "Ensure - Valid values are Present, Absent."
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


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xspinstallprereqs).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
