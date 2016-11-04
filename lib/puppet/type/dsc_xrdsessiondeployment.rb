require 'pathname'

Puppet::Type.newtype(:dsc_xrdsessiondeployment) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xRDSessionDeployment resource type.
    Automatically generated from
    'xRemoteDesktopSessionHost/DSCResources/MSFT_xRDSessionDeployment/MSFT_xRDSessionDeployment.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_sessionhost is a required attribute') if self[:dsc_sessionhost].nil?
      fail('dsc_connectionbroker is a required attribute') if self[:dsc_connectionbroker].nil?
      fail('dsc_webaccessserver is a required attribute') if self[:dsc_webaccessserver].nil?
    end

  def dscmeta_resource_friendly_name; 'xRDSessionDeployment' end
  def dscmeta_resource_name; 'MSFT_xRDSessionDeployment' end
  def dscmeta_module_name; 'xRemoteDesktopSessionHost' end
  def dscmeta_module_version; '1.3.0.0' end

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
  end

  # Name:         SessionHost
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_sessionhost) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SessionHost - Specifies the FQDN of a server to host the RD Session Host role service. "
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ConnectionBroker
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_connectionbroker) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectionBroker - Specifies the FQDN of a server to host the RD Connection Broker role service."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         WebAccessServer
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_webaccessserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WebAccessServer - Specifies the FQDN of a server to host the RD Web Access role service. "
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xrdsessiondeployment).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
