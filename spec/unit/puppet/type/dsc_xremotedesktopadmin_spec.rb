#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xremotedesktopadmin) do

  let :dsc_xremotedesktopadmin do
    Puppet::Type.type(:dsc_xremotedesktopadmin).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
    )
  end

  it "should stringify normally" do
    expect(dsc_xremotedesktopadmin.to_s).to eq("Dsc_xremotedesktopadmin[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xremotedesktopadmin[:ensure]).to eq :present
  end

  it 'should require that dsc_ensure is specified' do
    #dsc_xremotedesktopadmin[:dsc_ensure]
    expect { Puppet::Type.type(:dsc_xremotedesktopadmin).new(
      :name     => 'foo',
      :dsc_userauthentication => 'Secure',
    )}.to raise_error(Puppet::Error, /dsc_ensure is a required attribute/)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xremotedesktopadmin[:dsc_ensure] = 'Present'
    expect(dsc_xremotedesktopadmin[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xremotedesktopadmin[:dsc_ensure] = 'present'
    expect(dsc_xremotedesktopadmin[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xremotedesktopadmin[:dsc_ensure] = 'present'
    expect(dsc_xremotedesktopadmin[:ensure]).to eq(dsc_xremotedesktopadmin[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xremotedesktopadmin[:dsc_ensure] = 'Absent'
    expect(dsc_xremotedesktopadmin[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xremotedesktopadmin[:dsc_ensure] = 'absent'
    expect(dsc_xremotedesktopadmin[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xremotedesktopadmin[:dsc_ensure] = 'absent'
    expect(dsc_xremotedesktopadmin[:ensure]).to eq(dsc_xremotedesktopadmin[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xremotedesktopadmin[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xremotedesktopadmin[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xremotedesktopadmin[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xremotedesktopadmin[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xremotedesktopadmin[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_userauthentication predefined value Secure' do
    dsc_xremotedesktopadmin[:dsc_userauthentication] = 'Secure'
    expect(dsc_xremotedesktopadmin[:dsc_userauthentication]).to eq('Secure')
  end

  it 'should accept dsc_userauthentication predefined value secure' do
    dsc_xremotedesktopadmin[:dsc_userauthentication] = 'secure'
    expect(dsc_xremotedesktopadmin[:dsc_userauthentication]).to eq('secure')
  end

  it 'should accept dsc_userauthentication predefined value NonSecure' do
    dsc_xremotedesktopadmin[:dsc_userauthentication] = 'NonSecure'
    expect(dsc_xremotedesktopadmin[:dsc_userauthentication]).to eq('NonSecure')
  end

  it 'should accept dsc_userauthentication predefined value nonsecure' do
    dsc_xremotedesktopadmin[:dsc_userauthentication] = 'nonsecure'
    expect(dsc_xremotedesktopadmin[:dsc_userauthentication]).to eq('nonsecure')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xremotedesktopadmin[:dsc_userauthentication] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_userauthentication' do
    expect{dsc_xremotedesktopadmin[:dsc_userauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_userauthentication' do
    expect{dsc_xremotedesktopadmin[:dsc_userauthentication] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_userauthentication' do
    expect{dsc_xremotedesktopadmin[:dsc_userauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_userauthentication' do
    expect{dsc_xremotedesktopadmin[:dsc_userauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xremotedesktopadmin)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xremotedesktopadmin)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Import-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script with Import-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Import-DscResource/)
      end

    end

    describe "when dscmeta_import_resource is false" do

      it "should compute powershell dsc test script without Import-DscResource" do
        dsc_xremotedesktopadmin[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xremotedesktopadmin[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xremotedesktopadmin.original_parameters[:dsc_ensure] = 'present'
        dsc_xremotedesktopadmin[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xremotedesktopadmin)
      end

      it "should update :ensure to :present" do
        expect(dsc_xremotedesktopadmin[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xremotedesktopadmin.original_parameters[:dsc_ensure] = 'absent'
        dsc_xremotedesktopadmin[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xremotedesktopadmin)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xremotedesktopadmin[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xremotedesktopadmin)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xremotedesktopadmin)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xRemoteDesktopAdmin as $MSFT_xRemoteDesktopAdmin1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xRemoteDesktopAdmin/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xremotedesktopadmin[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xremotedesktopadmin)
      end

      it "should update :ensure to :present" do
        expect(dsc_xremotedesktopadmin[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xremotedesktopadmin[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xremotedesktopadmin)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xremotedesktopadmin[:ensure]).to eq(:absent)
      end

    end

  end
end
