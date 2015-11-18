#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwaitforcluster) do

  let :dsc_xwaitforcluster do
    Puppet::Type.type(:dsc_xwaitforcluster).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwaitforcluster.to_s).to eq("Dsc_xwaitforcluster[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xwaitforcluster[:dsc_name]
    expect { Puppet::Type.type(:dsc_xwaitforcluster).new(
      :name     => 'foo',
      :dsc_retryintervalsec => 64,
      :dsc_retrycount => 32,
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xwaitforcluster[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xwaitforcluster[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xwaitforcluster[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xwaitforcluster[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_retryintervalsec' do
    expect{dsc_xwaitforcluster[:dsc_retryintervalsec] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retryintervalsec' do
    expect{dsc_xwaitforcluster[:dsc_retryintervalsec] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retryintervalsec' do
    dsc_xwaitforcluster[:dsc_retryintervalsec] = 64
    expect(dsc_xwaitforcluster[:dsc_retryintervalsec]).to eq(64)
  end

  it 'should not accept signed (negative) value for dsc_retryintervalsec' do
    value = -64
    expect(value).to be < 0
    expect{dsc_xwaitforcluster[:dsc_retryintervalsec] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xwaitforcluster[:dsc_retryintervalsec] = '16'
    expect(dsc_xwaitforcluster[:dsc_retryintervalsec]).to eq(16)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xwaitforcluster[:dsc_retryintervalsec] = '32'
    expect(dsc_xwaitforcluster[:dsc_retryintervalsec]).to eq(32)
  end

  it 'should accept string-like uint for dsc_retryintervalsec' do
    dsc_xwaitforcluster[:dsc_retryintervalsec] = '64'
    expect(dsc_xwaitforcluster[:dsc_retryintervalsec]).to eq(64)
  end

  it 'should not accept array for dsc_retrycount' do
    expect{dsc_xwaitforcluster[:dsc_retrycount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retrycount' do
    expect{dsc_xwaitforcluster[:dsc_retrycount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retrycount' do
    dsc_xwaitforcluster[:dsc_retrycount] = 32
    expect(dsc_xwaitforcluster[:dsc_retrycount]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_retrycount' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xwaitforcluster[:dsc_retrycount] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xwaitforcluster[:dsc_retrycount] = '16'
    expect(dsc_xwaitforcluster[:dsc_retrycount]).to eq(16)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xwaitforcluster[:dsc_retrycount] = '32'
    expect(dsc_xwaitforcluster[:dsc_retrycount]).to eq(32)
  end

  it 'should accept string-like uint for dsc_retrycount' do
    dsc_xwaitforcluster[:dsc_retrycount] = '64'
    expect(dsc_xwaitforcluster[:dsc_retrycount]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwaitforcluster)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwaitforcluster)
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
