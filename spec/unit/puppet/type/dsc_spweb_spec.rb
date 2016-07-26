#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spweb) do

  let :dsc_spweb do
    Puppet::Type.type(:dsc_spweb).new(
      :name     => 'foo',
      :dsc_url => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spweb).new(
      :name     => 'foo',
      :dsc_url => 'foo',
      :dsc_ensure => 'Present',
      :dsc_description => 'foo',
      :dsc_name => 'foo',
      :dsc_language => 32,
      :dsc_template => 'foo',
      :dsc_uniquepermissions => true,
      :dsc_useparenttopnav => true,
      :dsc_addtoquicklaunch => true,
      :dsc_addtotopnav => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spweb.to_s).to eq("Dsc_spweb[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spweb[:ensure]).to eq :present
  end

  it 'should require that dsc_url is specified' do
    #dsc_spweb[:dsc_url]
    expect { Puppet::Type.type(:dsc_spweb).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_url is a required attribute/)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_spweb[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_spweb[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_spweb[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_spweb[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spweb[:dsc_ensure] = 'Present'
    expect(dsc_spweb[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spweb[:dsc_ensure] = 'present'
    expect(dsc_spweb[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spweb[:dsc_ensure] = 'present'
    expect(dsc_spweb[:ensure]).to eq(dsc_spweb[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spweb[:dsc_ensure] = 'Absent'
    expect(dsc_spweb[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spweb[:dsc_ensure] = 'absent'
    expect(dsc_spweb[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spweb[:dsc_ensure] = 'absent'
    expect(dsc_spweb[:ensure]).to eq(dsc_spweb[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spweb[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spweb[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spweb[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spweb[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spweb[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_spweb[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_spweb[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_spweb[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_spweb[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spweb[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spweb[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spweb[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spweb[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_language' do
    expect{dsc_spweb[:dsc_language] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_language' do
    expect{dsc_spweb[:dsc_language] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_language' do
    dsc_spweb[:dsc_language] = 32
    expect(dsc_spweb[:dsc_language]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_language' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spweb[:dsc_language] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_language' do
    dsc_spweb[:dsc_language] = '16'
    expect(dsc_spweb[:dsc_language]).to eq(16)
  end

  it 'should accept string-like uint for dsc_language' do
    dsc_spweb[:dsc_language] = '32'
    expect(dsc_spweb[:dsc_language]).to eq(32)
  end

  it 'should accept string-like uint for dsc_language' do
    dsc_spweb[:dsc_language] = '64'
    expect(dsc_spweb[:dsc_language]).to eq(64)
  end

  it 'should not accept array for dsc_template' do
    expect{dsc_spweb[:dsc_template] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_template' do
    expect{dsc_spweb[:dsc_template] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_template' do
    expect{dsc_spweb[:dsc_template] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_template' do
    expect{dsc_spweb[:dsc_template] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_uniquepermissions' do
    expect{dsc_spweb[:dsc_uniquepermissions] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_uniquepermissions' do
    dsc_spweb[:dsc_uniquepermissions] = true
    expect(dsc_spweb[:dsc_uniquepermissions]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_uniquepermissions" do
    dsc_spweb[:dsc_uniquepermissions] = 'true'
    expect(dsc_spweb[:dsc_uniquepermissions]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_uniquepermissions" do
    dsc_spweb[:dsc_uniquepermissions] = 'false'
    expect(dsc_spweb[:dsc_uniquepermissions]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_uniquepermissions" do
    dsc_spweb[:dsc_uniquepermissions] = 'True'
    expect(dsc_spweb[:dsc_uniquepermissions]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_uniquepermissions" do
    dsc_spweb[:dsc_uniquepermissions] = 'False'
    expect(dsc_spweb[:dsc_uniquepermissions]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_uniquepermissions" do
    dsc_spweb[:dsc_uniquepermissions] = :true
    expect(dsc_spweb[:dsc_uniquepermissions]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_uniquepermissions" do
    dsc_spweb[:dsc_uniquepermissions] = :false
    expect(dsc_spweb[:dsc_uniquepermissions]).to eq(false)
  end

  it 'should not accept int for dsc_uniquepermissions' do
    expect{dsc_spweb[:dsc_uniquepermissions] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_uniquepermissions' do
    expect{dsc_spweb[:dsc_uniquepermissions] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_useparenttopnav' do
    expect{dsc_spweb[:dsc_useparenttopnav] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_useparenttopnav' do
    dsc_spweb[:dsc_useparenttopnav] = true
    expect(dsc_spweb[:dsc_useparenttopnav]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_useparenttopnav" do
    dsc_spweb[:dsc_useparenttopnav] = 'true'
    expect(dsc_spweb[:dsc_useparenttopnav]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_useparenttopnav" do
    dsc_spweb[:dsc_useparenttopnav] = 'false'
    expect(dsc_spweb[:dsc_useparenttopnav]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_useparenttopnav" do
    dsc_spweb[:dsc_useparenttopnav] = 'True'
    expect(dsc_spweb[:dsc_useparenttopnav]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_useparenttopnav" do
    dsc_spweb[:dsc_useparenttopnav] = 'False'
    expect(dsc_spweb[:dsc_useparenttopnav]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_useparenttopnav" do
    dsc_spweb[:dsc_useparenttopnav] = :true
    expect(dsc_spweb[:dsc_useparenttopnav]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_useparenttopnav" do
    dsc_spweb[:dsc_useparenttopnav] = :false
    expect(dsc_spweb[:dsc_useparenttopnav]).to eq(false)
  end

  it 'should not accept int for dsc_useparenttopnav' do
    expect{dsc_spweb[:dsc_useparenttopnav] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_useparenttopnav' do
    expect{dsc_spweb[:dsc_useparenttopnav] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_addtoquicklaunch' do
    expect{dsc_spweb[:dsc_addtoquicklaunch] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_addtoquicklaunch' do
    dsc_spweb[:dsc_addtoquicklaunch] = true
    expect(dsc_spweb[:dsc_addtoquicklaunch]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_addtoquicklaunch" do
    dsc_spweb[:dsc_addtoquicklaunch] = 'true'
    expect(dsc_spweb[:dsc_addtoquicklaunch]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_addtoquicklaunch" do
    dsc_spweb[:dsc_addtoquicklaunch] = 'false'
    expect(dsc_spweb[:dsc_addtoquicklaunch]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_addtoquicklaunch" do
    dsc_spweb[:dsc_addtoquicklaunch] = 'True'
    expect(dsc_spweb[:dsc_addtoquicklaunch]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_addtoquicklaunch" do
    dsc_spweb[:dsc_addtoquicklaunch] = 'False'
    expect(dsc_spweb[:dsc_addtoquicklaunch]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_addtoquicklaunch" do
    dsc_spweb[:dsc_addtoquicklaunch] = :true
    expect(dsc_spweb[:dsc_addtoquicklaunch]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_addtoquicklaunch" do
    dsc_spweb[:dsc_addtoquicklaunch] = :false
    expect(dsc_spweb[:dsc_addtoquicklaunch]).to eq(false)
  end

  it 'should not accept int for dsc_addtoquicklaunch' do
    expect{dsc_spweb[:dsc_addtoquicklaunch] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_addtoquicklaunch' do
    expect{dsc_spweb[:dsc_addtoquicklaunch] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_addtotopnav' do
    expect{dsc_spweb[:dsc_addtotopnav] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_addtotopnav' do
    dsc_spweb[:dsc_addtotopnav] = true
    expect(dsc_spweb[:dsc_addtotopnav]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_addtotopnav" do
    dsc_spweb[:dsc_addtotopnav] = 'true'
    expect(dsc_spweb[:dsc_addtotopnav]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_addtotopnav" do
    dsc_spweb[:dsc_addtotopnav] = 'false'
    expect(dsc_spweb[:dsc_addtotopnav]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_addtotopnav" do
    dsc_spweb[:dsc_addtotopnav] = 'True'
    expect(dsc_spweb[:dsc_addtotopnav]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_addtotopnav" do
    dsc_spweb[:dsc_addtotopnav] = 'False'
    expect(dsc_spweb[:dsc_addtotopnav]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_addtotopnav" do
    dsc_spweb[:dsc_addtotopnav] = :true
    expect(dsc_spweb[:dsc_addtotopnav]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_addtotopnav" do
    dsc_spweb[:dsc_addtotopnav] = :false
    expect(dsc_spweb[:dsc_addtotopnav]).to eq(false)
  end

  it 'should not accept int for dsc_addtotopnav' do
    expect{dsc_spweb[:dsc_addtotopnav] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_addtotopnav' do
    expect{dsc_spweb[:dsc_addtotopnav] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spweb[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spweb[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spweb[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spweb[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spweb[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spweb)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spweb)
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
        dsc_spweb.original_parameters[:dsc_ensure] = 'present'
        dsc_spweb[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spweb)
      end

      it "should update :ensure to :present" do
        expect(dsc_spweb[:ensure]).to eq(:present)
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
        dsc_spweb.original_parameters[:dsc_ensure] = 'absent'
        dsc_spweb[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spweb)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spweb[:ensure]).to eq(:absent)
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
