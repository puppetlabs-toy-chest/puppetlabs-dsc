require 'pathname'

Puppet::Type.newtype(:dsc_xscvmmadmin) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSCVMMAdmin resource type.
    Automatically generated from
    'xSCVMM/DSCResources/MSFT_xSCVMMAdmin/MSFT_xSCVMMAdmin.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_principal is a required attribute') if self[:dsc_principal].nil?
      fail('dsc_userrole is a required attribute') if self[:dsc_userrole].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xSCVMMAdmin')."

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only' if value != 'xSCVMMAdmin'
    end

    defaultto 'xSCVMMAdmin'
  end

  newparam(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xSCVMMAdmin')."

    validate do |value|
      fail 'dscmeta_resource_name is read-only' if value != 'MSFT_xSCVMMAdmin'
    end

    defaultto 'MSFT_xSCVMMAdmin'
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

  newparam(:dscmeta_module_name) do
    desc "A read-only value that is the DSC Module Name ('xSCVMM')."

    validate do |value|
      fail 'dscmeta_module_name is read-only' if value != 'xSCVMM'
    end

    defaultto 'xSCVMM'
  end

  newparam(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.3.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    validate do |value|
      fail 'dscmeta_module_version is read-only' if value != '1.3.0.0'
    end

    defaultto '1.3.0.0'
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
    desc "Ensure - An enumerated value that describes if the principal is an Virtual Machine Manager admin.\nPresent {default}  \nAbsent   \n Valid values are Present, Absent."
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

  # Name:         Principal
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_principal) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Principal - The Virtual Machine Manager admin principal."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UserRole
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_userrole) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UserRole - The Virtual Machine Manager user role."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SCVMMAdminCredential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scvmmadmincredential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "SCVMMAdminCredential - Credential to be used to perform the operations."
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("SCVMMAdminCredential", value)
    end
  end


end

Puppet::Type.type(:dsc_xscvmmadmin).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
