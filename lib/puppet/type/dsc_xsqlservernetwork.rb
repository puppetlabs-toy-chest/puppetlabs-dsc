require 'pathname'

Puppet::Type.newtype(:dsc_xsqlservernetwork) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLServerNetwork resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLServerNetwork/MSFT_xSQLServerNetwork.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
    end

  def dscmeta_resource_friendly_name; 'xSQLServerNetwork' end
  def dscmeta_resource_name; 'MSFT_xSQLServerNetwork' end
  def dscmeta_module_name; 'xSQLServer' end
  def dscmeta_module_version; '8.1.0.0' end

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

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceName - The name of the SQL instance to be configured."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProtocolName
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Tcp"]
  newparam(:dsc_protocolname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProtocolName - The name of network protocol to be configured. Only tcp is currently supported. Valid values are Tcp."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Tcp', 'tcp'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Tcp")
      end
    end
  end

  # Name:         SQLServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQLServer - The host name of the SQL Server to be configured. Default value is $env:COMPUTERNAME."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IsEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsEnabled - Enables or disables the network protocol."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         TcpDynamicPorts
  # Type:         string
  # IsMandatory:  False
  # Values:       ["0", ""]
  newparam(:dsc_tcpdynamicports) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TcpDynamicPorts - Set the value to '0' if dynamic ports should be used. If static port should be used set this to a empty string value. Value can not be set to '0' if TcpPort is also set to a value. Valid values are 0, ."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['0', '0', '', ''].include?(value)
        fail("Invalid value '#{value}'. Valid values are 0, ")
      end
    end
  end

  # Name:         TcpPort
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tcpport) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TcpPort - The TCP port(s) that SQL Server should be listening on. If the IP address should listen on more than one port, list all ports separated with a comma ('1433,1500,1501'). To use this parameter set TcpDynamicPorts to the value '' (empty string)."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         RestartService
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restartservice) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RestartService - If set to $true then SQL Server and dependent services will be restarted if a change to the configuration is made. The default value is $false."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         RestartTimeout
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_restarttimeout) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "RestartTimeout - Timeout value for restarting the SQL Server services. The default value is 120 seconds."
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

Puppet::Type.type(:dsc_xsqlservernetwork).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
