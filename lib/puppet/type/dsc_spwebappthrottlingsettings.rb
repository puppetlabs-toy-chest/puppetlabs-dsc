require 'pathname'

Puppet::Type.newtype(:dsc_spwebappthrottlingsettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_SPWebApplicationHappyHour(mof_type_map, name, value)
        required = []
        allowed = ['hour','minute','duration']
        lowkey_hash = Hash[value.map { |k, v| [k.to_s.downcase, v] }]

        missing = required - lowkey_hash.keys
        unless missing.empty?
          fail "#{name} is missing the following required keys: #{missing.join(',')}"
        end

        extraneous = lowkey_hash.keys - required - allowed
        unless extraneous.empty?
          fail "#{name} includes invalid keys: #{extraneous.join(',')}"
        end

        lowkey_hash.keys.each do |key|
          if lowkey_hash[key]
            validate_mof_type(mof_type_map[key], 'MSFT_SPWebApplicationHappyHour', key, lowkey_hash[key])
          end
        end
      end
    end

  @doc = %q{
    The DSC SPWebAppThrottlingSettings resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPWebAppThrottlingSettings/MSFT_SPWebAppThrottlingSettings.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_url is a required attribute') if self[:dsc_url].nil?
    end

  def dscmeta_resource_friendly_name; 'SPWebAppThrottlingSettings' end
  def dscmeta_resource_name; 'MSFT_SPWebAppThrottlingSettings' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.6.0.0' end

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

  # Name:         Url
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_url) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Url - The URL of the web application"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ListViewThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_listviewthreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ListViewThreshold - What should the list view threshold for this site be set to"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         AllowObjectModelOverride
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowobjectmodeloverride) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowObjectModelOverride - Should object model code be able to be override the list view threshold"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AdminThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_adminthreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "AdminThreshold - What is the list view threshold for site administrators"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         ListViewLookupThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_listviewlookupthreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ListViewLookupThreshold - What is the maximum number of lookup fields in a single list view"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         HappyHourEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_happyhourenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "HappyHourEnabled - Should the happy hour window be enabled for this web app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         HappyHour
  # Type:         MSFT_SPWebApplicationHappyHour
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_happyhour) do
    def mof_type; 'MSFT_SPWebApplicationHappyHour' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"hour"=>{:type=>"uint32"}, "minute"=>{:type=>"uint32"}, "duration"=>{:type=>"uint32"}}
    end
    desc "HappyHour - The time window for happy hour"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_SPWebApplicationHappyHour(mof_type_map, "HappyHour", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)
    end
  end

  # Name:         UniquePermissionThreshold
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_uniquepermissionthreshold) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "UniquePermissionThreshold - What is the limit for unique permissions on a single object in this web app"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         RequestThrottling
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_requestthrottling) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "RequestThrottling - Is request throttling enabled on this web app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ChangeLogEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_changelogenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ChangeLogEnabled - Is the change log enabled for this web app"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ChangeLogExpiryDays
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_changelogexpirydays) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "ChangeLogExpiryDays - How many days does the change log store data for"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         EventHandlersEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_eventhandlersenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "EventHandlersEnabled - Are event handlers enabled in the web application"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsCredential if using PowerShell 5"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("InstallAccount", value)
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_spwebappthrottlingsettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
