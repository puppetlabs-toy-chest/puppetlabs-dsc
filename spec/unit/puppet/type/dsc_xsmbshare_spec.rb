#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsmbshare) do

  let :dsc_xsmbshare do
    Puppet::Type.type(:dsc_xsmbshare).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xsmbshare.to_s).to eq("Dsc_xsmbshare[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsmbshare[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xsmbshare[:dsc_name]
    expect { Puppet::Type.type(:dsc_xsmbshare).new(
      :name     => 'foo',
      :dsc_path => 'foo',
      :dsc_description => 'foo',
      :dsc_changeaccess => ["foo", "bar", "spec"],
      :dsc_concurrentuserlimit => 32,
      :dsc_encryptdata => true,
      :dsc_folderenumerationmode => 'AccessBased',
      :dsc_fullaccess => ["foo", "bar", "spec"],
      :dsc_noaccess => ["foo", "bar", "spec"],
      :dsc_readaccess => ["foo", "bar", "spec"],
      :dsc_ensure => 'Present',
      :dsc_sharestate => 'foo',
      :dsc_sharetype => 'foo',
      :dsc_shadowcopy => 'foo',
      :dsc_special => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xsmbshare[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xsmbshare[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xsmbshare[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xsmbshare[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xsmbshare[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xsmbshare[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xsmbshare[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xsmbshare[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xsmbshare[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xsmbshare[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xsmbshare[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xsmbshare[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_changeaccess' do
    dsc_xsmbshare[:dsc_changeaccess] = ["foo", "bar", "spec"]
    expect(dsc_xsmbshare[:dsc_changeaccess]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_changeaccess' do
    expect{dsc_xsmbshare[:dsc_changeaccess] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_changeaccess' do
    expect{dsc_xsmbshare[:dsc_changeaccess] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_changeaccess' do
    expect{dsc_xsmbshare[:dsc_changeaccess] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_concurrentuserlimit' do
    expect{dsc_xsmbshare[:dsc_concurrentuserlimit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_concurrentuserlimit' do
    expect{dsc_xsmbshare[:dsc_concurrentuserlimit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_concurrentuserlimit' do
    dsc_xsmbshare[:dsc_concurrentuserlimit] = 32
    expect(dsc_xsmbshare[:dsc_concurrentuserlimit]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_concurrentuserlimit' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xsmbshare[:dsc_concurrentuserlimit] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_concurrentuserlimit' do
    dsc_xsmbshare[:dsc_concurrentuserlimit] = '16'
    expect(dsc_xsmbshare[:dsc_concurrentuserlimit]).to eq(16)
  end

  it 'should accept string-like uint for dsc_concurrentuserlimit' do
    dsc_xsmbshare[:dsc_concurrentuserlimit] = '32'
    expect(dsc_xsmbshare[:dsc_concurrentuserlimit]).to eq(32)
  end

  it 'should accept string-like uint for dsc_concurrentuserlimit' do
    dsc_xsmbshare[:dsc_concurrentuserlimit] = '64'
    expect(dsc_xsmbshare[:dsc_concurrentuserlimit]).to eq(64)
  end

  it 'should not accept array for dsc_encryptdata' do
    expect{dsc_xsmbshare[:dsc_encryptdata] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_encryptdata' do
    dsc_xsmbshare[:dsc_encryptdata] = true
    expect(dsc_xsmbshare[:dsc_encryptdata]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_encryptdata" do
    dsc_xsmbshare[:dsc_encryptdata] = 'true'
    expect(dsc_xsmbshare[:dsc_encryptdata]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_encryptdata" do
    dsc_xsmbshare[:dsc_encryptdata] = 'false'
    expect(dsc_xsmbshare[:dsc_encryptdata]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_encryptdata" do
    dsc_xsmbshare[:dsc_encryptdata] = 'True'
    expect(dsc_xsmbshare[:dsc_encryptdata]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_encryptdata" do
    dsc_xsmbshare[:dsc_encryptdata] = 'False'
    expect(dsc_xsmbshare[:dsc_encryptdata]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_encryptdata" do
    dsc_xsmbshare[:dsc_encryptdata] = :true
    expect(dsc_xsmbshare[:dsc_encryptdata]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_encryptdata" do
    dsc_xsmbshare[:dsc_encryptdata] = :false
    expect(dsc_xsmbshare[:dsc_encryptdata]).to eq(false)
  end

  it 'should not accept int for dsc_encryptdata' do
    expect{dsc_xsmbshare[:dsc_encryptdata] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_encryptdata' do
    expect{dsc_xsmbshare[:dsc_encryptdata] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_folderenumerationmode predefined value AccessBased' do
    dsc_xsmbshare[:dsc_folderenumerationmode] = 'AccessBased'
    expect(dsc_xsmbshare[:dsc_folderenumerationmode]).to eq('AccessBased')
  end

  it 'should accept dsc_folderenumerationmode predefined value accessbased' do
    dsc_xsmbshare[:dsc_folderenumerationmode] = 'accessbased'
    expect(dsc_xsmbshare[:dsc_folderenumerationmode]).to eq('accessbased')
  end

  it 'should accept dsc_folderenumerationmode predefined value Unrestricted' do
    dsc_xsmbshare[:dsc_folderenumerationmode] = 'Unrestricted'
    expect(dsc_xsmbshare[:dsc_folderenumerationmode]).to eq('Unrestricted')
  end

  it 'should accept dsc_folderenumerationmode predefined value unrestricted' do
    dsc_xsmbshare[:dsc_folderenumerationmode] = 'unrestricted'
    expect(dsc_xsmbshare[:dsc_folderenumerationmode]).to eq('unrestricted')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsmbshare[:dsc_folderenumerationmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_folderenumerationmode' do
    expect{dsc_xsmbshare[:dsc_folderenumerationmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_folderenumerationmode' do
    expect{dsc_xsmbshare[:dsc_folderenumerationmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_folderenumerationmode' do
    expect{dsc_xsmbshare[:dsc_folderenumerationmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_folderenumerationmode' do
    expect{dsc_xsmbshare[:dsc_folderenumerationmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_fullaccess' do
    dsc_xsmbshare[:dsc_fullaccess] = ["foo", "bar", "spec"]
    expect(dsc_xsmbshare[:dsc_fullaccess]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_fullaccess' do
    expect{dsc_xsmbshare[:dsc_fullaccess] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_fullaccess' do
    expect{dsc_xsmbshare[:dsc_fullaccess] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_fullaccess' do
    expect{dsc_xsmbshare[:dsc_fullaccess] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_noaccess' do
    dsc_xsmbshare[:dsc_noaccess] = ["foo", "bar", "spec"]
    expect(dsc_xsmbshare[:dsc_noaccess]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_noaccess' do
    expect{dsc_xsmbshare[:dsc_noaccess] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_noaccess' do
    expect{dsc_xsmbshare[:dsc_noaccess] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_noaccess' do
    expect{dsc_xsmbshare[:dsc_noaccess] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_readaccess' do
    dsc_xsmbshare[:dsc_readaccess] = ["foo", "bar", "spec"]
    expect(dsc_xsmbshare[:dsc_readaccess]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_readaccess' do
    expect{dsc_xsmbshare[:dsc_readaccess] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_readaccess' do
    expect{dsc_xsmbshare[:dsc_readaccess] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_readaccess' do
    expect{dsc_xsmbshare[:dsc_readaccess] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsmbshare[:dsc_ensure] = 'Present'
    expect(dsc_xsmbshare[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsmbshare[:dsc_ensure] = 'present'
    expect(dsc_xsmbshare[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsmbshare[:dsc_ensure] = 'present'
    expect(dsc_xsmbshare[:ensure]).to eq(dsc_xsmbshare[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsmbshare[:dsc_ensure] = 'Absent'
    expect(dsc_xsmbshare[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsmbshare[:dsc_ensure] = 'absent'
    expect(dsc_xsmbshare[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsmbshare[:dsc_ensure] = 'absent'
    expect(dsc_xsmbshare[:ensure]).to eq(dsc_xsmbshare[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsmbshare[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsmbshare[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsmbshare[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsmbshare[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsmbshare[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sharestate' do
    expect{dsc_xsmbshare[:dsc_sharestate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sharestate' do
    expect{dsc_xsmbshare[:dsc_sharestate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sharestate' do
    expect{dsc_xsmbshare[:dsc_sharestate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sharestate' do
    expect{dsc_xsmbshare[:dsc_sharestate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sharetype' do
    expect{dsc_xsmbshare[:dsc_sharetype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sharetype' do
    expect{dsc_xsmbshare[:dsc_sharetype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sharetype' do
    expect{dsc_xsmbshare[:dsc_sharetype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sharetype' do
    expect{dsc_xsmbshare[:dsc_sharetype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_shadowcopy' do
    expect{dsc_xsmbshare[:dsc_shadowcopy] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_shadowcopy' do
    expect{dsc_xsmbshare[:dsc_shadowcopy] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_shadowcopy' do
    expect{dsc_xsmbshare[:dsc_shadowcopy] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_shadowcopy' do
    expect{dsc_xsmbshare[:dsc_shadowcopy] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_special' do
    expect{dsc_xsmbshare[:dsc_special] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_special' do
    expect{dsc_xsmbshare[:dsc_special] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_special' do
    expect{dsc_xsmbshare[:dsc_special] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_special' do
    expect{dsc_xsmbshare[:dsc_special] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsmbshare)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsmbshare)
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
        dsc_xsmbshare.original_parameters[:dsc_ensure] = 'present'
        dsc_xsmbshare[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsmbshare)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsmbshare[:ensure]).to eq(:present)
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
        dsc_xsmbshare.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsmbshare[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsmbshare)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsmbshare[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
