require 'pathname'

Puppet::Type.newtype(:dsc_xwordpresssite) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xWordPressSite resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xWordPress/DscResources/MSFT_xWordPressSite/MSFT_xWordPressSite.schema.mof
  }

  validate do
      fail('dsc_uri is a required attribute') if self[:dsc_uri].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xWordPressSite"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xWordPressSite"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWordPress"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Uri
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_uri) do
    desc "The WordPress Site URI."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Title
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_title) do
    desc "The WordPress Site Default page title."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AdministratorCredential
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_administratorcredential) do
    desc "The username and password of the WordPress administrator to create when creating the site."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AdministratorEmail
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_administratoremail) do
    desc "The email address of the WordPress administrator to create."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present"]
  newparam(:dsc_ensure) do
    desc "Should the module be present or absent."
    validate do |value|
      resource[:ensure] = value.downcase
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Present', 'present'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Present")
      end
    end
  end


end
