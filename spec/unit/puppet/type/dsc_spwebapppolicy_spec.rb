#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spwebapppolicy) do

  let :dsc_spwebapppolicy do
    Puppet::Type.type(:dsc_spwebapppolicy).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spwebapppolicy).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_members => {"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true},
      :dsc_memberstoinclude => {"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true},
      :dsc_memberstoexclude => {"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true},
      :dsc_setcacheaccountspolicy => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spwebapppolicy.to_s).to eq("Dsc_spwebapppolicy[foo]")
  end

  it 'should require that dsc_webappurl is specified' do
    #dsc_spwebapppolicy[:dsc_webappurl]
    expect { Puppet::Type.type(:dsc_spwebapppolicy).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_webappurl is a required attribute/)
  end

  it 'should not accept array for dsc_webappurl' do
    expect{dsc_spwebapppolicy[:dsc_webappurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webappurl' do
    expect{dsc_spwebapppolicy[:dsc_webappurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webappurl' do
    expect{dsc_spwebapppolicy[:dsc_webappurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webappurl' do
    expect{dsc_spwebapppolicy[:dsc_webappurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept a hash for dsc_members' do
    dsc_spwebapppolicy[:dsc_members] = {"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}
    expect(dsc_spwebapppolicy[:dsc_members]).to eq([{"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}])
  end

  it 'should accept a an array of hashes for dsc_members' do
    dsc_spwebapppolicy[:dsc_members] = [{"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}]
    expect(dsc_spwebapppolicy[:dsc_members]).to eq([{"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}])
  end

  it 'should not accept boolean for dsc_members' do
    expect{dsc_spwebapppolicy[:dsc_members] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_members' do
    expect{dsc_spwebapppolicy[:dsc_members] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_members' do
    expect{dsc_spwebapppolicy[:dsc_members] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept a hash for dsc_memberstoinclude' do
    dsc_spwebapppolicy[:dsc_memberstoinclude] = {"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}
    expect(dsc_spwebapppolicy[:dsc_memberstoinclude]).to eq([{"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}])
  end

  it 'should accept a an array of hashes for dsc_memberstoinclude' do
    dsc_spwebapppolicy[:dsc_memberstoinclude] = [{"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}]
    expect(dsc_spwebapppolicy[:dsc_memberstoinclude]).to eq([{"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}])
  end

  it 'should not accept boolean for dsc_memberstoinclude' do
    expect{dsc_spwebapppolicy[:dsc_memberstoinclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoinclude' do
    expect{dsc_spwebapppolicy[:dsc_memberstoinclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoinclude' do
    expect{dsc_spwebapppolicy[:dsc_memberstoinclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept a hash for dsc_memberstoexclude' do
    dsc_spwebapppolicy[:dsc_memberstoexclude] = {"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}
    expect(dsc_spwebapppolicy[:dsc_memberstoexclude]).to eq([{"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}])
  end

  it 'should accept a an array of hashes for dsc_memberstoexclude' do
    dsc_spwebapppolicy[:dsc_memberstoexclude] = [{"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}]
    expect(dsc_spwebapppolicy[:dsc_memberstoexclude]).to eq([{"Username"=>"foo", "PermissionLevel"=>"Deny All", "IdentityType"=>"Claims", "ActAsSystemAccount"=>true}])
  end

  it 'should not accept boolean for dsc_memberstoexclude' do
    expect{dsc_spwebapppolicy[:dsc_memberstoexclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoexclude' do
    expect{dsc_spwebapppolicy[:dsc_memberstoexclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoexclude' do
    expect{dsc_spwebapppolicy[:dsc_memberstoexclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setcacheaccountspolicy' do
    expect{dsc_spwebapppolicy[:dsc_setcacheaccountspolicy] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_setcacheaccountspolicy' do
    dsc_spwebapppolicy[:dsc_setcacheaccountspolicy] = true
    expect(dsc_spwebapppolicy[:dsc_setcacheaccountspolicy]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_setcacheaccountspolicy" do
    dsc_spwebapppolicy[:dsc_setcacheaccountspolicy] = 'true'
    expect(dsc_spwebapppolicy[:dsc_setcacheaccountspolicy]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_setcacheaccountspolicy" do
    dsc_spwebapppolicy[:dsc_setcacheaccountspolicy] = 'false'
    expect(dsc_spwebapppolicy[:dsc_setcacheaccountspolicy]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_setcacheaccountspolicy" do
    dsc_spwebapppolicy[:dsc_setcacheaccountspolicy] = 'True'
    expect(dsc_spwebapppolicy[:dsc_setcacheaccountspolicy]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_setcacheaccountspolicy" do
    dsc_spwebapppolicy[:dsc_setcacheaccountspolicy] = 'False'
    expect(dsc_spwebapppolicy[:dsc_setcacheaccountspolicy]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_setcacheaccountspolicy" do
    dsc_spwebapppolicy[:dsc_setcacheaccountspolicy] = :true
    expect(dsc_spwebapppolicy[:dsc_setcacheaccountspolicy]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_setcacheaccountspolicy" do
    dsc_spwebapppolicy[:dsc_setcacheaccountspolicy] = :false
    expect(dsc_spwebapppolicy[:dsc_setcacheaccountspolicy]).to eq(false)
  end

  it 'should not accept int for dsc_setcacheaccountspolicy' do
    expect{dsc_spwebapppolicy[:dsc_setcacheaccountspolicy] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setcacheaccountspolicy' do
    expect{dsc_spwebapppolicy[:dsc_setcacheaccountspolicy] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spwebapppolicy[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spwebapppolicy[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spwebapppolicy[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spwebapppolicy[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spwebapppolicy[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spwebapppolicy)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spwebapppolicy)
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
