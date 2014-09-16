#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdatabase) do

  let :dsc_xdatabase do
    Puppet::Type.type(:dsc_xdatabase).new(
      :name     => 'foo',
      :dsc_databasename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdatabase.to_s).to eq("Dsc_xdatabase[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdatabase[:ensure]).to eq :present
  end

  it 'should not accept array for dsc_credentials' do
    expect{dsc_xdatabase[:dsc_credentials] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credentials' do
    expect{dsc_xdatabase[:dsc_credentials] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credentials' do
    expect{dsc_xdatabase[:dsc_credentials] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credentials' do
    expect{dsc_xdatabase[:dsc_credentials] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdatabase[:dsc_ensure] = 'Present'
    expect(dsc_xdatabase[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdatabase[:dsc_ensure] = 'present'
    expect(dsc_xdatabase[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdatabase[:dsc_ensure] = 'present'
    expect(dsc_xdatabase[:ensure]).to eq(dsc_xdatabase[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdatabase[:dsc_ensure] = 'Absent'
    expect(dsc_xdatabase[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdatabase[:dsc_ensure] = 'absent'
    expect(dsc_xdatabase[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdatabase[:dsc_ensure] = 'absent'
    expect(dsc_xdatabase[:ensure]).to eq(dsc_xdatabase[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdatabase[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdatabase[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdatabase[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdatabase[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdatabase[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xdatabase[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xdatabase[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xdatabase[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xdatabase[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_sqlserverversion predefined value 2008-R2' do
    dsc_xdatabase[:dsc_sqlserverversion] = '2008-R2'
    expect(dsc_xdatabase[:dsc_sqlserverversion]).to eq('2008-R2')
  end

  it 'should accept dsc_sqlserverversion predefined value 2008-r2' do
    dsc_xdatabase[:dsc_sqlserverversion] = '2008-r2'
    expect(dsc_xdatabase[:dsc_sqlserverversion]).to eq('2008-r2')
  end

  it 'should accept dsc_sqlserverversion predefined value 2012' do
    dsc_xdatabase[:dsc_sqlserverversion] = '2012'
    expect(dsc_xdatabase[:dsc_sqlserverversion]).to eq('2012')
  end

  it 'should accept dsc_sqlserverversion predefined value 2012' do
    dsc_xdatabase[:dsc_sqlserverversion] = '2012'
    expect(dsc_xdatabase[:dsc_sqlserverversion]).to eq('2012')
  end

  it 'should accept dsc_sqlserverversion predefined value 2014' do
    dsc_xdatabase[:dsc_sqlserverversion] = '2014'
    expect(dsc_xdatabase[:dsc_sqlserverversion]).to eq('2014')
  end

  it 'should accept dsc_sqlserverversion predefined value 2014' do
    dsc_xdatabase[:dsc_sqlserverversion] = '2014'
    expect(dsc_xdatabase[:dsc_sqlserverversion]).to eq('2014')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdatabase[:dsc_sqlserverversion] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserverversion' do
    expect{dsc_xdatabase[:dsc_sqlserverversion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserverversion' do
    expect{dsc_xdatabase[:dsc_sqlserverversion] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserverversion' do
    expect{dsc_xdatabase[:dsc_sqlserverversion] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserverversion' do
    expect{dsc_xdatabase[:dsc_sqlserverversion] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_bacpacpath' do
    expect{dsc_xdatabase[:dsc_bacpacpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_bacpacpath' do
    expect{dsc_xdatabase[:dsc_bacpacpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_bacpacpath' do
    expect{dsc_xdatabase[:dsc_bacpacpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_bacpacpath' do
    expect{dsc_xdatabase[:dsc_bacpacpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_databasename is specified' do
    #dsc_xdatabase[:dsc_databasename]
    expect { Puppet::Type.type(:dsc_xdatabase).new(
      :name     => 'foo',
      :dsc_credentials => 'foo',
      :dsc_ensure => 'Present',
      :dsc_sqlserver => 'foo',
      :dsc_sqlserverversion => '2008-R2',
      :dsc_bacpacpath => 'foo',
      :dsc_dacpacpath => 'foo',
      :dsc_dacpacapplicationname => 'foo',
      :dsc_dacpacapplicationversion => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_databasename is a required attribute/)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_xdatabase[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_xdatabase[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_xdatabase[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_xdatabase[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dacpacpath' do
    expect{dsc_xdatabase[:dsc_dacpacpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dacpacpath' do
    expect{dsc_xdatabase[:dsc_dacpacpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dacpacpath' do
    expect{dsc_xdatabase[:dsc_dacpacpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dacpacpath' do
    expect{dsc_xdatabase[:dsc_dacpacpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dacpacapplicationname' do
    expect{dsc_xdatabase[:dsc_dacpacapplicationname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dacpacapplicationname' do
    expect{dsc_xdatabase[:dsc_dacpacapplicationname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dacpacapplicationname' do
    expect{dsc_xdatabase[:dsc_dacpacapplicationname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dacpacapplicationname' do
    expect{dsc_xdatabase[:dsc_dacpacapplicationname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dacpacapplicationversion' do
    expect{dsc_xdatabase[:dsc_dacpacapplicationversion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dacpacapplicationversion' do
    expect{dsc_xdatabase[:dsc_dacpacapplicationversion] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dacpacapplicationversion' do
    expect{dsc_xdatabase[:dsc_dacpacapplicationversion] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dacpacapplicationversion' do
    expect{dsc_xdatabase[:dsc_dacpacapplicationversion] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xdatabase)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xdatabase)
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
        dsc_xdatabase[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xdatabase[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xdatabase.original_parameters[:dsc_ensure] = 'present'
        dsc_xdatabase[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xdatabase)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdatabase[:ensure]).to eq(:present)
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
        dsc_xdatabase.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdatabase[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xdatabase)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdatabase[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xdatabase)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xdatabase)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xDatabase as $MSFT_xDatabase1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xDatabase/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xdatabase[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xdatabase)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdatabase[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xdatabase[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xdatabase)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdatabase[:ensure]).to eq(:absent)
      end

    end

  end
end
