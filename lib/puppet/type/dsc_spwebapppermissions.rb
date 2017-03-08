require 'pathname'

Puppet::Type.newtype(:dsc_spwebapppermissions) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPWebAppPermissions resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPWebAppPermissions/MSFT_SPWebAppPermissions.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_webappurl is a required attribute') if self[:dsc_webappurl].nil?
    end

  def dscmeta_resource_friendly_name; 'SPWebAppPermissions' end
  def dscmeta_resource_name; 'MSFT_SPWebAppPermissions' end
  def dscmeta_module_name; 'SharePointDsc' end
  def dscmeta_module_version; '1.5.0.0' end

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

  # Name:         WebAppUrl
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_webappurl) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "WebAppUrl - The url of the web application"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ListPermissions
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["Manage Lists", "Override List Behaviors", "Add Items", "Edit Items", "Delete Items", "View Items", "Approve Items", "Open Items", "View Versions", "Delete Versions", "Create Alerts", "View Application Pages"]
  newparam(:dsc_listpermissions, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "ListPermissions - List permissions that need to be configured Valid values are Manage Lists, Override List Behaviors, Add Items, Edit Items, Delete Items, View Items, Approve Items, Open Items, View Versions, Delete Versions, Create Alerts, View Application Pages."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['Manage Lists', 'manage lists', 'Override List Behaviors', 'override list behaviors', 'Add Items', 'add items', 'Edit Items', 'edit items', 'Delete Items', 'delete items', 'View Items', 'view items', 'Approve Items', 'approve items', 'Open Items', 'open items', 'View Versions', 'view versions', 'Delete Versions', 'delete versions', 'Create Alerts', 'create alerts', 'View Application Pages', 'view application pages'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are Manage Lists, Override List Behaviors, Add Items, Edit Items, Delete Items, View Items, Approve Items, Open Items, View Versions, Delete Versions, Create Alerts, View Application Pages")
        end
      end
      if value.kind_of?(String)
        unless ['Manage Lists', 'manage lists', 'Override List Behaviors', 'override list behaviors', 'Add Items', 'add items', 'Edit Items', 'edit items', 'Delete Items', 'delete items', 'View Items', 'view items', 'Approve Items', 'approve items', 'Open Items', 'open items', 'View Versions', 'view versions', 'Delete Versions', 'delete versions', 'Create Alerts', 'create alerts', 'View Application Pages', 'view application pages'].include?(value)
          fail("Invalid value #{value}. Valid values are Manage Lists, Override List Behaviors, Add Items, Edit Items, Delete Items, View Items, Approve Items, Open Items, View Versions, Delete Versions, Create Alerts, View Application Pages")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         SitePermissions
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["Manage Permissions", "View Web Analytics Data", "Create Subsites", "Manage Web Site", "Add and Customize Pages", "Apply Themes and Borders", "Apply Style Sheets", "Create Groups", "Browse Directories", "Use Self-Service Site Creation", "View Pages", "Enumerate Permissions", "Browse User Information", "Manage Alerts", "Use Remote Interfaces", "Use Client Integration Features", "Open", "Edit Personal User Information"]
  newparam(:dsc_sitepermissions, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "SitePermissions - Site permissions that need to be configured Valid values are Manage Permissions, View Web Analytics Data, Create Subsites, Manage Web Site, Add and Customize Pages, Apply Themes and Borders, Apply Style Sheets, Create Groups, Browse Directories, Use Self-Service Site Creation, View Pages, Enumerate Permissions, Browse User Information, Manage Alerts, Use Remote Interfaces, Use Client Integration Features, Open, Edit Personal User Information."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['Manage Permissions', 'manage permissions', 'View Web Analytics Data', 'view web analytics data', 'Create Subsites', 'create subsites', 'Manage Web Site', 'manage web site', 'Add and Customize Pages', 'add and customize pages', 'Apply Themes and Borders', 'apply themes and borders', 'Apply Style Sheets', 'apply style sheets', 'Create Groups', 'create groups', 'Browse Directories', 'browse directories', 'Use Self-Service Site Creation', 'use self-service site creation', 'View Pages', 'view pages', 'Enumerate Permissions', 'enumerate permissions', 'Browse User Information', 'browse user information', 'Manage Alerts', 'manage alerts', 'Use Remote Interfaces', 'use remote interfaces', 'Use Client Integration Features', 'use client integration features', 'Open', 'open', 'Edit Personal User Information', 'edit personal user information'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are Manage Permissions, View Web Analytics Data, Create Subsites, Manage Web Site, Add and Customize Pages, Apply Themes and Borders, Apply Style Sheets, Create Groups, Browse Directories, Use Self-Service Site Creation, View Pages, Enumerate Permissions, Browse User Information, Manage Alerts, Use Remote Interfaces, Use Client Integration Features, Open, Edit Personal User Information")
        end
      end
      if value.kind_of?(String)
        unless ['Manage Permissions', 'manage permissions', 'View Web Analytics Data', 'view web analytics data', 'Create Subsites', 'create subsites', 'Manage Web Site', 'manage web site', 'Add and Customize Pages', 'add and customize pages', 'Apply Themes and Borders', 'apply themes and borders', 'Apply Style Sheets', 'apply style sheets', 'Create Groups', 'create groups', 'Browse Directories', 'browse directories', 'Use Self-Service Site Creation', 'use self-service site creation', 'View Pages', 'view pages', 'Enumerate Permissions', 'enumerate permissions', 'Browse User Information', 'browse user information', 'Manage Alerts', 'manage alerts', 'Use Remote Interfaces', 'use remote interfaces', 'Use Client Integration Features', 'use client integration features', 'Open', 'open', 'Edit Personal User Information', 'edit personal user information'].include?(value)
          fail("Invalid value #{value}. Valid values are Manage Permissions, View Web Analytics Data, Create Subsites, Manage Web Site, Add and Customize Pages, Apply Themes and Borders, Apply Style Sheets, Create Groups, Browse Directories, Use Self-Service Site Creation, View Pages, Enumerate Permissions, Browse User Information, Manage Alerts, Use Remote Interfaces, Use Client Integration Features, Open, Edit Personal User Information")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         PersonalPermissions
  # Type:         string[]
  # IsMandatory:  False
  # Values:       ["Manage Personal Views", "Add/Remove Personal Web Parts", "Update Personal Web Parts"]
  newparam(:dsc_personalpermissions, :array_matching => :all) do
    def mof_type; 'string[]' end
    def mof_is_embedded?; false end
    desc "PersonalPermissions - Personal permissions that need to be configured Valid values are Manage Personal Views, Add/Remove Personal Web Parts, Update Personal Web Parts."
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string or an array of strings")
      end
      if value.kind_of?(Array)
        unless (['Manage Personal Views', 'manage personal views', 'Add/Remove Personal Web Parts', 'add/remove personal web parts', 'Update Personal Web Parts', 'update personal web parts'] & value).count == value.count
          fail("Invalid value #{value}. Valid values are Manage Personal Views, Add/Remove Personal Web Parts, Update Personal Web Parts")
        end
      end
      if value.kind_of?(String)
        unless ['Manage Personal Views', 'manage personal views', 'Add/Remove Personal Web Parts', 'add/remove personal web parts', 'Update Personal Web Parts', 'update personal web parts'].include?(value)
          fail("Invalid value #{value}. Valid values are Manage Personal Views, Add/Remove Personal Web Parts, Update Personal Web Parts")
        end
      end
    end
    munge do |value|
      Array(value)
    end
  end

  # Name:         AllPermissions
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allpermissions) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllPermissions - Set all permissions"
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

Puppet::Type.type(:dsc_spwebapppermissions).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
