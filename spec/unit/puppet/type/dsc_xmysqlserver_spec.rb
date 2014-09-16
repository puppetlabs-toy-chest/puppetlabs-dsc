#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xmysqlserver) do

  let :dsc_xmysqlserver do
    Puppet::Type.type(:dsc_xmysqlserver).new(
      :name     => 'foo',
      :dsc_servicename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xmysqlserver.to_s).to eq("Dsc_xmysqlserver[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xmysqlserver[:ensure]).to eq :present
  end

  it 'should require that dsc_servicename is specified' do
    #dsc_xmysqlserver[:dsc_servicename]
    expect { Puppet::Type.type(:dsc_xmysqlserver).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_rootpassword => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_servicename is a required attribute/)
  end

  it 'should not accept array for dsc_servicename' do
    expect{dsc_xmysqlserver[:dsc_servicename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servicename' do
    expect{dsc_xmysqlserver[:dsc_servicename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servicename' do
    expect{dsc_xmysqlserver[:dsc_servicename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servicename' do
    expect{dsc_xmysqlserver[:dsc_servicename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xmysqlserver[:dsc_ensure] = 'Present'
    expect(dsc_xmysqlserver[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xmysqlserver[:dsc_ensure] = 'present'
    expect(dsc_xmysqlserver[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xmysqlserver[:dsc_ensure] = 'present'
    expect(dsc_xmysqlserver[:ensure]).to eq(dsc_xmysqlserver[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xmysqlserver[:dsc_ensure] = 'Absent'
    expect(dsc_xmysqlserver[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xmysqlserver[:dsc_ensure] = 'absent'
    expect(dsc_xmysqlserver[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xmysqlserver[:dsc_ensure] = 'absent'
    expect(dsc_xmysqlserver[:ensure]).to eq(dsc_xmysqlserver[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmysqlserver[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xmysqlserver[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xmysqlserver[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xmysqlserver[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xmysqlserver[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_rootpassword' do
    expect{dsc_xmysqlserver[:dsc_rootpassword] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rootpassword' do
    expect{dsc_xmysqlserver[:dsc_rootpassword] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rootpassword' do
    expect{dsc_xmysqlserver[:dsc_rootpassword] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rootpassword' do
    expect{dsc_xmysqlserver[:dsc_rootpassword] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xmysqlserver)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xmysqlserver)
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
        dsc_xmysqlserver[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xmysqlserver[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xmysqlserver.original_parameters[:dsc_ensure] = 'present'
        dsc_xmysqlserver[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xmysqlserver)
      end

      it "should update :ensure to :present" do
        expect(dsc_xmysqlserver[:ensure]).to eq(:present)
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
        dsc_xmysqlserver.original_parameters[:dsc_ensure] = 'absent'
        dsc_xmysqlserver[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xmysqlserver)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xmysqlserver[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xmysqlserver)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xmysqlserver)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xMySqlServer as $MSFT_xMySqlServer1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xMySqlServer/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xmysqlserver[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xmysqlserver)
      end

      it "should update :ensure to :present" do
        expect(dsc_xmysqlserver[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xmysqlserver[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xmysqlserver)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xmysqlserver[:ensure]).to eq(:absent)
      end

    end

  end
end
