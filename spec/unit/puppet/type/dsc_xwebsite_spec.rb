#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwebsite) do

  let :dsc_xwebsite do
    Puppet::Type.type(:dsc_xwebsite).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwebsite.to_s).to eq("Dsc_xwebsite[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xwebsite[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xwebsite[:dsc_name]
    expect { Puppet::Type.type(:dsc_xwebsite).new(
      :name     => 'foo',
      :dsc_physicalpath => 'foo',
      :dsc_ensure => 'Present',
      :dsc_state => 'Started',
      :dsc_bindinginfo => {"Port"=>8080, "Protocol"=>"https"},
      :dsc_applicationpool => 'foo',
      :dsc_id => 'foo',
      :dsc_defaultpage => ["foo", "bar", "spec"],
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xwebsite[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xwebsite[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xwebsite[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xwebsite[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_physicalpath' do
    expect{dsc_xwebsite[:dsc_physicalpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_physicalpath' do
    expect{dsc_xwebsite[:dsc_physicalpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_physicalpath' do
    expect{dsc_xwebsite[:dsc_physicalpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_physicalpath' do
    expect{dsc_xwebsite[:dsc_physicalpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xwebsite[:dsc_ensure] = 'Present'
    expect(dsc_xwebsite[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xwebsite[:dsc_ensure] = 'present'
    expect(dsc_xwebsite[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebsite[:dsc_ensure] = 'present'
    expect(dsc_xwebsite[:ensure]).to eq(dsc_xwebsite[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xwebsite[:dsc_ensure] = 'Absent'
    expect(dsc_xwebsite[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xwebsite[:dsc_ensure] = 'absent'
    expect(dsc_xwebsite[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebsite[:dsc_ensure] = 'absent'
    expect(dsc_xwebsite[:ensure]).to eq(dsc_xwebsite[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebsite[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xwebsite[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xwebsite[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xwebsite[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xwebsite[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_state predefined value Started' do
    dsc_xwebsite[:dsc_state] = 'Started'
    expect(dsc_xwebsite[:dsc_state]).to eq('Started')
  end

  it 'should accept dsc_state predefined value started' do
    dsc_xwebsite[:dsc_state] = 'started'
    expect(dsc_xwebsite[:dsc_state]).to eq('started')
  end

  it 'should accept dsc_state predefined value Stopped' do
    dsc_xwebsite[:dsc_state] = 'Stopped'
    expect(dsc_xwebsite[:dsc_state]).to eq('Stopped')
  end

  it 'should accept dsc_state predefined value stopped' do
    dsc_xwebsite[:dsc_state] = 'stopped'
    expect(dsc_xwebsite[:dsc_state]).to eq('stopped')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebsite[:dsc_state] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xwebsite[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xwebsite[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xwebsite[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xwebsite[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept a hash for dsc_bindinginfo' do
    dsc_xwebsite[:dsc_bindinginfo] = {"Port"=>8080, "Protocol"=>"https"}
    expect(dsc_xwebsite[:dsc_bindinginfo]).to eq([{"Port"=>8080, "Protocol"=>"https"}])
  end

  it 'should accept a an array of hashes for dsc_bindinginfo' do
    dsc_xwebsite[:dsc_bindinginfo] = [{"Port"=>8080, "Protocol"=>"https"}]
    expect(dsc_xwebsite[:dsc_bindinginfo]).to eq([{"Port"=>8080, "Protocol"=>"https"}])
  end

  it 'should not accept boolean for dsc_bindinginfo' do
    expect{dsc_xwebsite[:dsc_bindinginfo] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_bindinginfo' do
    expect{dsc_xwebsite[:dsc_bindinginfo] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_bindinginfo' do
    expect{dsc_xwebsite[:dsc_bindinginfo] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpool' do
    expect{dsc_xwebsite[:dsc_applicationpool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpool' do
    expect{dsc_xwebsite[:dsc_applicationpool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpool' do
    expect{dsc_xwebsite[:dsc_applicationpool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpool' do
    expect{dsc_xwebsite[:dsc_applicationpool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_id' do
    expect{dsc_xwebsite[:dsc_id] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_id' do
    expect{dsc_xwebsite[:dsc_id] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_id' do
    expect{dsc_xwebsite[:dsc_id] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_id' do
    expect{dsc_xwebsite[:dsc_id] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_defaultpage' do
    dsc_xwebsite[:dsc_defaultpage] = ["foo", "bar", "spec"]
    expect(dsc_xwebsite[:dsc_defaultpage]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_defaultpage' do
    expect{dsc_xwebsite[:dsc_defaultpage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_defaultpage' do
    expect{dsc_xwebsite[:dsc_defaultpage] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_defaultpage' do
    expect{dsc_xwebsite[:dsc_defaultpage] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwebsite)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwebsite)
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
        dsc_xwebsite.original_parameters[:dsc_ensure] = 'present'
        dsc_xwebsite[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xwebsite)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwebsite[:ensure]).to eq(:present)
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
        dsc_xwebsite.original_parameters[:dsc_ensure] = 'absent'
        dsc_xwebsite[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xwebsite)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwebsite[:ensure]).to eq(:absent)
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
