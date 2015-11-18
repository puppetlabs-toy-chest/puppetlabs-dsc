#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspmanagedaccount) do

  let :dsc_xspmanagedaccount do
    Puppet::Type.type(:dsc_xspmanagedaccount).new(
      :name     => 'foo',
      :dsc_accountname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspmanagedaccount.to_s).to eq("Dsc_xspmanagedaccount[foo]")
  end

  it 'should require that dsc_accountname is specified' do
    #dsc_xspmanagedaccount[:dsc_accountname]
    expect { Puppet::Type.type(:dsc_xspmanagedaccount).new(
      :name     => 'foo',
      :dsc_account => {"user"=>"user", "password"=>"password"},
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
      :dsc_emailnotification => 32,
      :dsc_preexpiredays => 32,
      :dsc_schedule => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_accountname is a required attribute/)
  end

  it 'should not accept array for dsc_accountname' do
    expect{dsc_xspmanagedaccount[:dsc_accountname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_accountname' do
    expect{dsc_xspmanagedaccount[:dsc_accountname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_accountname' do
    expect{dsc_xspmanagedaccount[:dsc_accountname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_accountname' do
    expect{dsc_xspmanagedaccount[:dsc_accountname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_account" do
    expect{dsc_xspmanagedaccount[:dsc_account] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_account' do
    expect{dsc_xspmanagedaccount[:dsc_account] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_account' do
    expect{dsc_xspmanagedaccount[:dsc_account] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_account' do
    expect{dsc_xspmanagedaccount[:dsc_account] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_account' do
    expect{dsc_xspmanagedaccount[:dsc_account] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspmanagedaccount[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspmanagedaccount[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspmanagedaccount[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspmanagedaccount[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspmanagedaccount[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_emailnotification' do
    expect{dsc_xspmanagedaccount[:dsc_emailnotification] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_emailnotification' do
    expect{dsc_xspmanagedaccount[:dsc_emailnotification] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_emailnotification' do
    dsc_xspmanagedaccount[:dsc_emailnotification] = 32
    expect(dsc_xspmanagedaccount[:dsc_emailnotification]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_emailnotification' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspmanagedaccount[:dsc_emailnotification] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_emailnotification' do
    dsc_xspmanagedaccount[:dsc_emailnotification] = '16'
    expect(dsc_xspmanagedaccount[:dsc_emailnotification]).to eq(16)
  end

  it 'should accept string-like uint for dsc_emailnotification' do
    dsc_xspmanagedaccount[:dsc_emailnotification] = '32'
    expect(dsc_xspmanagedaccount[:dsc_emailnotification]).to eq(32)
  end

  it 'should accept string-like uint for dsc_emailnotification' do
    dsc_xspmanagedaccount[:dsc_emailnotification] = '64'
    expect(dsc_xspmanagedaccount[:dsc_emailnotification]).to eq(64)
  end

  it 'should not accept array for dsc_preexpiredays' do
    expect{dsc_xspmanagedaccount[:dsc_preexpiredays] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_preexpiredays' do
    expect{dsc_xspmanagedaccount[:dsc_preexpiredays] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_preexpiredays' do
    dsc_xspmanagedaccount[:dsc_preexpiredays] = 32
    expect(dsc_xspmanagedaccount[:dsc_preexpiredays]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_preexpiredays' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspmanagedaccount[:dsc_preexpiredays] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_preexpiredays' do
    dsc_xspmanagedaccount[:dsc_preexpiredays] = '16'
    expect(dsc_xspmanagedaccount[:dsc_preexpiredays]).to eq(16)
  end

  it 'should accept string-like uint for dsc_preexpiredays' do
    dsc_xspmanagedaccount[:dsc_preexpiredays] = '32'
    expect(dsc_xspmanagedaccount[:dsc_preexpiredays]).to eq(32)
  end

  it 'should accept string-like uint for dsc_preexpiredays' do
    dsc_xspmanagedaccount[:dsc_preexpiredays] = '64'
    expect(dsc_xspmanagedaccount[:dsc_preexpiredays]).to eq(64)
  end

  it 'should not accept array for dsc_schedule' do
    expect{dsc_xspmanagedaccount[:dsc_schedule] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_schedule' do
    expect{dsc_xspmanagedaccount[:dsc_schedule] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_schedule' do
    expect{dsc_xspmanagedaccount[:dsc_schedule] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_schedule' do
    expect{dsc_xspmanagedaccount[:dsc_schedule] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspmanagedaccount)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspmanagedaccount)
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
