#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspuserprofilesyncconnection) do

  let :dsc_xspuserprofilesyncconnection do
    Puppet::Type.type(:dsc_xspuserprofilesyncconnection).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xspuserprofilesyncconnection).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_forest => 'foo',
      :dsc_userprofileservice => 'foo',
      :dsc_connectioncredentials => {"user"=>"user", "password"=>"password"},
      :dsc_includedous => ["foo", "bar", "spec"],
      :dsc_excludedous => ["foo", "bar", "spec"],
      :dsc_server => 'foo',
      :dsc_usessl => true,
      :dsc_force => true,
      :dsc_connectiontype => 'ActiveDirectory',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xspuserprofilesyncconnection.to_s).to eq("Dsc_xspuserprofilesyncconnection[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspuserprofilesyncconnection[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspuserprofilesyncconnection).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_forest' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_forest] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_forest' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_forest] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_forest' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_forest] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_forest' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_forest] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_userprofileservice' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_userprofileservice] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_userprofileservice' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_userprofileservice] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_userprofileservice' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_userprofileservice] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_userprofileservice' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_userprofileservice] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_connectioncredentials" do
    expect{dsc_xspuserprofilesyncconnection[:dsc_connectioncredentials] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectioncredentials' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_connectioncredentials] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectioncredentials' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_connectioncredentials] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectioncredentials' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_connectioncredentials] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectioncredentials' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_connectioncredentials] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_includedous' do
    dsc_xspuserprofilesyncconnection[:dsc_includedous] = ["foo", "bar", "spec"]
    expect(dsc_xspuserprofilesyncconnection[:dsc_includedous]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_includedous' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_includedous] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_includedous' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_includedous] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_includedous' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_includedous] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_excludedous' do
    dsc_xspuserprofilesyncconnection[:dsc_excludedous] = ["foo", "bar", "spec"]
    expect(dsc_xspuserprofilesyncconnection[:dsc_excludedous]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_excludedous' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_excludedous] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_excludedous' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_excludedous] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_excludedous' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_excludedous] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_server' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_server] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_server' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_server] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_server' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_server] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_server' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_server] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usessl' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_usessl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_usessl' do
    dsc_xspuserprofilesyncconnection[:dsc_usessl] = true
    expect(dsc_xspuserprofilesyncconnection[:dsc_usessl]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_usessl" do
    dsc_xspuserprofilesyncconnection[:dsc_usessl] = 'true'
    expect(dsc_xspuserprofilesyncconnection[:dsc_usessl]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_usessl" do
    dsc_xspuserprofilesyncconnection[:dsc_usessl] = 'false'
    expect(dsc_xspuserprofilesyncconnection[:dsc_usessl]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_usessl" do
    dsc_xspuserprofilesyncconnection[:dsc_usessl] = 'True'
    expect(dsc_xspuserprofilesyncconnection[:dsc_usessl]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_usessl" do
    dsc_xspuserprofilesyncconnection[:dsc_usessl] = 'False'
    expect(dsc_xspuserprofilesyncconnection[:dsc_usessl]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_usessl" do
    dsc_xspuserprofilesyncconnection[:dsc_usessl] = :true
    expect(dsc_xspuserprofilesyncconnection[:dsc_usessl]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_usessl" do
    dsc_xspuserprofilesyncconnection[:dsc_usessl] = :false
    expect(dsc_xspuserprofilesyncconnection[:dsc_usessl]).to eq(false)
  end

  it 'should not accept int for dsc_usessl' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_usessl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usessl' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_usessl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_force' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_force] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_force' do
    dsc_xspuserprofilesyncconnection[:dsc_force] = true
    expect(dsc_xspuserprofilesyncconnection[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_force" do
    dsc_xspuserprofilesyncconnection[:dsc_force] = 'true'
    expect(dsc_xspuserprofilesyncconnection[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_force" do
    dsc_xspuserprofilesyncconnection[:dsc_force] = 'false'
    expect(dsc_xspuserprofilesyncconnection[:dsc_force]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_force" do
    dsc_xspuserprofilesyncconnection[:dsc_force] = 'True'
    expect(dsc_xspuserprofilesyncconnection[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_force" do
    dsc_xspuserprofilesyncconnection[:dsc_force] = 'False'
    expect(dsc_xspuserprofilesyncconnection[:dsc_force]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_force" do
    dsc_xspuserprofilesyncconnection[:dsc_force] = :true
    expect(dsc_xspuserprofilesyncconnection[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_force" do
    dsc_xspuserprofilesyncconnection[:dsc_force] = :false
    expect(dsc_xspuserprofilesyncconnection[:dsc_force]).to eq(false)
  end

  it 'should not accept int for dsc_force' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_force] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_force' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_force] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_connectiontype predefined value ActiveDirectory' do
    dsc_xspuserprofilesyncconnection[:dsc_connectiontype] = 'ActiveDirectory'
    expect(dsc_xspuserprofilesyncconnection[:dsc_connectiontype]).to eq('ActiveDirectory')
  end

  it 'should accept dsc_connectiontype predefined value activedirectory' do
    dsc_xspuserprofilesyncconnection[:dsc_connectiontype] = 'activedirectory'
    expect(dsc_xspuserprofilesyncconnection[:dsc_connectiontype]).to eq('activedirectory')
  end

  it 'should accept dsc_connectiontype predefined value BusinessDataCatalog' do
    dsc_xspuserprofilesyncconnection[:dsc_connectiontype] = 'BusinessDataCatalog'
    expect(dsc_xspuserprofilesyncconnection[:dsc_connectiontype]).to eq('BusinessDataCatalog')
  end

  it 'should accept dsc_connectiontype predefined value businessdatacatalog' do
    dsc_xspuserprofilesyncconnection[:dsc_connectiontype] = 'businessdatacatalog'
    expect(dsc_xspuserprofilesyncconnection[:dsc_connectiontype]).to eq('businessdatacatalog')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_connectiontype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectiontype' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_connectiontype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectiontype' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_connectiontype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectiontype' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_connectiontype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectiontype' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_connectiontype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspuserprofilesyncconnection[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspuserprofilesyncconnection[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspuserprofilesyncconnection)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspuserprofilesyncconnection)
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
