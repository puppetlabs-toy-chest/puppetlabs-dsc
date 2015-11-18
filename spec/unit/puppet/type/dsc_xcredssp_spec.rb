#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xcredssp) do

  let :dsc_xcredssp do
    Puppet::Type.type(:dsc_xcredssp).new(
      :name     => 'foo',
      :dsc_role => 'Server',
    )
  end

  it "should stringify normally" do
    expect(dsc_xcredssp.to_s).to eq("Dsc_xcredssp[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xcredssp[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xcredssp[:dsc_ensure] = 'Present'
    expect(dsc_xcredssp[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xcredssp[:dsc_ensure] = 'present'
    expect(dsc_xcredssp[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xcredssp[:dsc_ensure] = 'present'
    expect(dsc_xcredssp[:ensure]).to eq(dsc_xcredssp[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xcredssp[:dsc_ensure] = 'Absent'
    expect(dsc_xcredssp[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xcredssp[:dsc_ensure] = 'absent'
    expect(dsc_xcredssp[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xcredssp[:dsc_ensure] = 'absent'
    expect(dsc_xcredssp[:ensure]).to eq(dsc_xcredssp[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xcredssp[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xcredssp[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xcredssp[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xcredssp[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xcredssp[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_role is specified' do
    #dsc_xcredssp[:dsc_role]
    expect { Puppet::Type.type(:dsc_xcredssp).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_delegatecomputers => ["foo", "bar", "spec"],
    )}.to raise_error(Puppet::Error, /dsc_role is a required attribute/)
  end

  it 'should accept dsc_role predefined value Server' do
    dsc_xcredssp[:dsc_role] = 'Server'
    expect(dsc_xcredssp[:dsc_role]).to eq('Server')
  end

  it 'should accept dsc_role predefined value server' do
    dsc_xcredssp[:dsc_role] = 'server'
    expect(dsc_xcredssp[:dsc_role]).to eq('server')
  end

  it 'should accept dsc_role predefined value Client' do
    dsc_xcredssp[:dsc_role] = 'Client'
    expect(dsc_xcredssp[:dsc_role]).to eq('Client')
  end

  it 'should accept dsc_role predefined value client' do
    dsc_xcredssp[:dsc_role] = 'client'
    expect(dsc_xcredssp[:dsc_role]).to eq('client')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xcredssp[:dsc_role] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_role' do
    expect{dsc_xcredssp[:dsc_role] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_role' do
    expect{dsc_xcredssp[:dsc_role] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_role' do
    expect{dsc_xcredssp[:dsc_role] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_role' do
    expect{dsc_xcredssp[:dsc_role] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_delegatecomputers' do
    dsc_xcredssp[:dsc_delegatecomputers] = ["foo", "bar", "spec"]
    expect(dsc_xcredssp[:dsc_delegatecomputers]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_delegatecomputers' do
    expect{dsc_xcredssp[:dsc_delegatecomputers] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_delegatecomputers' do
    expect{dsc_xcredssp[:dsc_delegatecomputers] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_delegatecomputers' do
    expect{dsc_xcredssp[:dsc_delegatecomputers] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xcredssp)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xcredssp)
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
        dsc_xcredssp.original_parameters[:dsc_ensure] = 'present'
        dsc_xcredssp[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xcredssp)
      end

      it "should update :ensure to :present" do
        expect(dsc_xcredssp[:ensure]).to eq(:present)
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
        dsc_xcredssp.original_parameters[:dsc_ensure] = 'absent'
        dsc_xcredssp[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xcredssp)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xcredssp[:ensure]).to eq(:absent)
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
