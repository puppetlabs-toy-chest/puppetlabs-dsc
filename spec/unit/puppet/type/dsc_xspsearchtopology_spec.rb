#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspsearchtopology) do

  let :dsc_xspsearchtopology do
    Puppet::Type.type(:dsc_xspsearchtopology).new(
      :name     => 'foo',
      :dsc_serviceappname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspsearchtopology.to_s).to eq("Dsc_xspsearchtopology[foo]")
  end

  it 'should require that dsc_serviceappname is specified' do
    #dsc_xspsearchtopology[:dsc_serviceappname]
    expect { Puppet::Type.type(:dsc_xspsearchtopology).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_serviceappname is a required attribute/)
  end

  it 'should not accept array for dsc_serviceappname' do
    expect{dsc_xspsearchtopology[:dsc_serviceappname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serviceappname' do
    expect{dsc_xspsearchtopology[:dsc_serviceappname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serviceappname' do
    expect{dsc_xspsearchtopology[:dsc_serviceappname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceappname' do
    expect{dsc_xspsearchtopology[:dsc_serviceappname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_admin' do
    dsc_xspsearchtopology[:dsc_admin] = ["foo", "bar", "spec"]
    expect(dsc_xspsearchtopology[:dsc_admin]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_admin' do
    expect{dsc_xspsearchtopology[:dsc_admin] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_admin' do
    expect{dsc_xspsearchtopology[:dsc_admin] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_admin' do
    expect{dsc_xspsearchtopology[:dsc_admin] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_crawler' do
    dsc_xspsearchtopology[:dsc_crawler] = ["foo", "bar", "spec"]
    expect(dsc_xspsearchtopology[:dsc_crawler]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_crawler' do
    expect{dsc_xspsearchtopology[:dsc_crawler] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_crawler' do
    expect{dsc_xspsearchtopology[:dsc_crawler] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_crawler' do
    expect{dsc_xspsearchtopology[:dsc_crawler] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_contentprocessing' do
    dsc_xspsearchtopology[:dsc_contentprocessing] = ["foo", "bar", "spec"]
    expect(dsc_xspsearchtopology[:dsc_contentprocessing]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_contentprocessing' do
    expect{dsc_xspsearchtopology[:dsc_contentprocessing] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_contentprocessing' do
    expect{dsc_xspsearchtopology[:dsc_contentprocessing] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_contentprocessing' do
    expect{dsc_xspsearchtopology[:dsc_contentprocessing] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_analyticsprocessing' do
    dsc_xspsearchtopology[:dsc_analyticsprocessing] = ["foo", "bar", "spec"]
    expect(dsc_xspsearchtopology[:dsc_analyticsprocessing]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_analyticsprocessing' do
    expect{dsc_xspsearchtopology[:dsc_analyticsprocessing] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_analyticsprocessing' do
    expect{dsc_xspsearchtopology[:dsc_analyticsprocessing] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_analyticsprocessing' do
    expect{dsc_xspsearchtopology[:dsc_analyticsprocessing] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_queryprocessing' do
    dsc_xspsearchtopology[:dsc_queryprocessing] = ["foo", "bar", "spec"]
    expect(dsc_xspsearchtopology[:dsc_queryprocessing]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_queryprocessing' do
    expect{dsc_xspsearchtopology[:dsc_queryprocessing] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_queryprocessing' do
    expect{dsc_xspsearchtopology[:dsc_queryprocessing] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_queryprocessing' do
    expect{dsc_xspsearchtopology[:dsc_queryprocessing] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_indexpartition' do
    dsc_xspsearchtopology[:dsc_indexpartition] = ["foo", "bar", "spec"]
    expect(dsc_xspsearchtopology[:dsc_indexpartition]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_indexpartition' do
    expect{dsc_xspsearchtopology[:dsc_indexpartition] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_indexpartition' do
    expect{dsc_xspsearchtopology[:dsc_indexpartition] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_indexpartition' do
    expect{dsc_xspsearchtopology[:dsc_indexpartition] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_firstpartitiondirectory' do
    expect{dsc_xspsearchtopology[:dsc_firstpartitiondirectory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_firstpartitiondirectory' do
    expect{dsc_xspsearchtopology[:dsc_firstpartitiondirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_firstpartitiondirectory' do
    expect{dsc_xspsearchtopology[:dsc_firstpartitiondirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_firstpartitiondirectory' do
    expect{dsc_xspsearchtopology[:dsc_firstpartitiondirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspsearchtopology[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspsearchtopology[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspsearchtopology[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspsearchtopology[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspsearchtopology[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspsearchtopology)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspsearchtopology)
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
