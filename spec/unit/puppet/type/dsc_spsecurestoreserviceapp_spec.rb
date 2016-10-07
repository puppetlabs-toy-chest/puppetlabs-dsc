#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spsecurestoreserviceapp) do

  let :dsc_spsecurestoreserviceapp do
    Puppet::Type.type(:dsc_spsecurestoreserviceapp).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spsecurestoreserviceapp).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_applicationpool => 'foo',
      :dsc_auditingenabled => true,
      :dsc_auditlogmaxsize => 32,
      :dsc_databasecredentials => {"user"=>"user", "password"=>"password"},
      :dsc_databasename => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_databaseauthenticationtype => 'Windows',
      :dsc_failoverdatabaseserver => 'foo',
      :dsc_partitionmode => true,
      :dsc_sharing => true,
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spsecurestoreserviceapp.to_s).to eq("Dsc_spsecurestoreserviceapp[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spsecurestoreserviceapp[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_spsecurestoreserviceapp[:dsc_name]
    expect { Puppet::Type.type(:dsc_spsecurestoreserviceapp).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spsecurestoreserviceapp[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spsecurestoreserviceapp[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spsecurestoreserviceapp[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spsecurestoreserviceapp[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpool' do
    expect{dsc_spsecurestoreserviceapp[:dsc_applicationpool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpool' do
    expect{dsc_spsecurestoreserviceapp[:dsc_applicationpool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpool' do
    expect{dsc_spsecurestoreserviceapp[:dsc_applicationpool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpool' do
    expect{dsc_spsecurestoreserviceapp[:dsc_applicationpool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_auditingenabled' do
    expect{dsc_spsecurestoreserviceapp[:dsc_auditingenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_auditingenabled' do
    dsc_spsecurestoreserviceapp[:dsc_auditingenabled] = true
    expect(dsc_spsecurestoreserviceapp[:dsc_auditingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_auditingenabled" do
    dsc_spsecurestoreserviceapp[:dsc_auditingenabled] = 'true'
    expect(dsc_spsecurestoreserviceapp[:dsc_auditingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_auditingenabled" do
    dsc_spsecurestoreserviceapp[:dsc_auditingenabled] = 'false'
    expect(dsc_spsecurestoreserviceapp[:dsc_auditingenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_auditingenabled" do
    dsc_spsecurestoreserviceapp[:dsc_auditingenabled] = 'True'
    expect(dsc_spsecurestoreserviceapp[:dsc_auditingenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_auditingenabled" do
    dsc_spsecurestoreserviceapp[:dsc_auditingenabled] = 'False'
    expect(dsc_spsecurestoreserviceapp[:dsc_auditingenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_auditingenabled" do
    dsc_spsecurestoreserviceapp[:dsc_auditingenabled] = :true
    expect(dsc_spsecurestoreserviceapp[:dsc_auditingenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_auditingenabled" do
    dsc_spsecurestoreserviceapp[:dsc_auditingenabled] = :false
    expect(dsc_spsecurestoreserviceapp[:dsc_auditingenabled]).to eq(false)
  end

  it 'should not accept int for dsc_auditingenabled' do
    expect{dsc_spsecurestoreserviceapp[:dsc_auditingenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_auditingenabled' do
    expect{dsc_spsecurestoreserviceapp[:dsc_auditingenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_auditlogmaxsize' do
    expect{dsc_spsecurestoreserviceapp[:dsc_auditlogmaxsize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_auditlogmaxsize' do
    expect{dsc_spsecurestoreserviceapp[:dsc_auditlogmaxsize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_auditlogmaxsize' do
    dsc_spsecurestoreserviceapp[:dsc_auditlogmaxsize] = 32
    expect(dsc_spsecurestoreserviceapp[:dsc_auditlogmaxsize]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_auditlogmaxsize' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spsecurestoreserviceapp[:dsc_auditlogmaxsize] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_auditlogmaxsize' do
    dsc_spsecurestoreserviceapp[:dsc_auditlogmaxsize] = '16'
    expect(dsc_spsecurestoreserviceapp[:dsc_auditlogmaxsize]).to eq(16)
  end

  it 'should accept string-like uint for dsc_auditlogmaxsize' do
    dsc_spsecurestoreserviceapp[:dsc_auditlogmaxsize] = '32'
    expect(dsc_spsecurestoreserviceapp[:dsc_auditlogmaxsize]).to eq(32)
  end

  it 'should accept string-like uint for dsc_auditlogmaxsize' do
    dsc_spsecurestoreserviceapp[:dsc_auditlogmaxsize] = '64'
    expect(dsc_spsecurestoreserviceapp[:dsc_auditlogmaxsize]).to eq(64)
  end

  it "should not accept empty password for dsc_databasecredentials" do
    expect{dsc_spsecurestoreserviceapp[:dsc_databasecredentials] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasecredentials' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databasecredentials] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasecredentials' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databasecredentials] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasecredentials' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databasecredentials] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasecredentials' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databasecredentials] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_databaseauthenticationtype predefined value Windows' do
    dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype] = 'Windows'
    expect(dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype]).to eq('Windows')
  end

  it 'should accept dsc_databaseauthenticationtype predefined value windows' do
    dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype] = 'windows'
    expect(dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype]).to eq('windows')
  end

  it 'should accept dsc_databaseauthenticationtype predefined value SQL' do
    dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype] = 'SQL'
    expect(dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype]).to eq('SQL')
  end

  it 'should accept dsc_databaseauthenticationtype predefined value sql' do
    dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype] = 'sql'
    expect(dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype]).to eq('sql')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseauthenticationtype' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseauthenticationtype' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseauthenticationtype' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseauthenticationtype' do
    expect{dsc_spsecurestoreserviceapp[:dsc_databaseauthenticationtype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_failoverdatabaseserver' do
    expect{dsc_spsecurestoreserviceapp[:dsc_failoverdatabaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_failoverdatabaseserver' do
    expect{dsc_spsecurestoreserviceapp[:dsc_failoverdatabaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_failoverdatabaseserver' do
    expect{dsc_spsecurestoreserviceapp[:dsc_failoverdatabaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_failoverdatabaseserver' do
    expect{dsc_spsecurestoreserviceapp[:dsc_failoverdatabaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_partitionmode' do
    expect{dsc_spsecurestoreserviceapp[:dsc_partitionmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_partitionmode' do
    dsc_spsecurestoreserviceapp[:dsc_partitionmode] = true
    expect(dsc_spsecurestoreserviceapp[:dsc_partitionmode]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_partitionmode" do
    dsc_spsecurestoreserviceapp[:dsc_partitionmode] = 'true'
    expect(dsc_spsecurestoreserviceapp[:dsc_partitionmode]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_partitionmode" do
    dsc_spsecurestoreserviceapp[:dsc_partitionmode] = 'false'
    expect(dsc_spsecurestoreserviceapp[:dsc_partitionmode]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_partitionmode" do
    dsc_spsecurestoreserviceapp[:dsc_partitionmode] = 'True'
    expect(dsc_spsecurestoreserviceapp[:dsc_partitionmode]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_partitionmode" do
    dsc_spsecurestoreserviceapp[:dsc_partitionmode] = 'False'
    expect(dsc_spsecurestoreserviceapp[:dsc_partitionmode]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_partitionmode" do
    dsc_spsecurestoreserviceapp[:dsc_partitionmode] = :true
    expect(dsc_spsecurestoreserviceapp[:dsc_partitionmode]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_partitionmode" do
    dsc_spsecurestoreserviceapp[:dsc_partitionmode] = :false
    expect(dsc_spsecurestoreserviceapp[:dsc_partitionmode]).to eq(false)
  end

  it 'should not accept int for dsc_partitionmode' do
    expect{dsc_spsecurestoreserviceapp[:dsc_partitionmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_partitionmode' do
    expect{dsc_spsecurestoreserviceapp[:dsc_partitionmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sharing' do
    expect{dsc_spsecurestoreserviceapp[:dsc_sharing] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_sharing' do
    dsc_spsecurestoreserviceapp[:dsc_sharing] = true
    expect(dsc_spsecurestoreserviceapp[:dsc_sharing]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_sharing" do
    dsc_spsecurestoreserviceapp[:dsc_sharing] = 'true'
    expect(dsc_spsecurestoreserviceapp[:dsc_sharing]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_sharing" do
    dsc_spsecurestoreserviceapp[:dsc_sharing] = 'false'
    expect(dsc_spsecurestoreserviceapp[:dsc_sharing]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_sharing" do
    dsc_spsecurestoreserviceapp[:dsc_sharing] = 'True'
    expect(dsc_spsecurestoreserviceapp[:dsc_sharing]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_sharing" do
    dsc_spsecurestoreserviceapp[:dsc_sharing] = 'False'
    expect(dsc_spsecurestoreserviceapp[:dsc_sharing]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_sharing" do
    dsc_spsecurestoreserviceapp[:dsc_sharing] = :true
    expect(dsc_spsecurestoreserviceapp[:dsc_sharing]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_sharing" do
    dsc_spsecurestoreserviceapp[:dsc_sharing] = :false
    expect(dsc_spsecurestoreserviceapp[:dsc_sharing]).to eq(false)
  end

  it 'should not accept int for dsc_sharing' do
    expect{dsc_spsecurestoreserviceapp[:dsc_sharing] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sharing' do
    expect{dsc_spsecurestoreserviceapp[:dsc_sharing] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spsecurestoreserviceapp[:dsc_ensure] = 'Present'
    expect(dsc_spsecurestoreserviceapp[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spsecurestoreserviceapp[:dsc_ensure] = 'present'
    expect(dsc_spsecurestoreserviceapp[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spsecurestoreserviceapp[:dsc_ensure] = 'present'
    expect(dsc_spsecurestoreserviceapp[:ensure]).to eq(dsc_spsecurestoreserviceapp[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spsecurestoreserviceapp[:dsc_ensure] = 'Absent'
    expect(dsc_spsecurestoreserviceapp[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spsecurestoreserviceapp[:dsc_ensure] = 'absent'
    expect(dsc_spsecurestoreserviceapp[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spsecurestoreserviceapp[:dsc_ensure] = 'absent'
    expect(dsc_spsecurestoreserviceapp[:ensure]).to eq(dsc_spsecurestoreserviceapp[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spsecurestoreserviceapp[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spsecurestoreserviceapp[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spsecurestoreserviceapp[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spsecurestoreserviceapp[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spsecurestoreserviceapp[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spsecurestoreserviceapp[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spsecurestoreserviceapp[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spsecurestoreserviceapp[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spsecurestoreserviceapp[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spsecurestoreserviceapp[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spsecurestoreserviceapp)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spsecurestoreserviceapp)
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

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_spsecurestoreserviceapp.original_parameters[:dsc_ensure] = 'present'
        dsc_spsecurestoreserviceapp[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spsecurestoreserviceapp)
      end

      it "should update :ensure to :present" do
        expect(dsc_spsecurestoreserviceapp[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_spsecurestoreserviceapp.original_parameters[:dsc_ensure] = 'absent'
        dsc_spsecurestoreserviceapp[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spsecurestoreserviceapp)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spsecurestoreserviceapp[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
