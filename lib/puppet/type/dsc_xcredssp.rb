require 'pathname'

Puppet::Type.newtype(:dsc_xcredssp) do
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
    The DSC xCredSSP resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xCredSSP/DSCResources/MSFT_xCredSSP/MSFT_xCredSSP.schema.mof
  }

  validate do
      fail('dsc_role is a required attribute') if self[:dsc_role].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xCredSSP"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xCredSSP"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xCredSSP"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0.1"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto :present
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    desc "An enumerated value that describes if the role is expected to be enabled on the machine.\nPresent {default}  \nAbsent   \n"
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

  # Name:         Role
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Server", "Client"]
  newparam(:dsc_role) do
    desc "Specifies the CredSSP role.\nServer   \nClient   \n"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Server', 'server', 'Client', 'client'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Server, Client")
      end
    end
  end

  # Name:         DelegateComputers
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_delegatecomputers, :array_matching => :all) do
    desc "Specifies the array of computers that CredSSP client can delegate to."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end


end
