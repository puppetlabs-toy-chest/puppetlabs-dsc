#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spshelladmins) do

  let :dsc_spshelladmins do
    Puppet::Type.type(:dsc_spshelladmins).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spshelladmins).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_members => ["foo", "bar", "spec"],
      :dsc_memberstoinclude => ["foo", "bar", "spec"],
      :dsc_memberstoexclude => ["foo", "bar", "spec"],
      :dsc_contentdatabases => {"Name"=>"foo", "Members"=>["foo", "bar", "spec"], "MembersToInclude"=>["foo", "bar", "spec"], "MembersToExclude"=>["foo", "bar", "spec"]},
      :dsc_allcontentdatabases => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spshelladmins.to_s).to eq("Dsc_spshelladmins[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_spshelladmins[:dsc_name]
    expect { Puppet::Type.type(:dsc_spshelladmins).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spshelladmins[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spshelladmins[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spshelladmins[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spshelladmins[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_members' do
    dsc_spshelladmins[:dsc_members] = ["foo", "bar", "spec"]
    expect(dsc_spshelladmins[:dsc_members]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_members' do
    expect{dsc_spshelladmins[:dsc_members] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_members' do
    expect{dsc_spshelladmins[:dsc_members] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_members' do
    expect{dsc_spshelladmins[:dsc_members] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_memberstoinclude' do
    dsc_spshelladmins[:dsc_memberstoinclude] = ["foo", "bar", "spec"]
    expect(dsc_spshelladmins[:dsc_memberstoinclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_memberstoinclude' do
    expect{dsc_spshelladmins[:dsc_memberstoinclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoinclude' do
    expect{dsc_spshelladmins[:dsc_memberstoinclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoinclude' do
    expect{dsc_spshelladmins[:dsc_memberstoinclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_memberstoexclude' do
    dsc_spshelladmins[:dsc_memberstoexclude] = ["foo", "bar", "spec"]
    expect(dsc_spshelladmins[:dsc_memberstoexclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_memberstoexclude' do
    expect{dsc_spshelladmins[:dsc_memberstoexclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoexclude' do
    expect{dsc_spshelladmins[:dsc_memberstoexclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoexclude' do
    expect{dsc_spshelladmins[:dsc_memberstoexclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept a hash for dsc_contentdatabases' do
    dsc_spshelladmins[:dsc_contentdatabases] = {"Name"=>"foo", "Members"=>["foo", "bar", "spec"], "MembersToInclude"=>["foo", "bar", "spec"], "MembersToExclude"=>["foo", "bar", "spec"]}
    expect(dsc_spshelladmins[:dsc_contentdatabases]).to eq([{"Name"=>"foo", "Members"=>["foo", "bar", "spec"], "MembersToInclude"=>["foo", "bar", "spec"], "MembersToExclude"=>["foo", "bar", "spec"]}])
  end

  it 'should accept a an array of hashes for dsc_contentdatabases' do
    dsc_spshelladmins[:dsc_contentdatabases] = [{"Name"=>"foo", "Members"=>["foo", "bar", "spec"], "MembersToInclude"=>["foo", "bar", "spec"], "MembersToExclude"=>["foo", "bar", "spec"]}]
    expect(dsc_spshelladmins[:dsc_contentdatabases]).to eq([{"Name"=>"foo", "Members"=>["foo", "bar", "spec"], "MembersToInclude"=>["foo", "bar", "spec"], "MembersToExclude"=>["foo", "bar", "spec"]}])
  end

  it 'should not accept boolean for dsc_contentdatabases' do
    expect{dsc_spshelladmins[:dsc_contentdatabases] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_contentdatabases' do
    expect{dsc_spshelladmins[:dsc_contentdatabases] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_contentdatabases' do
    expect{dsc_spshelladmins[:dsc_contentdatabases] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allcontentdatabases' do
    expect{dsc_spshelladmins[:dsc_allcontentdatabases] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allcontentdatabases' do
    dsc_spshelladmins[:dsc_allcontentdatabases] = true
    expect(dsc_spshelladmins[:dsc_allcontentdatabases]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allcontentdatabases" do
    dsc_spshelladmins[:dsc_allcontentdatabases] = 'true'
    expect(dsc_spshelladmins[:dsc_allcontentdatabases]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allcontentdatabases" do
    dsc_spshelladmins[:dsc_allcontentdatabases] = 'false'
    expect(dsc_spshelladmins[:dsc_allcontentdatabases]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allcontentdatabases" do
    dsc_spshelladmins[:dsc_allcontentdatabases] = 'True'
    expect(dsc_spshelladmins[:dsc_allcontentdatabases]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allcontentdatabases" do
    dsc_spshelladmins[:dsc_allcontentdatabases] = 'False'
    expect(dsc_spshelladmins[:dsc_allcontentdatabases]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allcontentdatabases" do
    dsc_spshelladmins[:dsc_allcontentdatabases] = :true
    expect(dsc_spshelladmins[:dsc_allcontentdatabases]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allcontentdatabases" do
    dsc_spshelladmins[:dsc_allcontentdatabases] = :false
    expect(dsc_spshelladmins[:dsc_allcontentdatabases]).to eq(false)
  end

  it 'should not accept int for dsc_allcontentdatabases' do
    expect{dsc_spshelladmins[:dsc_allcontentdatabases] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allcontentdatabases' do
    expect{dsc_spshelladmins[:dsc_allcontentdatabases] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spshelladmins[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spshelladmins[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spshelladmins[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spshelladmins[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spshelladmins[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spshelladmins)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spshelladmins)
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
