# workaround for cross modules dependencies
master_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', '..', 'dsc','lib'))
$:.push(master_path) if File.directory?(master_path)
require 'puppet/type/base_dsc'

Puppet::Type.newtype(:dsc_xaddomaintrust) do

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xADDomainTrust resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/dsc-resource-kit/xActiveDirectory/DSCResources/MSFT_xADDomainTrust/MSFT_xADDomainTrust.schema.mof
  }

  validate do
      fail('dsc_targetdomainname is a required attribute') if self[:dsc_targetdomainname].nil?
      fail('dsc_sourcedomainname is a required attribute') if self[:dsc_sourcedomainname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xADDomainTrust"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xADDomainTrust"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      value.to_s.downcase.to_bool
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xActiveDirectory"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto :present
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    desc "Should this resource be present or absent"
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

  # Name:         TargetDomainAdministratorCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_targetdomainadministratorcredential) do
    desc "Credentials to authenticate to the target domain"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TargetDomainName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_targetdomainname) do
    desc "Name of the AD domain that is being trusted"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TrustType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["External"]
  newparam(:dsc_trusttype) do
    desc "Type of trust"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['External', 'external'].include?(value)
        fail("Invalid value '#{value}'. Valid values are External")
      end
    end
  end

  # Name:         TrustDirection
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Bidirectional", "Inbound", "Outbound"]
  newparam(:dsc_trustdirection) do
    desc "Direction of trust"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Bidirectional', 'bidirectional', 'Inbound', 'inbound', 'Outbound', 'outbound'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Bidirectional, Inbound, Outbound")
      end
    end
  end

  # Name:         SourceDomainName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_sourcedomainname) do
    desc "Name of the AD domain that is requesting the trust"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
