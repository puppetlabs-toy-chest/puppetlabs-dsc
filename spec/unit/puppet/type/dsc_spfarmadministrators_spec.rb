#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spfarmadministrators) do

  let :dsc_spfarmadministrators do
    Puppet::Type.type(:dsc_spfarmadministrators).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spfarmadministrators).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_members => ["foo", "bar", "spec"],
      :dsc_memberstoinclude => ["foo", "bar", "spec"],
      :dsc_memberstoexclude => ["foo", "bar", "spec"],
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spfarmadministrators.to_s).to eq("Dsc_spfarmadministrators[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_spfarmadministrators[:dsc_name]
    expect { Puppet::Type.type(:dsc_spfarmadministrators).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spfarmadministrators[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spfarmadministrators[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spfarmadministrators[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spfarmadministrators[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_members' do
    dsc_spfarmadministrators[:dsc_members] = ["foo", "bar", "spec"]
    expect(dsc_spfarmadministrators[:dsc_members]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_members' do
    expect{dsc_spfarmadministrators[:dsc_members] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_members' do
    expect{dsc_spfarmadministrators[:dsc_members] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_members' do
    expect{dsc_spfarmadministrators[:dsc_members] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_memberstoinclude' do
    dsc_spfarmadministrators[:dsc_memberstoinclude] = ["foo", "bar", "spec"]
    expect(dsc_spfarmadministrators[:dsc_memberstoinclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_memberstoinclude' do
    expect{dsc_spfarmadministrators[:dsc_memberstoinclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoinclude' do
    expect{dsc_spfarmadministrators[:dsc_memberstoinclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoinclude' do
    expect{dsc_spfarmadministrators[:dsc_memberstoinclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_memberstoexclude' do
    dsc_spfarmadministrators[:dsc_memberstoexclude] = ["foo", "bar", "spec"]
    expect(dsc_spfarmadministrators[:dsc_memberstoexclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_memberstoexclude' do
    expect{dsc_spfarmadministrators[:dsc_memberstoexclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoexclude' do
    expect{dsc_spfarmadministrators[:dsc_memberstoexclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoexclude' do
    expect{dsc_spfarmadministrators[:dsc_memberstoexclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spfarmadministrators[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spfarmadministrators[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spfarmadministrators[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spfarmadministrators[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spfarmadministrators[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spfarmadministrators)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spfarmadministrators)
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
