#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdbpackage) do

  let :dsc_xdbpackage do
    Puppet::Type.type(:dsc_xdbpackage).new(
      :name     => 'foo',
      :dsc_databasename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdbpackage.to_s).to eq("Dsc_xdbpackage[foo]")
  end

  it 'should not accept array for dsc_credentials' do
    expect{dsc_xdbpackage[:dsc_credentials] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credentials' do
    expect{dsc_xdbpackage[:dsc_credentials] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credentials' do
    expect{dsc_xdbpackage[:dsc_credentials] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credentials' do
    expect{dsc_xdbpackage[:dsc_credentials] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_databasename is specified' do
    #dsc_xdbpackage[:dsc_databasename]
    expect { Puppet::Type.type(:dsc_xdbpackage).new(
      :name     => 'foo',
      :dsc_credentials => 'foo',
      :dsc_sqlserver => 'foo',
      :dsc_path => 'foo',
      :dsc_type => 'DACPAC',
      :dsc_sqlserverversion => '2008-R2',
    )}.to raise_error(Puppet::Error, /dsc_databasename is a required attribute/)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_xdbpackage[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_xdbpackage[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_xdbpackage[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_xdbpackage[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserver' do
    expect{dsc_xdbpackage[:dsc_sqlserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserver' do
    expect{dsc_xdbpackage[:dsc_sqlserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserver' do
    expect{dsc_xdbpackage[:dsc_sqlserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserver' do
    expect{dsc_xdbpackage[:dsc_sqlserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xdbpackage[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xdbpackage[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xdbpackage[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xdbpackage[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_type predefined value DACPAC' do
    dsc_xdbpackage[:dsc_type] = 'DACPAC'
    expect(dsc_xdbpackage[:dsc_type]).to eq('DACPAC')
  end

  it 'should accept dsc_type predefined value dacpac' do
    dsc_xdbpackage[:dsc_type] = 'dacpac'
    expect(dsc_xdbpackage[:dsc_type]).to eq('dacpac')
  end

  it 'should accept dsc_type predefined value BACPAC' do
    dsc_xdbpackage[:dsc_type] = 'BACPAC'
    expect(dsc_xdbpackage[:dsc_type]).to eq('BACPAC')
  end

  it 'should accept dsc_type predefined value bacpac' do
    dsc_xdbpackage[:dsc_type] = 'bacpac'
    expect(dsc_xdbpackage[:dsc_type]).to eq('bacpac')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdbpackage[:dsc_type] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_type' do
    expect{dsc_xdbpackage[:dsc_type] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_type' do
    expect{dsc_xdbpackage[:dsc_type] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_type' do
    expect{dsc_xdbpackage[:dsc_type] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_type' do
    expect{dsc_xdbpackage[:dsc_type] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_sqlserverversion predefined value 2008-R2' do
    dsc_xdbpackage[:dsc_sqlserverversion] = '2008-R2'
    expect(dsc_xdbpackage[:dsc_sqlserverversion]).to eq('2008-R2')
  end

  it 'should accept dsc_sqlserverversion predefined value 2008-r2' do
    dsc_xdbpackage[:dsc_sqlserverversion] = '2008-r2'
    expect(dsc_xdbpackage[:dsc_sqlserverversion]).to eq('2008-r2')
  end

  it 'should accept dsc_sqlserverversion predefined value 2012' do
    dsc_xdbpackage[:dsc_sqlserverversion] = '2012'
    expect(dsc_xdbpackage[:dsc_sqlserverversion]).to eq('2012')
  end

  it 'should accept dsc_sqlserverversion predefined value 2012' do
    dsc_xdbpackage[:dsc_sqlserverversion] = '2012'
    expect(dsc_xdbpackage[:dsc_sqlserverversion]).to eq('2012')
  end

  it 'should accept dsc_sqlserverversion predefined value 2014' do
    dsc_xdbpackage[:dsc_sqlserverversion] = '2014'
    expect(dsc_xdbpackage[:dsc_sqlserverversion]).to eq('2014')
  end

  it 'should accept dsc_sqlserverversion predefined value 2014' do
    dsc_xdbpackage[:dsc_sqlserverversion] = '2014'
    expect(dsc_xdbpackage[:dsc_sqlserverversion]).to eq('2014')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdbpackage[:dsc_sqlserverversion] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserverversion' do
    expect{dsc_xdbpackage[:dsc_sqlserverversion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserverversion' do
    expect{dsc_xdbpackage[:dsc_sqlserverversion] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserverversion' do
    expect{dsc_xdbpackage[:dsc_sqlserverversion] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserverversion' do
    expect{dsc_xdbpackage[:dsc_sqlserverversion] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xdbpackage)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xdbpackage)
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
        dsc_xdbpackage[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xdbpackage[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_xdbpackage)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xdbpackage)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xDBPackage as $MSFT_xDBPackage1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xDBPackage/)
    end


  end
end
