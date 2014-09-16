#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwebvirtualdirectory) do

  let :dsc_xwebvirtualdirectory do
    Puppet::Type.type(:dsc_xwebvirtualdirectory).new(
      :name     => 'foo',
      :dsc_website => 'foo',
      :dsc_webapplication => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwebvirtualdirectory.to_s).to eq("Dsc_xwebvirtualdirectory[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xwebvirtualdirectory[:ensure]).to eq :present
  end

  it 'should require that dsc_website is specified' do
    #dsc_xwebvirtualdirectory[:dsc_website]
    expect { Puppet::Type.type(:dsc_xwebvirtualdirectory).new(
      :name     => 'foo',
      :dsc_webapplication => 'foo',
      :dsc_name => 'foo',
      :dsc_physicalpath => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_website is a required attribute/)
  end

  it 'should not accept array for dsc_website' do
    expect{dsc_xwebvirtualdirectory[:dsc_website] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_website' do
    expect{dsc_xwebvirtualdirectory[:dsc_website] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_website' do
    expect{dsc_xwebvirtualdirectory[:dsc_website] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_website' do
    expect{dsc_xwebvirtualdirectory[:dsc_website] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_webapplication is specified' do
    #dsc_xwebvirtualdirectory[:dsc_webapplication]
    expect { Puppet::Type.type(:dsc_xwebvirtualdirectory).new(
      :name     => 'foo',
      :dsc_website => 'foo',
      :dsc_name => 'foo',
      :dsc_physicalpath => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_webapplication is a required attribute/)
  end

  it 'should not accept array for dsc_webapplication' do
    expect{dsc_xwebvirtualdirectory[:dsc_webapplication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webapplication' do
    expect{dsc_xwebvirtualdirectory[:dsc_webapplication] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webapplication' do
    expect{dsc_xwebvirtualdirectory[:dsc_webapplication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webapplication' do
    expect{dsc_xwebvirtualdirectory[:dsc_webapplication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_xwebvirtualdirectory[:dsc_name]
    expect { Puppet::Type.type(:dsc_xwebvirtualdirectory).new(
      :name     => 'foo',
      :dsc_website => 'foo',
      :dsc_webapplication => 'foo',
      :dsc_physicalpath => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xwebvirtualdirectory[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xwebvirtualdirectory[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xwebvirtualdirectory[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xwebvirtualdirectory[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_physicalpath' do
    expect{dsc_xwebvirtualdirectory[:dsc_physicalpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_physicalpath' do
    expect{dsc_xwebvirtualdirectory[:dsc_physicalpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_physicalpath' do
    expect{dsc_xwebvirtualdirectory[:dsc_physicalpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_physicalpath' do
    expect{dsc_xwebvirtualdirectory[:dsc_physicalpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xwebvirtualdirectory[:dsc_ensure] = 'Present'
    expect(dsc_xwebvirtualdirectory[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xwebvirtualdirectory[:dsc_ensure] = 'present'
    expect(dsc_xwebvirtualdirectory[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebvirtualdirectory[:dsc_ensure] = 'present'
    expect(dsc_xwebvirtualdirectory[:ensure]).to eq(dsc_xwebvirtualdirectory[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xwebvirtualdirectory[:dsc_ensure] = 'Absent'
    expect(dsc_xwebvirtualdirectory[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xwebvirtualdirectory[:dsc_ensure] = 'absent'
    expect(dsc_xwebvirtualdirectory[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebvirtualdirectory[:dsc_ensure] = 'absent'
    expect(dsc_xwebvirtualdirectory[:ensure]).to eq(dsc_xwebvirtualdirectory[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebvirtualdirectory[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xwebvirtualdirectory[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xwebvirtualdirectory[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xwebvirtualdirectory[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xwebvirtualdirectory[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xwebvirtualdirectory)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xwebvirtualdirectory)
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
        dsc_xwebvirtualdirectory[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xwebvirtualdirectory[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xwebvirtualdirectory.original_parameters[:dsc_ensure] = 'present'
        dsc_xwebvirtualdirectory[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xwebvirtualdirectory)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwebvirtualdirectory[:ensure]).to eq(:present)
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
        dsc_xwebvirtualdirectory.original_parameters[:dsc_ensure] = 'absent'
        dsc_xwebvirtualdirectory[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xwebvirtualdirectory)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwebvirtualdirectory[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xwebvirtualdirectory)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xwebvirtualdirectory)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xWebVirtualDirectory as $MSFT_xWebVirtualDirectory1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xWebVirtualDirectory/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xwebvirtualdirectory[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xwebvirtualdirectory)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwebvirtualdirectory[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xwebvirtualdirectory[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xwebvirtualdirectory)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwebvirtualdirectory[:ensure]).to eq(:absent)
      end

    end

  end
end
