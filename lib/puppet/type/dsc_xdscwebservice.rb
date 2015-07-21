# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_xdscwebservice) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  provide :mof, :parent => Puppet::Type.type(:base_dsc).provider(:mof)

  @doc = %q{
    The DSC xDSCWebService resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xPSDesiredStateConfiguration/DSCResources/MSFT_xDSCWebService/MSFT_xDSCWebService.Schema.mof
  }

  validate do
      fail('dsc_endpointname is a required attribute') if self[:dsc_endpointname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xDSCWebService"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xDSCWebService"
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
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto :present
  end

  # Name:         EndpointName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_endpointname) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CertificateThumbPrint
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_certificatethumbprint) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Port
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_port) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         PhysicalPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_physicalpath) do
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

  # Name:         State
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Started", "Stopped"]
  newparam(:dsc_state) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Started', 'started', 'Stopped', 'stopped'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Started, Stopped")
      end
    end
  end

  # Name:         ModulePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_modulepath) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConfigurationPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_configurationpath) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IsComplianceServer
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_iscomplianceserver) do
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      value.to_s.downcase.to_bool
    end
  end

  # Name:         DSCServerUrl
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dscserverurl) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
