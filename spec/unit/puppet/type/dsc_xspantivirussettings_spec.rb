#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspantivirussettings) do

  let :dsc_xspantivirussettings do
    Puppet::Type.type(:dsc_xspantivirussettings).new(
      :name     => 'foo',
      :dsc_scanondownload => true,
    )
  end

  it "should stringify normally" do
    expect(dsc_xspantivirussettings.to_s).to eq("Dsc_xspantivirussettings[foo]")
  end

  it 'should require that dsc_scanondownload is specified' do
    #dsc_xspantivirussettings[:dsc_scanondownload]
    expect { Puppet::Type.type(:dsc_xspantivirussettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_scanondownload is a required attribute/)
  end

  it 'should not accept array for dsc_scanondownload' do
    expect{dsc_xspantivirussettings[:dsc_scanondownload] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_scanondownload' do
    dsc_xspantivirussettings[:dsc_scanondownload] = true
    expect(dsc_xspantivirussettings[:dsc_scanondownload]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_scanondownload" do
    dsc_xspantivirussettings[:dsc_scanondownload] = 'true'
    expect(dsc_xspantivirussettings[:dsc_scanondownload]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_scanondownload" do
    dsc_xspantivirussettings[:dsc_scanondownload] = 'false'
    expect(dsc_xspantivirussettings[:dsc_scanondownload]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_scanondownload" do
    dsc_xspantivirussettings[:dsc_scanondownload] = 'True'
    expect(dsc_xspantivirussettings[:dsc_scanondownload]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_scanondownload" do
    dsc_xspantivirussettings[:dsc_scanondownload] = 'False'
    expect(dsc_xspantivirussettings[:dsc_scanondownload]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_scanondownload" do
    dsc_xspantivirussettings[:dsc_scanondownload] = :true
    expect(dsc_xspantivirussettings[:dsc_scanondownload]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_scanondownload" do
    dsc_xspantivirussettings[:dsc_scanondownload] = :false
    expect(dsc_xspantivirussettings[:dsc_scanondownload]).to eq(false)
  end

  it 'should not accept int for dsc_scanondownload' do
    expect{dsc_xspantivirussettings[:dsc_scanondownload] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scanondownload' do
    expect{dsc_xspantivirussettings[:dsc_scanondownload] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scanonupload' do
    expect{dsc_xspantivirussettings[:dsc_scanonupload] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_scanonupload' do
    dsc_xspantivirussettings[:dsc_scanonupload] = true
    expect(dsc_xspantivirussettings[:dsc_scanonupload]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_scanonupload" do
    dsc_xspantivirussettings[:dsc_scanonupload] = 'true'
    expect(dsc_xspantivirussettings[:dsc_scanonupload]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_scanonupload" do
    dsc_xspantivirussettings[:dsc_scanonupload] = 'false'
    expect(dsc_xspantivirussettings[:dsc_scanonupload]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_scanonupload" do
    dsc_xspantivirussettings[:dsc_scanonupload] = 'True'
    expect(dsc_xspantivirussettings[:dsc_scanonupload]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_scanonupload" do
    dsc_xspantivirussettings[:dsc_scanonupload] = 'False'
    expect(dsc_xspantivirussettings[:dsc_scanonupload]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_scanonupload" do
    dsc_xspantivirussettings[:dsc_scanonupload] = :true
    expect(dsc_xspantivirussettings[:dsc_scanonupload]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_scanonupload" do
    dsc_xspantivirussettings[:dsc_scanonupload] = :false
    expect(dsc_xspantivirussettings[:dsc_scanonupload]).to eq(false)
  end

  it 'should not accept int for dsc_scanonupload' do
    expect{dsc_xspantivirussettings[:dsc_scanonupload] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scanonupload' do
    expect{dsc_xspantivirussettings[:dsc_scanonupload] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowdownloadinfected' do
    expect{dsc_xspantivirussettings[:dsc_allowdownloadinfected] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowdownloadinfected' do
    dsc_xspantivirussettings[:dsc_allowdownloadinfected] = true
    expect(dsc_xspantivirussettings[:dsc_allowdownloadinfected]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_xspantivirussettings[:dsc_allowdownloadinfected] = 'true'
    expect(dsc_xspantivirussettings[:dsc_allowdownloadinfected]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_xspantivirussettings[:dsc_allowdownloadinfected] = 'false'
    expect(dsc_xspantivirussettings[:dsc_allowdownloadinfected]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_xspantivirussettings[:dsc_allowdownloadinfected] = 'True'
    expect(dsc_xspantivirussettings[:dsc_allowdownloadinfected]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_xspantivirussettings[:dsc_allowdownloadinfected] = 'False'
    expect(dsc_xspantivirussettings[:dsc_allowdownloadinfected]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_xspantivirussettings[:dsc_allowdownloadinfected] = :true
    expect(dsc_xspantivirussettings[:dsc_allowdownloadinfected]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_xspantivirussettings[:dsc_allowdownloadinfected] = :false
    expect(dsc_xspantivirussettings[:dsc_allowdownloadinfected]).to eq(false)
  end

  it 'should not accept int for dsc_allowdownloadinfected' do
    expect{dsc_xspantivirussettings[:dsc_allowdownloadinfected] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowdownloadinfected' do
    expect{dsc_xspantivirussettings[:dsc_allowdownloadinfected] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_attempttoclean' do
    expect{dsc_xspantivirussettings[:dsc_attempttoclean] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_attempttoclean' do
    dsc_xspantivirussettings[:dsc_attempttoclean] = true
    expect(dsc_xspantivirussettings[:dsc_attempttoclean]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_attempttoclean" do
    dsc_xspantivirussettings[:dsc_attempttoclean] = 'true'
    expect(dsc_xspantivirussettings[:dsc_attempttoclean]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_attempttoclean" do
    dsc_xspantivirussettings[:dsc_attempttoclean] = 'false'
    expect(dsc_xspantivirussettings[:dsc_attempttoclean]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_attempttoclean" do
    dsc_xspantivirussettings[:dsc_attempttoclean] = 'True'
    expect(dsc_xspantivirussettings[:dsc_attempttoclean]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_attempttoclean" do
    dsc_xspantivirussettings[:dsc_attempttoclean] = 'False'
    expect(dsc_xspantivirussettings[:dsc_attempttoclean]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_attempttoclean" do
    dsc_xspantivirussettings[:dsc_attempttoclean] = :true
    expect(dsc_xspantivirussettings[:dsc_attempttoclean]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_attempttoclean" do
    dsc_xspantivirussettings[:dsc_attempttoclean] = :false
    expect(dsc_xspantivirussettings[:dsc_attempttoclean]).to eq(false)
  end

  it 'should not accept int for dsc_attempttoclean' do
    expect{dsc_xspantivirussettings[:dsc_attempttoclean] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_attempttoclean' do
    expect{dsc_xspantivirussettings[:dsc_attempttoclean] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_timeoutduration' do
    expect{dsc_xspantivirussettings[:dsc_timeoutduration] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_timeoutduration' do
    expect{dsc_xspantivirussettings[:dsc_timeoutduration] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_timeoutduration' do
    dsc_xspantivirussettings[:dsc_timeoutduration] = 16
    expect(dsc_xspantivirussettings[:dsc_timeoutduration]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_timeoutduration' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xspantivirussettings[:dsc_timeoutduration] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_timeoutduration' do
    dsc_xspantivirussettings[:dsc_timeoutduration] = '16'
    expect(dsc_xspantivirussettings[:dsc_timeoutduration]).to eq(16)
  end

  it 'should accept string-like uint for dsc_timeoutduration' do
    dsc_xspantivirussettings[:dsc_timeoutduration] = '32'
    expect(dsc_xspantivirussettings[:dsc_timeoutduration]).to eq(32)
  end

  it 'should accept string-like uint for dsc_timeoutduration' do
    dsc_xspantivirussettings[:dsc_timeoutduration] = '64'
    expect(dsc_xspantivirussettings[:dsc_timeoutduration]).to eq(64)
  end

  it 'should not accept array for dsc_numberofthreads' do
    expect{dsc_xspantivirussettings[:dsc_numberofthreads] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_numberofthreads' do
    expect{dsc_xspantivirussettings[:dsc_numberofthreads] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_numberofthreads' do
    dsc_xspantivirussettings[:dsc_numberofthreads] = 16
    expect(dsc_xspantivirussettings[:dsc_numberofthreads]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_numberofthreads' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xspantivirussettings[:dsc_numberofthreads] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_numberofthreads' do
    dsc_xspantivirussettings[:dsc_numberofthreads] = '16'
    expect(dsc_xspantivirussettings[:dsc_numberofthreads]).to eq(16)
  end

  it 'should accept string-like uint for dsc_numberofthreads' do
    dsc_xspantivirussettings[:dsc_numberofthreads] = '32'
    expect(dsc_xspantivirussettings[:dsc_numberofthreads]).to eq(32)
  end

  it 'should accept string-like uint for dsc_numberofthreads' do
    dsc_xspantivirussettings[:dsc_numberofthreads] = '64'
    expect(dsc_xspantivirussettings[:dsc_numberofthreads]).to eq(64)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspantivirussettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspantivirussettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspantivirussettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspantivirussettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspantivirussettings[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspantivirussettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspantivirussettings)
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
