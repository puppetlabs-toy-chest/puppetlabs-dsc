#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xscomconsoleupdate) do

  let :dsc_xscomconsoleupdate do
    Puppet::Type.type(:dsc_xscomconsoleupdate).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )
  end

  it "should stringify normally" do
    expect(dsc_xscomconsoleupdate.to_s).to eq("Dsc_xscomconsoleupdate[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xscomconsoleupdate[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_xscomconsoleupdate[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_xscomconsoleupdate).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
      :dsc_update => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xscomconsoleupdate[:dsc_ensure] = 'Present'
    expect(dsc_xscomconsoleupdate[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xscomconsoleupdate[:dsc_ensure] = 'present'
    expect(dsc_xscomconsoleupdate[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscomconsoleupdate[:dsc_ensure] = 'present'
    expect(dsc_xscomconsoleupdate[:ensure]).to eq(dsc_xscomconsoleupdate[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xscomconsoleupdate[:dsc_ensure] = 'Absent'
    expect(dsc_xscomconsoleupdate[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xscomconsoleupdate[:dsc_ensure] = 'absent'
    expect(dsc_xscomconsoleupdate[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xscomconsoleupdate[:dsc_ensure] = 'absent'
    expect(dsc_xscomconsoleupdate[:ensure]).to eq(dsc_xscomconsoleupdate[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xscomconsoleupdate[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xscomconsoleupdate[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xscomconsoleupdate[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xscomconsoleupdate[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xscomconsoleupdate[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xscomconsoleupdate[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xscomconsoleupdate[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xscomconsoleupdate[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xscomconsoleupdate[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xscomconsoleupdate[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xscomconsoleupdate[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xscomconsoleupdate[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xscomconsoleupdate[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xscomconsoleupdate[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xscomconsoleupdate[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xscomconsoleupdate[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xscomconsoleupdate[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xscomconsoleupdate[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_update' do
    expect{dsc_xscomconsoleupdate[:dsc_update] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_update' do
    expect{dsc_xscomconsoleupdate[:dsc_update] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_update' do
    expect{dsc_xscomconsoleupdate[:dsc_update] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_update' do
    expect{dsc_xscomconsoleupdate[:dsc_update] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xscomconsoleupdate)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xscomconsoleupdate)
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
        dsc_xscomconsoleupdate.original_parameters[:dsc_ensure] = 'present'
        dsc_xscomconsoleupdate[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xscomconsoleupdate)
      end

      it "should update :ensure to :present" do
        expect(dsc_xscomconsoleupdate[:ensure]).to eq(:present)
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
        dsc_xscomconsoleupdate.original_parameters[:dsc_ensure] = 'absent'
        dsc_xscomconsoleupdate[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xscomconsoleupdate)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xscomconsoleupdate[:ensure]).to eq(:absent)
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
