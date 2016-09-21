require 'pathname'

Puppet::Type.newtype(:dsc_xsystemrestorepoint) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSystemRestorePoint resource type.
    Automatically generated from
    'xWindowsRestore/DSCResources/xSystemRestorePoint/xSystemRestorePoint.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_description is a required attribute') if self[:dsc_description].nil?
    end

  def dscmeta_resource_friendly_name; 'xSystemRestorePoint' end
  def dscmeta_resource_name; 'xSystemRestorePoint' end
  def dscmeta_module_name; 'xWindowsRestore' end
  def dscmeta_module_version; '1.0.0' end

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

  # Name:         Description
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - Specifies a descriptive name for the restore point."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RestorePointType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["APPLICATION_INSTALL", "APPLICATION_UNINSTALL", "DEVICE_DRIVER_INSTALL", "MODIFY_SETTINGS", "CANCELLED_OPERATION"]
  newparam(:dsc_restorepointtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "RestorePointType - Specifies the type of restore point. The default is APPLICATION_INSTALL. Valid values are APPLICATION_INSTALL, APPLICATION_UNINSTALL, DEVICE_DRIVER_INSTALL, MODIFY_SETTINGS, CANCELLED_OPERATION."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['APPLICATION_INSTALL', 'application_install', 'APPLICATION_UNINSTALL', 'application_uninstall', 'DEVICE_DRIVER_INSTALL', 'device_driver_install', 'MODIFY_SETTINGS', 'modify_settings', 'CANCELLED_OPERATION', 'cancelled_operation'].include?(value)
        fail("Invalid value '#{value}'. Valid values are APPLICATION_INSTALL, APPLICATION_UNINSTALL, DEVICE_DRIVER_INSTALL, MODIFY_SETTINGS, CANCELLED_OPERATION")
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
    desc "Ensure - Indicates if the specified restore point created. Set this property to 'Absent' to ensure that the restore point does not exist. Set it to 'Present' to ensure that the restore point does exist. The default is 'Present'. Valid values are Present, Absent."
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

Puppet::Type.type(:dsc_xsystemrestorepoint).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
