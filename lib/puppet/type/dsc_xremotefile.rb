begin
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
rescue LoadError => detail
  require 'pathname'
  lib_path = Pathname.new(__FILE__).dirname.parent.parent
  $:.unshift(lib_path)
  require 'puppet_x/msutter/providers/dsc_configuration_provider'
  require 'puppet_x/msutter/providers/dsc_mof_provider'
  require 'puppet_x/msutter/helpers/dsc_type_helpers'
end

Puppet::Type.newtype(:dsc_xremotefile) do

  include Puppet_x::Msutter::DscTypeHelpers

  provide :dsc_configuration do
    include Puppet_x::Msutter::DscConfigurationProvider
  end

  provide :dsc_mof do
    include Puppet_x::Msutter::DscMofProvider
  end

  @doc = %q{
    The DSC xRemoteFile resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resource_modules/dsc-resource-kit-wave-6/xPSDesiredStateConfiguration/DSCResources/MSFT_xRemoteFile/MSFT_xRemoteFile.schema.mof
  }

  validate do
      fail('dsc_destinationpath is a required attribute') if self[:dsc_destinationpath].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xRemoteFile"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xRemoteFile"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xPSDesiredStateConfiguration"
  end

  newparam(:dscmeta_module_version) do
    defaultto "3.0.2.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    defaultvalues
    defaultto :present
  end

  # Name:         DestinationPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_destinationpath) do
    desc "Path under which downloaded or copied file should be accessible after operation."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Uri
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_uri) do
    desc "Uri of a file which should be copied or downloaded. This parameter supports HTTP and HTTPS values."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UserAgent
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_useragent) do
    desc "User agent for the web request."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Headers
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_headers, :array_matching => :all) do
    desc "Headers of the web request."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
  end

  # Name:         Credential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    desc "Specifies a user account that has permission to send the request."
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
    desc "Says whether DestinationPath exists on the machine"
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
