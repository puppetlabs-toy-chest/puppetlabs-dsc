require 'pathname'

Puppet::Type.newtype(:dsc_xspsite) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSPSite resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPSite/MSFT_xSPSite.schema.mof
  }

  validate do
      fail('dsc_url is a required attribute') if self[:dsc_url].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSPSite"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSPSite"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xSharePoint"
  end

  newparam(:dscmeta_module_version) do
    defaultto "0.3.1.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Url
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_url) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         OwnerAlias
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_owneralias) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         CompatibilityLevel
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_compatibilitylevel) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         ContentDatabase
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_contentdatabase) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Description
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_description) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         HostHeaderWebApplication
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_hostheaderwebapplication) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Language
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_language) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_name) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         OwnerEmail
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_owneremail) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         QuotaTemplate
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_quotatemplate) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SecondaryEmail
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_secondaryemail) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SecondaryOwnerAlias
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_secondaryowneralias) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Template
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_template) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstallAccount
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
