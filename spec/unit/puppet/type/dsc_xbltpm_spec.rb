#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xbltpm) do

  let :dsc_xbltpm do
    Puppet::Type.type(:dsc_xbltpm).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xbltpm.to_s).to eq("Dsc_xbltpm[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xbltpm[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xbltpm).new(
      :name     => 'foo',
      :dsc_allowclear => true,
      :dsc_allowphysicalpresence => true,
      :dsc_allowimmediatereboot => true,
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xbltpm[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xbltpm[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xbltpm[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xbltpm[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowclear' do
    expect{dsc_xbltpm[:dsc_allowclear] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowclear' do
    dsc_xbltpm[:dsc_allowclear] = true
    expect(dsc_xbltpm[:dsc_allowclear]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowclear" do
    dsc_xbltpm[:dsc_allowclear] = 'true'
    expect(dsc_xbltpm[:dsc_allowclear]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowclear" do
    dsc_xbltpm[:dsc_allowclear] = 'false'
    expect(dsc_xbltpm[:dsc_allowclear]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowclear" do
    dsc_xbltpm[:dsc_allowclear] = 'True'
    expect(dsc_xbltpm[:dsc_allowclear]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowclear" do
    dsc_xbltpm[:dsc_allowclear] = 'False'
    expect(dsc_xbltpm[:dsc_allowclear]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowclear" do
    dsc_xbltpm[:dsc_allowclear] = :true
    expect(dsc_xbltpm[:dsc_allowclear]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowclear" do
    dsc_xbltpm[:dsc_allowclear] = :false
    expect(dsc_xbltpm[:dsc_allowclear]).to eq(false)
  end

  it 'should not accept int for dsc_allowclear' do
    expect{dsc_xbltpm[:dsc_allowclear] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowclear' do
    expect{dsc_xbltpm[:dsc_allowclear] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowphysicalpresence' do
    expect{dsc_xbltpm[:dsc_allowphysicalpresence] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowphysicalpresence' do
    dsc_xbltpm[:dsc_allowphysicalpresence] = true
    expect(dsc_xbltpm[:dsc_allowphysicalpresence]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowphysicalpresence" do
    dsc_xbltpm[:dsc_allowphysicalpresence] = 'true'
    expect(dsc_xbltpm[:dsc_allowphysicalpresence]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowphysicalpresence" do
    dsc_xbltpm[:dsc_allowphysicalpresence] = 'false'
    expect(dsc_xbltpm[:dsc_allowphysicalpresence]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowphysicalpresence" do
    dsc_xbltpm[:dsc_allowphysicalpresence] = 'True'
    expect(dsc_xbltpm[:dsc_allowphysicalpresence]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowphysicalpresence" do
    dsc_xbltpm[:dsc_allowphysicalpresence] = 'False'
    expect(dsc_xbltpm[:dsc_allowphysicalpresence]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowphysicalpresence" do
    dsc_xbltpm[:dsc_allowphysicalpresence] = :true
    expect(dsc_xbltpm[:dsc_allowphysicalpresence]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowphysicalpresence" do
    dsc_xbltpm[:dsc_allowphysicalpresence] = :false
    expect(dsc_xbltpm[:dsc_allowphysicalpresence]).to eq(false)
  end

  it 'should not accept int for dsc_allowphysicalpresence' do
    expect{dsc_xbltpm[:dsc_allowphysicalpresence] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowphysicalpresence' do
    expect{dsc_xbltpm[:dsc_allowphysicalpresence] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowimmediatereboot' do
    expect{dsc_xbltpm[:dsc_allowimmediatereboot] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowimmediatereboot' do
    dsc_xbltpm[:dsc_allowimmediatereboot] = true
    expect(dsc_xbltpm[:dsc_allowimmediatereboot]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowimmediatereboot" do
    dsc_xbltpm[:dsc_allowimmediatereboot] = 'true'
    expect(dsc_xbltpm[:dsc_allowimmediatereboot]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowimmediatereboot" do
    dsc_xbltpm[:dsc_allowimmediatereboot] = 'false'
    expect(dsc_xbltpm[:dsc_allowimmediatereboot]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowimmediatereboot" do
    dsc_xbltpm[:dsc_allowimmediatereboot] = 'True'
    expect(dsc_xbltpm[:dsc_allowimmediatereboot]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowimmediatereboot" do
    dsc_xbltpm[:dsc_allowimmediatereboot] = 'False'
    expect(dsc_xbltpm[:dsc_allowimmediatereboot]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowimmediatereboot" do
    dsc_xbltpm[:dsc_allowimmediatereboot] = :true
    expect(dsc_xbltpm[:dsc_allowimmediatereboot]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowimmediatereboot" do
    dsc_xbltpm[:dsc_allowimmediatereboot] = :false
    expect(dsc_xbltpm[:dsc_allowimmediatereboot]).to eq(false)
  end

  it 'should not accept int for dsc_allowimmediatereboot' do
    expect{dsc_xbltpm[:dsc_allowimmediatereboot] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowimmediatereboot' do
    expect{dsc_xbltpm[:dsc_allowimmediatereboot] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xbltpm)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xbltpm)
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
