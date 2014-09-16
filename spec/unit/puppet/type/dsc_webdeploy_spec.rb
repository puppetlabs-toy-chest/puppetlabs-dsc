#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_webdeploy) do

  let :dsc_webdeploy do
    Puppet::Type.type(:dsc_webdeploy).new(
      :name     => 'foo',
      :dsc_packagepath => 'foo',
      :dsc_contentpath => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_webdeploy.to_s).to eq("Dsc_webdeploy[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_webdeploy[:ensure]).to eq :present
  end

  it 'should require that dsc_packagepath is specified' do
    #dsc_webdeploy[:dsc_packagepath]
    expect { Puppet::Type.type(:dsc_webdeploy).new(
      :name     => 'foo',
      :dsc_contentpath => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_packagepath is a required attribute/)
  end

  it 'should not accept array for dsc_packagepath' do
    expect{dsc_webdeploy[:dsc_packagepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_packagepath' do
    expect{dsc_webdeploy[:dsc_packagepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_packagepath' do
    expect{dsc_webdeploy[:dsc_packagepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_packagepath' do
    expect{dsc_webdeploy[:dsc_packagepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_contentpath is specified' do
    #dsc_webdeploy[:dsc_contentpath]
    expect { Puppet::Type.type(:dsc_webdeploy).new(
      :name     => 'foo',
      :dsc_packagepath => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_contentpath is a required attribute/)
  end

  it 'should not accept array for dsc_contentpath' do
    expect{dsc_webdeploy[:dsc_contentpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_contentpath' do
    expect{dsc_webdeploy[:dsc_contentpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_contentpath' do
    expect{dsc_webdeploy[:dsc_contentpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_contentpath' do
    expect{dsc_webdeploy[:dsc_contentpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_webdeploy[:dsc_ensure] = 'Present'
    expect(dsc_webdeploy[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_webdeploy[:dsc_ensure] = 'present'
    expect(dsc_webdeploy[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_webdeploy[:dsc_ensure] = 'present'
    expect(dsc_webdeploy[:ensure]).to eq(dsc_webdeploy[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_webdeploy[:dsc_ensure] = 'Absent'
    expect(dsc_webdeploy[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_webdeploy[:dsc_ensure] = 'absent'
    expect(dsc_webdeploy[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_webdeploy[:dsc_ensure] = 'absent'
    expect(dsc_webdeploy[:ensure]).to eq(dsc_webdeploy[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_webdeploy[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_webdeploy[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_webdeploy[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_webdeploy[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_webdeploy[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_webdeploy)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_webdeploy)
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
        dsc_webdeploy[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_webdeploy[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_webdeploy.original_parameters[:dsc_ensure] = 'present'
        dsc_webdeploy[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_webdeploy)
      end

      it "should update :ensure to :present" do
        expect(dsc_webdeploy[:ensure]).to eq(:present)
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
        dsc_webdeploy.original_parameters[:dsc_ensure] = 'absent'
        dsc_webdeploy[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_webdeploy)
      end

      it "should update :ensure to :absent" do
        expect(dsc_webdeploy[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_webdeploy)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_webdeploy)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xWebdeploy as $MSFT_xWebdeploy1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xWebdeploy/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_webdeploy[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_webdeploy)
      end

      it "should update :ensure to :present" do
        expect(dsc_webdeploy[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_webdeploy[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_webdeploy)
      end

      it "should update :ensure to :absent" do
        expect(dsc_webdeploy[:ensure]).to eq(:absent)
      end

    end

  end
end
