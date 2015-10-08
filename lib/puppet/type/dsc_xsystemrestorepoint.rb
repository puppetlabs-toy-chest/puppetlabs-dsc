require 'pathname'

Puppet::Type.newtype(:dsc_xsystemrestorepoint) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSystemRestorePoint resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xWindowsRestore/DSCResources/xSystemRestorePoint/xSystemRestorePoint.schema.mof
  }

  validate do
      fail('dsc_description is a required attribute') if self[:dsc_description].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSystemRestorePoint"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "xSystemRestorePoint"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWindowsRestore"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Specifies a descriptive name for the restore point."
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
    desc "Specifies the type of restore point. The default is APPLICATION_INSTALL."
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
    desc "Indicates if the specified restore point created. Set this property to 'Absent' to ensure that the restore point does not exist. Set it to 'Present' to ensure that the restore point does exist. The default is 'Present'."
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


end

Puppet::Type.type(:dsc_xsystemrestorepoint).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
