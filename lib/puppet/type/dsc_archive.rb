require 'pathname'

Puppet::Type.newtype(:dsc_archive) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC Archive resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/PSDesiredStateConfiguration/DSCResources/MSFT_ArchiveResource/MSFT_ArchiveResource.schema.mof
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
      fail('dsc_destination is a required attribute') if self[:dsc_destination].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "Archive"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_ArchiveResource"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "PSDesiredStateConfiguration"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

if Puppet.version >= '4.0.0'
  autonotify(:reboot) { ['dsc_reboot'] }
end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Destination
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_destination) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Validate
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_validate) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Checksum
  # Type:         string
  # IsMandatory:  False
  # Values:       ["SHA-1", "SHA-256", "SHA-512", "CreatedDate", "ModifiedDate"]
  newparam(:dsc_checksum) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['SHA-1', 'sha-1', 'SHA-256', 'sha-256', 'SHA-512', 'sha-512', 'CreatedDate', 'createddate', 'ModifiedDate', 'modifieddate'].include?(value)
        fail("Invalid value '#{value}'. Valid values are SHA-1, SHA-256, SHA-512, CreatedDate, ModifiedDate")
      end
    end
  end

  # Name:         Force
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_force) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end


end

Puppet::Type.type(:dsc_archive).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
