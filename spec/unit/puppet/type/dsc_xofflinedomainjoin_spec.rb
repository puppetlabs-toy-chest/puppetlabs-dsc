#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xofflinedomainjoin) do

  let :dsc_xofflinedomainjoin do
    Puppet::Type.type(:dsc_xofflinedomainjoin).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xofflinedomainjoin).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
      :dsc_requestfile => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xofflinedomainjoin.to_s).to eq("Dsc_xofflinedomainjoin[foo]")
  end

  it 'should require that dsc_issingleinstance is specified' do
    #dsc_xofflinedomainjoin[:dsc_issingleinstance]
    expect { Puppet::Type.type(:dsc_xofflinedomainjoin).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_issingleinstance is a required attribute/)
  end

  it 'should accept dsc_issingleinstance predefined value Yes' do
    dsc_xofflinedomainjoin[:dsc_issingleinstance] = 'Yes'
    expect(dsc_xofflinedomainjoin[:dsc_issingleinstance]).to eq('Yes')
  end

  it 'should accept dsc_issingleinstance predefined value yes' do
    dsc_xofflinedomainjoin[:dsc_issingleinstance] = 'yes'
    expect(dsc_xofflinedomainjoin[:dsc_issingleinstance]).to eq('yes')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xofflinedomainjoin[:dsc_issingleinstance] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issingleinstance' do
    expect{dsc_xofflinedomainjoin[:dsc_issingleinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_issingleinstance' do
    expect{dsc_xofflinedomainjoin[:dsc_issingleinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_issingleinstance' do
    expect{dsc_xofflinedomainjoin[:dsc_issingleinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issingleinstance' do
    expect{dsc_xofflinedomainjoin[:dsc_issingleinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_requestfile' do
    expect{dsc_xofflinedomainjoin[:dsc_requestfile] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_requestfile' do
    expect{dsc_xofflinedomainjoin[:dsc_requestfile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_requestfile' do
    expect{dsc_xofflinedomainjoin[:dsc_requestfile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_requestfile' do
    expect{dsc_xofflinedomainjoin[:dsc_requestfile] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xofflinedomainjoin)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xofflinedomainjoin)
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

  end
end
