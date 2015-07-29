# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_webdeploy) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC WebDeploy resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xWebAdministration/DSCResources/MSFT_xWebDeploy/MSFT_xWebdeploy.schema.mof
  }

  validate do
      fail('dsc_packagepath is a required attribute') if self[:dsc_packagepath].nil?
      fail('dsc_contentpath is a required attribute') if self[:dsc_contentpath].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "WebDeploy"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xWebdeploy"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWebAdministration"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.3.2"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto :present
  end

  # Name:         PackagePath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_packagepath) do
    desc "Path to Web Deploy package (zip format)."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ContentPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_contentpath) do
    desc "Path to Web Site (content path or site name)."
    isrequired
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
    desc "Desired state of resource."
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
