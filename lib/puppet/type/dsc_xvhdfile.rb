require 'pathname'

Puppet::Type.newtype(:dsc_xvhdfile) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'

    class PuppetX::Dsc::TypeHelpers
      def self.validate_MSFT_xFileDirectory(mof_type_map, name, value)
        required = ['destinationpath']
        allowed = ['sourcepath','ensure','type','recurse','force','content','attributes']
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
            validate_mof_type(mof_type_map[key], 'MSFT_xFileDirectory', key, lowkey_hash[key])
          end
        end
      end
    end

  @doc = %q{
    The DSC xVhdFile resource type.
    Automatically generated from
    'xHyper-V/DSCResources/MSFT_xVhdFileDirectory/MSFT_xVhdFileDirectory.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_vhdpath is a required attribute') if self[:dsc_vhdpath].nil?
    end

  def dscmeta_resource_friendly_name; 'xVhdFile' end
  def dscmeta_resource_name; 'MSFT_xVhdFileDirectory' end
  def dscmeta_module_name; 'xHyper-V' end
  def dscmeta_module_version; '3.5.0.0' end

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

  # Name:         VhdPath
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_vhdpath) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "VhdPath - Path to the VHD"
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         FileDirectory
  # Type:         MSFT_xFileDirectory[]
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_filedirectory, :array_matching => :all) do
    def mof_type; 'MSFT_xFileDirectory[]' end
    def mof_is_embedded?; true end
    def mof_type_map
      {"destinationpath"=>{:type=>"string"}, "sourcepath"=>{:type=>"string"}, "ensure"=>{:type=>"string", :values=>["Present", "Absent"]}, "type"=>{:type=>"string", :values=>["File", "Directory"]}, "recurse"=>{:type=>"boolean"}, "force"=>{:type=>"boolean"}, "content"=>{:type=>"string"}, "attributes"=>{:type=>"string[]", :values=>["ReadOnly", "Hidden", "System", "Archive"]}}
    end
    desc "FileDirectory - The FileDirectory objects to copy to the VHD"
    validate do |value|
      unless value.kind_of?(Array) || value.kind_of?(Hash)
        fail("Invalid value '#{value}'. Should be an array of hashes or a hash")
      end
      (value.kind_of?(Hash) ? [value] : value).each_with_index do |v, i|
        fail "FileDirectory value at index #{i} should be a Hash" unless v.is_a? Hash

        PuppetX::Dsc::TypeHelpers.validate_MSFT_xFileDirectory(mof_type_map, "FileDirectory", v)
      end
    end
    munge do |value|
      value.kind_of?(Hash) ?
        [PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, value)] :
        value.map { |v| PuppetX::Dsc::TypeHelpers.munge_embeddedinstance(mof_type_map, v) }
    end
  end

  # Name:         CheckSum
  # Type:         string
  # IsMandatory:  False
  # Values:       ["ModifiedDate", "SHA-1", "SHA-256", "SHA-512"]
  newparam(:dsc_checksum) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "CheckSum - Valid values are ModifiedDate, SHA-1, SHA-256, SHA-512."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['ModifiedDate', 'modifieddate', 'SHA-1', 'sha-1', 'SHA-256', 'sha-256', 'SHA-512', 'sha-512'].include?(value)
        fail("Invalid value '#{value}'. Valid values are ModifiedDate, SHA-1, SHA-256, SHA-512")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_xvhdfile).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10240.16384'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
