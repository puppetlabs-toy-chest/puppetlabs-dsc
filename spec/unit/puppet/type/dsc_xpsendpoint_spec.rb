#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xpsendpoint) do

  let :dsc_xpsendpoint do
    Puppet::Type.type(:dsc_xpsendpoint).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xpsendpoint.to_s).to eq("Dsc_xpsendpoint[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xpsendpoint[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xpsendpoint[:dsc_name]
    expect { Puppet::Type.type(:dsc_xpsendpoint).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_startupscript => 'foo',
      :dsc_runascredential => 'foo',
      :dsc_securitydescriptorsddl => 'foo',
      :dsc_accessmode => 'Local',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xpsendpoint[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xpsendpoint[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xpsendpoint[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xpsendpoint[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xpsendpoint[:dsc_ensure] = 'Present'
    expect(dsc_xpsendpoint[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xpsendpoint[:dsc_ensure] = 'present'
    expect(dsc_xpsendpoint[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xpsendpoint[:dsc_ensure] = 'present'
    expect(dsc_xpsendpoint[:ensure]).to eq(dsc_xpsendpoint[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xpsendpoint[:dsc_ensure] = 'Absent'
    expect(dsc_xpsendpoint[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xpsendpoint[:dsc_ensure] = 'absent'
    expect(dsc_xpsendpoint[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xpsendpoint[:dsc_ensure] = 'absent'
    expect(dsc_xpsendpoint[:ensure]).to eq(dsc_xpsendpoint[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xpsendpoint[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xpsendpoint[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xpsendpoint[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xpsendpoint[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xpsendpoint[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_startupscript' do
    expect{dsc_xpsendpoint[:dsc_startupscript] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_startupscript' do
    expect{dsc_xpsendpoint[:dsc_startupscript] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_startupscript' do
    expect{dsc_xpsendpoint[:dsc_startupscript] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_startupscript' do
    expect{dsc_xpsendpoint[:dsc_startupscript] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_runascredential' do
    expect{dsc_xpsendpoint[:dsc_runascredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_runascredential' do
    expect{dsc_xpsendpoint[:dsc_runascredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_runascredential' do
    expect{dsc_xpsendpoint[:dsc_runascredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_runascredential' do
    expect{dsc_xpsendpoint[:dsc_runascredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_securitydescriptorsddl' do
    expect{dsc_xpsendpoint[:dsc_securitydescriptorsddl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_securitydescriptorsddl' do
    expect{dsc_xpsendpoint[:dsc_securitydescriptorsddl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_securitydescriptorsddl' do
    expect{dsc_xpsendpoint[:dsc_securitydescriptorsddl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_securitydescriptorsddl' do
    expect{dsc_xpsendpoint[:dsc_securitydescriptorsddl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_accessmode predefined value Local' do
    dsc_xpsendpoint[:dsc_accessmode] = 'Local'
    expect(dsc_xpsendpoint[:dsc_accessmode]).to eq('Local')
  end

  it 'should accept dsc_accessmode predefined value local' do
    dsc_xpsendpoint[:dsc_accessmode] = 'local'
    expect(dsc_xpsendpoint[:dsc_accessmode]).to eq('local')
  end

  it 'should accept dsc_accessmode predefined value Remote' do
    dsc_xpsendpoint[:dsc_accessmode] = 'Remote'
    expect(dsc_xpsendpoint[:dsc_accessmode]).to eq('Remote')
  end

  it 'should accept dsc_accessmode predefined value remote' do
    dsc_xpsendpoint[:dsc_accessmode] = 'remote'
    expect(dsc_xpsendpoint[:dsc_accessmode]).to eq('remote')
  end

  it 'should accept dsc_accessmode predefined value Disabled' do
    dsc_xpsendpoint[:dsc_accessmode] = 'Disabled'
    expect(dsc_xpsendpoint[:dsc_accessmode]).to eq('Disabled')
  end

  it 'should accept dsc_accessmode predefined value disabled' do
    dsc_xpsendpoint[:dsc_accessmode] = 'disabled'
    expect(dsc_xpsendpoint[:dsc_accessmode]).to eq('disabled')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xpsendpoint[:dsc_accessmode] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_accessmode' do
    expect{dsc_xpsendpoint[:dsc_accessmode] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_accessmode' do
    expect{dsc_xpsendpoint[:dsc_accessmode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_accessmode' do
    expect{dsc_xpsendpoint[:dsc_accessmode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_accessmode' do
    expect{dsc_xpsendpoint[:dsc_accessmode] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xpsendpoint)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xpsendpoint)
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
        dsc_xpsendpoint[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xpsendpoint[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xpsendpoint.original_parameters[:dsc_ensure] = 'present'
        dsc_xpsendpoint[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xpsendpoint)
      end

      it "should update :ensure to :present" do
        expect(dsc_xpsendpoint[:ensure]).to eq(:present)
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
        dsc_xpsendpoint.original_parameters[:dsc_ensure] = 'absent'
        dsc_xpsendpoint[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xpsendpoint)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xpsendpoint[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xpsendpoint)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xpsendpoint)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xPSSessionConfiguration as $MSFT_xPSSessionConfiguration1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xPSSessionConfiguration/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xpsendpoint[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xpsendpoint)
      end

      it "should update :ensure to :present" do
        expect(dsc_xpsendpoint[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xpsendpoint[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xpsendpoint)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xpsendpoint[:ensure]).to eq(:absent)
      end

    end

  end
end
