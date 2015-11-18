#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexcheventloglevel) do

  let :dsc_xexcheventloglevel do
    Puppet::Type.type(:dsc_xexcheventloglevel).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexcheventloglevel.to_s).to eq("Dsc_xexcheventloglevel[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexcheventloglevel[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexcheventloglevel).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_level => 'Lowest',
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexcheventloglevel[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexcheventloglevel[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexcheventloglevel[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexcheventloglevel[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexcheventloglevel[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexcheventloglevel[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexcheventloglevel[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexcheventloglevel[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexcheventloglevel[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_level predefined value Lowest' do
    dsc_xexcheventloglevel[:dsc_level] = 'Lowest'
    expect(dsc_xexcheventloglevel[:dsc_level]).to eq('Lowest')
  end

  it 'should accept dsc_level predefined value lowest' do
    dsc_xexcheventloglevel[:dsc_level] = 'lowest'
    expect(dsc_xexcheventloglevel[:dsc_level]).to eq('lowest')
  end

  it 'should accept dsc_level predefined value Low' do
    dsc_xexcheventloglevel[:dsc_level] = 'Low'
    expect(dsc_xexcheventloglevel[:dsc_level]).to eq('Low')
  end

  it 'should accept dsc_level predefined value low' do
    dsc_xexcheventloglevel[:dsc_level] = 'low'
    expect(dsc_xexcheventloglevel[:dsc_level]).to eq('low')
  end

  it 'should accept dsc_level predefined value Medium' do
    dsc_xexcheventloglevel[:dsc_level] = 'Medium'
    expect(dsc_xexcheventloglevel[:dsc_level]).to eq('Medium')
  end

  it 'should accept dsc_level predefined value medium' do
    dsc_xexcheventloglevel[:dsc_level] = 'medium'
    expect(dsc_xexcheventloglevel[:dsc_level]).to eq('medium')
  end

  it 'should accept dsc_level predefined value High' do
    dsc_xexcheventloglevel[:dsc_level] = 'High'
    expect(dsc_xexcheventloglevel[:dsc_level]).to eq('High')
  end

  it 'should accept dsc_level predefined value high' do
    dsc_xexcheventloglevel[:dsc_level] = 'high'
    expect(dsc_xexcheventloglevel[:dsc_level]).to eq('high')
  end

  it 'should accept dsc_level predefined value Expert' do
    dsc_xexcheventloglevel[:dsc_level] = 'Expert'
    expect(dsc_xexcheventloglevel[:dsc_level]).to eq('Expert')
  end

  it 'should accept dsc_level predefined value expert' do
    dsc_xexcheventloglevel[:dsc_level] = 'expert'
    expect(dsc_xexcheventloglevel[:dsc_level]).to eq('expert')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexcheventloglevel[:dsc_level] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_level' do
    expect{dsc_xexcheventloglevel[:dsc_level] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_level' do
    expect{dsc_xexcheventloglevel[:dsc_level] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_level' do
    expect{dsc_xexcheventloglevel[:dsc_level] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_level' do
    expect{dsc_xexcheventloglevel[:dsc_level] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexcheventloglevel)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexcheventloglevel)
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

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
