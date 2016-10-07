#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spantivirussettings) do

  let :dsc_spantivirussettings do
    Puppet::Type.type(:dsc_spantivirussettings).new(
      :name     => 'foo',
      :dsc_scanondownload => true,
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spantivirussettings).new(
      :name     => 'foo',
      :dsc_scanondownload => true,
      :dsc_scanonupload => true,
      :dsc_allowdownloadinfected => true,
      :dsc_attempttoclean => true,
      :dsc_timeoutduration => 16,
      :dsc_numberofthreads => 16,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spantivirussettings.to_s).to eq("Dsc_spantivirussettings[foo]")
  end

  it 'should require that dsc_scanondownload is specified' do
    #dsc_spantivirussettings[:dsc_scanondownload]
    expect { Puppet::Type.type(:dsc_spantivirussettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_scanondownload is a required attribute/)
  end

  it 'should not accept array for dsc_scanondownload' do
    expect{dsc_spantivirussettings[:dsc_scanondownload] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_scanondownload' do
    dsc_spantivirussettings[:dsc_scanondownload] = true
    expect(dsc_spantivirussettings[:dsc_scanondownload]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_scanondownload" do
    dsc_spantivirussettings[:dsc_scanondownload] = 'true'
    expect(dsc_spantivirussettings[:dsc_scanondownload]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_scanondownload" do
    dsc_spantivirussettings[:dsc_scanondownload] = 'false'
    expect(dsc_spantivirussettings[:dsc_scanondownload]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_scanondownload" do
    dsc_spantivirussettings[:dsc_scanondownload] = 'True'
    expect(dsc_spantivirussettings[:dsc_scanondownload]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_scanondownload" do
    dsc_spantivirussettings[:dsc_scanondownload] = 'False'
    expect(dsc_spantivirussettings[:dsc_scanondownload]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_scanondownload" do
    dsc_spantivirussettings[:dsc_scanondownload] = :true
    expect(dsc_spantivirussettings[:dsc_scanondownload]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_scanondownload" do
    dsc_spantivirussettings[:dsc_scanondownload] = :false
    expect(dsc_spantivirussettings[:dsc_scanondownload]).to eq(false)
  end

  it 'should not accept int for dsc_scanondownload' do
    expect{dsc_spantivirussettings[:dsc_scanondownload] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scanondownload' do
    expect{dsc_spantivirussettings[:dsc_scanondownload] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scanonupload' do
    expect{dsc_spantivirussettings[:dsc_scanonupload] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_scanonupload' do
    dsc_spantivirussettings[:dsc_scanonupload] = true
    expect(dsc_spantivirussettings[:dsc_scanonupload]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_scanonupload" do
    dsc_spantivirussettings[:dsc_scanonupload] = 'true'
    expect(dsc_spantivirussettings[:dsc_scanonupload]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_scanonupload" do
    dsc_spantivirussettings[:dsc_scanonupload] = 'false'
    expect(dsc_spantivirussettings[:dsc_scanonupload]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_scanonupload" do
    dsc_spantivirussettings[:dsc_scanonupload] = 'True'
    expect(dsc_spantivirussettings[:dsc_scanonupload]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_scanonupload" do
    dsc_spantivirussettings[:dsc_scanonupload] = 'False'
    expect(dsc_spantivirussettings[:dsc_scanonupload]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_scanonupload" do
    dsc_spantivirussettings[:dsc_scanonupload] = :true
    expect(dsc_spantivirussettings[:dsc_scanonupload]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_scanonupload" do
    dsc_spantivirussettings[:dsc_scanonupload] = :false
    expect(dsc_spantivirussettings[:dsc_scanonupload]).to eq(false)
  end

  it 'should not accept int for dsc_scanonupload' do
    expect{dsc_spantivirussettings[:dsc_scanonupload] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scanonupload' do
    expect{dsc_spantivirussettings[:dsc_scanonupload] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowdownloadinfected' do
    expect{dsc_spantivirussettings[:dsc_allowdownloadinfected] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowdownloadinfected' do
    dsc_spantivirussettings[:dsc_allowdownloadinfected] = true
    expect(dsc_spantivirussettings[:dsc_allowdownloadinfected]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_spantivirussettings[:dsc_allowdownloadinfected] = 'true'
    expect(dsc_spantivirussettings[:dsc_allowdownloadinfected]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_spantivirussettings[:dsc_allowdownloadinfected] = 'false'
    expect(dsc_spantivirussettings[:dsc_allowdownloadinfected]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_spantivirussettings[:dsc_allowdownloadinfected] = 'True'
    expect(dsc_spantivirussettings[:dsc_allowdownloadinfected]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_spantivirussettings[:dsc_allowdownloadinfected] = 'False'
    expect(dsc_spantivirussettings[:dsc_allowdownloadinfected]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_spantivirussettings[:dsc_allowdownloadinfected] = :true
    expect(dsc_spantivirussettings[:dsc_allowdownloadinfected]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowdownloadinfected" do
    dsc_spantivirussettings[:dsc_allowdownloadinfected] = :false
    expect(dsc_spantivirussettings[:dsc_allowdownloadinfected]).to eq(false)
  end

  it 'should not accept int for dsc_allowdownloadinfected' do
    expect{dsc_spantivirussettings[:dsc_allowdownloadinfected] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowdownloadinfected' do
    expect{dsc_spantivirussettings[:dsc_allowdownloadinfected] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_attempttoclean' do
    expect{dsc_spantivirussettings[:dsc_attempttoclean] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_attempttoclean' do
    dsc_spantivirussettings[:dsc_attempttoclean] = true
    expect(dsc_spantivirussettings[:dsc_attempttoclean]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_attempttoclean" do
    dsc_spantivirussettings[:dsc_attempttoclean] = 'true'
    expect(dsc_spantivirussettings[:dsc_attempttoclean]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_attempttoclean" do
    dsc_spantivirussettings[:dsc_attempttoclean] = 'false'
    expect(dsc_spantivirussettings[:dsc_attempttoclean]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_attempttoclean" do
    dsc_spantivirussettings[:dsc_attempttoclean] = 'True'
    expect(dsc_spantivirussettings[:dsc_attempttoclean]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_attempttoclean" do
    dsc_spantivirussettings[:dsc_attempttoclean] = 'False'
    expect(dsc_spantivirussettings[:dsc_attempttoclean]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_attempttoclean" do
    dsc_spantivirussettings[:dsc_attempttoclean] = :true
    expect(dsc_spantivirussettings[:dsc_attempttoclean]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_attempttoclean" do
    dsc_spantivirussettings[:dsc_attempttoclean] = :false
    expect(dsc_spantivirussettings[:dsc_attempttoclean]).to eq(false)
  end

  it 'should not accept int for dsc_attempttoclean' do
    expect{dsc_spantivirussettings[:dsc_attempttoclean] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_attempttoclean' do
    expect{dsc_spantivirussettings[:dsc_attempttoclean] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_timeoutduration' do
    expect{dsc_spantivirussettings[:dsc_timeoutduration] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_timeoutduration' do
    expect{dsc_spantivirussettings[:dsc_timeoutduration] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_timeoutduration' do
    dsc_spantivirussettings[:dsc_timeoutduration] = 16
    expect(dsc_spantivirussettings[:dsc_timeoutduration]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_timeoutduration' do
    value = -16
    expect(value).to be < 0
    expect{dsc_spantivirussettings[:dsc_timeoutduration] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_timeoutduration' do
    dsc_spantivirussettings[:dsc_timeoutduration] = '16'
    expect(dsc_spantivirussettings[:dsc_timeoutduration]).to eq(16)
  end

  it 'should accept string-like uint for dsc_timeoutduration' do
    dsc_spantivirussettings[:dsc_timeoutduration] = '32'
    expect(dsc_spantivirussettings[:dsc_timeoutduration]).to eq(32)
  end

  it 'should accept string-like uint for dsc_timeoutduration' do
    dsc_spantivirussettings[:dsc_timeoutduration] = '64'
    expect(dsc_spantivirussettings[:dsc_timeoutduration]).to eq(64)
  end

  it 'should not accept array for dsc_numberofthreads' do
    expect{dsc_spantivirussettings[:dsc_numberofthreads] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_numberofthreads' do
    expect{dsc_spantivirussettings[:dsc_numberofthreads] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_numberofthreads' do
    dsc_spantivirussettings[:dsc_numberofthreads] = 16
    expect(dsc_spantivirussettings[:dsc_numberofthreads]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_numberofthreads' do
    value = -16
    expect(value).to be < 0
    expect{dsc_spantivirussettings[:dsc_numberofthreads] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_numberofthreads' do
    dsc_spantivirussettings[:dsc_numberofthreads] = '16'
    expect(dsc_spantivirussettings[:dsc_numberofthreads]).to eq(16)
  end

  it 'should accept string-like uint for dsc_numberofthreads' do
    dsc_spantivirussettings[:dsc_numberofthreads] = '32'
    expect(dsc_spantivirussettings[:dsc_numberofthreads]).to eq(32)
  end

  it 'should accept string-like uint for dsc_numberofthreads' do
    dsc_spantivirussettings[:dsc_numberofthreads] = '64'
    expect(dsc_spantivirussettings[:dsc_numberofthreads]).to eq(64)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spantivirussettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spantivirussettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spantivirussettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spantivirussettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spantivirussettings[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spantivirussettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spantivirussettings)
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
