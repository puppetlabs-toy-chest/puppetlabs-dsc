require 'pathname'

Puppet::Type.newtype(:dsc_sqlrs) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SqlRS resource type.
    Automatically generated from
    'SqlServerDsc/DSCResources/MSFT_SqlRS/MSFT_SqlRS.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SqlRS' end
  def dscmeta_resource_name; 'MSFT_SqlRS' end
  def dscmeta_module_name; 'SqlServerDsc' end
  def dscmeta_module_version; '11.1.0.0' end

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

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InstanceName - Name of the SQL Server Reporting Services instance to be configured."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseServerName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databaseservername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseServerName - Name of the SQL Server to host the Reporting Service database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseInstanceName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databaseinstancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "DatabaseInstanceName - Name of the SQL Server instance to host the Reporting Service database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReportServerVirtualDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportservervirtualdirectory) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReportServerVirtualDirectory - Report Server Web Service virtual directory. Optional."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReportsVirtualDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportsvirtualdirectory) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReportsVirtualDirectory - Report Manager/Report Web App virtual directory name. Optional."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReportServerReservedUrl
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportserverreservedurl, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ReportServerReservedUrl - Report Server URL reservations. Optional. If not specified, 'http://+:80' URL reservation will be used."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         ReportsReservedUrl
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportsreservedurl, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ReportsReservedUrl - Report Manager/Report Web App URL reservations. Optional. If not specified, 'http://+:80' URL reservation will be used."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         UseSsl
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_usessl) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "UseSsl - If connections to the Reporting Services must use SSL. If this parameter is not assigned a value, the default is that Reporting Services does not use SSL."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsInitialized
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isinitialized) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsInitialized - Is the Reporting Services instance initialized."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_sqlrs).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
