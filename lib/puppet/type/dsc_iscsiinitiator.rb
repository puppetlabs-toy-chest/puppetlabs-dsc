require 'pathname'

Puppet::Type.newtype(:dsc_iscsiinitiator) do
  require Pathname.new(__FILE__).dirname + '../../' + 'puppet/type/base_dsc'
  require Pathname.new(__FILE__).dirname + '../../puppet_x/puppetlabs/dsc_type_helpers'


  @doc = %q{
    The DSC iSCSIInitiator resource type.
    Automatically generated from
    'iSCSIDsc/DSCResources/DSR_iSCSIInitiator/DSR_iSCSIInitiator.schema.mof'

    To learn more about PowerShell Desired State Configuration, please
    visit https://technet.microsoft.com/en-us/library/dn249912.aspx.

    For more information about built-in DSC Resources, please visit
    https://technet.microsoft.com/en-us/library/dn249921.aspx.

    For more information about xDsc Resources, please visit
    https://github.com/PowerShell/DscResources.
  }

  validate do
      fail('dsc_nodeaddress is a required attribute') if self[:dsc_nodeaddress].nil?
    end

  def dscmeta_resource_friendly_name; 'iSCSIInitiator' end
  def dscmeta_resource_name; 'DSR_iSCSIInitiator' end
  def dscmeta_module_name; 'iSCSIDsc' end
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
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_sensitive_hash!(value)
    end
  end

  # Name:         NodeAddress
  # Type:         string
  # IsMandatory:  True
  # Values:       None
  newparam(:dsc_nodeaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "NodeAddress - Represents the IQN of the discovered target."
    isrequired
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TargetPortalAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_targetportaladdress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TargetPortalAddress - Specifies the IP address or DNS name of the target portal."
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
    desc "Ensure - Ensures that Target is Absent or Present. Valid values are Present, Absent."
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

  # Name:         InitiatorPortalAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_initiatorportaladdress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InitiatorPortalAddress - Specifies the IP address associated with the target portal."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TargetPortalPortNumber
  # Type:         uint16
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_targetportalportnumber) do
    def mof_type; 'uint16' end
    def mof_is_embedded?; false end
    desc "TargetPortalPortNumber - Specifies the TCP/IP port number for the target portal."
    validate do |value|
      unless (value.kind_of?(Numeric) && value >= 0) || (value.to_i.to_s == value && value.to_i >= 0)
          fail("Invalid value #{value}. Should be a unsigned Integer")
      end
    end
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_integer(value)
    end
  end

  # Name:         InitiatorInstanceName
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_initiatorinstancename) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InitiatorInstanceName - The name of the initiator instance that the iSCSI initiator service uses to send SendTargets requests to the target portal."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         AuthenticationType
  # Type:         string
  # IsMandatory:  False
  # Values:       ["None", "OneWayCHAP", "MutualCHAP"]
  newparam(:dsc_authenticationtype) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "AuthenticationType - Specifies the type of authentication to use when logging into the target. Valid values are None, OneWayCHAP, MutualCHAP."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
      unless ['None', 'none', 'OneWayCHAP', 'onewaychap', 'MutualCHAP', 'mutualchap'].include?(value)
        fail("Invalid value '#{value}'. Valid values are None, OneWayCHAP, MutualCHAP")
      end
    end
  end

  # Name:         ChapUsername
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_chapusername) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ChapUsername - Specifies the user name to use when establishing a connection authenticated by using Mutual CHAP."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         ChapSecret
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_chapsecret) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ChapSecret - Specifies the CHAP secret to use when establishing a connection authenticated by using CHAP."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IsDataDigest
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isdatadigest) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsDataDigest - Enables data digest when the initiator logs into the target portal."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsHeaderDigest
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isheaderdigest) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsHeaderDigest - Enables header digest when the initiator logs into the target portal. By not specifying this parameter, the digest setting is determined by the initiator kernel mode driver."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsMultipathEnabled
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ismultipathenabled) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsMultipathEnabled - Indicates that the initiator has enabled Multipath I/O (MPIO) and it will be used when logging into the target portal."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         IsPersistent
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_ispersistent) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsPersistent - Specifies that the session is to be automatically connected after each restart."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ReportToPnP
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_reporttopnp) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "ReportToPnP - Specifies that the operation is reported to PNP."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         iSNSServer
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isnsserver) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "iSNSServer - Specifies the name of an iSNS Server to register this Initiator with."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IsConnected
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isconnected) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsConnected - Is the target connected to the server."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         ConnectionIdentifier
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_connectionidentifier) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "ConnectionIdentifier - This is the current connection identifier for this target connection."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         SessionIdentifier
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_sessionidentifier) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "SessionIdentifier - This is the current session identifier for this target session."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         IsDiscovered
  # Type:         boolean
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_isdiscovered) do
    def mof_type; 'boolean' end
    def mof_is_embedded?; false end
    desc "IsDiscovered - Is the target discovered in this session."
    validate do |value|
    end
    newvalues(true, false)
    munge do |value|
      PuppetX::Dsc::TypeHelpers.munge_boolean(value.to_s)
    end
  end

  # Name:         InitiatorNodeAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_initiatornodeaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "InitiatorNodeAddress - The Initiator Node address assigned to this session."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end

  # Name:         TargetNodeAddress
  # Type:         string
  # IsMandatory:  False
  # Values:       None
  newparam(:dsc_targetnodeaddress) do
    def mof_type; 'string' end
    def mof_is_embedded?; false end
    desc "TargetNodeAddress - The Target Node address assigned to this session."
    validate do |value|
      unless value.kind_of?(String)
        fail("Invalid value '#{value}'. Should be a string")
      end
    end
  end


  def builddepends
    pending_relations = super()
    PuppetX::Dsc::TypeHelpers.ensure_reboot_relationship(self, pending_relations)
  end
end

Puppet::Type.type(:dsc_iscsiinitiator).provide :powershell, :parent => Puppet::Type.type(:base_dsc).provider(:powershell) do
  confine :true => (Gem::Version.new(Facter.value(:powershell_version)) >= Gem::Version.new('5.0.10586.117'))
  defaultfor :operatingsystem => :windows

  mk_resource_methods
end
