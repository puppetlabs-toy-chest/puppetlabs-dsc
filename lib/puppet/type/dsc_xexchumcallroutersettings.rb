require 'pathname'

Puppet::Type.newtype(:dsc_xexchumcallroutersettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xExchUMCallRouterSettings resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xExchange/DSCResources/MSFT_xExchUMCallRouterSettings/MSFT_xExchUMCallRouterSettings.schema.mof
  }

  validate do
      fail('dsc_server is a required attribute') if self[:dsc_server].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xExchUMCallRouterSettings"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xExchUMCallRouterSettings"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xExchange"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.2.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Server
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_server) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Hostname of the UM server to configure"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Credential
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_credential) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "Credentials used to establish a remote Powershell session to Exchange"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("Credential", value)
    end
  end

  # Name:         UMStartupMode
  # Type:         string
  # IsMandatory:  False
  # Values:       ["TCP", "TLS", "Dual"]
  newparam(:dsc_umstartupmode) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "UMStartupMode for the UM call router"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['TCP', 'tcp', 'TLS', 'tls', 'Dual', 'dual'].include?(value)
        fail("Invalid value '#{value}'. Valid values are TCP, TLS, Dual")
      end
    end
  end

  # Name:         DomainController
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domaincontroller) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Optional Domain Controller to connect to"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
