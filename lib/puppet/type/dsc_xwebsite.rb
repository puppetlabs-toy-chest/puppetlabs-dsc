require 'pathname'

Puppet::Type.newtype(:dsc_xwebsite) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_xWebBindingInformation(mof_type_map, name, value)
        required = ['protocol']
        allowed = ['bindinginformation','ipaddress','port','hostname','certificatethumbprint','certificatestorename','sslflags']
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
            validate_mof_type(mof_type_map[key], 'MSFT_xWebBindingInformation', key, lowkey_hash[key])
          end
        end
      end
    end
    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_xWebAuthenticationInformation(mof_type_map, name, value)
        required = []
        allowed = ['anonymous','basic','digest','windows']
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
            validate_mof_type(mof_type_map[key], 'MSFT_xWebAuthenticationInformation', key, lowkey_hash[key])
          end
        end
      end
    end

  @doc = %q{
    The DSC xWebsite resource type.
    Automatically generated from
    'xWebAdministration/DSCResources/MSFT_xWebsite/MSFT_xWebsite.schema.mof'

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

  def dscmeta_resource_friendly_name; 'xWebsite' end
  def dscmeta_resource_name; 'MSFT_xWebsite' end
  def dscmeta_module_name; 'xWebAdministration' end
  def dscmeta_module_version; '1.15.0.0' end

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
    desc "Ensure - Valid values are Present, Absent."
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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         PhysicalPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_physicalpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PhysicalPath"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         State
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Started", "Stopped"]
  newparam(:dsc_state) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "State - Valid values are Started, Stopped."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Started', 'started', 'Stopped', 'stopped'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Started, Stopped")
      end
    end
  end

  # Name:         ApplicationPool
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applicationpool) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ApplicationPool"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         BindingInfo
  # Type:         MSFT_xWebBindingInformation[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_bindinginfo, :array_matching => :all) do
    def mof_type; 'MSFT_xWebBindingInformation[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"protocol"=>{:type=>"string", :values=>["http", "https", "msmq.formatname", "net.msmq", "net.pipe", "net.tcp"]}, "bindinginformation"=>{:type=>"string"}, "ipaddress"=>{:type=>"string"}, "port"=>{:type=>"uint16"}, "hostname"=>{:type=>"string"}, "certificatethumbprint"=>{:type=>"string"}, "certificatestorename"=>{:type=>"string", :values=>["My", "WebHosting"]}, "sslflags"=>{:type=>"string", :values=>["0", "1", "2", "3"]}}
    end
    desc "BindingInfo - Website's binding information in the form of an array of embedded instances of the MSFT_xWebBindingInformation CIM class."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "BindingInfo value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_xWebBindingInformation(mof_type_map, "BindingInfo", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
    end
  end

  # Name:         DefaultPage
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_defaultpage, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "DefaultPage"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         EnabledProtocols
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_enabledprotocols) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "EnabledProtocols"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AuthenticationInfo
  # Type:         MSFT_xWebAuthenticationInformation
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_authenticationinfo) do
    def mof_type; 'MSFT_xWebAuthenticationInformation' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"anonymous"=>{:type=>"boolean"}, "basic"=>{:type=>"boolean"}, "digest"=>{:type=>"boolean"}, "windows"=>{:type=>"boolean"}}
    end
    desc "AuthenticationInfo - Hashtable containing authentication information (Anonymous, Basic, Digest, Windows)"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_xWebAuthenticationInformation(mof_type_map, "AuthenticationInfo", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)
    end
  end

  # Name:         PreloadEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_preloadenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "PreloadEnabled - Allows the Website to automatically start without a request"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ServiceAutoStartEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serviceautostartenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ServiceAutoStartEnabled - Enables Autostart on a Website."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ServiceAutoStartProvider
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_serviceautostartprovider) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServiceAutoStartProvider - Adds a AutostartProvider"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ApplicationType
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applicationtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ApplicationType - Adds a AutostartProvider ApplicationType"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogPath - The directory to be used for logfiles"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogFlags
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["Date", "Time", "ClientIP", "UserName", "SiteName", "ComputerName", "ServerIP", "Method", "UriStem", "UriQuery", "HttpStatus", "Win32Status", "BytesSent", "BytesRecv", "TimeTaken", "ServerPort", "UserAgent", "Cookie", "Referer", "ProtocolVersion", "Host", "HttpSubStatus"]
  newparam(:dsc_logflags, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "LogFlags - The W3C logging fields Valid values are Date, Time, ClientIP, UserName, SiteName, ComputerName, ServerIP, Method, UriStem, UriQuery, HttpStatus, Win32Status, BytesSent, BytesRecv, TimeTaken, ServerPort, UserAgent, Cookie, Referer, ProtocolVersion, Host, HttpSubStatus."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['Date', 'date', 'Time', 'time', 'ClientIP', 'clientip', 'UserName', 'username', 'SiteName', 'sitename', 'ComputerName', 'computername', 'ServerIP', 'serverip', 'Method', 'method', 'UriStem', 'uristem', 'UriQuery', 'uriquery', 'HttpStatus', 'httpstatus', 'Win32Status', 'win32status', 'BytesSent', 'bytessent', 'BytesRecv', 'bytesrecv', 'TimeTaken', 'timetaken', 'ServerPort', 'serverport', 'UserAgent', 'useragent', 'Cookie', 'cookie', 'Referer', 'referer', 'ProtocolVersion', 'protocolversion', 'Host', 'host', 'HttpSubStatus', 'httpsubstatus'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are Date, Time, ClientIP, UserName, SiteName, ComputerName, ServerIP, Method, UriStem, UriQuery, HttpStatus, Win32Status, BytesSent, BytesRecv, TimeTaken, ServerPort, UserAgent, Cookie, Referer, ProtocolVersion, Host, HttpSubStatus")
        end
      end
      if value.kind_of?(String)
        unless ['Date', 'date', 'Time', 'time', 'ClientIP', 'clientip', 'UserName', 'username', 'SiteName', 'sitename', 'ComputerName', 'computername', 'ServerIP', 'serverip', 'Method', 'method', 'UriStem', 'uristem', 'UriQuery', 'uriquery', 'HttpStatus', 'httpstatus', 'Win32Status', 'win32status', 'BytesSent', 'bytessent', 'BytesRecv', 'bytesrecv', 'TimeTaken', 'timetaken', 'ServerPort', 'serverport', 'UserAgent', 'useragent', 'Cookie', 'cookie', 'Referer', 'referer', 'ProtocolVersion', 'protocolversion', 'Host', 'host', 'HttpSubStatus', 'httpsubstatus'].include?(value)
          fail("Invalid value #{value}. Valid values are Date, Time, ClientIP, UserName, SiteName, ComputerName, ServerIP, Method, UriStem, UriQuery, HttpStatus, Win32Status, BytesSent, BytesRecv, TimeTaken, ServerPort, UserAgent, Cookie, Referer, ProtocolVersion, Host, HttpSubStatus")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         LogPeriod
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Hourly", "Daily", "Weekly", "Monthly", "MaxSize"]
  newparam(:dsc_logperiod) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogPeriod - How often the log file should rollover Valid values are Hourly, Daily, Weekly, Monthly, MaxSize."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Hourly', 'hourly', 'Daily', 'daily', 'Weekly', 'weekly', 'Monthly', 'monthly', 'MaxSize', 'maxsize'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Hourly, Daily, Weekly, Monthly, MaxSize")
      end
    end
  end

  # Name:         LogTruncateSize
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logtruncatesize) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogTruncateSize - How large the file should be before it is truncated"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LoglocalTimeRollover
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_loglocaltimerollover) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "LoglocalTimeRollover - Use the localtime for file naming and rollover"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         LogFormat
  # Type:         string
  # IsMandatory:  False
  # Values:       ["IIS", "W3C", "NCSA"]
  newparam(:dsc_logformat) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogFormat - Format of the Logfiles. Only W3C supports LogFlags Valid values are IIS, W3C, NCSA."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['IIS', 'iis', 'W3C', 'w3c', 'NCSA', 'ncsa'].include?(value)
        fail("Invalid value '#{value}'. Valid values are IIS, W3C, NCSA")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xwebsite).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
