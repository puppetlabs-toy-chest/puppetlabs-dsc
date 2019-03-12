require 'pathname'

Puppet::Type.newtype(:dsc_spwebappclientcallablesettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_SPProxyLibraryEntry(mof_type_map, name, value)
        required = ['assemblyname']
        allowed = ['supportappauthentication']
        lowkey_hash = Hash[value.map { |k, v| [k.to_s.downcase, v] }]

        missing = required - lowkey_hash.keys
        unless missing.empty?
          fail "#{name} is missing the following required keys: #{missing.join(',')}"
        end

        extraneous = lowkey_hash.keys - required - allowed
        unless extraneous.empty?
          fail "#{name} includes invalid keys: #{extraneous.join(',')}"
        end

        lowkey_hash.keys.each do |key|
          if lowkey_hash[key]
            validate_mof_type(mof_type_map[key], 'MSFT_SPProxyLibraryEntry', key, lowkey_hash[key])
          end
        end
      end
    end

  @doc = %q{
    The DSC SPWebAppClientCallableSettings resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPWebAppClientCallableSettings/MSFT_SPWebAppClientCallableSettings.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_webappurl is a required attribute') if self[:dsc_webappurl].nil?
    end

  def dscmeta_resource_friendly_name; 'SPWebAppClientCallableSettings' end
  def dscmeta_resource_name; 'MSFT_SPWebAppClientCallableSettings' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '3.2.0.0' end

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

  # Name:         WebAppUrl
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_webappurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WebAppUrl - The URL of the web application to set blocked file types for"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProxyLibraries
  # Type:         MSFT_SPProxyLibraryEntry[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_proxylibraries, :array_matching => :all) do
    def mof_type; 'MSFT_SPProxyLibraryEntry[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"assemblyname"=>{:type=>"string"}, "supportappauthentication"=>{:type=>"boolean"}}
    end
    desc "ProxyLibraries - A list of proxy libraries to set. Those not in this list will be removed"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "ProxyLibraries value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_SPProxyLibraryEntry(mof_type_map, "ProxyLibraries", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
    end
  end

  # Name:         ProxyLibrariesToInclude
  # Type:         MSFT_SPProxyLibraryEntry[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_proxylibrariestoinclude, :array_matching => :all) do
    def mof_type; 'MSFT_SPProxyLibraryEntry[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"assemblyname"=>{:type=>"string"}, "supportappauthentication"=>{:type=>"boolean"}}
    end
    desc "ProxyLibrariesToInclude - A list of proxy libraries to add. Proxy libraries not in this list will be kept"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "ProxyLibrariesToInclude value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_SPProxyLibraryEntry(mof_type_map, "ProxyLibrariesToInclude", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
    end
  end

  # Name:         ProxyLibrariesToExclude
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_proxylibrariestoexclude, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ProxyLibrariesToExclude - A list of proxy libraries to remove. Proxy libraries not in this list will be kept"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         MaxResourcesPerRequest
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxresourcesperrequest) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxResourcesPerRequest - Sets the maximum number of internal SPRequest objects that can be included in one request"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         MaxObjectPaths
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_maxobjectpaths) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "MaxObjectPaths - Sets the maximum number of object paths that can be used within one request"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ExecutionTimeout
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_executiontimeout) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ExecutionTimeout - Sets the execution timeout for the client request in minutes"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RequestXmlMaxDepth
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requestxmlmaxdepth) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RequestXmlMaxDepth - Sets the maximum depth of the request XML that is sent by the client measured in 'tag' count"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EnableXsdValidation
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enablexsdvalidation) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableXsdValidation - Sets a Boolean value that specifies whether to enable XSD validation against an XML request or not"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         EnableStackTrace
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enablestacktrace) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableStackTrace - Sets a Boolean value that specifies whether the server can send stack trace data to the client"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RequestUsageExecutionTimeThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requestusageexecutiontimethreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "RequestUsageExecutionTimeThreshold - Sets the threshold in milliseconds for logging csom request usage data "
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EnableRequestUsage
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enablerequestusage) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EnableRequestUsage - Sets a Boolean value that specifies whether to log usage data or not"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LogActionsIfHasRequestException
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logactionsifhasrequestexception) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LogActionsIfHasRequestException - Sets a Boolean value that specifies whether to log usage data when request has an exception or not"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsCredential if using PowerShell 5"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("InstallAccount", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spwebappclientcallablesettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
