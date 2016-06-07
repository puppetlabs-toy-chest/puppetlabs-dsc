#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspserviceappsecurity) do

  let :dsc_xspserviceappsecurity do
    Puppet::Type.type(:dsc_xspserviceappsecurity).new(
      :name     => 'foo',
      :dsc_serviceappname => 'foo',
      :dsc_securitytype => 'Administrators',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xspserviceappsecurity).new(
      :name     => 'foo',
      :dsc_serviceappname => 'foo',
      :dsc_securitytype => 'Administrators',
      :dsc_members => {"Username"=>"foo", "AccessLevel"=>"Change Permissions"},
      :dsc_memberstoinclude => {"Username"=>"foo", "AccessLevel"=>"Change Permissions"},
      :dsc_memberstoexclude => ["foo", "bar", "spec"],
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xspserviceappsecurity.to_s).to eq("Dsc_xspserviceappsecurity[foo]")
  end

  it 'should require that dsc_serviceappname is specified' do
    #dsc_xspserviceappsecurity[:dsc_serviceappname]
    expect { Puppet::Type.type(:dsc_xspserviceappsecurity).new(
      :name     => 'foo',
      :dsc_securitytype => 'Administrators',
    )}.to raise_error(Puppet::Error, /dsc_serviceappname is a required attribute/)
  end

  it 'should not accept array for dsc_serviceappname' do
    expect{dsc_xspserviceappsecurity[:dsc_serviceappname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serviceappname' do
    expect{dsc_xspserviceappsecurity[:dsc_serviceappname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serviceappname' do
    expect{dsc_xspserviceappsecurity[:dsc_serviceappname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceappname' do
    expect{dsc_xspserviceappsecurity[:dsc_serviceappname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_securitytype is specified' do
    #dsc_xspserviceappsecurity[:dsc_securitytype]
    expect { Puppet::Type.type(:dsc_xspserviceappsecurity).new(
      :name     => 'foo',
      :dsc_serviceappname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_securitytype is a required attribute/)
  end

  it 'should accept dsc_securitytype predefined value Administrators' do
    dsc_xspserviceappsecurity[:dsc_securitytype] = 'Administrators'
    expect(dsc_xspserviceappsecurity[:dsc_securitytype]).to eq('Administrators')
  end

  it 'should accept dsc_securitytype predefined value administrators' do
    dsc_xspserviceappsecurity[:dsc_securitytype] = 'administrators'
    expect(dsc_xspserviceappsecurity[:dsc_securitytype]).to eq('administrators')
  end

  it 'should accept dsc_securitytype predefined value SharingPermissions' do
    dsc_xspserviceappsecurity[:dsc_securitytype] = 'SharingPermissions'
    expect(dsc_xspserviceappsecurity[:dsc_securitytype]).to eq('SharingPermissions')
  end

  it 'should accept dsc_securitytype predefined value sharingpermissions' do
    dsc_xspserviceappsecurity[:dsc_securitytype] = 'sharingpermissions'
    expect(dsc_xspserviceappsecurity[:dsc_securitytype]).to eq('sharingpermissions')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspserviceappsecurity[:dsc_securitytype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_securitytype' do
    expect{dsc_xspserviceappsecurity[:dsc_securitytype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_securitytype' do
    expect{dsc_xspserviceappsecurity[:dsc_securitytype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_securitytype' do
    expect{dsc_xspserviceappsecurity[:dsc_securitytype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_securitytype' do
    expect{dsc_xspserviceappsecurity[:dsc_securitytype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept a hash for dsc_members' do
    dsc_xspserviceappsecurity[:dsc_members] = {"Username"=>"foo", "AccessLevel"=>"Change Permissions"}
    expect(dsc_xspserviceappsecurity[:dsc_members]).to eq([{"Username"=>"foo", "AccessLevel"=>"Change Permissions"}])
  end

  it 'should accept a an array of hashes for dsc_members' do
    dsc_xspserviceappsecurity[:dsc_members] = [{"Username"=>"foo", "AccessLevel"=>"Change Permissions"}]
    expect(dsc_xspserviceappsecurity[:dsc_members]).to eq([{"Username"=>"foo", "AccessLevel"=>"Change Permissions"}])
  end

  it 'should not accept boolean for dsc_members' do
    expect{dsc_xspserviceappsecurity[:dsc_members] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_members' do
    expect{dsc_xspserviceappsecurity[:dsc_members] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_members' do
    expect{dsc_xspserviceappsecurity[:dsc_members] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept a hash for dsc_memberstoinclude' do
    dsc_xspserviceappsecurity[:dsc_memberstoinclude] = {"Username"=>"foo", "AccessLevel"=>"Change Permissions"}
    expect(dsc_xspserviceappsecurity[:dsc_memberstoinclude]).to eq([{"Username"=>"foo", "AccessLevel"=>"Change Permissions"}])
  end

  it 'should accept a an array of hashes for dsc_memberstoinclude' do
    dsc_xspserviceappsecurity[:dsc_memberstoinclude] = [{"Username"=>"foo", "AccessLevel"=>"Change Permissions"}]
    expect(dsc_xspserviceappsecurity[:dsc_memberstoinclude]).to eq([{"Username"=>"foo", "AccessLevel"=>"Change Permissions"}])
  end

  it 'should not accept boolean for dsc_memberstoinclude' do
    expect{dsc_xspserviceappsecurity[:dsc_memberstoinclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoinclude' do
    expect{dsc_xspserviceappsecurity[:dsc_memberstoinclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoinclude' do
    expect{dsc_xspserviceappsecurity[:dsc_memberstoinclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_memberstoexclude' do
    dsc_xspserviceappsecurity[:dsc_memberstoexclude] = ["foo", "bar", "spec"]
    expect(dsc_xspserviceappsecurity[:dsc_memberstoexclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_memberstoexclude' do
    expect{dsc_xspserviceappsecurity[:dsc_memberstoexclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoexclude' do
    expect{dsc_xspserviceappsecurity[:dsc_memberstoexclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoexclude' do
    expect{dsc_xspserviceappsecurity[:dsc_memberstoexclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspserviceappsecurity[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspserviceappsecurity[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspserviceappsecurity[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspserviceappsecurity[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspserviceappsecurity[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspserviceappsecurity)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspserviceappsecurity)
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
