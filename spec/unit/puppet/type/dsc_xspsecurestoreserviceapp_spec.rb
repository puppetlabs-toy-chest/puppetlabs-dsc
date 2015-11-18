#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspsecurestoreserviceapp) do

  let :dsc_xspsecurestoreserviceapp do
    Puppet::Type.type(:dsc_xspsecurestoreserviceapp).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspsecurestoreserviceapp.to_s).to eq("Dsc_xspsecurestoreserviceapp[foo]")
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspsecurestoreserviceapp[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspsecurestoreserviceapp).new(
      :name     => 'foo',
      :dsc_applicationpool => 'foo',
      :dsc_auditingenabled => true,
      :dsc_auditlogmaxsize => 32,
      :dsc_databasecredentials => {"user"=>"user", "password"=>"password"},
      :dsc_databasename => 'foo',
      :dsc_databasepassword => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_databaseusername => 'foo',
      :dsc_failoverdatabaseserver => 'foo',
      :dsc_partitionmode => true,
      :dsc_sharing => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpool' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_applicationpool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpool' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_applicationpool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpool' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_applicationpool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpool' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_applicationpool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_auditingenabled' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_auditingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_auditingenabled' do
    dsc_xspsecurestoreserviceapp[:dsc_auditingenabled] = true
    expect(dsc_xspsecurestoreserviceapp[:dsc_auditingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_auditingenabled" do
    dsc_xspsecurestoreserviceapp[:dsc_auditingenabled] = 'true'
    expect(dsc_xspsecurestoreserviceapp[:dsc_auditingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_auditingenabled" do
    dsc_xspsecurestoreserviceapp[:dsc_auditingenabled] = 'false'
    expect(dsc_xspsecurestoreserviceapp[:dsc_auditingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_auditingenabled" do
    dsc_xspsecurestoreserviceapp[:dsc_auditingenabled] = 'True'
    expect(dsc_xspsecurestoreserviceapp[:dsc_auditingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_auditingenabled" do
    dsc_xspsecurestoreserviceapp[:dsc_auditingenabled] = 'False'
    expect(dsc_xspsecurestoreserviceapp[:dsc_auditingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_auditingenabled" do
    dsc_xspsecurestoreserviceapp[:dsc_auditingenabled] = :true
    expect(dsc_xspsecurestoreserviceapp[:dsc_auditingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_auditingenabled" do
    dsc_xspsecurestoreserviceapp[:dsc_auditingenabled] = :false
    expect(dsc_xspsecurestoreserviceapp[:dsc_auditingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_auditingenabled' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_auditingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_auditingenabled' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_auditingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_auditlogmaxsize' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_auditlogmaxsize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_auditlogmaxsize' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_auditlogmaxsize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_auditlogmaxsize' do
    dsc_xspsecurestoreserviceapp[:dsc_auditlogmaxsize] = 32
    expect(dsc_xspsecurestoreserviceapp[:dsc_auditlogmaxsize]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_auditlogmaxsize' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspsecurestoreserviceapp[:dsc_auditlogmaxsize] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_auditlogmaxsize' do
    dsc_xspsecurestoreserviceapp[:dsc_auditlogmaxsize] = '16'
    expect(dsc_xspsecurestoreserviceapp[:dsc_auditlogmaxsize]).to eq(16)
  end

  it 'should accept string-like uint for dsc_auditlogmaxsize' do
    dsc_xspsecurestoreserviceapp[:dsc_auditlogmaxsize] = '32'
    expect(dsc_xspsecurestoreserviceapp[:dsc_auditlogmaxsize]).to eq(32)
  end

  it 'should accept string-like uint for dsc_auditlogmaxsize' do
    dsc_xspsecurestoreserviceapp[:dsc_auditlogmaxsize] = '64'
    expect(dsc_xspsecurestoreserviceapp[:dsc_auditlogmaxsize]).to eq(64)
  end

  it "should not accept empty password for dsc_databasecredentials" do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasecredentials] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasecredentials' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasecredentials] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasecredentials' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasecredentials] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasecredentials' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasecredentials] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasecredentials' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasecredentials] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasepassword' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasepassword] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasepassword' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasepassword] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasepassword' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasepassword] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasepassword' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databasepassword] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseusername' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databaseusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseusername' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databaseusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseusername' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databaseusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseusername' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_databaseusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_failoverdatabaseserver' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_failoverdatabaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_failoverdatabaseserver' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_failoverdatabaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_failoverdatabaseserver' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_failoverdatabaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_failoverdatabaseserver' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_failoverdatabaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_partitionmode' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_partitionmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_partitionmode' do
    dsc_xspsecurestoreserviceapp[:dsc_partitionmode] = true
    expect(dsc_xspsecurestoreserviceapp[:dsc_partitionmode]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_partitionmode" do
    dsc_xspsecurestoreserviceapp[:dsc_partitionmode] = 'true'
    expect(dsc_xspsecurestoreserviceapp[:dsc_partitionmode]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_partitionmode" do
    dsc_xspsecurestoreserviceapp[:dsc_partitionmode] = 'false'
    expect(dsc_xspsecurestoreserviceapp[:dsc_partitionmode]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_partitionmode" do
    dsc_xspsecurestoreserviceapp[:dsc_partitionmode] = 'True'
    expect(dsc_xspsecurestoreserviceapp[:dsc_partitionmode]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_partitionmode" do
    dsc_xspsecurestoreserviceapp[:dsc_partitionmode] = 'False'
    expect(dsc_xspsecurestoreserviceapp[:dsc_partitionmode]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_partitionmode" do
    dsc_xspsecurestoreserviceapp[:dsc_partitionmode] = :true
    expect(dsc_xspsecurestoreserviceapp[:dsc_partitionmode]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_partitionmode" do
    dsc_xspsecurestoreserviceapp[:dsc_partitionmode] = :false
    expect(dsc_xspsecurestoreserviceapp[:dsc_partitionmode]).to eq(false)
  end

  it 'should not accept int for dsc_partitionmode' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_partitionmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_partitionmode' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_partitionmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sharing' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_sharing] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_sharing' do
    dsc_xspsecurestoreserviceapp[:dsc_sharing] = true
    expect(dsc_xspsecurestoreserviceapp[:dsc_sharing]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_sharing" do
    dsc_xspsecurestoreserviceapp[:dsc_sharing] = 'true'
    expect(dsc_xspsecurestoreserviceapp[:dsc_sharing]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_sharing" do
    dsc_xspsecurestoreserviceapp[:dsc_sharing] = 'false'
    expect(dsc_xspsecurestoreserviceapp[:dsc_sharing]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_sharing" do
    dsc_xspsecurestoreserviceapp[:dsc_sharing] = 'True'
    expect(dsc_xspsecurestoreserviceapp[:dsc_sharing]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_sharing" do
    dsc_xspsecurestoreserviceapp[:dsc_sharing] = 'False'
    expect(dsc_xspsecurestoreserviceapp[:dsc_sharing]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_sharing" do
    dsc_xspsecurestoreserviceapp[:dsc_sharing] = :true
    expect(dsc_xspsecurestoreserviceapp[:dsc_sharing]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_sharing" do
    dsc_xspsecurestoreserviceapp[:dsc_sharing] = :false
    expect(dsc_xspsecurestoreserviceapp[:dsc_sharing]).to eq(false)
  end

  it 'should not accept int for dsc_sharing' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_sharing] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sharing' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_sharing] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspsecurestoreserviceapp[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspsecurestoreserviceapp[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspsecurestoreserviceapp)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspsecurestoreserviceapp)
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
