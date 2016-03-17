require 'pathname'

Puppet::Type.newtype(:dsc_xspuserprofileserviceapp) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC xSPUserProfileServiceApp resource type.
    Automatically generated from
    'xSharePoint/Modules/xSharePoint/DSCResources/MSFT_xSPUserProfileServiceApp/MSFT_xSPUserProfileServiceApp.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_name is a required attribute') if self[:dsc_name].nil?
    end

  def dscmeta_resource_friendly_name; 'xSPUserProfileServiceApp' end
  def dscmeta_resource_name; 'MSFT_xSPUserProfileServiceApp' end
  def dscmeta_module_name; 'xSharePoint' end
  def dscmeta_module_version; '0.12.0.0' end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         Name
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_name) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Name - The name of the user profile service"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ApplicationPool
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_applicationpool) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ApplicationPool - The name of the application pool to run the service app in"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FarmAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_farmaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "FarmAccount - The farm account to use when provisioning the app"
    validate do |value|
      unless value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be a hash")
      end
      PuppetX::Dsc::TypeHelpers.validate_MSFT_Credential("FarmAccount", value)
    end
  end

  # Name:         MySiteHostLocation
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_mysitehostlocation) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "MySiteHostLocation - The URL of the my site host collection"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProfileDBName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_profiledbname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProfileDBName - The name of the profile database"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ProfileDBServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_profiledbserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ProfileDBServer - The name of the server to host the profile database"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SocialDBName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_socialdbname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SocialDBName - The name of the social database"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SocialDBServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_socialdbserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SocialDBServer - The name of the database server to host the social database"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SyncDBName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_syncdbname) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SyncDBName - The name of the sync database"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SyncDBServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_syncdbserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SyncDBServer - The name of the database server to host the sync database"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         InstallAccount
  # Type:         MSFT_Credential
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_installaccount) do
    def mof_type; 'MSFT_Credential' end
    def mof_is_embedded?; true end
    desc "InstallAccount - POWERSHELL 4 ONLY: The account to run this resource as, use PsDscRunAsAccount if using PowerShell 5"
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

Puppet::Type.type(:dsc_xspuserprofileserviceapp).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
