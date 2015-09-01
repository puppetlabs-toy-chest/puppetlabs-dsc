#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_waitforany) do

  let :dsc_waitforany do
    Puppet::Type.type(:dsc_waitforany).new(
      :name     => 'foo',
      :dsc_resourcename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_waitforany.to_s).to eq("Dsc_waitforany[foo]")
  end

  it 'should require that dsc_resourcename is specified' do
    #dsc_waitforany[:dsc_resourcename]
    expect { Puppet::Type.type(:dsc_waitforany).new(
      :name     => 'foo',
      :dsc_nodename => ["foo", "bar", "spec"],
      :dsc_retryintervalsec => 64,
      :dsc_retrycount => 32,
      :dsc_throttlelimit => 32,
    )}.to raise_error(Puppet::Error, /dsc_resourcename is a required attribute/)
  end

  it 'should not accept array for dsc_resourcename' do
    expect{dsc_waitforany[:dsc_resourcename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_resourcename' do
    expect{dsc_waitforany[:dsc_resourcename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_resourcename' do
    expect{dsc_waitforany[:dsc_resourcename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_resourcename' do
    expect{dsc_waitforany[:dsc_resourcename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_nodename' do
    dsc_waitforany[:dsc_nodename] = ["foo", "bar", "spec"]
    expect(dsc_waitforany[:dsc_nodename]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_nodename' do
    expect{dsc_waitforany[:dsc_nodename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_nodename' do
    expect{dsc_waitforany[:dsc_nodename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_nodename' do
    expect{dsc_waitforany[:dsc_nodename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_retryintervalsec' do
    expect{dsc_waitforany[:dsc_retryintervalsec] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retryintervalsec' do
    expect{dsc_waitforany[:dsc_retryintervalsec] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_retryintervalsec' do
    expect{dsc_waitforany[:dsc_retryintervalsec] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retryintervalsec' do
    dsc_waitforany[:dsc_retryintervalsec] = 64
    expect(dsc_waitforany[:dsc_retryintervalsec]).to eq(64)
  end


  it 'should accept string-like int for dsc_retryintervalsec' do
    dsc_waitforany[:dsc_retryintervalsec] = '16'
    expect(dsc_waitforany[:dsc_retryintervalsec]).to eq(16)
  end


  it 'should accept string-like int for dsc_retryintervalsec' do
    dsc_waitforany[:dsc_retryintervalsec] = '32'
    expect(dsc_waitforany[:dsc_retryintervalsec]).to eq(32)
  end


  it 'should accept string-like int for dsc_retryintervalsec' do
    dsc_waitforany[:dsc_retryintervalsec] = '64'
    expect(dsc_waitforany[:dsc_retryintervalsec]).to eq(64)
  end

  it 'should not accept array for dsc_retrycount' do
    expect{dsc_waitforany[:dsc_retrycount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retrycount' do
    expect{dsc_waitforany[:dsc_retrycount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_retrycount' do
    expect{dsc_waitforany[:dsc_retrycount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_retrycount' do
    dsc_waitforany[:dsc_retrycount] = 32
    expect(dsc_waitforany[:dsc_retrycount]).to eq(32)
  end


  it 'should accept string-like int for dsc_retrycount' do
    dsc_waitforany[:dsc_retrycount] = '16'
    expect(dsc_waitforany[:dsc_retrycount]).to eq(16)
  end


  it 'should accept string-like int for dsc_retrycount' do
    dsc_waitforany[:dsc_retrycount] = '32'
    expect(dsc_waitforany[:dsc_retrycount]).to eq(32)
  end


  it 'should accept string-like int for dsc_retrycount' do
    dsc_waitforany[:dsc_retrycount] = '64'
    expect(dsc_waitforany[:dsc_retrycount]).to eq(64)
  end

  it 'should not accept array for dsc_throttlelimit' do
    expect{dsc_waitforany[:dsc_throttlelimit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_throttlelimit' do
    expect{dsc_waitforany[:dsc_throttlelimit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_throttlelimit' do
    expect{dsc_waitforany[:dsc_throttlelimit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_throttlelimit' do
    dsc_waitforany[:dsc_throttlelimit] = 32
    expect(dsc_waitforany[:dsc_throttlelimit]).to eq(32)
  end


  it 'should accept string-like int for dsc_throttlelimit' do
    dsc_waitforany[:dsc_throttlelimit] = '16'
    expect(dsc_waitforany[:dsc_throttlelimit]).to eq(16)
  end


  it 'should accept string-like int for dsc_throttlelimit' do
    dsc_waitforany[:dsc_throttlelimit] = '32'
    expect(dsc_waitforany[:dsc_throttlelimit]).to eq(32)
  end


  it 'should accept string-like int for dsc_throttlelimit' do
    dsc_waitforany[:dsc_throttlelimit] = '64'
    expect(dsc_waitforany[:dsc_throttlelimit]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_waitforany)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_waitforany)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

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
