#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspquotatemplate) do

  let :dsc_xspquotatemplate do
    Puppet::Type.type(:dsc_xspquotatemplate).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspquotatemplate.to_s).to eq("Dsc_xspquotatemplate[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xspquotatemplate[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspquotatemplate[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspquotatemplate).new(
      :name     => 'foo',
      :dsc_storagemaxinmb => 32,
      :dsc_storagewarninginmb => 32,
      :dsc_maximumusagepointssolutions => 32,
      :dsc_warningusagepointssolutions => 32,
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspquotatemplate[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspquotatemplate[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspquotatemplate[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspquotatemplate[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_storagemaxinmb' do
    expect{dsc_xspquotatemplate[:dsc_storagemaxinmb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_storagemaxinmb' do
    expect{dsc_xspquotatemplate[:dsc_storagemaxinmb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_storagemaxinmb' do
    dsc_xspquotatemplate[:dsc_storagemaxinmb] = 32
    expect(dsc_xspquotatemplate[:dsc_storagemaxinmb]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_storagemaxinmb' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspquotatemplate[:dsc_storagemaxinmb] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_storagemaxinmb' do
    dsc_xspquotatemplate[:dsc_storagemaxinmb] = '16'
    expect(dsc_xspquotatemplate[:dsc_storagemaxinmb]).to eq(16)
  end

  it 'should accept string-like uint for dsc_storagemaxinmb' do
    dsc_xspquotatemplate[:dsc_storagemaxinmb] = '32'
    expect(dsc_xspquotatemplate[:dsc_storagemaxinmb]).to eq(32)
  end

  it 'should accept string-like uint for dsc_storagemaxinmb' do
    dsc_xspquotatemplate[:dsc_storagemaxinmb] = '64'
    expect(dsc_xspquotatemplate[:dsc_storagemaxinmb]).to eq(64)
  end

  it 'should not accept array for dsc_storagewarninginmb' do
    expect{dsc_xspquotatemplate[:dsc_storagewarninginmb] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_storagewarninginmb' do
    expect{dsc_xspquotatemplate[:dsc_storagewarninginmb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_storagewarninginmb' do
    dsc_xspquotatemplate[:dsc_storagewarninginmb] = 32
    expect(dsc_xspquotatemplate[:dsc_storagewarninginmb]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_storagewarninginmb' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspquotatemplate[:dsc_storagewarninginmb] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_storagewarninginmb' do
    dsc_xspquotatemplate[:dsc_storagewarninginmb] = '16'
    expect(dsc_xspquotatemplate[:dsc_storagewarninginmb]).to eq(16)
  end

  it 'should accept string-like uint for dsc_storagewarninginmb' do
    dsc_xspquotatemplate[:dsc_storagewarninginmb] = '32'
    expect(dsc_xspquotatemplate[:dsc_storagewarninginmb]).to eq(32)
  end

  it 'should accept string-like uint for dsc_storagewarninginmb' do
    dsc_xspquotatemplate[:dsc_storagewarninginmb] = '64'
    expect(dsc_xspquotatemplate[:dsc_storagewarninginmb]).to eq(64)
  end

  it 'should not accept array for dsc_maximumusagepointssolutions' do
    expect{dsc_xspquotatemplate[:dsc_maximumusagepointssolutions] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maximumusagepointssolutions' do
    expect{dsc_xspquotatemplate[:dsc_maximumusagepointssolutions] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maximumusagepointssolutions' do
    dsc_xspquotatemplate[:dsc_maximumusagepointssolutions] = 32
    expect(dsc_xspquotatemplate[:dsc_maximumusagepointssolutions]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_maximumusagepointssolutions' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspquotatemplate[:dsc_maximumusagepointssolutions] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maximumusagepointssolutions' do
    dsc_xspquotatemplate[:dsc_maximumusagepointssolutions] = '16'
    expect(dsc_xspquotatemplate[:dsc_maximumusagepointssolutions]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maximumusagepointssolutions' do
    dsc_xspquotatemplate[:dsc_maximumusagepointssolutions] = '32'
    expect(dsc_xspquotatemplate[:dsc_maximumusagepointssolutions]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maximumusagepointssolutions' do
    dsc_xspquotatemplate[:dsc_maximumusagepointssolutions] = '64'
    expect(dsc_xspquotatemplate[:dsc_maximumusagepointssolutions]).to eq(64)
  end

  it 'should not accept array for dsc_warningusagepointssolutions' do
    expect{dsc_xspquotatemplate[:dsc_warningusagepointssolutions] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_warningusagepointssolutions' do
    expect{dsc_xspquotatemplate[:dsc_warningusagepointssolutions] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_warningusagepointssolutions' do
    dsc_xspquotatemplate[:dsc_warningusagepointssolutions] = 32
    expect(dsc_xspquotatemplate[:dsc_warningusagepointssolutions]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_warningusagepointssolutions' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspquotatemplate[:dsc_warningusagepointssolutions] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_warningusagepointssolutions' do
    dsc_xspquotatemplate[:dsc_warningusagepointssolutions] = '16'
    expect(dsc_xspquotatemplate[:dsc_warningusagepointssolutions]).to eq(16)
  end

  it 'should accept string-like uint for dsc_warningusagepointssolutions' do
    dsc_xspquotatemplate[:dsc_warningusagepointssolutions] = '32'
    expect(dsc_xspquotatemplate[:dsc_warningusagepointssolutions]).to eq(32)
  end

  it 'should accept string-like uint for dsc_warningusagepointssolutions' do
    dsc_xspquotatemplate[:dsc_warningusagepointssolutions] = '64'
    expect(dsc_xspquotatemplate[:dsc_warningusagepointssolutions]).to eq(64)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xspquotatemplate[:dsc_ensure] = 'Present'
    expect(dsc_xspquotatemplate[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xspquotatemplate[:dsc_ensure] = 'present'
    expect(dsc_xspquotatemplate[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspquotatemplate[:dsc_ensure] = 'present'
    expect(dsc_xspquotatemplate[:ensure]).to eq(dsc_xspquotatemplate[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xspquotatemplate[:dsc_ensure] = 'Absent'
    expect(dsc_xspquotatemplate[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xspquotatemplate[:dsc_ensure] = 'absent'
    expect(dsc_xspquotatemplate[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspquotatemplate[:dsc_ensure] = 'absent'
    expect(dsc_xspquotatemplate[:ensure]).to eq(dsc_xspquotatemplate[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspquotatemplate[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xspquotatemplate[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xspquotatemplate[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xspquotatemplate[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xspquotatemplate[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspquotatemplate[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspquotatemplate[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspquotatemplate[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspquotatemplate[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspquotatemplate[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspquotatemplate)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspquotatemplate)
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
        dsc_xspquotatemplate.original_parameters[:dsc_ensure] = 'present'
        dsc_xspquotatemplate[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xspquotatemplate)
      end

      it "should update :ensure to :present" do
        expect(dsc_xspquotatemplate[:ensure]).to eq(:present)
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
        dsc_xspquotatemplate.original_parameters[:dsc_ensure] = 'absent'
        dsc_xspquotatemplate[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xspquotatemplate)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xspquotatemplate[:ensure]).to eq(:absent)
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
