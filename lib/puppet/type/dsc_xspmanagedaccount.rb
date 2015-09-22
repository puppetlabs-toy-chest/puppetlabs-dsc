require 'pathname'

Puppet::Type.newtype(:dsc_xspmanagedaccount) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xSPManagedAccount resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPManagedAccount/MSFT_xSPManagedAccount.schema.mof
  }

  validate do
      fail('dsc_accountname is a required attribute') if self[:dsc_accountname].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xSPManagedAccount"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xSPManagedAccount"
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

  # Name:         AccountName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_accountname) do
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Account
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_account) do
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

  # Name:         EmailNotification
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_emailnotification) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         PreExpireDays
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_preexpiredays) do
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      value.to_i
    end
  end

  # Name:         Schedule
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_schedule) do
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


end
