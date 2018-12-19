require 'pathname'

Puppet::Type.newtype(:dsc_xclusterproperty) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xClusterProperty resource type.
    Automatically generated from
    'xFailOverCluster/DSCResources/MSFT_xClusterProperty/MSFT_xClusterProperty.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'xClusterProperty' end
  def dscmeta_resource_name; 'MSFT_xClusterProperty' end
  def dscmeta_module_name; 'xFailOverCluster' end
  def dscmeta_module_version; '1.10.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - Name of the cluster."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AddEvictDelay
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_addevictdelay) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "AddEvictDelay - Specifies how many seconds after a node is evicted that the failover cluster service will wait before adding a new node."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ClusterLogLevel
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_clusterloglevel) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ClusterLogLevel - Controls the level of cluster logging."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ClusterLogSize
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_clusterlogsize) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ClusterLogSize - Controls the maximum size of the cluster log files on each of the nodes."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         CrossSiteDelay
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_crosssitedelay) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "CrossSiteDelay - Controls the time interval, in milliseconds, that the cluster network driver waits between sending Cluster Service heartbeats across sites."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         CrossSiteThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_crosssitethreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "CrossSiteThreshold - Controls how many Cluster Service heartbeats can be missed across sites before it determines that Cluster Service has stopped responding."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         CrossSubnetDelay
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_crosssubnetdelay) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "CrossSubnetDelay - Controls the time interval, in milliseconds, that the cluster network driver waits between sending Cluster Service heartbeats across subnets."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         CrossSubnetThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_crosssubnetthreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "CrossSubnetThreshold - Controls how many Cluster Service heartbeats can be missed across subnets before it determines that Cluster Service has stopped responding."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DatabaseReadWriteMode
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasereadwritemode) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DatabaseReadWriteMode - Specifies the read/write mode for the cluster database."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DefaultNetworkRole
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_defaultnetworkrole) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DefaultNetworkRole - Specifies the role that the cluster automatically assigns to any newly discovered or created network."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Description - Stores administrative comments about the cluster. The following table summarizes the attributes of the Description property."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DrainOnShutdown
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_drainonshutdown) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DrainOnShutdown - Specifies whether to enable Node Drain for a cluster."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DynamicQuorum
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dynamicquorum) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DynamicQuorum - Enables the cluster to change the required number of nodes that need to participate in quorum when nodes shut down or crash."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NetftIPSecEnabled
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_netftipsecenabled) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "NetftIPSecEnabled - Specifies whether Internet Protocol Security (IPSec) encryption is enabled for inter-node cluster communication."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         PreferredSite
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_preferredsite) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PreferredSite - Specifies the preferred site for a site-aware cluster."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         QuarantineDuration
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_quarantineduration) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "QuarantineDuration - Specifies the quarantine duration for a node, in seconds."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         QuarantineThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_quarantinethreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "QuarantineThreshold - Specifies the quarantine threshold for a node, in minutes."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SameSubnetDelay
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_samesubnetdelay) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SameSubnetDelay - Controls the delay, in milliseconds, between netft heartbeats."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SameSubnetThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_samesubnetthreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SameSubnetThreshold - Controls how many heartbeats can be missed on the same subnet before the route is declared as unreachable."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ShutdownTimeoutInMinutes
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_shutdowntimeoutinminutes) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ShutdownTimeoutInMinutes - Specifies how many minutes after a system shutdown is initiated that the failover cluster service will wait for resources to go offline."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xclusterproperty).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
