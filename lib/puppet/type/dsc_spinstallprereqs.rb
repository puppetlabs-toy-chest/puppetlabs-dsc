require 'pathname'

Puppet::Type.newtype(:dsc_spinstallprereqs) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPInstallPrereqs resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPInstallPrereqs/MSFT_SPInstallPrereqs.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPInstallPrereqs' end
  def dscmeta_resource_name; 'MSFT_SPInstallPrereqs' end
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

  # Name:         InstallerPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_installerpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstallerPath - The full path to prerequisiteinstaller.exe"
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
    desc "OnlineMode - Should the installer download prerequisites from the internet or not"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SXSpath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sxspath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SXSpath - The path to the Windows Server Operating System SXS source files, for use in closed environments without access to Windows Update"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLNCli
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlncli) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLNCli - The path to the installer for this prerequisite"
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
    desc "PowerShell - The path to the installer for this prerequisite"
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
    desc "NETFX - The path to the installer for this prerequisite"
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
    desc "IDFX - The path to the installer for this prerequisite"
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
    desc "Sync - The path to the installer for this prerequisite"
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
    desc "AppFabric - The path to the installer for this prerequisite"
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
    desc "IDFX11 - The path to the installer for this prerequisite"
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
    desc "MSIPCClient - The path to the installer for this prerequisite"
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
    desc "WCFDataServices - The path to the installer for this prerequisite"
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
    desc "KB2671763 - The path to the installer for this prerequisite"
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
    desc "WCFDataServices56 - The path to the installer for this prerequisite"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MSVCRT11
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_msvcrt11) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MSVCRT11 - The path to the installer for this prerequisite"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         MSVCRT14
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_msvcrt14) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MSVCRT14 - The path to the installer for this prerequisite"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         KB3092423
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_kb3092423) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "KB3092423 - The path to the installer for this prerequisite"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ODBC
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_odbc) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ODBC - The path to the installer for this prerequisite"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DotNetFx
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dotnetfx) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DotNetFx - The path to the installer for this prerequisite"
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
    desc "Ensure - Present to install the prerequisites. Absent is currently not supported Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_spinstallprereqs).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
