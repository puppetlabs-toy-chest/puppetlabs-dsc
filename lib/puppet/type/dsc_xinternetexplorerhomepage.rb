require 'pathname'

Puppet::Type.newtype(:dsc_xinternetexplorerhomepage) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xInternetExplorerHomePage resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xInternetExplorerHomePage/DSCResources/xInternetExplorerHomePage/xInternetExplorerHomePage.schema.mof
  }

  validate do
      fail('dsc_startpage is a required attribute') if self[:dsc_startpage].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xInternetExplorerHomePage"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "xInternetExplorerHomePage"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xInternetExplorerHomePage"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    newvalue(:absent)  { provider.destroy }
    defaultto { :present }
  end

  # Name:         StartPage
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_startpage) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Specifies the URL for the home page of Internet Explorer."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SecondaryStartPages
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_secondarystartpages) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Specifies the URL for the secondary home pages of Internet Explorer."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         Ensure
  # Type:         string
  # IsMandatory:  False
  # Values:       ["Present", "Absent"]
  newparam(:dsc_ensure) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "Should the IE home page is configured or unconfigured."
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


end
