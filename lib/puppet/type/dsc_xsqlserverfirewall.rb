require 'pathname'

Puppet::Type.newtype(:dsc_xsqlserverfirewall) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSQLServerFirewall resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSQLServer/DSCResources/MSFT_xSQLServerFirewall/MSFT_xSQLServerFirewall.schema.mof
  }

  validate do
      fail('dsc_features is a required attribute') if self[:dsc_features].nil?
      fail('dsc_instancename is a required attribute') if self[:dsc_instancename].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSQLServerFirewall"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSQLServerFirewall"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSQLServer"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.3.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "An enumerated value that describes if the SQL firewall rules are is expected to be enabled on the machine.\nPresent {default}  \nAbsent   \n"
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

  # Name:         SourcePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcepath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UNC path to the root of the source files for installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SourceFolder
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sourcefolder) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Folder within the source path containing the source files for installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Features
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_features) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQL features to enable firewall rules for."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstanceName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_instancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SQL instance to enable firewall rules for."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabaseEngineFirewall
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databaseenginefirewall) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Is the firewall rule for the Database Engine enabled?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         BrowserFirewall
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_browserfirewall) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Is the firewall rule for the Browser enabled?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ReportingServicesFirewall
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportingservicesfirewall) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Is the firewall rule for Reporting Services enabled?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AnalysisServicesFirewall
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_analysisservicesfirewall) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Is the firewall rule for Analysis Services enabled?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IntegrationServicesFirewall
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_integrationservicesfirewall) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Is the firewall rule for the Integration Services enabled?"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end


end
