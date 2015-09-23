require 'pathname'

Puppet::Type.newtype(:dsc_xscvmmadmin) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSCVMMAdmin resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSCVMM/DSCResources/MSFT_xSCVMMAdmin/MSFT_xSCVMMAdmin.schema.mof
  }

  validate do
      fail('dsc_principal is a required attribute') if self[:dsc_principal].nil?
      fail('dsc_userrole is a required attribute') if self[:dsc_userrole].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSCVMMAdmin"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSCVMMAdmin"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSCVMM"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.2.4.0"
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
    desc "An enumerated value that describes if the principal is an Virtual Machine Manager admin.\nPresent {default}  \nAbsent   \n"
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
    desc "The Virtual Machine Manager admin principal."
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
    desc "The Virtual Machine Manager user role."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SCVMMAdminCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_scvmmadmincredential) do
    desc "Credential to be used to perform the operations."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
