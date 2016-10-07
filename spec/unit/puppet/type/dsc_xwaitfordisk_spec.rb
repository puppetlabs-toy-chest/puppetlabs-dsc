#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwaitfordisk) do

  let :dsc_xwaitfordisk do
    Puppet::Type.type(:dsc_xwaitfordisk).new(
      :name     => 'foo',
      :dsc_disknumber => 32,
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xwaitfordisk).new(
      :name     => 'foo',
      :dsc_disknumber => 32,
      :dsc_retryintervalsec => 64,
      :dsc_retrycount => 32,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xwaitfordisk.to_s).to eq("Dsc_xwaitfordisk[foo]")
  end

  it 'should require that dsc_disknumber is specified' do
    #dsc_xwaitfordisk[:dsc_disknumber]
    expect { Puppet::Type.type(:dsc_xwaitfordisk).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_disknumber is a required attribute/)
  end

  it 'should not accept array for dsc_disknumber' do
    expect{dsc_xwaitfordisk[:dsc_disknumber] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_disknumber' do
    expect{dsc_xwaitfordisk[:dsc_disknumber] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_retryintervalsec' do
    expect{dsc_xwaitfordisk[:dsc_retryintervalsec] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retryintervalsec' do
    expect{dsc_xwaitfordisk[:dsc_retryintervalsec] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_retrycount' do
    expect{dsc_xwaitfordisk[:dsc_retrycount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_retrycount' do
    expect{dsc_xwaitfordisk[:dsc_retrycount] = true}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwaitfordisk)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwaitfordisk)
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
