#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlservermaxdop) do

  let :dsc_xsqlservermaxdop do
    Puppet::Type.type(:dsc_xsqlservermaxdop).new(
      :name     => 'foo',
      :dsc_dynamicalloc => true,
    )
  end

  it "should stringify normally" do
    expect(dsc_xsqlservermaxdop.to_s).to eq("Dsc_xsqlservermaxdop[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsqlservermaxdop[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsqlservermaxdop[:dsc_ensure] = 'Present'
    expect(dsc_xsqlservermaxdop[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsqlservermaxdop[:dsc_ensure] = 'present'
    expect(dsc_xsqlservermaxdop[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlservermaxdop[:dsc_ensure] = 'present'
    expect(dsc_xsqlservermaxdop[:ensure]).to eq(dsc_xsqlservermaxdop[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsqlservermaxdop[:dsc_ensure] = 'Absent'
    expect(dsc_xsqlservermaxdop[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsqlservermaxdop[:dsc_ensure] = 'absent'
    expect(dsc_xsqlservermaxdop[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlservermaxdop[:dsc_ensure] = 'absent'
    expect(dsc_xsqlservermaxdop[:ensure]).to eq(dsc_xsqlservermaxdop[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlservermaxdop[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsqlservermaxdop[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsqlservermaxdop[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsqlservermaxdop[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsqlservermaxdop[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_dynamicalloc is specified' do
    #dsc_xsqlservermaxdop[:dsc_dynamicalloc]
    expect { Puppet::Type.type(:dsc_xsqlservermaxdop).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_maxdop => -32,
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstancename => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_dynamicalloc is a required attribute/)
  end

  it 'should not accept array for dsc_dynamicalloc' do
    expect{dsc_xsqlservermaxdop[:dsc_dynamicalloc] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_dynamicalloc' do
    dsc_xsqlservermaxdop[:dsc_dynamicalloc] = true
    expect(dsc_xsqlservermaxdop[:dsc_dynamicalloc]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_dynamicalloc" do
    dsc_xsqlservermaxdop[:dsc_dynamicalloc] = 'true'
    expect(dsc_xsqlservermaxdop[:dsc_dynamicalloc]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_dynamicalloc" do
    dsc_xsqlservermaxdop[:dsc_dynamicalloc] = 'false'
    expect(dsc_xsqlservermaxdop[:dsc_dynamicalloc]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_dynamicalloc" do
    dsc_xsqlservermaxdop[:dsc_dynamicalloc] = 'True'
    expect(dsc_xsqlservermaxdop[:dsc_dynamicalloc]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_dynamicalloc" do
    dsc_xsqlservermaxdop[:dsc_dynamicalloc] = 'False'
    expect(dsc_xsqlservermaxdop[:dsc_dynamicalloc]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_dynamicalloc" do
    dsc_xsqlservermaxdop[:dsc_dynamicalloc] = :true
    expect(dsc_xsqlservermaxdop[:dsc_dynamicalloc]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_dynamicalloc" do
    dsc_xsqlservermaxdop[:dsc_dynamicalloc] = :false
    expect(dsc_xsqlservermaxdop[:dsc_dynamicalloc]).to eq(false)
  end

  it 'should not accept int for dsc_dynamicalloc' do
    expect{dsc_xsqlservermaxdop[:dsc_dynamicalloc] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dynamicalloc' do
    expect{dsc_xsqlservermaxdop[:dsc_dynamicalloc] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_maxdop' do
    expect{dsc_xsqlservermaxdop[:dsc_maxdop] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxdop' do
    expect{dsc_xsqlservermaxdop[:dsc_maxdop] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_maxdop' do
    dsc_xsqlservermaxdop[:dsc_maxdop] = -32
    expect(dsc_xsqlservermaxdop[:dsc_maxdop]).to eq(-32)
  end

  it 'should accept string-like int for dsc_maxdop' do
    dsc_xsqlservermaxdop[:dsc_maxdop] = '16'
    expect(dsc_xsqlservermaxdop[:dsc_maxdop]).to eq(16)
  end

  it 'should accept string-like int for dsc_maxdop' do
    dsc_xsqlservermaxdop[:dsc_maxdop] = '-16'
    expect(dsc_xsqlservermaxdop[:dsc_maxdop]).to eq(-16)
  end

  it 'should accept string-like int for dsc_maxdop' do
    dsc_xsqlservermaxdop[:dsc_maxdop] = '32'
    expect(dsc_xsqlservermaxdop[:dsc_maxdop]).to eq(32)
  end

  it 'should accept string-like int for dsc_maxdop' do
    dsc_xsqlservermaxdop[:dsc_maxdop] = '-32'
    expect(dsc_xsqlservermaxdop[:dsc_maxdop]).to eq(-32)
  end


  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xsqlservermaxdop[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xsqlservermaxdop[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xsqlservermaxdop[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xsqlservermaxdop[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstancename' do
    expect{dsc_xsqlservermaxdop[:dsc_sqlinstancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstancename' do
    expect{dsc_xsqlservermaxdop[:dsc_sqlinstancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstancename' do
    expect{dsc_xsqlservermaxdop[:dsc_sqlinstancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstancename' do
    expect{dsc_xsqlservermaxdop[:dsc_sqlinstancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlservermaxdop)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlservermaxdop)
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
        dsc_xsqlservermaxdop.original_parameters[:dsc_ensure] = 'present'
        dsc_xsqlservermaxdop[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsqlservermaxdop)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsqlservermaxdop[:ensure]).to eq(:present)
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
        dsc_xsqlservermaxdop.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsqlservermaxdop[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsqlservermaxdop)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsqlservermaxdop[:ensure]).to eq(:absent)
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
