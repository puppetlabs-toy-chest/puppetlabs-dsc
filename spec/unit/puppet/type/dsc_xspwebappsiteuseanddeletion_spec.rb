#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspwebappsiteuseanddeletion) do

  let :dsc_xspwebappsiteuseanddeletion do
    Puppet::Type.type(:dsc_xspwebappsiteuseanddeletion).new(
      :name     => 'foo',
      :dsc_url => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xspwebappsiteuseanddeletion).new(
      :name     => 'foo',
      :dsc_url => 'foo',
      :dsc_sendunusedsitecollectionnotifications => true,
      :dsc_unusedsitenotificationperiod => 32,
      :dsc_automaticallydeleteunusedsitecollections => true,
      :dsc_unusedsitenotificationsbeforedeletion => 32,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xspwebappsiteuseanddeletion.to_s).to eq("Dsc_xspwebappsiteuseanddeletion[foo]")
  end

  it 'should require that dsc_url is specified' do
    #dsc_xspwebappsiteuseanddeletion[:dsc_url]
    expect { Puppet::Type.type(:dsc_xspwebappsiteuseanddeletion).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_url is a required attribute/)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sendunusedsitecollectionnotifications' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_sendunusedsitecollectionnotifications' do
    dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = true
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = 'true'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = 'false'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = 'True'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = 'False'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = :true
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_sendunusedsitecollectionnotifications" do
    dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = :false
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications]).to eq(false)
  end

  it 'should not accept int for dsc_sendunusedsitecollectionnotifications' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sendunusedsitecollectionnotifications' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_sendunusedsitecollectionnotifications] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_unusedsitenotificationperiod' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_unusedsitenotificationperiod' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_unusedsitenotificationperiod' do
    dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod] = 32
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_unusedsitenotificationperiod' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_unusedsitenotificationperiod' do
    dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod] = '16'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod]).to eq(16)
  end

  it 'should accept string-like uint for dsc_unusedsitenotificationperiod' do
    dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod] = '32'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod]).to eq(32)
  end

  it 'should accept string-like uint for dsc_unusedsitenotificationperiod' do
    dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod] = '64'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationperiod]).to eq(64)
  end

  it 'should not accept array for dsc_automaticallydeleteunusedsitecollections' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_automaticallydeleteunusedsitecollections' do
    dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = true
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = 'true'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = 'false'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = 'True'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = 'False'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = :true
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_automaticallydeleteunusedsitecollections" do
    dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = :false
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections]).to eq(false)
  end

  it 'should not accept int for dsc_automaticallydeleteunusedsitecollections' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_automaticallydeleteunusedsitecollections' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_automaticallydeleteunusedsitecollections] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_unusedsitenotificationsbeforedeletion' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_unusedsitenotificationsbeforedeletion' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_unusedsitenotificationsbeforedeletion' do
    dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion] = 32
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_unusedsitenotificationsbeforedeletion' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_unusedsitenotificationsbeforedeletion' do
    dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion] = '16'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion]).to eq(16)
  end

  it 'should accept string-like uint for dsc_unusedsitenotificationsbeforedeletion' do
    dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion] = '32'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion]).to eq(32)
  end

  it 'should accept string-like uint for dsc_unusedsitenotificationsbeforedeletion' do
    dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion] = '64'
    expect(dsc_xspwebappsiteuseanddeletion[:dsc_unusedsitenotificationsbeforedeletion]).to eq(64)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspwebappsiteuseanddeletion[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspwebappsiteuseanddeletion)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspwebappsiteuseanddeletion)
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
