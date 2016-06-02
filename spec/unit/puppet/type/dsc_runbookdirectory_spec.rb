#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_runbookdirectory) do

  let :dsc_runbookdirectory do
    Puppet::Type.type(:dsc_runbookdirectory).new(
      :name     => 'foo',
      :dsc_runbookpath => 'foo',
      :dsc_webserviceendpoint => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_runbookdirectory).new(
      :name     => 'foo',
      :dsc_ensure => 'Published',
      :dsc_runbookpath => 'foo',
      :dsc_matches => true,
      :dsc_webserviceendpoint => 'foo',
      :dsc_port => 32,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_runbookdirectory.to_s).to eq("Dsc_runbookdirectory[foo]")
  end

  it 'should default to ensure => published' do
    expect(dsc_runbookdirectory[:ensure]).to eq :published
  end

  it 'should accept dsc_ensure predefined value Published' do
    dsc_runbookdirectory[:dsc_ensure] = 'Published'
    expect(dsc_runbookdirectory[:dsc_ensure]).to eq('Published')
  end

  it 'should accept dsc_ensure predefined value published' do
    dsc_runbookdirectory[:dsc_ensure] = 'published'
    expect(dsc_runbookdirectory[:dsc_ensure]).to eq('published')
  end

  it 'should accept dsc_ensure predefined value published and update ensure with this value (ensure end value should be a symbol)' do
    dsc_runbookdirectory[:dsc_ensure] = 'published'
    expect(dsc_runbookdirectory[:ensure]).to eq(dsc_runbookdirectory[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Draft' do
    dsc_runbookdirectory[:dsc_ensure] = 'Draft'
    expect(dsc_runbookdirectory[:dsc_ensure]).to eq('Draft')
  end

  it 'should accept dsc_ensure predefined value draft' do
    dsc_runbookdirectory[:dsc_ensure] = 'draft'
    expect(dsc_runbookdirectory[:dsc_ensure]).to eq('draft')
  end

  it 'should accept dsc_ensure predefined value draft and update ensure with this value (ensure end value should be a symbol)' do
    dsc_runbookdirectory[:dsc_ensure] = 'draft'
    expect(dsc_runbookdirectory[:ensure]).to eq(dsc_runbookdirectory[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_runbookdirectory[:dsc_ensure] = 'Absent'
    expect(dsc_runbookdirectory[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_runbookdirectory[:dsc_ensure] = 'absent'
    expect(dsc_runbookdirectory[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_runbookdirectory[:dsc_ensure] = 'absent'
    expect(dsc_runbookdirectory[:ensure]).to eq(dsc_runbookdirectory[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_runbookdirectory[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_runbookdirectory[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_runbookdirectory[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_runbookdirectory[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_runbookdirectory[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_runbookpath is specified' do
    #dsc_runbookdirectory[:dsc_runbookpath]
    expect { Puppet::Type.type(:dsc_runbookdirectory).new(
      :name     => 'foo',
      :dsc_webserviceendpoint => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_runbookpath is a required attribute/)
  end

  it 'should not accept array for dsc_runbookpath' do
    expect{dsc_runbookdirectory[:dsc_runbookpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_runbookpath' do
    expect{dsc_runbookdirectory[:dsc_runbookpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_runbookpath' do
    expect{dsc_runbookdirectory[:dsc_runbookpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_runbookpath' do
    expect{dsc_runbookdirectory[:dsc_runbookpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_matches' do
    expect{dsc_runbookdirectory[:dsc_matches] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_matches' do
    dsc_runbookdirectory[:dsc_matches] = true
    expect(dsc_runbookdirectory[:dsc_matches]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_matches" do
    dsc_runbookdirectory[:dsc_matches] = 'true'
    expect(dsc_runbookdirectory[:dsc_matches]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_matches" do
    dsc_runbookdirectory[:dsc_matches] = 'false'
    expect(dsc_runbookdirectory[:dsc_matches]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_matches" do
    dsc_runbookdirectory[:dsc_matches] = 'True'
    expect(dsc_runbookdirectory[:dsc_matches]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_matches" do
    dsc_runbookdirectory[:dsc_matches] = 'False'
    expect(dsc_runbookdirectory[:dsc_matches]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_matches" do
    dsc_runbookdirectory[:dsc_matches] = :true
    expect(dsc_runbookdirectory[:dsc_matches]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_matches" do
    dsc_runbookdirectory[:dsc_matches] = :false
    expect(dsc_runbookdirectory[:dsc_matches]).to eq(false)
  end

  it 'should not accept int for dsc_matches' do
    expect{dsc_runbookdirectory[:dsc_matches] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_matches' do
    expect{dsc_runbookdirectory[:dsc_matches] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_webserviceendpoint is specified' do
    #dsc_runbookdirectory[:dsc_webserviceendpoint]
    expect { Puppet::Type.type(:dsc_runbookdirectory).new(
      :name     => 'foo',
      :dsc_runbookpath => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_webserviceendpoint is a required attribute/)
  end

  it 'should not accept array for dsc_webserviceendpoint' do
    expect{dsc_runbookdirectory[:dsc_webserviceendpoint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webserviceendpoint' do
    expect{dsc_runbookdirectory[:dsc_webserviceendpoint] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webserviceendpoint' do
    expect{dsc_runbookdirectory[:dsc_webserviceendpoint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webserviceendpoint' do
    expect{dsc_runbookdirectory[:dsc_webserviceendpoint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_port' do
    expect{dsc_runbookdirectory[:dsc_port] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_port' do
    expect{dsc_runbookdirectory[:dsc_port] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_port' do
    dsc_runbookdirectory[:dsc_port] = 32
    expect(dsc_runbookdirectory[:dsc_port]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_port' do
    value = -32
    expect(value).to be < 0
    expect{dsc_runbookdirectory[:dsc_port] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_runbookdirectory[:dsc_port] = '16'
    expect(dsc_runbookdirectory[:dsc_port]).to eq(16)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_runbookdirectory[:dsc_port] = '32'
    expect(dsc_runbookdirectory[:dsc_port]).to eq(32)
  end

  it 'should accept string-like uint for dsc_port' do
    dsc_runbookdirectory[:dsc_port] = '64'
    expect(dsc_runbookdirectory[:dsc_port]).to eq(64)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_runbookdirectory)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_runbookdirectory)
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

    describe "when dsc_ensure is 'published'" do

      before(:each) do
        dsc_runbookdirectory.original_parameters[:dsc_ensure] = 'published'
        dsc_runbookdirectory[:dsc_ensure] = 'published'
        @provider = described_class.provider(:powershell).new(dsc_runbookdirectory)
      end

      it "should update :ensure to :published" do
        expect(dsc_runbookdirectory[:ensure]).to eq(:published)
      end

      it "should compute powershell dsc test script in which ensure value is 'published'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'published'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'published'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'published'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_runbookdirectory.original_parameters[:dsc_ensure] = 'absent'
        dsc_runbookdirectory[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_runbookdirectory)
      end

      it "should update :ensure to :absent" do
        expect(dsc_runbookdirectory[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'published'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'published'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
