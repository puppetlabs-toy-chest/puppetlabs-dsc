require 'pathname'

Puppet::Type.newtype(:dsc_xazurepackrelyingparty) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xAzurePackRelyingParty resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xAzurePack/DSCResources/MSFT_xAzurePackRelyingParty/MSFT_xAzurePackRelyingParty.schema.mof
  }

  validate do
      fail('dsc_target is a required attribute') if self[:dsc_target].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xAzurePackRelyingParty"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xAzurePackRelyingParty"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xAzurePack"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.1.4.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Target
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Admin", "Tenant"]
  newparam(:dsc_target) do
    desc "Specifies the target site."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Admin', 'admin', 'Tenant', 'tenant'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Admin, Tenant")
      end
    end
  end

  # Name:         FullyQualifiedDomainName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fullyqualifieddomainname) do
    desc "Specifies a Fully Qualified Domain Name (FQDN)."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Port
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_port) do
    desc "Specifies a port number."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         AzurePackAdminCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_azurepackadmincredential) do
    desc "Credential to be used to perform the installation."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlserver) do
    desc "Database server for the Azure Pack databases."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SQLInstance
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sqlinstance) do
    desc "Database instance for the Azure Pack databases."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
