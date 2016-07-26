#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlaogroupjoin) do

  let :dsc_xsqlaogroupjoin do
    Puppet::Type.type(:dsc_xsqlaogroupjoin).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_availabilitygroupname => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqlaogroupjoin).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_availabilitygroupname => 'foo',
      :dsc_sqlserver => 'foo',
      :dsc_sqlinstancename => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqlaogroupjoin.to_s).to eq("Dsc_xsqlaogroupjoin[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsqlaogroupjoin[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_xsqlaogroupjoin[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_xsqlaogroupjoin).new(
      :name     => 'foo',
      :dsc_availabilitygroupname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsqlaogroupjoin[:dsc_ensure] = 'Present'
    expect(dsc_xsqlaogroupjoin[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsqlaogroupjoin[:dsc_ensure] = 'present'
    expect(dsc_xsqlaogroupjoin[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlaogroupjoin[:dsc_ensure] = 'present'
    expect(dsc_xsqlaogroupjoin[:ensure]).to eq(dsc_xsqlaogroupjoin[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsqlaogroupjoin[:dsc_ensure] = 'Absent'
    expect(dsc_xsqlaogroupjoin[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsqlaogroupjoin[:dsc_ensure] = 'absent'
    expect(dsc_xsqlaogroupjoin[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlaogroupjoin[:dsc_ensure] = 'absent'
    expect(dsc_xsqlaogroupjoin[:ensure]).to eq(dsc_xsqlaogroupjoin[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlaogroupjoin[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsqlaogroupjoin[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsqlaogroupjoin[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsqlaogroupjoin[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsqlaogroupjoin[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_availabilitygroupname is specified' do
    #dsc_xsqlaogroupjoin[:dsc_availabilitygroupname]
    expect { Puppet::Type.type(:dsc_xsqlaogroupjoin).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_availabilitygroupname is a required attribute/)
  end

  it 'should not accept array for dsc_availabilitygroupname' do
    expect{dsc_xsqlaogroupjoin[:dsc_availabilitygroupname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_availabilitygroupname' do
    expect{dsc_xsqlaogroupjoin[:dsc_availabilitygroupname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_availabilitygroupname' do
    expect{dsc_xsqlaogroupjoin[:dsc_availabilitygroupname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_availabilitygroupname' do
    expect{dsc_xsqlaogroupjoin[:dsc_availabilitygroupname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xsqlaogroupjoin[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xsqlaogroupjoin[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xsqlaogroupjoin[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xsqlaogroupjoin[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlinstancename' do
    expect{dsc_xsqlaogroupjoin[:dsc_sqlinstancename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlinstancename' do
    expect{dsc_xsqlaogroupjoin[:dsc_sqlinstancename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlinstancename' do
    expect{dsc_xsqlaogroupjoin[:dsc_sqlinstancename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlinstancename' do
    expect{dsc_xsqlaogroupjoin[:dsc_sqlinstancename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xsqlaogroupjoin[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xsqlaogroupjoin[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xsqlaogroupjoin[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xsqlaogroupjoin[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xsqlaogroupjoin[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlaogroupjoin)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlaogroupjoin)
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
        dsc_xsqlaogroupjoin.original_parameters[:dsc_ensure] = 'present'
        dsc_xsqlaogroupjoin[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsqlaogroupjoin)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsqlaogroupjoin[:ensure]).to eq(:present)
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
        dsc_xsqlaogroupjoin.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsqlaogroupjoin[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsqlaogroupjoin)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsqlaogroupjoin[:ensure]).to eq(:absent)
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
