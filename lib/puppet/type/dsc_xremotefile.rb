require 'pathname'

Puppet::Type.newtype(:dsc_xremotefile) do
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
    The DSC xRemoteFile resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xPSDesiredStateConfiguration/DSCResources/MSFT_xRemoteFile/MSFT_xRemoteFile.schema.mof
  }

  validate do
      fail('dsc_destinationpath is a required attribute') if self[:dsc_destinationpath].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xRemoteFile"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xRemoteFile"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xPSDesiredStateConfiguration"
  end

  newparam(:dscmeta_module_version) do
    defaultto "3.4.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto :present
  end

  # Name:         DestinationPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_destinationpath) do
    desc "Path under which downloaded or copied file should be accessible after operation."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Uri
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_uri) do
    desc "Uri of a file which should be copied or downloaded. This parameter supports HTTP and HTTPS values."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         UserAgent
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_useragent) do
    desc "User agent for the web request."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Headers
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_headers, :array_matching => :all) do
    desc "Headers of the web request."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         Credential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    desc "Specifies a user account that has permission to send the request."
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
    desc "Says whether DestinationPath exists on the machine"
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


end
