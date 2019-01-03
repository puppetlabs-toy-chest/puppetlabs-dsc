require 'pathname'

Puppet::Type.newtype(:dsc_xdnsserversetting) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xDnsServerSetting resource type.
    Automatically generated from
    'xDnsServer/DSCResources/MSFT_xDnsServerSetting/MSFT_xDnsServerSetting.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xDnsServerSetting' end
  def dscmeta_resource_name; 'MSFT_xDnsServerSetting' end
  def dscmeta_module_name; 'xDnsServer' end
  def dscmeta_module_version; '1.9.0.0' end

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
    desc "Name - Key for the resource.  It doesn't matter what it is as long as it's unique within the configuration."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AddressAnswerLimit
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_addressanswerlimit) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "AddressAnswerLimit - Maximum number of host records returned in response to an address request. Values between 5 and 28 are valid."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         AllowUpdate
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowupdate) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "AllowUpdate - Specifies whether the DNS Server accepts dynamic update requests."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         AutoCacheUpdate
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autocacheupdate) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AutoCacheUpdate - Indicates whether the DNS Server attempts to update its cache entries using data from root servers."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AutoConfigFileZones
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_autoconfigfilezones) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "AutoConfigFileZones - Indicates which standard primary zones that are authoritative for the name of the DNS Server must be updated when the name server changes."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         BindSecondaries
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_bindsecondaries) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "BindSecondaries - Determines the AXFR message format when sending to non-Microsoft DNS Server secondaries"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BootMethod
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_bootmethod) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "BootMethod - Initialization method for the DNS Server."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DefaultAgingState
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_defaultagingstate) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DefaultAgingState - Default ScavengingInterval value set for all Active Directory-integrated zones created on this DNS Server."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DefaultNoRefreshInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_defaultnorefreshinterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DefaultNoRefreshInterval - No-refresh interval, in hours, set for all Active Directory-integrated zones created on this DNS Server."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DefaultRefreshInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_defaultrefreshinterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DefaultRefreshInterval - Refresh interval, in hours, set for all Active Directory-integrated zones created on this DNS Server."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DisableAutoReverseZones
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disableautoreversezones) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisableAutoReverseZones - Indicates whether the DNS Server automatically creates standard reverse look up zones."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DisjointNets
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_disjointnets) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "DisjointNets - Indicates whether the default port binding for a socket used to send queries to remote DNS Servers can be overridden."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         DsPollingInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dspollinginterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DsPollingInterval - Interval, in seconds, to poll the DS-integrated zones."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         DsTombstoneInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_dstombstoneinterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "DsTombstoneInterval - Lifetime of tombstoned records in Directory Service integrated zones, expressed in seconds."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EDnsCacheTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ednscachetimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EDnsCacheTimeout - Lifetime, in seconds, of the cached information describing the EDNS version supported by other DNS Servers."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EnableDirectoryPartitions
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enabledirectorypartitions) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableDirectoryPartitions - Specifies whether support for application directory partitions is enabled on the DNS Server."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EnableDnsSec
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enablednssec) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EnableDnsSec - Specifies whether the DNS Server includes DNSSEC-specific RRs, KEY, SIG, and NXT in a response."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EnableEDnsProbes
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enableednsprobes) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableEDnsProbes - Specifies the behavior of the DNS Server. When TRUE, the DNS Server always responds with OPT resource records according to RFC 2671, unless the remote server has indicated it does not support EDNS in a prior exchange. If FALSE, the DNS Server responds to queries with OPTs only if OPTs are sent in the original query."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EventLogLevel
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_eventloglevel) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "EventLogLevel - Indicates which events the DNS Server records in the Event Viewer system log."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ForwardDelegations
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forwarddelegations) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ForwardDelegations - Specifies whether queries to delegated sub-zones are forwarded."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Forwarders
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forwarders, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Forwarders - Enumerates the list of IP addresses of Forwarders to which the DNS Server forwards queries."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ForwardingTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_forwardingtimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ForwardingTimeout - Time, in seconds, a DNS Server forwarding a query will wait for resolution from the forwarder before attempting to resolve the query itself."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         IsSlave
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isslave) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsSlave - TRUE if the DNS server does not use recursion when name-resolution through forwarders fails."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ListenAddresses
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_listenaddresses, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ListenAddresses - Enumerates the list of IP addresses on which the DNS Server can receive queries."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         LocalNetPriority
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_localnetpriority) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LocalNetPriority - Indicates whether the DNS Server gives priority to the local net address when returning A records."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LogFileMaxSize
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logfilemaxsize) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "LogFileMaxSize - Size of the DNS Server debug log, in bytes."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LogFilePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logfilepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogFilePath - File name and path for the DNS Server debug log."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogIPFilterList
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logipfilterlist, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "LogIPFilterList - List of IP addresses used to filter DNS events written to the debug log."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         LogLevel
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_loglevel) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "LogLevel - Indicates which policies are activated in the Event Viewer system log."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LooseWildcarding
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_loosewildcarding) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LooseWildcarding - Indicates whether the DNS Server performs loose wildcarding."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         MaxCacheTTL
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxcachettl) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxCacheTTL - Maximum time, in seconds, the record of a recursive name query may remain in the DNS Server cache."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxNegativeCacheTTL
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxnegativecachettl) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxNegativeCacheTTL - Maximum time, in seconds, a name error result from a recursive query may remain in the DNS Server cache."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NameCheckFlag
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_namecheckflag) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "NameCheckFlag - Indicates the set of eligible characters to be used in DNS names."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         NoRecursion
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_norecursion) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "NoRecursion - Indicates whether the DNS Server performs recursive look ups. TRUE indicates recursive look ups are not performed."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RecursionRetry
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recursionretry) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RecursionRetry - Elapsed seconds before retrying a recursive look up."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RecursionTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_recursiontimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RecursionTimeout - Elapsed seconds before the DNS Server gives up recursive query."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RoundRobin
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_roundrobin) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RoundRobin - Indicates whether the DNS Server round robins multiple A records."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RpcProtocol
  # Type:         sint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_rpcprotocol) do
    def mof_type; 'sint16' end
    def mof_is_embedded?; false end
    desc "RpcProtocol - RPC protocol or protocols over which administrative RPC runs."
    validate do |value|
      unless value.kind_of?(Numeric) || value.to_i.to_s == value
          fail("Invalid value #{value}. Should be a signed Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ScavengingInterval
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scavenginginterval) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ScavengingInterval - Interval, in hours, between two consecutive scavenging operations performed by the DNS Server."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         SecureResponses
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_secureresponses) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "SecureResponses - Indicates whether the DNS Server exclusively saves records of names in the same subtree as the server that provided them."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         SendPort
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sendport) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "SendPort - Port on which the DNS Server sends UDP queries to other servers."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         StrictFileParsing
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_strictfileparsing) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "StrictFileParsing - Indicates whether the DNS Server parses zone files strictly."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         UpdateOptions
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_updateoptions) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "UpdateOptions - Restricts the type of records that can be dynamically updated on the server, used in addition to the AllowUpdate settings on Server and Zone objects."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         WriteAuthorityNS
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_writeauthorityns) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "WriteAuthorityNS - Specifies whether the DNS Server writes NS and SOA records to the authority section on successful response."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         XfrConnectTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_xfrconnecttimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "XfrConnectTimeout - Time, in seconds, the DNS Server waits for a successful TCP connection to a remote server when attempting a zone transfer."
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

Puppet::Type.type(:dsc_xdnsserversetting).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
