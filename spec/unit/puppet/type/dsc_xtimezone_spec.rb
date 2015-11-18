#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xtimezone) do

  let :dsc_xtimezone do
    Puppet::Type.type(:dsc_xtimezone).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
    )
  end

  it "should stringify normally" do
    expect(dsc_xtimezone.to_s).to eq("Dsc_xtimezone[foo]")
  end

  it 'should require that dsc_issingleinstance is specified' do
    #dsc_xtimezone[:dsc_issingleinstance]
    expect { Puppet::Type.type(:dsc_xtimezone).new(
      :name     => 'foo',
      :dsc_timezone => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_issingleinstance is a required attribute/)
  end

  it 'should accept dsc_issingleinstance predefined value Yes' do
    dsc_xtimezone[:dsc_issingleinstance] = 'Yes'
    expect(dsc_xtimezone[:dsc_issingleinstance]).to eq('Yes')
  end

  it 'should accept dsc_issingleinstance predefined value yes' do
    dsc_xtimezone[:dsc_issingleinstance] = 'yes'
    expect(dsc_xtimezone[:dsc_issingleinstance]).to eq('yes')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xtimezone[:dsc_issingleinstance] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issingleinstance' do
    expect{dsc_xtimezone[:dsc_issingleinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_issingleinstance' do
    expect{dsc_xtimezone[:dsc_issingleinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_issingleinstance' do
    expect{dsc_xtimezone[:dsc_issingleinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issingleinstance' do
    expect{dsc_xtimezone[:dsc_issingleinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_timezone' do
    expect{dsc_xtimezone[:dsc_timezone] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_timezone' do
    expect{dsc_xtimezone[:dsc_timezone] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_timezone' do
    expect{dsc_xtimezone[:dsc_timezone] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_timezone' do
    expect{dsc_xtimezone[:dsc_timezone] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xtimezone)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xtimezone)
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
