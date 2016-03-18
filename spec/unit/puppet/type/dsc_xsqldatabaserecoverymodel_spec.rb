#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqldatabaserecoverymodel) do

  let :dsc_xsqldatabaserecoverymodel do
    Puppet::Type.type(:dsc_xsqldatabaserecoverymodel).new(
      :name     => 'foo',
      :dsc_databasename => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqldatabaserecoverymodel).new(
      :name     => 'foo',
      :dsc_databasename => 'foo',
      :dsc_sqlserverinstance => 'foo',
      :dsc_recoverymodel => 'Full',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqldatabaserecoverymodel.to_s).to eq("Dsc_xsqldatabaserecoverymodel[foo]")
  end

  it 'should require that dsc_databasename is specified' do
    #dsc_xsqldatabaserecoverymodel[:dsc_databasename]
    expect { Puppet::Type.type(:dsc_xsqldatabaserecoverymodel).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_databasename is a required attribute/)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sqlserverinstance' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_sqlserverinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlserverinstance' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_sqlserverinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlserverinstance' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_sqlserverinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlserverinstance' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_sqlserverinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_recoverymodel predefined value Full' do
    dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel] = 'Full'
    expect(dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel]).to eq('Full')
  end

  it 'should accept dsc_recoverymodel predefined value full' do
    dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel] = 'full'
    expect(dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel]).to eq('full')
  end

  it 'should accept dsc_recoverymodel predefined value Simple' do
    dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel] = 'Simple'
    expect(dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel]).to eq('Simple')
  end

  it 'should accept dsc_recoverymodel predefined value simple' do
    dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel] = 'simple'
    expect(dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel]).to eq('simple')
  end

  it 'should accept dsc_recoverymodel predefined value BulkLogged' do
    dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel] = 'BulkLogged'
    expect(dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel]).to eq('BulkLogged')
  end

  it 'should accept dsc_recoverymodel predefined value bulklogged' do
    dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel] = 'bulklogged'
    expect(dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel]).to eq('bulklogged')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_recoverymodel' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_recoverymodel' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_recoverymodel' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_recoverymodel' do
    expect{dsc_xsqldatabaserecoverymodel[:dsc_recoverymodel] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqldatabaserecoverymodel)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqldatabaserecoverymodel)
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

  end
end
