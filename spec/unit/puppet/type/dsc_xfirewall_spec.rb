#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xfirewall) do

  let :dsc_xfirewall do
    Puppet::Type.type(:dsc_xfirewall).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xfirewall.to_s).to eq("Dsc_xfirewall[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xfirewall[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xfirewall[:dsc_name]
    expect { Puppet::Type.type(:dsc_xfirewall).new(
      :name     => 'foo',
      :dsc_displayname => 'foo',
      :dsc_displaygroup => 'foo',
      :dsc_ensure => 'Present',
      :dsc_access => 'NotConfigured',
      :dsc_state => 'Enabled',
      :dsc_profile => 'Any',
      :dsc_direction => 'Inbound',
      :dsc_remoteport => ["foo", "bar", "spec"],
      :dsc_localport => ["foo", "bar", "spec"],
      :dsc_protocol => 'foo',
      :dsc_description => 'foo',
      :dsc_applicationpath => 'foo',
      :dsc_service => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xfirewall[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xfirewall[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xfirewall[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xfirewall[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_xfirewall[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_xfirewall[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_xfirewall[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_xfirewall[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displaygroup' do
    expect{dsc_xfirewall[:dsc_displaygroup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displaygroup' do
    expect{dsc_xfirewall[:dsc_displaygroup] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displaygroup' do
    expect{dsc_xfirewall[:dsc_displaygroup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displaygroup' do
    expect{dsc_xfirewall[:dsc_displaygroup] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xfirewall[:dsc_ensure] = 'Present'
    expect(dsc_xfirewall[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xfirewall[:dsc_ensure] = 'present'
    expect(dsc_xfirewall[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xfirewall[:dsc_ensure] = 'present'
    expect(dsc_xfirewall[:ensure]).to eq(dsc_xfirewall[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xfirewall[:dsc_ensure] = 'Absent'
    expect(dsc_xfirewall[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xfirewall[:dsc_ensure] = 'absent'
    expect(dsc_xfirewall[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xfirewall[:dsc_ensure] = 'absent'
    expect(dsc_xfirewall[:ensure]).to eq(dsc_xfirewall[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xfirewall[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xfirewall[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xfirewall[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xfirewall[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_access predefined value NotConfigured' do
    dsc_xfirewall[:dsc_access] = 'NotConfigured'
    expect(dsc_xfirewall[:dsc_access]).to eq('NotConfigured')
  end

  it 'should accept dsc_access predefined value notconfigured' do
    dsc_xfirewall[:dsc_access] = 'notconfigured'
    expect(dsc_xfirewall[:dsc_access]).to eq('notconfigured')
  end

  it 'should accept dsc_access predefined value Allow' do
    dsc_xfirewall[:dsc_access] = 'Allow'
    expect(dsc_xfirewall[:dsc_access]).to eq('Allow')
  end

  it 'should accept dsc_access predefined value allow' do
    dsc_xfirewall[:dsc_access] = 'allow'
    expect(dsc_xfirewall[:dsc_access]).to eq('allow')
  end

  it 'should accept dsc_access predefined value Block' do
    dsc_xfirewall[:dsc_access] = 'Block'
    expect(dsc_xfirewall[:dsc_access]).to eq('Block')
  end

  it 'should accept dsc_access predefined value block' do
    dsc_xfirewall[:dsc_access] = 'block'
    expect(dsc_xfirewall[:dsc_access]).to eq('block')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_access] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_access' do
    expect{dsc_xfirewall[:dsc_access] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_access' do
    expect{dsc_xfirewall[:dsc_access] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_access' do
    expect{dsc_xfirewall[:dsc_access] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_access' do
    expect{dsc_xfirewall[:dsc_access] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_state predefined value Enabled' do
    dsc_xfirewall[:dsc_state] = 'Enabled'
    expect(dsc_xfirewall[:dsc_state]).to eq('Enabled')
  end

  it 'should accept dsc_state predefined value enabled' do
    dsc_xfirewall[:dsc_state] = 'enabled'
    expect(dsc_xfirewall[:dsc_state]).to eq('enabled')
  end

  it 'should accept dsc_state predefined value Disabled' do
    dsc_xfirewall[:dsc_state] = 'Disabled'
    expect(dsc_xfirewall[:dsc_state]).to eq('Disabled')
  end

  it 'should accept dsc_state predefined value disabled' do
    dsc_xfirewall[:dsc_state] = 'disabled'
    expect(dsc_xfirewall[:dsc_state]).to eq('disabled')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_state] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xfirewall[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xfirewall[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xfirewall[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xfirewall[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_profile predefined value Any' do
    dsc_xfirewall[:dsc_profile] = 'Any'
    expect(dsc_xfirewall[:dsc_profile]).to eq('Any')
  end

  it 'should accept dsc_profile predefined value any' do
    dsc_xfirewall[:dsc_profile] = 'any'
    expect(dsc_xfirewall[:dsc_profile]).to eq('any')
  end

  it 'should accept dsc_profile predefined value Public' do
    dsc_xfirewall[:dsc_profile] = 'Public'
    expect(dsc_xfirewall[:dsc_profile]).to eq('Public')
  end

  it 'should accept dsc_profile predefined value public' do
    dsc_xfirewall[:dsc_profile] = 'public'
    expect(dsc_xfirewall[:dsc_profile]).to eq('public')
  end

  it 'should accept dsc_profile predefined value Private' do
    dsc_xfirewall[:dsc_profile] = 'Private'
    expect(dsc_xfirewall[:dsc_profile]).to eq('Private')
  end

  it 'should accept dsc_profile predefined value private' do
    dsc_xfirewall[:dsc_profile] = 'private'
    expect(dsc_xfirewall[:dsc_profile]).to eq('private')
  end

  it 'should accept dsc_profile predefined value Domain' do
    dsc_xfirewall[:dsc_profile] = 'Domain'
    expect(dsc_xfirewall[:dsc_profile]).to eq('Domain')
  end

  it 'should accept dsc_profile predefined value domain' do
    dsc_xfirewall[:dsc_profile] = 'domain'
    expect(dsc_xfirewall[:dsc_profile]).to eq('domain')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_profile] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_profile' do
    dsc_xfirewall[:dsc_profile] = ["Any", "Public", "Private", "Domain"]
    expect(dsc_xfirewall[:dsc_profile]).to eq(["Any", "Public", "Private", "Domain"])
  end

  it 'should not accept boolean for dsc_profile' do
    expect{dsc_xfirewall[:dsc_profile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_profile' do
    expect{dsc_xfirewall[:dsc_profile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_profile' do
    expect{dsc_xfirewall[:dsc_profile] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_direction predefined value Inbound' do
    dsc_xfirewall[:dsc_direction] = 'Inbound'
    expect(dsc_xfirewall[:dsc_direction]).to eq('Inbound')
  end

  it 'should accept dsc_direction predefined value inbound' do
    dsc_xfirewall[:dsc_direction] = 'inbound'
    expect(dsc_xfirewall[:dsc_direction]).to eq('inbound')
  end

  it 'should accept dsc_direction predefined value Outbound' do
    dsc_xfirewall[:dsc_direction] = 'Outbound'
    expect(dsc_xfirewall[:dsc_direction]).to eq('Outbound')
  end

  it 'should accept dsc_direction predefined value outbound' do
    dsc_xfirewall[:dsc_direction] = 'outbound'
    expect(dsc_xfirewall[:dsc_direction]).to eq('outbound')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_direction] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_direction' do
    expect{dsc_xfirewall[:dsc_direction] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_direction' do
    expect{dsc_xfirewall[:dsc_direction] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_direction' do
    expect{dsc_xfirewall[:dsc_direction] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_direction' do
    expect{dsc_xfirewall[:dsc_direction] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_remoteport' do
    dsc_xfirewall[:dsc_remoteport] = ["foo", "bar", "spec"]
    expect(dsc_xfirewall[:dsc_remoteport]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_remoteport' do
    expect{dsc_xfirewall[:dsc_remoteport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_remoteport' do
    expect{dsc_xfirewall[:dsc_remoteport] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_remoteport' do
    expect{dsc_xfirewall[:dsc_remoteport] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_localport' do
    dsc_xfirewall[:dsc_localport] = ["foo", "bar", "spec"]
    expect(dsc_xfirewall[:dsc_localport]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_localport' do
    expect{dsc_xfirewall[:dsc_localport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_localport' do
    expect{dsc_xfirewall[:dsc_localport] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_localport' do
    expect{dsc_xfirewall[:dsc_localport] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_protocol' do
    expect{dsc_xfirewall[:dsc_protocol] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_protocol' do
    expect{dsc_xfirewall[:dsc_protocol] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_protocol' do
    expect{dsc_xfirewall[:dsc_protocol] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_protocol' do
    expect{dsc_xfirewall[:dsc_protocol] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xfirewall[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xfirewall[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xfirewall[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xfirewall[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpath' do
    expect{dsc_xfirewall[:dsc_applicationpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpath' do
    expect{dsc_xfirewall[:dsc_applicationpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpath' do
    expect{dsc_xfirewall[:dsc_applicationpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpath' do
    expect{dsc_xfirewall[:dsc_applicationpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_service' do
    expect{dsc_xfirewall[:dsc_service] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_service' do
    expect{dsc_xfirewall[:dsc_service] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_service' do
    expect{dsc_xfirewall[:dsc_service] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_service' do
    expect{dsc_xfirewall[:dsc_service] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xfirewall)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xfirewall)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Import-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script with Import-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Import-DscResource/)
      end

    end

    describe "when dscmeta_import_resource is false" do

      it "should compute powershell dsc test script without Import-DscResource" do
        dsc_xfirewall[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xfirewall[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xfirewall.original_parameters[:dsc_ensure] = 'present'
        dsc_xfirewall[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xfirewall)
      end

      it "should update :ensure to :present" do
        expect(dsc_xfirewall[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xfirewall.original_parameters[:dsc_ensure] = 'absent'
        dsc_xfirewall[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xfirewall)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xfirewall[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xfirewall)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xfirewall)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xFirewall as $MSFT_xFirewall1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xFirewall/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xfirewall[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xfirewall)
      end

      it "should update :ensure to :present" do
        expect(dsc_xfirewall[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xfirewall[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xfirewall)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xfirewall[:ensure]).to eq(:absent)
      end

    end

  end
end
