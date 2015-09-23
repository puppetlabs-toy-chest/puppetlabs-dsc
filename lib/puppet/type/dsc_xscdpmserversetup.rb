require 'pathname'

Puppet::Type.newtype(:dsc_xscdpmserversetup) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSCDPMServerSetup resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSCDPM/DSCResources/MSFT_xSCDPMServerSetup/MSFT_xSCDPMServerSetup.schema.mof
  }

  validate do
      fail('dsc_ensure is a required attribute') if self[:dsc_ensure].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSCDPMServerSetup"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSCDPMServerSetup"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSCDPM"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.2.0.0"
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
    desc "An enumerated value that describes if the DPM server is expected to be installed on the machine.\nPresent {default}  \nAbsent   \n"
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
    desc "UNC path to the root of the source filesfor installation."
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
    desc "Folder within the source path containing the source files for installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SetupCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_setupcredential) do
    desc "Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UserName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_username) do
    desc "User name that the software will be registered to."
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
    desc "Company name that the software will be registered to."
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
    desc "Product key for licensed installations."
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
    desc "Installation path for the software."
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
    desc "Name of the SQL server for the DPM database."
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
    desc "SQL instance for the DPM database."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         YukonMachineCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_yukonmachinecredential) do
    desc "Credential to be used to access the SQL instance for DPM at installation time."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReportingMachineName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportingmachinename) do
    desc "Name of the SQL server for reporting."
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
    desc "SQL instance for reporting."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ReportingMachineCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reportingmachinecredential) do
    desc "Credential to be used to access SQL reporting for DPM at installation time."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
