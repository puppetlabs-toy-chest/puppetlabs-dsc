#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xjeaendpoint) do

  let :dsc_xjeaendpoint do
    Puppet::Type.type(:dsc_xjeaendpoint).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xjeaendpoint.to_s).to eq("Dsc_xjeaendpoint[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xjeaendpoint[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xjeaendpoint[:dsc_name]
    expect { Puppet::Type.type(:dsc_xjeaendpoint).new(
      :name     => 'foo',
      :dsc_toolkit => ["foo", "bar", "spec"],
      :dsc_securitydescriptorsddl => 'foo',
      :dsc_group => ["foo", "bar", "spec"],
      :dsc_ensure => 'Present',
      :dsc_cleanall => true,
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xjeaendpoint[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xjeaendpoint[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xjeaendpoint[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xjeaendpoint[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_toolkit' do
    dsc_xjeaendpoint[:dsc_toolkit] = ["foo", "bar", "spec"]
    expect(dsc_xjeaendpoint[:dsc_toolkit]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_toolkit' do
    expect{dsc_xjeaendpoint[:dsc_toolkit] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_toolkit' do
    expect{dsc_xjeaendpoint[:dsc_toolkit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_toolkit' do
    expect{dsc_xjeaendpoint[:dsc_toolkit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_securitydescriptorsddl' do
    expect{dsc_xjeaendpoint[:dsc_securitydescriptorsddl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_securitydescriptorsddl' do
    expect{dsc_xjeaendpoint[:dsc_securitydescriptorsddl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_securitydescriptorsddl' do
    expect{dsc_xjeaendpoint[:dsc_securitydescriptorsddl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_securitydescriptorsddl' do
    expect{dsc_xjeaendpoint[:dsc_securitydescriptorsddl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_group' do
    dsc_xjeaendpoint[:dsc_group] = ["foo", "bar", "spec"]
    expect(dsc_xjeaendpoint[:dsc_group]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_group' do
    expect{dsc_xjeaendpoint[:dsc_group] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_group' do
    expect{dsc_xjeaendpoint[:dsc_group] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_group' do
    expect{dsc_xjeaendpoint[:dsc_group] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xjeaendpoint[:dsc_ensure] = 'Present'
    expect(dsc_xjeaendpoint[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xjeaendpoint[:dsc_ensure] = 'present'
    expect(dsc_xjeaendpoint[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xjeaendpoint[:dsc_ensure] = 'present'
    expect(dsc_xjeaendpoint[:ensure]).to eq(dsc_xjeaendpoint[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xjeaendpoint[:dsc_ensure] = 'Absent'
    expect(dsc_xjeaendpoint[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xjeaendpoint[:dsc_ensure] = 'absent'
    expect(dsc_xjeaendpoint[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xjeaendpoint[:dsc_ensure] = 'absent'
    expect(dsc_xjeaendpoint[:ensure]).to eq(dsc_xjeaendpoint[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xjeaendpoint[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xjeaendpoint[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xjeaendpoint[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xjeaendpoint[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xjeaendpoint[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_cleanall' do
    expect{dsc_xjeaendpoint[:dsc_cleanall] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_cleanall' do
    dsc_xjeaendpoint[:dsc_cleanall] = true
    expect(dsc_xjeaendpoint[:dsc_cleanall]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_cleanall" do
    dsc_xjeaendpoint[:dsc_cleanall] = 'true'
    expect(dsc_xjeaendpoint[:dsc_cleanall]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_cleanall" do
    dsc_xjeaendpoint[:dsc_cleanall] = 'false'
    expect(dsc_xjeaendpoint[:dsc_cleanall]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_cleanall" do
    dsc_xjeaendpoint[:dsc_cleanall] = 'True'
    expect(dsc_xjeaendpoint[:dsc_cleanall]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_cleanall" do
    dsc_xjeaendpoint[:dsc_cleanall] = 'False'
    expect(dsc_xjeaendpoint[:dsc_cleanall]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_cleanall" do
    dsc_xjeaendpoint[:dsc_cleanall] = :true
    expect(dsc_xjeaendpoint[:dsc_cleanall]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_cleanall" do
    dsc_xjeaendpoint[:dsc_cleanall] = :false
    expect(dsc_xjeaendpoint[:dsc_cleanall]).to eq(false)
  end

  it 'should not accept int for dsc_cleanall' do
    expect{dsc_xjeaendpoint[:dsc_cleanall] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_cleanall' do
    expect{dsc_xjeaendpoint[:dsc_cleanall] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xjeaendpoint)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xjeaendpoint)
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
        dsc_xjeaendpoint[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xjeaendpoint[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xjeaendpoint.original_parameters[:dsc_ensure] = 'present'
        dsc_xjeaendpoint[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xjeaendpoint)
      end

      it "should update :ensure to :present" do
        expect(dsc_xjeaendpoint[:ensure]).to eq(:present)
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
        dsc_xjeaendpoint.original_parameters[:dsc_ensure] = 'absent'
        dsc_xjeaendpoint[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xjeaendpoint)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xjeaendpoint[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xjeaendpoint)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xjeaendpoint)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xJeaEndpoint as $MSFT_xJeaEndpoint1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xJeaEndpoint/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xjeaendpoint[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xjeaendpoint)
      end

      it "should update :ensure to :present" do
        expect(dsc_xjeaendpoint[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xjeaendpoint[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xjeaendpoint)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xjeaendpoint[:ensure]).to eq(:absent)
      end

    end

  end
end
