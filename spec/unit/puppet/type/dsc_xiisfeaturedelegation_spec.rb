#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xiisfeaturedelegation) do

  let :dsc_xiisfeaturedelegation do
    Puppet::Type.type(:dsc_xiisfeaturedelegation).new(
      :name     => 'foo',
      :dsc_sectionname => 'foo',
      :dsc_overridemode => 'Allow',
    )
  end

  it "should stringify normally" do
    expect(dsc_xiisfeaturedelegation.to_s).to eq("Dsc_xiisfeaturedelegation[foo]")
  end

  it 'should require that dsc_sectionname is specified' do
    #dsc_xiisfeaturedelegation[:dsc_sectionname]
    expect { Puppet::Type.type(:dsc_xiisfeaturedelegation).new(
      :name     => 'foo',
      :dsc_overridemode => 'Allow',
    )}.to raise_error(Puppet::Error, /dsc_sectionname is a required attribute/)
  end

  it 'should not accept array for dsc_sectionname' do
    expect{dsc_xiisfeaturedelegation[:dsc_sectionname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sectionname' do
    expect{dsc_xiisfeaturedelegation[:dsc_sectionname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sectionname' do
    expect{dsc_xiisfeaturedelegation[:dsc_sectionname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sectionname' do
    expect{dsc_xiisfeaturedelegation[:dsc_sectionname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_overridemode is specified' do
    #dsc_xiisfeaturedelegation[:dsc_overridemode]
    expect { Puppet::Type.type(:dsc_xiisfeaturedelegation).new(
      :name     => 'foo',
      :dsc_sectionname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_overridemode is a required attribute/)
  end

  it 'should accept dsc_overridemode predefined value Allow' do
    dsc_xiisfeaturedelegation[:dsc_overridemode] = 'Allow'
    expect(dsc_xiisfeaturedelegation[:dsc_overridemode]).to eq('Allow')
  end

  it 'should accept dsc_overridemode predefined value allow' do
    dsc_xiisfeaturedelegation[:dsc_overridemode] = 'allow'
    expect(dsc_xiisfeaturedelegation[:dsc_overridemode]).to eq('allow')
  end

  it 'should accept dsc_overridemode predefined value Deny' do
    dsc_xiisfeaturedelegation[:dsc_overridemode] = 'Deny'
    expect(dsc_xiisfeaturedelegation[:dsc_overridemode]).to eq('Deny')
  end

  it 'should accept dsc_overridemode predefined value deny' do
    dsc_xiisfeaturedelegation[:dsc_overridemode] = 'deny'
    expect(dsc_xiisfeaturedelegation[:dsc_overridemode]).to eq('deny')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xiisfeaturedelegation[:dsc_overridemode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_overridemode' do
    expect{dsc_xiisfeaturedelegation[:dsc_overridemode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_overridemode' do
    expect{dsc_xiisfeaturedelegation[:dsc_overridemode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_overridemode' do
    expect{dsc_xiisfeaturedelegation[:dsc_overridemode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_overridemode' do
    expect{dsc_xiisfeaturedelegation[:dsc_overridemode] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xiisfeaturedelegation)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xiisfeaturedelegation)
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
