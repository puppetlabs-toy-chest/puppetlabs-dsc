#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspwebapplication) do

  let :dsc_xspwebapplication do
    Puppet::Type.type(:dsc_xspwebapplication).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspwebapplication.to_s).to eq("Dsc_xspwebapplication[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspwebapplication[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspwebapplication).new(
      :name     => 'foo',
      :dsc_applicationpool => 'foo',
      :dsc_applicationpoolaccount => 'foo',
      :dsc_url => 'foo',
      :dsc_allowanonymous => true,
      :dsc_authenticationmethod => 'NTLM',
      :dsc_databasename => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_hostheader => 'foo',
      :dsc_path => 'foo',
      :dsc_port => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspwebapplication[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspwebapplication[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspwebapplication[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspwebapplication[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpool' do
    expect{dsc_xspwebapplication[:dsc_applicationpool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpool' do
    expect{dsc_xspwebapplication[:dsc_applicationpool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpool' do
    expect{dsc_xspwebapplication[:dsc_applicationpool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpool' do
    expect{dsc_xspwebapplication[:dsc_applicationpool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpoolaccount' do
    expect{dsc_xspwebapplication[:dsc_applicationpoolaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpoolaccount' do
    expect{dsc_xspwebapplication[:dsc_applicationpoolaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpoolaccount' do
    expect{dsc_xspwebapplication[:dsc_applicationpoolaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpoolaccount' do
    expect{dsc_xspwebapplication[:dsc_applicationpoolaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_xspwebapplication[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_xspwebapplication[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_xspwebapplication[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_xspwebapplication[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowanonymous' do
    expect{dsc_xspwebapplication[:dsc_allowanonymous] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowanonymous' do
    dsc_xspwebapplication[:dsc_allowanonymous] = true
    expect(dsc_xspwebapplication[:dsc_allowanonymous]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowanonymous" do
    dsc_xspwebapplication[:dsc_allowanonymous] = 'true'
    expect(dsc_xspwebapplication[:dsc_allowanonymous]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowanonymous" do
    dsc_xspwebapplication[:dsc_allowanonymous] = 'false'
    expect(dsc_xspwebapplication[:dsc_allowanonymous]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowanonymous" do
    dsc_xspwebapplication[:dsc_allowanonymous] = 'True'
    expect(dsc_xspwebapplication[:dsc_allowanonymous]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowanonymous" do
    dsc_xspwebapplication[:dsc_allowanonymous] = 'False'
    expect(dsc_xspwebapplication[:dsc_allowanonymous]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowanonymous" do
    dsc_xspwebapplication[:dsc_allowanonymous] = :true
    expect(dsc_xspwebapplication[:dsc_allowanonymous]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowanonymous" do
    dsc_xspwebapplication[:dsc_allowanonymous] = :false
    expect(dsc_xspwebapplication[:dsc_allowanonymous]).to eq(false)
  end

  it 'should not accept int for dsc_allowanonymous' do
    expect{dsc_xspwebapplication[:dsc_allowanonymous] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowanonymous' do
    expect{dsc_xspwebapplication[:dsc_allowanonymous] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_authenticationmethod predefined value NTLM' do
    dsc_xspwebapplication[:dsc_authenticationmethod] = 'NTLM'
    expect(dsc_xspwebapplication[:dsc_authenticationmethod]).to eq('NTLM')
  end

  it 'should accept dsc_authenticationmethod predefined value ntlm' do
    dsc_xspwebapplication[:dsc_authenticationmethod] = 'ntlm'
    expect(dsc_xspwebapplication[:dsc_authenticationmethod]).to eq('ntlm')
  end

  it 'should accept dsc_authenticationmethod predefined value Kerberos' do
    dsc_xspwebapplication[:dsc_authenticationmethod] = 'Kerberos'
    expect(dsc_xspwebapplication[:dsc_authenticationmethod]).to eq('Kerberos')
  end

  it 'should accept dsc_authenticationmethod predefined value kerberos' do
    dsc_xspwebapplication[:dsc_authenticationmethod] = 'kerberos'
    expect(dsc_xspwebapplication[:dsc_authenticationmethod]).to eq('kerberos')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspwebapplication[:dsc_authenticationmethod] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_authenticationmethod' do
    expect{dsc_xspwebapplication[:dsc_authenticationmethod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_authenticationmethod' do
    expect{dsc_xspwebapplication[:dsc_authenticationmethod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_authenticationmethod' do
    expect{dsc_xspwebapplication[:dsc_authenticationmethod] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_authenticationmethod' do
    expect{dsc_xspwebapplication[:dsc_authenticationmethod] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_xspwebapplication[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_xspwebapplication[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_xspwebapplication[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_xspwebapplication[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_xspwebapplication[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_xspwebapplication[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_xspwebapplication[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_xspwebapplication[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_hostheader' do
    expect{dsc_xspwebapplication[:dsc_hostheader] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_hostheader' do
    expect{dsc_xspwebapplication[:dsc_hostheader] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_hostheader' do
    expect{dsc_xspwebapplication[:dsc_hostheader] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_hostheader' do
    expect{dsc_xspwebapplication[:dsc_hostheader] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xspwebapplication[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xspwebapplication[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xspwebapplication[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xspwebapplication[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_port' do
    expect{dsc_xspwebapplication[:dsc_port] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_port' do
    expect{dsc_xspwebapplication[:dsc_port] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_port' do
    expect{dsc_xspwebapplication[:dsc_port] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_port' do
    expect{dsc_xspwebapplication[:dsc_port] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspwebapplication[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspwebapplication[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspwebapplication[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspwebapplication[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspwebapplication[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspwebapplication)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspwebapplication)
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
