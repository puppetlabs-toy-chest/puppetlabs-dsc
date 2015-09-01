require 'pathname'

Puppet::Type.newtype(:dsc_xwebsitedefaults) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'

  provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
    defaultfor :operatingsystem => :windows
  end

  @doc = %q{
    The DSC xWebSiteDefaults resource type.
    Originally generated from the following schema.mof file:
      import/dsc_resources/xWebAdministration/DSCResources/MSFT_xWebSiteDefaults/MSFT_xWebSiteDefaults.schema.mof
  }

  validate do
      fail('dsc_applyto is a required attribute') if self[:dsc_applyto].nil?
    end

  newparam(:dscmeta_resource_friendly_name) do
    defaultto "xWebSiteDefaults"
  end

  newparam(:dscmeta_resource_name) do
    defaultto "MSFT_xWebSiteDefaults"
  end

  newparam(:dscmeta_import_resource) do
    newvalues(true, false)

    munge do |value|
      provider.munge_boolean(value.to_s)
    end

    defaultto true
  end

  newparam(:dscmeta_module_name) do
    defaultto "xWebAdministration"
  end

  newparam(:dscmeta_module_version) do
    defaultto "1.7.0.0"
  end

  newparam(:name, :namevar => true ) do
  end

  ensurable do
    newvalue(:exists?) { provider.exists? }
    newvalue(:present) { provider.create }
    defaultto { :present }
  end

  # Name:         ApplyTo
  # Type:         string
  # IsMandatory:  True
  # Values:       ["Machine"]
  newparam(:dsc_applyto) do
    desc "Dummy value because we need a key, always 'Machine'"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['Machine', 'machine'].include?(value)
        fail("Invalid value '#{value}'. Valid values are Machine")
      end
    end
  end

  # Name:         LogFormat
  # Type:         string
  # IsMandatory:  False
  # Values:       ["W3C", "IIS", "NCSA", "Custom"]
  newparam(:dsc_logformat) do
    desc "sites/siteDefaults/logFile/logFormat"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['W3C', 'w3c', 'IIS', 'iis', 'NCSA', 'ncsa', 'Custom', 'custom'].include?(value)
        fail("Invalid value '#{value}'. Valid values are W3C, IIS, NCSA, Custom")
      end
    end
  end

  # Name:         LogDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_logdirectory) do
    desc "sites/siteDefaults/logFile/directory"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TraceLogDirectory
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_tracelogdirectory) do
    desc "sites/siteDefaults/traceFailedRequestsLogging/directory"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         DefaultApplicationPool
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_defaultapplicationpool) do
    desc "sites/applicationDefaults/applicationPool"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AllowSubDirConfig
  # Type:         string
  # IsMandatory:  False
  # Values:       ["true", "false"]
  newparam(:dsc_allowsubdirconfig) do
    desc "sites/virtualDirectoryDefaults/allowSubDirConfig"
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['true', 'true', 'false', 'false'].include?(value)
        fail("Invalid value '#{value}'. Valid values are true, false")
      end
    end
  end


end
