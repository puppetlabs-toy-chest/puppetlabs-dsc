require 'pathname'

Puppet::Type.newtype(:dsc_spdesignersettings) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC SPDesignerSettings resource type.
    Automatically generated from
    'SharePointDsc/DSCResources/MSFT_SPDesignerSettings/MSFT_SPDesignerSettings.schema.mof'

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

  def dscmeta_resource_friendly_name; 'SPDesignerSettings' end
  def dscmeta_resource_name; 'MSFT_SPDesignerSettings' end
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
    desc "Url - The URL of the web application or site collection to configure"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SettingsScope
  # Type:         string
  # IsMandatory:  False
  # Values:       ["WebApplication", "SiteCollection"]
  newparam(:dsc_settingsscope) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SettingsScope - Define the scope of the configuration - either WebApplication or SiteCollection Valid values are WebApplication, SiteCollection."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['WebApplication', 'webapplication', 'SiteCollection', 'sitecollection'].include?(value)
        fail("Invalid value '#{value}'. Valid values are WebApplication, SiteCollection")
      end
    end
  end

  # Name:         AllowSharePointDesigner
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowsharepointdesigner) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowSharePointDesigner - Allow the use of SharePoint Designer"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowDetachPagesFromDefinition
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowdetachpagesfromdefinition) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowDetachPagesFromDefinition - Allow pages to be un-ghosted by SharePoint Designer"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowCustomiseMasterPage
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowcustomisemasterpage) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowCustomiseMasterPage - Allow masterpages to be changed by SharePoint Designer"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowManageSiteURLStructure
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowmanagesiteurlstructure) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowManageSiteURLStructure - Allow site URL structure to be changed by SharePoint Designer"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowCreateDeclarativeWorkflow
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowcreatedeclarativeworkflow) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowCreateDeclarativeWorkflow - Allow users to create declarative workflows with SharePoint Designer"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowSavePublishDeclarativeWorkflow
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowsavepublishdeclarativeworkflow) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowSavePublishDeclarativeWorkflow - Allow users to save and re-publish declarative workflows with SharePoint Designer"
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         AllowSaveDeclarativeWorkflowAsTemplate
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_allowsavedeclarativeworkflowastemplate) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "AllowSaveDeclarativeWorkflowAsTemplate - Allow users to save declarative workflows as a template from SharePoint Designer"
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

Puppet::Type.type(:dsc_spdesignersettings).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
