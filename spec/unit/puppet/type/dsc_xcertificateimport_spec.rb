#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xcertificateimport) do

  let :dsc_xcertificateimport do
    Puppet::Type.type(:dsc_xcertificateimport).new(
      :name     => 'foo',
      :dsc_thumbprint => 'foo',
      :dsc_location => 'LocalMachine',
      :dsc_store => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xcertificateimport).new(
      :name     => 'foo',
      :dsc_thumbprint => 'foo',
      :dsc_path => 'foo',
      :dsc_location => 'LocalMachine',
      :dsc_store => 'foo',
      :dsc_ensure => 'Present',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xcertificateimport.to_s).to eq("Dsc_xcertificateimport[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xcertificateimport[:ensure]).to eq :present
  end

  it 'should require that dsc_thumbprint is specified' do
    #dsc_xcertificateimport[:dsc_thumbprint]
    expect { Puppet::Type.type(:dsc_xcertificateimport).new(
      :name     => 'foo',
      :dsc_location => 'LocalMachine',
      :dsc_store => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_thumbprint is a required attribute/)
  end

  it 'should not accept array for dsc_thumbprint' do
    expect{dsc_xcertificateimport[:dsc_thumbprint] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_thumbprint' do
    expect{dsc_xcertificateimport[:dsc_thumbprint] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_thumbprint' do
    expect{dsc_xcertificateimport[:dsc_thumbprint] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_thumbprint' do
    expect{dsc_xcertificateimport[:dsc_thumbprint] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xcertificateimport[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xcertificateimport[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xcertificateimport[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xcertificateimport[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_location is specified' do
    #dsc_xcertificateimport[:dsc_location]
    expect { Puppet::Type.type(:dsc_xcertificateimport).new(
      :name     => 'foo',
      :dsc_thumbprint => 'foo',
      :dsc_store => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_location is a required attribute/)
  end

  it 'should accept dsc_location predefined value LocalMachine' do
    dsc_xcertificateimport[:dsc_location] = 'LocalMachine'
    expect(dsc_xcertificateimport[:dsc_location]).to eq('LocalMachine')
  end

  it 'should accept dsc_location predefined value localmachine' do
    dsc_xcertificateimport[:dsc_location] = 'localmachine'
    expect(dsc_xcertificateimport[:dsc_location]).to eq('localmachine')
  end

  it 'should accept dsc_location predefined value CurrentUser' do
    dsc_xcertificateimport[:dsc_location] = 'CurrentUser'
    expect(dsc_xcertificateimport[:dsc_location]).to eq('CurrentUser')
  end

  it 'should accept dsc_location predefined value currentuser' do
    dsc_xcertificateimport[:dsc_location] = 'currentuser'
    expect(dsc_xcertificateimport[:dsc_location]).to eq('currentuser')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xcertificateimport[:dsc_location] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_location' do
    expect{dsc_xcertificateimport[:dsc_location] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_location' do
    expect{dsc_xcertificateimport[:dsc_location] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_location' do
    expect{dsc_xcertificateimport[:dsc_location] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_location' do
    expect{dsc_xcertificateimport[:dsc_location] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_store is specified' do
    #dsc_xcertificateimport[:dsc_store]
    expect { Puppet::Type.type(:dsc_xcertificateimport).new(
      :name     => 'foo',
      :dsc_thumbprint => 'foo',
      :dsc_location => 'LocalMachine',
    )}.to raise_error(Puppet::Error, /dsc_store is a required attribute/)
  end

  it 'should not accept array for dsc_store' do
    expect{dsc_xcertificateimport[:dsc_store] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_store' do
    expect{dsc_xcertificateimport[:dsc_store] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_store' do
    expect{dsc_xcertificateimport[:dsc_store] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_store' do
    expect{dsc_xcertificateimport[:dsc_store] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xcertificateimport[:dsc_ensure] = 'Present'
    expect(dsc_xcertificateimport[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xcertificateimport[:dsc_ensure] = 'present'
    expect(dsc_xcertificateimport[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xcertificateimport[:dsc_ensure] = 'present'
    expect(dsc_xcertificateimport[:ensure]).to eq(dsc_xcertificateimport[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xcertificateimport[:dsc_ensure] = 'Absent'
    expect(dsc_xcertificateimport[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xcertificateimport[:dsc_ensure] = 'absent'
    expect(dsc_xcertificateimport[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xcertificateimport[:dsc_ensure] = 'absent'
    expect(dsc_xcertificateimport[:ensure]).to eq(dsc_xcertificateimport[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xcertificateimport[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xcertificateimport[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xcertificateimport[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xcertificateimport[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xcertificateimport[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xcertificateimport)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xcertificateimport)
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
        dsc_xcertificateimport.original_parameters[:dsc_ensure] = 'present'
        dsc_xcertificateimport[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xcertificateimport)
      end

      it "should update :ensure to :present" do
        expect(dsc_xcertificateimport[:ensure]).to eq(:present)
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
        dsc_xcertificateimport.original_parameters[:dsc_ensure] = 'absent'
        dsc_xcertificateimport[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xcertificateimport)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xcertificateimport[:ensure]).to eq(:absent)
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
