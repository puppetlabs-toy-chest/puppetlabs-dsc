require 'pathname'

Puppet::Type.newtype(:dsc_xadcswebenrollment) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows

    def ensure_value
        'present'
    end

    def absent_value
        'absent'
    end

  end

  @doc = %q{
    The DSC xAdcsWebEnrollment resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xAdcsDeployment/xCertificateServices/DSCResources/MSFT_xAdcsWebEnrollment/MSFT_xAdcsWebEnrollment.schema.mof
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xAdcsWebEnrollment"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xAdcsWebEnrollment"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xCertificateServices"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.1.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto :present
  end

  # Name:         CAConfig
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_caconfig) do
    desc "CAConfig parameter string. Do not specify this if there is a local CA installed."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    desc "If the Web Enrollment service is configured to use Standalone certification authority, then an account that is a member of the local Administrators on the CA is required. If the Web Enrollment service is configured to use an Enterprise CA, then an account that is a member of Domain Admins is required."
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
    desc "Specifies whether the Web Enrollment feature should be installed or uninstalled."
    validate do |value|
      resource[:ensure] = provider.munge_ensure(value.downcase)
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
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
