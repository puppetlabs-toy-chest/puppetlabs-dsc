#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spcontentdatabase) do

  let :dsc_spcontentdatabase do
    Puppet::Type.type(:dsc_spcontentdatabase).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spcontentdatabase).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_databaseserver => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_enabled => true,
      :dsc_warningsitecount => 16,
      :dsc_maximumsitecount => 16,
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spcontentdatabase.to_s).to eq("Dsc_spcontentdatabase[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spcontentdatabase[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_spcontentdatabase[:dsc_name]
    expect { Puppet::Type.type(:dsc_spcontentdatabase).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spcontentdatabase[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spcontentdatabase[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spcontentdatabase[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spcontentdatabase[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_databaseserver' do
    expect{dsc_spcontentdatabase[:dsc_databaseserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databaseserver' do
    expect{dsc_spcontentdatabase[:dsc_databaseserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databaseserver' do
    expect{dsc_spcontentdatabase[:dsc_databaseserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databaseserver' do
    expect{dsc_spcontentdatabase[:dsc_databaseserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_webappurl' do
    expect{dsc_spcontentdatabase[:dsc_webappurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webappurl' do
    expect{dsc_spcontentdatabase[:dsc_webappurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webappurl' do
    expect{dsc_spcontentdatabase[:dsc_webappurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webappurl' do
    expect{dsc_spcontentdatabase[:dsc_webappurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_spcontentdatabase[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enabled' do
    dsc_spcontentdatabase[:dsc_enabled] = true
    expect(dsc_spcontentdatabase[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enabled" do
    dsc_spcontentdatabase[:dsc_enabled] = 'true'
    expect(dsc_spcontentdatabase[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enabled" do
    dsc_spcontentdatabase[:dsc_enabled] = 'false'
    expect(dsc_spcontentdatabase[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enabled" do
    dsc_spcontentdatabase[:dsc_enabled] = 'True'
    expect(dsc_spcontentdatabase[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enabled" do
    dsc_spcontentdatabase[:dsc_enabled] = 'False'
    expect(dsc_spcontentdatabase[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enabled" do
    dsc_spcontentdatabase[:dsc_enabled] = :true
    expect(dsc_spcontentdatabase[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enabled" do
    dsc_spcontentdatabase[:dsc_enabled] = :false
    expect(dsc_spcontentdatabase[:dsc_enabled]).to eq(false)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_spcontentdatabase[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_spcontentdatabase[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_warningsitecount' do
    expect{dsc_spcontentdatabase[:dsc_warningsitecount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_warningsitecount' do
    expect{dsc_spcontentdatabase[:dsc_warningsitecount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_warningsitecount' do
    dsc_spcontentdatabase[:dsc_warningsitecount] = 16
    expect(dsc_spcontentdatabase[:dsc_warningsitecount]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_warningsitecount' do
    value = -16
    expect(value).to be < 0
    expect{dsc_spcontentdatabase[:dsc_warningsitecount] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_warningsitecount' do
    dsc_spcontentdatabase[:dsc_warningsitecount] = '16'
    expect(dsc_spcontentdatabase[:dsc_warningsitecount]).to eq(16)
  end

  it 'should accept string-like uint for dsc_warningsitecount' do
    dsc_spcontentdatabase[:dsc_warningsitecount] = '32'
    expect(dsc_spcontentdatabase[:dsc_warningsitecount]).to eq(32)
  end

  it 'should accept string-like uint for dsc_warningsitecount' do
    dsc_spcontentdatabase[:dsc_warningsitecount] = '64'
    expect(dsc_spcontentdatabase[:dsc_warningsitecount]).to eq(64)
  end

  it 'should not accept array for dsc_maximumsitecount' do
    expect{dsc_spcontentdatabase[:dsc_maximumsitecount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maximumsitecount' do
    expect{dsc_spcontentdatabase[:dsc_maximumsitecount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maximumsitecount' do
    dsc_spcontentdatabase[:dsc_maximumsitecount] = 16
    expect(dsc_spcontentdatabase[:dsc_maximumsitecount]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_maximumsitecount' do
    value = -16
    expect(value).to be < 0
    expect{dsc_spcontentdatabase[:dsc_maximumsitecount] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maximumsitecount' do
    dsc_spcontentdatabase[:dsc_maximumsitecount] = '16'
    expect(dsc_spcontentdatabase[:dsc_maximumsitecount]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maximumsitecount' do
    dsc_spcontentdatabase[:dsc_maximumsitecount] = '32'
    expect(dsc_spcontentdatabase[:dsc_maximumsitecount]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maximumsitecount' do
    dsc_spcontentdatabase[:dsc_maximumsitecount] = '64'
    expect(dsc_spcontentdatabase[:dsc_maximumsitecount]).to eq(64)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spcontentdatabase[:dsc_ensure] = 'Present'
    expect(dsc_spcontentdatabase[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spcontentdatabase[:dsc_ensure] = 'present'
    expect(dsc_spcontentdatabase[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spcontentdatabase[:dsc_ensure] = 'present'
    expect(dsc_spcontentdatabase[:ensure]).to eq(dsc_spcontentdatabase[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spcontentdatabase[:dsc_ensure] = 'Absent'
    expect(dsc_spcontentdatabase[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spcontentdatabase[:dsc_ensure] = 'absent'
    expect(dsc_spcontentdatabase[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spcontentdatabase[:dsc_ensure] = 'absent'
    expect(dsc_spcontentdatabase[:ensure]).to eq(dsc_spcontentdatabase[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spcontentdatabase[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spcontentdatabase[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spcontentdatabase[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spcontentdatabase[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spcontentdatabase[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spcontentdatabase[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spcontentdatabase[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spcontentdatabase[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spcontentdatabase[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spcontentdatabase[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spcontentdatabase)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spcontentdatabase)
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
        dsc_spcontentdatabase.original_parameters[:dsc_ensure] = 'present'
        dsc_spcontentdatabase[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spcontentdatabase)
      end

      it "should update :ensure to :present" do
        expect(dsc_spcontentdatabase[:ensure]).to eq(:present)
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
        dsc_spcontentdatabase.original_parameters[:dsc_ensure] = 'absent'
        dsc_spcontentdatabase[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spcontentdatabase)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spcontentdatabase[:ensure]).to eq(:absent)
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
