require 'pathname'

Puppet::Type.newtype(:dsc_xaddomaintrust) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xADDomainTrust resource type.
    Automatically generated from
    'xActiveDirectory/DSCResources/MSFT_xADDomainTrust/MSFT_xADDomainTrust.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_targetdomainname is a required attribute') if self[:dsc_targetdomainname].nil?
      fail('dsc_sourcedomainname is a required attribute') if self[:dsc_sourcedomainname].nil?
    end

  def dscmeta_resource_friendly_name; 'xADDomainTrust' end
  def dscmeta_resource_name; 'MSFT_xADDomainTrust' end
  def dscmeta_module_name; 'xActiveDirectory' end
  def dscmeta_module_version; '2.14.0.0' end

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

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Should this resource be present or absent Valid values are Present, Absent."
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
    desc "TargetDomainAdministratorCredential - Credentials to authenticate to the target domain"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("TargetDomainAdministratorCredential", value)
    end
  end

  # Name:         TargetDomainName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_targetdomainname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TargetDomainName - Name of the AD domain that is being trusted"
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
    desc "TrustType - Type of trust Valid values are External, Forest."
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
    desc "TrustDirection - Direction of trust Valid values are Bidirectional, Inbound, Outbound."
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
    desc "SourceDomainName - Name of the AD domain that is requesting the trust"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xaddomaintrust).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
