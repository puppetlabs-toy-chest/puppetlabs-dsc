#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspuserprofileserviceapp) do

  let :dsc_xspuserprofileserviceapp do
    Puppet::Type.type(:dsc_xspuserprofileserviceapp).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspuserprofileserviceapp.to_s).to eq("Dsc_xspuserprofileserviceapp[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspuserprofileserviceapp[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspuserprofileserviceapp).new(
      :name     => 'foo',
      :dsc_applicationpool => 'foo',
      :dsc_farmaccount => {"user"=>"user", "password"=>"password"},
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
      :dsc_mysitehostlocation => 'foo',
      :dsc_profiledbname => 'foo',
      :dsc_profiledbserver => 'foo',
      :dsc_socialdbname => 'foo',
      :dsc_socialdbserver => 'foo',
      :dsc_syncdbname => 'foo',
      :dsc_syncdbserver => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspuserprofileserviceapp[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspuserprofileserviceapp[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspuserprofileserviceapp[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspuserprofileserviceapp[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpool' do
    expect{dsc_xspuserprofileserviceapp[:dsc_applicationpool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpool' do
    expect{dsc_xspuserprofileserviceapp[:dsc_applicationpool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpool' do
    expect{dsc_xspuserprofileserviceapp[:dsc_applicationpool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpool' do
    expect{dsc_xspuserprofileserviceapp[:dsc_applicationpool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_farmaccount" do
    expect{dsc_xspuserprofileserviceapp[:dsc_farmaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_farmaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_farmaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_farmaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_farmaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_farmaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_farmaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_farmaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_farmaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspuserprofileserviceapp[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mysitehostlocation' do
    expect{dsc_xspuserprofileserviceapp[:dsc_mysitehostlocation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mysitehostlocation' do
    expect{dsc_xspuserprofileserviceapp[:dsc_mysitehostlocation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mysitehostlocation' do
    expect{dsc_xspuserprofileserviceapp[:dsc_mysitehostlocation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mysitehostlocation' do
    expect{dsc_xspuserprofileserviceapp[:dsc_mysitehostlocation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_profiledbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_profiledbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_profiledbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_profiledbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_profiledbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_profiledbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_profiledbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_profiledbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_socialdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_socialdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_socialdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_socialdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_socialdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_socialdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_socialdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_socialdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_syncdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_syncdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_syncdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_syncdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_syncdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_syncdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_syncdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_syncdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspuserprofileserviceapp)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspuserprofileserviceapp)
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
