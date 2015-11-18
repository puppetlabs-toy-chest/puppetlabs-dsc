#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazureaffinitygroup) do

  let :dsc_xazureaffinitygroup do
    Puppet::Type.type(:dsc_xazureaffinitygroup).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazureaffinitygroup.to_s).to eq("Dsc_xazureaffinitygroup[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xazureaffinitygroup[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xazureaffinitygroup[:dsc_name]
    expect { Puppet::Type.type(:dsc_xazureaffinitygroup).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_location => 'foo',
      :dsc_description => 'foo',
      :dsc_label => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xazureaffinitygroup[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xazureaffinitygroup[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xazureaffinitygroup[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xazureaffinitygroup[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xazureaffinitygroup[:dsc_ensure] = 'Present'
    expect(dsc_xazureaffinitygroup[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xazureaffinitygroup[:dsc_ensure] = 'present'
    expect(dsc_xazureaffinitygroup[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazureaffinitygroup[:dsc_ensure] = 'present'
    expect(dsc_xazureaffinitygroup[:ensure]).to eq(dsc_xazureaffinitygroup[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xazureaffinitygroup[:dsc_ensure] = 'Absent'
    expect(dsc_xazureaffinitygroup[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xazureaffinitygroup[:dsc_ensure] = 'absent'
    expect(dsc_xazureaffinitygroup[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazureaffinitygroup[:dsc_ensure] = 'absent'
    expect(dsc_xazureaffinitygroup[:ensure]).to eq(dsc_xazureaffinitygroup[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazureaffinitygroup[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xazureaffinitygroup[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xazureaffinitygroup[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xazureaffinitygroup[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xazureaffinitygroup[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_location' do
    expect{dsc_xazureaffinitygroup[:dsc_location] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_location' do
    expect{dsc_xazureaffinitygroup[:dsc_location] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_location' do
    expect{dsc_xazureaffinitygroup[:dsc_location] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_location' do
    expect{dsc_xazureaffinitygroup[:dsc_location] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xazureaffinitygroup[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xazureaffinitygroup[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xazureaffinitygroup[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xazureaffinitygroup[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_label' do
    expect{dsc_xazureaffinitygroup[:dsc_label] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_label' do
    expect{dsc_xazureaffinitygroup[:dsc_label] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_label' do
    expect{dsc_xazureaffinitygroup[:dsc_label] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_label' do
    expect{dsc_xazureaffinitygroup[:dsc_label] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xazureaffinitygroup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xazureaffinitygroup)
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
        dsc_xazureaffinitygroup.original_parameters[:dsc_ensure] = 'present'
        dsc_xazureaffinitygroup[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xazureaffinitygroup)
      end

      it "should update :ensure to :present" do
        expect(dsc_xazureaffinitygroup[:ensure]).to eq(:present)
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
        dsc_xazureaffinitygroup.original_parameters[:dsc_ensure] = 'absent'
        dsc_xazureaffinitygroup[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xazureaffinitygroup)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xazureaffinitygroup[:ensure]).to eq(:absent)
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
