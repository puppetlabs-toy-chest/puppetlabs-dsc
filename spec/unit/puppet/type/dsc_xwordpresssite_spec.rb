#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwordpresssite) do

  let :dsc_xwordpresssite do
    Puppet::Type.type(:dsc_xwordpresssite).new(
      :name     => 'foo',
      :dsc_uri => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwordpresssite.to_s).to eq("Dsc_xwordpresssite[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xwordpresssite[:ensure]).to eq :present
  end

  it 'should require that dsc_uri is specified' do
    #dsc_xwordpresssite[:dsc_uri]
    expect { Puppet::Type.type(:dsc_xwordpresssite).new(
      :name     => 'foo',
      :dsc_title => 'foo',
      :dsc_administratorcredential => {"user"=>"user", "password"=>"password"},
      :dsc_administratoremail => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_uri is a required attribute/)
  end

  it 'should not accept array for dsc_uri' do
    expect{dsc_xwordpresssite[:dsc_uri] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_uri' do
    expect{dsc_xwordpresssite[:dsc_uri] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_uri' do
    expect{dsc_xwordpresssite[:dsc_uri] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_uri' do
    expect{dsc_xwordpresssite[:dsc_uri] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_title' do
    expect{dsc_xwordpresssite[:dsc_title] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_title' do
    expect{dsc_xwordpresssite[:dsc_title] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_title' do
    expect{dsc_xwordpresssite[:dsc_title] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_title' do
    expect{dsc_xwordpresssite[:dsc_title] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_administratorcredential" do
    expect{dsc_xwordpresssite[:dsc_administratorcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_administratorcredential' do
    expect{dsc_xwordpresssite[:dsc_administratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_administratorcredential' do
    expect{dsc_xwordpresssite[:dsc_administratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_administratorcredential' do
    expect{dsc_xwordpresssite[:dsc_administratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_administratorcredential' do
    expect{dsc_xwordpresssite[:dsc_administratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_administratoremail' do
    expect{dsc_xwordpresssite[:dsc_administratoremail] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_administratoremail' do
    expect{dsc_xwordpresssite[:dsc_administratoremail] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_administratoremail' do
    expect{dsc_xwordpresssite[:dsc_administratoremail] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_administratoremail' do
    expect{dsc_xwordpresssite[:dsc_administratoremail] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xwordpresssite[:dsc_ensure] = 'Present'
    expect(dsc_xwordpresssite[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xwordpresssite[:dsc_ensure] = 'present'
    expect(dsc_xwordpresssite[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwordpresssite[:dsc_ensure] = 'present'
    expect(dsc_xwordpresssite[:ensure]).to eq(dsc_xwordpresssite[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xwordpresssite[:dsc_ensure] = 'Absent'
    expect(dsc_xwordpresssite[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xwordpresssite[:dsc_ensure] = 'absent'
    expect(dsc_xwordpresssite[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwordpresssite[:dsc_ensure] = 'absent'
    expect(dsc_xwordpresssite[:ensure]).to eq(dsc_xwordpresssite[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwordpresssite[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xwordpresssite[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xwordpresssite[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xwordpresssite[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xwordpresssite[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwordpresssite)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwordpresssite)
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
        dsc_xwordpresssite.original_parameters[:dsc_ensure] = 'present'
        dsc_xwordpresssite[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xwordpresssite)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwordpresssite[:ensure]).to eq(:present)
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
        dsc_xwordpresssite.original_parameters[:dsc_ensure] = 'absent'
        dsc_xwordpresssite[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xwordpresssite)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwordpresssite[:ensure]).to eq(:absent)
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
