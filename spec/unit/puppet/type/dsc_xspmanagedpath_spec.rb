#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspmanagedpath) do

  let :dsc_xspmanagedpath do
    Puppet::Type.type(:dsc_xspmanagedpath).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_relativeurl => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspmanagedpath.to_s).to eq("Dsc_xspmanagedpath[foo]")
  end

  it 'should require that dsc_webappurl is specified' do
    #dsc_xspmanagedpath[:dsc_webappurl]
    expect { Puppet::Type.type(:dsc_xspmanagedpath).new(
      :name     => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
      :dsc_relativeurl => 'foo',
      :dsc_explicit => true,
      :dsc_hostheader => true,
    )}.to raise_error(Puppet::Error, /dsc_webappurl is a required attribute/)
  end

  it 'should not accept array for dsc_webappurl' do
    expect{dsc_xspmanagedpath[:dsc_webappurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webappurl' do
    expect{dsc_xspmanagedpath[:dsc_webappurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webappurl' do
    expect{dsc_xspmanagedpath[:dsc_webappurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webappurl' do
    expect{dsc_xspmanagedpath[:dsc_webappurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspmanagedpath[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspmanagedpath[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspmanagedpath[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspmanagedpath[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspmanagedpath[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_relativeurl is specified' do
    #dsc_xspmanagedpath[:dsc_relativeurl]
    expect { Puppet::Type.type(:dsc_xspmanagedpath).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
      :dsc_explicit => true,
      :dsc_hostheader => true,
    )}.to raise_error(Puppet::Error, /dsc_relativeurl is a required attribute/)
  end

  it 'should not accept array for dsc_relativeurl' do
    expect{dsc_xspmanagedpath[:dsc_relativeurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_relativeurl' do
    expect{dsc_xspmanagedpath[:dsc_relativeurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_relativeurl' do
    expect{dsc_xspmanagedpath[:dsc_relativeurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_relativeurl' do
    expect{dsc_xspmanagedpath[:dsc_relativeurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_explicit' do
    expect{dsc_xspmanagedpath[:dsc_explicit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_explicit' do
    dsc_xspmanagedpath[:dsc_explicit] = true
    expect(dsc_xspmanagedpath[:dsc_explicit]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_explicit" do
    dsc_xspmanagedpath[:dsc_explicit] = 'true'
    expect(dsc_xspmanagedpath[:dsc_explicit]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_explicit" do
    dsc_xspmanagedpath[:dsc_explicit] = 'false'
    expect(dsc_xspmanagedpath[:dsc_explicit]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_explicit" do
    dsc_xspmanagedpath[:dsc_explicit] = 'True'
    expect(dsc_xspmanagedpath[:dsc_explicit]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_explicit" do
    dsc_xspmanagedpath[:dsc_explicit] = 'False'
    expect(dsc_xspmanagedpath[:dsc_explicit]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_explicit" do
    dsc_xspmanagedpath[:dsc_explicit] = :true
    expect(dsc_xspmanagedpath[:dsc_explicit]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_explicit" do
    dsc_xspmanagedpath[:dsc_explicit] = :false
    expect(dsc_xspmanagedpath[:dsc_explicit]).to eq(false)
  end

  it 'should not accept int for dsc_explicit' do
    expect{dsc_xspmanagedpath[:dsc_explicit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_explicit' do
    expect{dsc_xspmanagedpath[:dsc_explicit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_hostheader' do
    expect{dsc_xspmanagedpath[:dsc_hostheader] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_hostheader' do
    dsc_xspmanagedpath[:dsc_hostheader] = true
    expect(dsc_xspmanagedpath[:dsc_hostheader]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_hostheader" do
    dsc_xspmanagedpath[:dsc_hostheader] = 'true'
    expect(dsc_xspmanagedpath[:dsc_hostheader]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_hostheader" do
    dsc_xspmanagedpath[:dsc_hostheader] = 'false'
    expect(dsc_xspmanagedpath[:dsc_hostheader]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_hostheader" do
    dsc_xspmanagedpath[:dsc_hostheader] = 'True'
    expect(dsc_xspmanagedpath[:dsc_hostheader]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_hostheader" do
    dsc_xspmanagedpath[:dsc_hostheader] = 'False'
    expect(dsc_xspmanagedpath[:dsc_hostheader]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_hostheader" do
    dsc_xspmanagedpath[:dsc_hostheader] = :true
    expect(dsc_xspmanagedpath[:dsc_hostheader]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_hostheader" do
    dsc_xspmanagedpath[:dsc_hostheader] = :false
    expect(dsc_xspmanagedpath[:dsc_hostheader]).to eq(false)
  end

  it 'should not accept int for dsc_hostheader' do
    expect{dsc_xspmanagedpath[:dsc_hostheader] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_hostheader' do
    expect{dsc_xspmanagedpath[:dsc_hostheader] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspmanagedpath)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspmanagedpath)
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
