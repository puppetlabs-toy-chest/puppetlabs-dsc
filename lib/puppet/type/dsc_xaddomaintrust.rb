require 'pathname'

Puppet::Type.newtype(:dsc_xaddomaintrust) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xADDomainTrust resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADDomainTrust/MSFT_xADDomainTrust.schema.mof
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
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xActiveDirectory"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.5.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_targetdomainadministratorcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credentials to authenticate to the target domain"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
    end
  end

  # Name:         TargetDomainName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_targetdomainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
  # Values:       ["External", "Forest"]
  newparam(:dsc_trusttype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type of trust"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['External', 'external', 'Forest', 'forest'].include?(value)
        fail("Invalid value '#{value}'. Valid values are External, Forest")
      end
    end
  end

  # Name:         TrustDirection
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Bidirectional", "Inbound", "Outbound"]
  newparam(:dsc_trustdirection) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name of the AD domain that is requesting the trust"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
