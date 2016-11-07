require 'pathname'

Puppet::Type.newtype(:dsc_xiislogging) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xIisLogging resource type.
    Automatically generated from
    'xWebAdministration/DSCResources/MSFT_xIisLogging/MSFT_xIisLogging.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_logpath is a required attribute') if self[:dsc_logpath].nil?
    end

  def dscmeta_resource_friendly_name; 'xIisLogging' end
  def dscmeta_resource_name; 'MSFT_xIisLogging' end
  def dscmeta_module_name; 'xWebAdministration' end
  def dscmeta_module_version; '1.15.0.0' end

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
  end

  # Name:         LogPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_logpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "LogPath - The directory to be used for logfiles"
    isrequired
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

Puppet::Type.type(:dsc_xiislogging).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
