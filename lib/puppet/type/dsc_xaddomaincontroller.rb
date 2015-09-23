require 'pathname'

Puppet::Type.newtype(:dsc_xaddomaincontroller) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xADDomainController resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xActiveDirectory/DSCResources/MSFT_xADDomainController/MSFT_xADDomainController.schema.mof
  }

  validate do
      fail('dsc_domainname is a required attribute') if self[:dsc_domainname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xADDomainController"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xADDomainController"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xActiveDirectory"
  end

  newparam(:dscmeta_module_version) do
    defaultto "2.5.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         DomainName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_domainname) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DomainAdministratorCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_domainadministratorcredential) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SafemodeAdministratorPassword
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_safemodeadministratorpassword) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DatabasePath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_databasepath) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         LogPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logpath) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SysvolPath
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sysvolpath) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
