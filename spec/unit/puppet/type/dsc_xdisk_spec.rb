#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdisk) do

  let :dsc_xdisk do
    Puppet::Type.type(:dsc_xdisk).new(
      :name     => 'foo',
      :dsc_driveletter => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xdisk).new(
      :name     => 'foo',
      :dsc_driveletter => 'foo',
      :dsc_disknumber => 32,
      :dsc_size => 64,
      :dsc_fslabel => 'foo',
      :dsc_allocationunitsize => 32,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xdisk.to_s).to eq("Dsc_xdisk[foo]")
  end

  it 'should require that dsc_driveletter is specified' do
    #dsc_xdisk[:dsc_driveletter]
    expect { Puppet::Type.type(:dsc_xdisk).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_driveletter is a required attribute/)
  end

  it 'should not accept array for dsc_driveletter' do
    expect{dsc_xdisk[:dsc_driveletter] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_driveletter' do
    expect{dsc_xdisk[:dsc_driveletter] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_driveletter' do
    expect{dsc_xdisk[:dsc_driveletter] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disknumber' do
    expect{dsc_xdisk[:dsc_disknumber] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_disknumber' do
    expect{dsc_xdisk[:dsc_disknumber] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_size' do
    expect{dsc_xdisk[:dsc_size] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_size' do
    expect{dsc_xdisk[:dsc_size] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_fslabel' do
    expect{dsc_xdisk[:dsc_fslabel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_fslabel' do
    expect{dsc_xdisk[:dsc_fslabel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_fslabel' do
    expect{dsc_xdisk[:dsc_fslabel] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allocationunitsize' do
    expect{dsc_xdisk[:dsc_allocationunitsize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_allocationunitsize' do
    expect{dsc_xdisk[:dsc_allocationunitsize] = true}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdisk)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdisk)
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
