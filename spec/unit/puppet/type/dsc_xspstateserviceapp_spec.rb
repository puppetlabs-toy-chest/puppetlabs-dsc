#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspstateserviceapp) do

  let :dsc_xspstateserviceapp do
    Puppet::Type.type(:dsc_xspstateserviceapp).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspstateserviceapp.to_s).to eq("Dsc_xspstateserviceapp[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspstateserviceapp[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspstateserviceapp).new(
      :name     => 'foo',
      :dsc_databasecredentials => {"user"=>"user", "password"=>"password"},
      :dsc_databasename => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspstateserviceapp[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspstateserviceapp[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspstateserviceapp[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspstateserviceapp[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_databasecredentials" do
    expect{dsc_xspstateserviceapp[:dsc_databasecredentials] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasecredentials' do
    expect{dsc_xspstateserviceapp[:dsc_databasecredentials] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasecredentials' do
    expect{dsc_xspstateserviceapp[:dsc_databasecredentials] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasecredentials' do
    expect{dsc_xspstateserviceapp[:dsc_databasecredentials] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasecredentials' do
    expect{dsc_xspstateserviceapp[:dsc_databasecredentials] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_xspstateserviceapp[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_xspstateserviceapp[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_xspstateserviceapp[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_xspstateserviceapp[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_xspstateserviceapp[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_xspstateserviceapp[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_xspstateserviceapp[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_xspstateserviceapp[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspstateserviceapp[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspstateserviceapp[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspstateserviceapp[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspstateserviceapp[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspstateserviceapp[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspstateserviceapp)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspstateserviceapp)
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
