require 'pathname'

Puppet::Type.newtype(:dsc_spsearchcontentsource) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_SPSearchCrawlSchedule(mof_type_map, name, value)
        required = ['scheduletype']
        allowed = ['crawlscheduledaysofmonth','crawlscheduledaysofweek','crawlschedulemonthsofyear','starthour','startminute','crawlschedulerepeatduration','crawlschedulerepeatinterval','crawlscheduleruneveryinterval']
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
            validate_mof_type(mof_type_map[key], 'MSFT_SPSearchCrawlSchedule', key, lowkey_hash[key])
          end
        end
      end
    end

  @doc = %q{
    The DSC SPSearchContentSource resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPSearchContentSource/MSFT_SPSearchContentSource.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
      fail('dsc_serviceappname is a required attribute') if self[:dsc_serviceappname].nil?
    end

  def dscmeta_resource_friendly_name; 'SPSearchContentSource' end
  def dscmeta_resource_name; 'MSFT_SPSearchContentSource' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.5.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
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

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the content source"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ServiceAppName
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_serviceappname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ServiceAppName - The name of the search service app that this content source exists within"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ContentSourceType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["SharePoint", "Website", "FileShare"]
  newparam(:dsc_contentsourcetype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ContentSourceType - The type of content source - currently only SharePoint, Website and File Shares are supported Valid values are SharePoint, Website, FileShare."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['SharePoint', 'sharepoint', 'Website', 'website', 'FileShare', 'fileshare'].include?(value)
        fail("Invalid value '#{value}'. Valid values are SharePoint, Website, FileShare")
      end
    end
  end

  # Name:         Addresses
  # Type:         string[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_addresses, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "Addresses - A list of the addresses this content source includes"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         CrawlSetting
  # Type:         string
  # IsMandatory:  False
  # Values:       ["CrawlEverything", "CrawlFirstOnly", "Custom"]
  newparam(:dsc_crawlsetting) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CrawlSetting - Should the crawler index everything, just the first site or page, or a custom depth (applies to websites only) Valid values are CrawlEverything, CrawlFirstOnly, Custom."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['CrawlEverything', 'crawleverything', 'CrawlFirstOnly', 'crawlfirstonly', 'Custom', 'custom'].include?(value)
        fail("Invalid value '#{value}'. Valid values are CrawlEverything, CrawlFirstOnly, Custom")
      end
    end
  end

  # Name:         ContinuousCrawl
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_continuouscrawl) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ContinuousCrawl - Should this content source use continuous crawl (SharePoint sites only)"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IncrementalSchedule
  # Type:         MSFT_SPSearchCrawlSchedule
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_incrementalschedule) do
    def mof_type; 'MSFT_SPSearchCrawlSchedule' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"scheduletype"=>{:type=>"string", :values=>["None", "Daily", "Weekly", "Monthly"]}, "crawlscheduledaysofmonth"=>{:type=>"uint32"}, "crawlscheduledaysofweek"=>{:type=>"string[]", :values=>["Everyday", "Weekdays", "Weekends", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]}, "crawlschedulemonthsofyear"=>{:type=>"string[]", :values=>["AllMonths", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]}, "starthour"=>{:type=>"uint32"}, "startminute"=>{:type=>"uint32"}, "crawlschedulerepeatduration"=>{:type=>"uint32"}, "crawlschedulerepeatinterval"=>{:type=>"uint32"}, "crawlscheduleruneveryinterval"=>{:type=>"uint32"}}
    end
    desc "IncrementalSchedule - What is the incremental schedule for this content source"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_SPSearchCrawlSchedule(mof_type_map, "IncrementalSchedule", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)
    end
  end

  # Name:         FullSchedule
  # Type:         MSFT_SPSearchCrawlSchedule
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_fullschedule) do
    def mof_type; 'MSFT_SPSearchCrawlSchedule' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"scheduletype"=>{:type=>"string", :values=>["None", "Daily", "Weekly", "Monthly"]}, "crawlscheduledaysofmonth"=>{:type=>"uint32"}, "crawlscheduledaysofweek"=>{:type=>"string[]", :values=>["Everyday", "Weekdays", "Weekends", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]}, "crawlschedulemonthsofyear"=>{:type=>"string[]", :values=>["AllMonths", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]}, "starthour"=>{:type=>"uint32"}, "startminute"=>{:type=>"uint32"}, "crawlschedulerepeatduration"=>{:type=>"uint32"}, "crawlschedulerepeatinterval"=>{:type=>"uint32"}, "crawlscheduleruneveryinterval"=>{:type=>"uint32"}}
    end
    desc "FullSchedule - What is the full schedule for this content source"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_SPSearchCrawlSchedule(mof_type_map, "FullSchedule", value)
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)
    end
  end

  # Name:         Priority
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Normal", "High"]
  newparam(:dsc_priority) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Priority - What is the priority on this content source Valid values are Normal, High."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Normal', 'normal', 'High', 'high'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Normal, High")
      end
    end
  end

  # Name:         LimitPageDepth
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_limitpagedepth) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "LimitPageDepth - How many pages deep should the crawler go (-1 = unlimited, website sources only)"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         LimitServerHops
  # Type:         uint32
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_limitserverhops) do
    def mof_type; 'uint32' end
    def mof_is_embedded?; false end
    desc "LimitServerHops - How many server hops should the crawler make (-1 = unlimtied, website sources only)"
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Ensure - Present if the source should exist, absent if it should not Valid values are Present, Absent."
    validate do |value|
      resource[:ensure] = value.downcase
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Present', 'present', 'Absent', 'absent'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Present, Absent")
      end
    end
  end

  # Name:         Force
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_force) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "Force - Specify true if DSC is allowed to delete and recreate a content source to apply the correct settings, otherwise false will just report errors if a change can not be applied."
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

Puppet::Type.type(:dsc_spsearchcontentsource).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
