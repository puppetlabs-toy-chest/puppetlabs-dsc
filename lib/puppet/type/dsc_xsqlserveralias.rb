require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserveralias) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSQLServerAlias resource type.
    Automatically generated from
    'xSQLServer/DSCResources/MSFT_xSQLServerAlias/MSFT_xSQLServerAlias.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_servername is a required attribute') if self[:dsc_servername].nil?
    end

  def dscmeta_resource_friendly_name; 'xSQLServerAlias' end
  def dscmeta_resource_name; 'MSFT_xSQLServerAlias' end
  def dscmeta_module_name; 'xSQLServer' end
  def dscmeta_module_version; '7.0.0.0' end

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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of Alias (e.g. svr01\\inst01)."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Protocol
  # Type:         string
  # IsMandatory:  False
  # Values:       ["TCP", "NP"]
  newparam(:dsc_protocol) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Protocol - Protocol to use when connecting. Valid values are 'TCP' or 'NP' (Named Pipes). Default value is 'TCP'. Valid values are TCP, NP."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['TCP', 'tcp', 'NP', 'np'].include?(value)
        fail("Invalid value '#{value}'. Valid values are TCP, NP")
      end
    end
  end

  # Name:         ServerName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_servername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServerName - The SQL Server you are aliasing (the netbios name or FQDN)."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TcpPort
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tcpport) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "TcpPort - The TCP port SQL is listening on. Only used when protocol is set to 'TCP'. Default value is port 1433."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         UseDynamicTcpPort
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usedynamictcpport) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UseDynamicTcpPort - The UseDynamicTcpPort specify that the Net-Library will determine the port dynamically. The port specified in Port number will not be used. Default value is '$false'."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         PipeName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_pipename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "PipeName - Named Pipes path from the Get-TargetResource method."
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
    desc "Ensure - Determines whether the alias should be added or removed. Default value is 'Present' Valid values are Present, Absent."
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


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xsqlserveralias).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
