#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspfarmadministrators) do

  let :dsc_xspfarmadministrators do
    Puppet::Type.type(:dsc_xspfarmadministrators).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspfarmadministrators.to_s).to eq("Dsc_xspfarmadministrators[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspfarmadministrators[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspfarmadministrators).new(
      :name     => 'foo',
      :dsc_members => ["foo", "bar", "spec"],
      :dsc_memberstoinclude => ["foo", "bar", "spec"],
      :dsc_memberstoexclude => ["foo", "bar", "spec"],
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspfarmadministrators[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspfarmadministrators[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspfarmadministrators[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspfarmadministrators[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_members' do
    dsc_xspfarmadministrators[:dsc_members] = ["foo", "bar", "spec"]
    expect(dsc_xspfarmadministrators[:dsc_members]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_members' do
    expect{dsc_xspfarmadministrators[:dsc_members] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_members' do
    expect{dsc_xspfarmadministrators[:dsc_members] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_members' do
    expect{dsc_xspfarmadministrators[:dsc_members] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_memberstoinclude' do
    dsc_xspfarmadministrators[:dsc_memberstoinclude] = ["foo", "bar", "spec"]
    expect(dsc_xspfarmadministrators[:dsc_memberstoinclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_memberstoinclude' do
    expect{dsc_xspfarmadministrators[:dsc_memberstoinclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoinclude' do
    expect{dsc_xspfarmadministrators[:dsc_memberstoinclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoinclude' do
    expect{dsc_xspfarmadministrators[:dsc_memberstoinclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_memberstoexclude' do
    dsc_xspfarmadministrators[:dsc_memberstoexclude] = ["foo", "bar", "spec"]
    expect(dsc_xspfarmadministrators[:dsc_memberstoexclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_memberstoexclude' do
    expect{dsc_xspfarmadministrators[:dsc_memberstoexclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoexclude' do
    expect{dsc_xspfarmadministrators[:dsc_memberstoexclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoexclude' do
    expect{dsc_xspfarmadministrators[:dsc_memberstoexclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspfarmadministrators[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspfarmadministrators[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspfarmadministrators[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspfarmadministrators[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspfarmadministrators[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspfarmadministrators)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspfarmadministrators)
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
