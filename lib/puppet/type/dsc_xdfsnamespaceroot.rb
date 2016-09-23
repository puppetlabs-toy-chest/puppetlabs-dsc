require 'pathname'

Puppet::Type.newtype(:dsc_xdfsnamespaceroot) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDFSNamespaceRoot resource type.
    Automatically generated from
    'xDFS/DSCResources/MSFT_xDFSNamespaceRoot/MSFT_xDFSNamespaceRoot.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_path is a required attribute') if self[:dsc_path].nil?
      fail('dsc_targetpath is a required attribute') if self[:dsc_targetpath].nil?
    end

  def dscmeta_resource_friendly_name; 'xDFSNamespaceRoot' end
  def dscmeta_resource_name; 'MSFT_xDFSNamespaceRoot' end
  def dscmeta_module_name; 'xDFS' end
  def dscmeta_module_version; '3.1.0.0' end

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

  # Name:         Path
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_path) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Path - Specifies a path for the root of a DFS namespace."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TargetPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_targetpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TargetPath - Specifies a path for a root target of the DFS namespace."
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
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Specifies if the DFS Namespace root should exist. Valid values are Present, Absent."
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

  # Name:         Type
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Standalone", "DomainV1", "DomainV2"]
  newparam(:dsc_type) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Type - Specifies the type of a DFS namespace as a Type object. Valid values are Standalone, DomainV1, DomainV2."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Standalone', 'standalone', 'DomainV1', 'domainv1', 'DomainV2', 'domainv2'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Standalone, DomainV1, DomainV2")
      end
    end
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - The description of the DFS Namespace."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         EnableSiteCosting
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enablesitecosting) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableSiteCosting - Indicates whether a DFS namespace uses cost-based selection."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EnableInsiteReferrals
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableinsitereferrals) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableInsiteReferrals - Indicates whether a DFS namespace server provides a client only with referrals that are in the same site as the client."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EnableAccessBasedEnumeration
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableaccessbasedenumeration) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableAccessBasedEnumeration - Indicates whether a DFS namespace uses access-based enumeration."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EnableRootScalability
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enablerootscalability) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableRootScalability - Indicates whether a DFS namespace uses root scalability mode."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EnableTargetFailback
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enabletargetfailback) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableTargetFailback - Indicates whether a DFS namespace uses target failback."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ReferralPriorityClass
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Global-High", "SiteCost-High", "SiteCost-Normal", "SiteCost-Low", "Global-Low"]
  newparam(:dsc_referralpriorityclass) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReferralPriorityClass - Specifies the target priority class for a DFS namespace root. Valid values are Global-High, SiteCost-High, SiteCost-Normal, SiteCost-Low, Global-Low."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Global-High', 'global-high', 'SiteCost-High', 'sitecost-high', 'SiteCost-Normal', 'sitecost-normal', 'SiteCost-Low', 'sitecost-low', 'Global-Low', 'global-low'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Global-High, SiteCost-High, SiteCost-Normal, SiteCost-Low, Global-Low")
      end
    end
  end

  # Name:         ReferralPriorityRank
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_referralpriorityrank) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ReferralPriorityRank - Specifies the priority rank, as an integer, for a root target of the DFS namespace."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         TimeToLiveSec
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_timetolivesec) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "TimeToLiveSec - Specifies a TTL interval, in seconds, for referrals."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         State
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_state) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "State"
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

Puppet::Type.type(:dsc_xdfsnamespaceroot).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
