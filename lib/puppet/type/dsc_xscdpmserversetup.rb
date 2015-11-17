require 'pathname'

Puppet::Type.newtype(:dsc_xscdpmserversetup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSCDPMServerSetup resource type.
    Automatically generated from
    'xSCDPM/DSCResources/MSFT_xSCDPMServerSetup/MSFT_xSCDPMServerSetup.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_ensure is a required attribute') if self[:dsc_ensure].nil?
    end

  newproperty(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xSCDPMServerSetup')."

    def retrieve
      'xSCDPMServerSetup'
    end

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only'
    end
  end

  newproperty(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xSCDPMServerSetup')."

    def retrieve
      'MSFT_xSCDPMServerSetup'
    end

    validate do |value|
      fail 'dscmeta_resource_name is read-only'
    end
  end

  newparam(:dscmeta_import_resource) do
    desc "Please ignore this parameter.
      Defaults to `true`."
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newproperty(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xSCDPM')."

    def retrieve
      'xSCDPM'
    end

    validate do |value|
      fail 'dscmeta_module_name is read-only'
    end
  end

  newproperty(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.2.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    def retrieve
      '1.2.0.0'
    end

    validate do |value|
      fail 'dscmeta_module_version is read-only'
    end
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
  # IsMandatory:  True
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - An enumerated value that describes if the DPM server is expected to be installed on the machine.\nPresent {default}  \nAbsent   \n Valid values are Present, Absent."
    isrequired
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
    desc "SourcePath - UNC path to the root of the source filesfor installation."
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
    desc "SourceFolder - Folder within the source path containing the source files for installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SetupCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_setupcredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SetupCredential - Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SetupCredential", value)
    end
  end

  # Name:         UserName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_username) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserName - User name that the software will be registered to."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CompanyName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_companyname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CompanyName - Company name that the software will be registered to."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProductKey
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_productkey) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProductKey - Product key for licensed installations."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProgramFiles
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_programfiles) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProgramFiles - Installation path for the software."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         YukonMachineName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_yukonmachinename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "YukonMachineName - Name of the SQL server for the DPM database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         YukonInstanceName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_yukoninstancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "YukonInstanceName - SQL instance for the DPM database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         YukonMachineCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_yukonmachinecredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "YukonMachineCredential - Credential to be used to access the SQL instance for DPM at installation time."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("YukonMachineCredential", value)
    end
  end

  # Name:         ReportingMachineName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportingmachinename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReportingMachineName - Name of the SQL server for reporting."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReportingInstanceName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportinginstancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ReportingInstanceName - SQL instance for reporting."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReportingMachineCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportingmachinecredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "ReportingMachineCredential - Credential to be used to access SQL reporting for DPM at installation time."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("ReportingMachineCredential", value)
    end
  end


end

Puppet::Type.type(:dsc_xscdpmserversetup).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
