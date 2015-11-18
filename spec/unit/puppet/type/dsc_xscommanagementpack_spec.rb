#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscommanagementpack) do

  let :dsc_xscommanagementpack do
    Puppet::Type.type(:dsc_xscommanagementpack).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscommanagementpack.to_s).to eq("Dsc_xscommanagementpack[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xscommanagementpack[:dsc_name]
    expect { Puppet::Type.type(:dsc_xscommanagementpack).new(
      :name     => 'foo',
      :dsc_version => 'foo',
      :dsc_minversion => 'foo',
      :dsc_scomadmincredential => {"user"=>"user", "password"=>"password"},
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_sourcefile => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xscommanagementpack[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xscommanagementpack[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xscommanagementpack[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xscommanagementpack[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_version' do
    expect{dsc_xscommanagementpack[:dsc_version] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_version' do
    expect{dsc_xscommanagementpack[:dsc_version] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_version' do
    expect{dsc_xscommanagementpack[:dsc_version] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_version' do
    expect{dsc_xscommanagementpack[:dsc_version] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_minversion' do
    expect{dsc_xscommanagementpack[:dsc_minversion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_minversion' do
    expect{dsc_xscommanagementpack[:dsc_minversion] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_minversion' do
    expect{dsc_xscommanagementpack[:dsc_minversion] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_minversion' do
    expect{dsc_xscommanagementpack[:dsc_minversion] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_scomadmincredential" do
    expect{dsc_xscommanagementpack[:dsc_scomadmincredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scomadmincredential' do
    expect{dsc_xscommanagementpack[:dsc_scomadmincredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scomadmincredential' do
    expect{dsc_xscommanagementpack[:dsc_scomadmincredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scomadmincredential' do
    expect{dsc_xscommanagementpack[:dsc_scomadmincredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scomadmincredential' do
    expect{dsc_xscommanagementpack[:dsc_scomadmincredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xscommanagementpack[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xscommanagementpack[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xscommanagementpack[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xscommanagementpack[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xscommanagementpack[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xscommanagementpack[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xscommanagementpack[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xscommanagementpack[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefile' do
    expect{dsc_xscommanagementpack[:dsc_sourcefile] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefile' do
    expect{dsc_xscommanagementpack[:dsc_sourcefile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefile' do
    expect{dsc_xscommanagementpack[:dsc_sourcefile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefile' do
    expect{dsc_xscommanagementpack[:dsc_sourcefile] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscommanagementpack)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscommanagementpack)
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
