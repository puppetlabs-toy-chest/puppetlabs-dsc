#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spwebapplication) do

  let :dsc_spwebapplication do
    Puppet::Type.type(:dsc_spwebapplication).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spwebapplication).new(
      :name     => 'foo',
      :dsc_name => 'foo',
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
      :dsc_usessl => true,
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spwebapplication.to_s).to eq("Dsc_spwebapplication[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spwebapplication[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_spwebapplication[:dsc_name]
    expect { Puppet::Type.type(:dsc_spwebapplication).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spwebapplication[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spwebapplication[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spwebapplication[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spwebapplication[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpool' do
    expect{dsc_spwebapplication[:dsc_applicationpool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpool' do
    expect{dsc_spwebapplication[:dsc_applicationpool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpool' do
    expect{dsc_spwebapplication[:dsc_applicationpool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpool' do
    expect{dsc_spwebapplication[:dsc_applicationpool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpoolaccount' do
    expect{dsc_spwebapplication[:dsc_applicationpoolaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpoolaccount' do
    expect{dsc_spwebapplication[:dsc_applicationpoolaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpoolaccount' do
    expect{dsc_spwebapplication[:dsc_applicationpoolaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpoolaccount' do
    expect{dsc_spwebapplication[:dsc_applicationpoolaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_spwebapplication[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_spwebapplication[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_spwebapplication[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_spwebapplication[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowanonymous' do
    expect{dsc_spwebapplication[:dsc_allowanonymous] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowanonymous' do
    dsc_spwebapplication[:dsc_allowanonymous] = true
    expect(dsc_spwebapplication[:dsc_allowanonymous]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowanonymous" do
    dsc_spwebapplication[:dsc_allowanonymous] = 'true'
    expect(dsc_spwebapplication[:dsc_allowanonymous]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowanonymous" do
    dsc_spwebapplication[:dsc_allowanonymous] = 'false'
    expect(dsc_spwebapplication[:dsc_allowanonymous]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowanonymous" do
    dsc_spwebapplication[:dsc_allowanonymous] = 'True'
    expect(dsc_spwebapplication[:dsc_allowanonymous]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowanonymous" do
    dsc_spwebapplication[:dsc_allowanonymous] = 'False'
    expect(dsc_spwebapplication[:dsc_allowanonymous]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowanonymous" do
    dsc_spwebapplication[:dsc_allowanonymous] = :true
    expect(dsc_spwebapplication[:dsc_allowanonymous]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowanonymous" do
    dsc_spwebapplication[:dsc_allowanonymous] = :false
    expect(dsc_spwebapplication[:dsc_allowanonymous]).to eq(false)
  end

  it 'should not accept int for dsc_allowanonymous' do
    expect{dsc_spwebapplication[:dsc_allowanonymous] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowanonymous' do
    expect{dsc_spwebapplication[:dsc_allowanonymous] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_authenticationmethod predefined value NTLM' do
    dsc_spwebapplication[:dsc_authenticationmethod] = 'NTLM'
    expect(dsc_spwebapplication[:dsc_authenticationmethod]).to eq('NTLM')
  end

  it 'should accept dsc_authenticationmethod predefined value ntlm' do
    dsc_spwebapplication[:dsc_authenticationmethod] = 'ntlm'
    expect(dsc_spwebapplication[:dsc_authenticationmethod]).to eq('ntlm')
  end

  it 'should accept dsc_authenticationmethod predefined value Kerberos' do
    dsc_spwebapplication[:dsc_authenticationmethod] = 'Kerberos'
    expect(dsc_spwebapplication[:dsc_authenticationmethod]).to eq('Kerberos')
  end

  it 'should accept dsc_authenticationmethod predefined value kerberos' do
    dsc_spwebapplication[:dsc_authenticationmethod] = 'kerberos'
    expect(dsc_spwebapplication[:dsc_authenticationmethod]).to eq('kerberos')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spwebapplication[:dsc_authenticationmethod] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_authenticationmethod' do
    expect{dsc_spwebapplication[:dsc_authenticationmethod] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_authenticationmethod' do
    expect{dsc_spwebapplication[:dsc_authenticationmethod] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_authenticationmethod' do
    expect{dsc_spwebapplication[:dsc_authenticationmethod] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_authenticationmethod' do
    expect{dsc_spwebapplication[:dsc_authenticationmethod] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_spwebapplication[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_spwebapplication[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_spwebapplication[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_spwebapplication[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_spwebapplication[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_spwebapplication[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_spwebapplication[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_spwebapplication[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_hostheader' do
    expect{dsc_spwebapplication[:dsc_hostheader] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_hostheader' do
    expect{dsc_spwebapplication[:dsc_hostheader] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_hostheader' do
    expect{dsc_spwebapplication[:dsc_hostheader] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_hostheader' do
    expect{dsc_spwebapplication[:dsc_hostheader] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_spwebapplication[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_spwebapplication[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_spwebapplication[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_spwebapplication[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_port' do
    expect{dsc_spwebapplication[:dsc_port] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_port' do
    expect{dsc_spwebapplication[:dsc_port] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_port' do
    expect{dsc_spwebapplication[:dsc_port] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_port' do
    expect{dsc_spwebapplication[:dsc_port] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usessl' do
    expect{dsc_spwebapplication[:dsc_usessl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_usessl' do
    dsc_spwebapplication[:dsc_usessl] = true
    expect(dsc_spwebapplication[:dsc_usessl]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_usessl" do
    dsc_spwebapplication[:dsc_usessl] = 'true'
    expect(dsc_spwebapplication[:dsc_usessl]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_usessl" do
    dsc_spwebapplication[:dsc_usessl] = 'false'
    expect(dsc_spwebapplication[:dsc_usessl]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_usessl" do
    dsc_spwebapplication[:dsc_usessl] = 'True'
    expect(dsc_spwebapplication[:dsc_usessl]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_usessl" do
    dsc_spwebapplication[:dsc_usessl] = 'False'
    expect(dsc_spwebapplication[:dsc_usessl]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_usessl" do
    dsc_spwebapplication[:dsc_usessl] = :true
    expect(dsc_spwebapplication[:dsc_usessl]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_usessl" do
    dsc_spwebapplication[:dsc_usessl] = :false
    expect(dsc_spwebapplication[:dsc_usessl]).to eq(false)
  end

  it 'should not accept int for dsc_usessl' do
    expect{dsc_spwebapplication[:dsc_usessl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usessl' do
    expect{dsc_spwebapplication[:dsc_usessl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spwebapplication[:dsc_ensure] = 'Present'
    expect(dsc_spwebapplication[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spwebapplication[:dsc_ensure] = 'present'
    expect(dsc_spwebapplication[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spwebapplication[:dsc_ensure] = 'present'
    expect(dsc_spwebapplication[:ensure]).to eq(dsc_spwebapplication[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spwebapplication[:dsc_ensure] = 'Absent'
    expect(dsc_spwebapplication[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spwebapplication[:dsc_ensure] = 'absent'
    expect(dsc_spwebapplication[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spwebapplication[:dsc_ensure] = 'absent'
    expect(dsc_spwebapplication[:ensure]).to eq(dsc_spwebapplication[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spwebapplication[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spwebapplication[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spwebapplication[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spwebapplication[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spwebapplication[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spwebapplication[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spwebapplication[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spwebapplication[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spwebapplication[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spwebapplication[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spwebapplication)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spwebapplication)
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
        dsc_spwebapplication.original_parameters[:dsc_ensure] = 'present'
        dsc_spwebapplication[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spwebapplication)
      end

      it "should update :ensure to :present" do
        expect(dsc_spwebapplication[:ensure]).to eq(:present)
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
        dsc_spwebapplication.original_parameters[:dsc_ensure] = 'absent'
        dsc_spwebapplication[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spwebapplication)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spwebapplication[:ensure]).to eq(:absent)
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
