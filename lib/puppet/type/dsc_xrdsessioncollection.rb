require 'pathname'

Puppet::Type.newtype(:dsc_xrdsessioncollection) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xRDSessionCollection resource type.
    Automatically generated from
    'xRemoteDesktopSessionHost/DSCResources/MSFT_xRDSessionCollection/MSFT_xRDSessionCollection.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_collectionname is a required attribute') if self[:dsc_collectionname].nil?
      fail('dsc_sessionhost is a required attribute') if self[:dsc_sessionhost].nil?
    end

  newproperty(:dscmeta_resource_friendly_name) do
    desc "A read-only value that is the DSC Resource Friendly Name ('xRDSessionCollection')."

    def retrieve
      'xRDSessionCollection'
    end

    validate do |value|
      fail 'dscmeta_resource_friendly_name is read-only'
    end
  end

  newproperty(:dscmeta_resource_name) do
    desc "A read-only value that is the DSC Resource Name ('MSFT_xRDSessionCollection')."

    def retrieve
      'MSFT_xRDSessionCollection'
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
    desc "A read-only value that is the DSC Module Name ('xRemoteDesktopSessionHost')."

    def retrieve
      'xRemoteDesktopSessionHost'
    end

    validate do |value|
      fail 'dscmeta_module_name is read-only'
    end
  end

  newproperty(:dscmeta_module_version) do
    desc "A read-only value for the DSC Module Version ('1.1.0.0').
      This is the supported version of the PowerShell module that this
      type was built on. When Puppet runs this resource, it will explicitly
      use this version."

    def retrieve
      '1.1.0.0'
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
    defaultto { :present }
  end

  # Name:         CollectionName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_collectionname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CollectionName - Specifies a name for the session collection. "
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SessionHost
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_sessionhost) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SessionHost - Specifies an RD Session Host server to include in the session collection. "
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CollectionDescription
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_collectiondescription) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CollectionDescription - Specifies a description for the collection."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectionBroker
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectionbroker) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectionBroker - Specifies the Remote Desktop Connection Broker (RD Connection Broker) server for a Remote Desktop deployment."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end

Puppet::Type.type(:dsc_xrdsessioncollection).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
