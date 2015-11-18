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
      :dsc_enabled => 'True',
      :dsc_action => 'NotConfigured',
      :dsc_profile => ["foo", "bar", "spec"],
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

  it 'should accept dsc_enabled predefined value True' do
    dsc_xfirewall[:dsc_enabled] = 'True'
    expect(dsc_xfirewall[:dsc_enabled]).to eq('True')
  end

  it 'should accept dsc_enabled predefined value true' do
    dsc_xfirewall[:dsc_enabled] = 'true'
    expect(dsc_xfirewall[:dsc_enabled]).to eq('true')
  end

  it 'should accept dsc_enabled predefined value False' do
    dsc_xfirewall[:dsc_enabled] = 'False'
    expect(dsc_xfirewall[:dsc_enabled]).to eq('False')
  end

  it 'should accept dsc_enabled predefined value false' do
    dsc_xfirewall[:dsc_enabled] = 'false'
    expect(dsc_xfirewall[:dsc_enabled]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_enabled] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_xfirewall[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_enabled' do
    expect{dsc_xfirewall[:dsc_enabled] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_xfirewall[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_xfirewall[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_action predefined value NotConfigured' do
    dsc_xfirewall[:dsc_action] = 'NotConfigured'
    expect(dsc_xfirewall[:dsc_action]).to eq('NotConfigured')
  end

  it 'should accept dsc_action predefined value notconfigured' do
    dsc_xfirewall[:dsc_action] = 'notconfigured'
    expect(dsc_xfirewall[:dsc_action]).to eq('notconfigured')
  end

  it 'should accept dsc_action predefined value Allow' do
    dsc_xfirewall[:dsc_action] = 'Allow'
    expect(dsc_xfirewall[:dsc_action]).to eq('Allow')
  end

  it 'should accept dsc_action predefined value allow' do
    dsc_xfirewall[:dsc_action] = 'allow'
    expect(dsc_xfirewall[:dsc_action]).to eq('allow')
  end

  it 'should accept dsc_action predefined value Block' do
    dsc_xfirewall[:dsc_action] = 'Block'
    expect(dsc_xfirewall[:dsc_action]).to eq('Block')
  end

  it 'should accept dsc_action predefined value block' do
    dsc_xfirewall[:dsc_action] = 'block'
    expect(dsc_xfirewall[:dsc_action]).to eq('block')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xfirewall[:dsc_action] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_action' do
    expect{dsc_xfirewall[:dsc_action] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_action' do
    expect{dsc_xfirewall[:dsc_action] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_action' do
    expect{dsc_xfirewall[:dsc_action] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_action' do
    expect{dsc_xfirewall[:dsc_action] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_profile' do
    dsc_xfirewall[:dsc_profile] = ["foo", "bar", "spec"]
    expect(dsc_xfirewall[:dsc_profile]).to eq(["foo", "bar", "spec"])
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

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xfirewall)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xfirewall)
    end

    describe "when dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Invoke-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Test" do
        expect(@provider.ps_script_content('test')).to match(/Method\s+=\s*'test'/)
      end

      it "should compute powershell dsc set script with Invoke-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Set" do
        expect(@provider.ps_script_content('set')).to match(/Method\s+=\s*'set'/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xfirewall.original_parameters[:dsc_ensure] = 'present'
        dsc_xfirewall[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xfirewall)
      end

      it "should update :ensure to :present" do
        expect(dsc_xfirewall[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xfirewall.original_parameters[:dsc_ensure] = 'absent'
        dsc_xfirewall[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xfirewall)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xfirewall[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
