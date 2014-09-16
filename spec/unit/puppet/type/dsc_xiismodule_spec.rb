#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xiismodule) do

  let :dsc_xiismodule do
    Puppet::Type.type(:dsc_xiismodule).new(
      :name     => 'foo',
      :dsc_path => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xiismodule.to_s).to eq("Dsc_xiismodule[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xiismodule[:ensure]).to eq :present
  end

  it 'should require that dsc_path is specified' do
    #dsc_xiismodule[:dsc_path]
    expect { Puppet::Type.type(:dsc_xiismodule).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_requestpath => 'foo',
      :dsc_verb => ["foo", "bar", "spec"],
      :dsc_sitename => 'foo',
      :dsc_ensure => 'Present',
      :dsc_moduletype => 'FastCgiModule',
      :dsc_endpointsetup => true,
    )}.to raise_error(Puppet::Error, /dsc_path is a required attribute/)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xiismodule[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xiismodule[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xiismodule[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xiismodule[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xiismodule[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xiismodule[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xiismodule[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xiismodule[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_requestpath' do
    expect{dsc_xiismodule[:dsc_requestpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_requestpath' do
    expect{dsc_xiismodule[:dsc_requestpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_requestpath' do
    expect{dsc_xiismodule[:dsc_requestpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_requestpath' do
    expect{dsc_xiismodule[:dsc_requestpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_verb' do
    dsc_xiismodule[:dsc_verb] = ["foo", "bar", "spec"]
    expect(dsc_xiismodule[:dsc_verb]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_verb' do
    expect{dsc_xiismodule[:dsc_verb] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_verb' do
    expect{dsc_xiismodule[:dsc_verb] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_verb' do
    expect{dsc_xiismodule[:dsc_verb] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sitename' do
    expect{dsc_xiismodule[:dsc_sitename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sitename' do
    expect{dsc_xiismodule[:dsc_sitename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sitename' do
    expect{dsc_xiismodule[:dsc_sitename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sitename' do
    expect{dsc_xiismodule[:dsc_sitename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xiismodule[:dsc_ensure] = 'Present'
    expect(dsc_xiismodule[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xiismodule[:dsc_ensure] = 'present'
    expect(dsc_xiismodule[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xiismodule[:dsc_ensure] = 'present'
    expect(dsc_xiismodule[:ensure]).to eq(dsc_xiismodule[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xiismodule[:dsc_ensure] = 'Absent'
    expect(dsc_xiismodule[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xiismodule[:dsc_ensure] = 'absent'
    expect(dsc_xiismodule[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xiismodule[:dsc_ensure] = 'absent'
    expect(dsc_xiismodule[:ensure]).to eq(dsc_xiismodule[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xiismodule[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xiismodule[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xiismodule[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xiismodule[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xiismodule[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_moduletype predefined value FastCgiModule' do
    dsc_xiismodule[:dsc_moduletype] = 'FastCgiModule'
    expect(dsc_xiismodule[:dsc_moduletype]).to eq('FastCgiModule')
  end

  it 'should accept dsc_moduletype predefined value fastcgimodule' do
    dsc_xiismodule[:dsc_moduletype] = 'fastcgimodule'
    expect(dsc_xiismodule[:dsc_moduletype]).to eq('fastcgimodule')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xiismodule[:dsc_moduletype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_moduletype' do
    expect{dsc_xiismodule[:dsc_moduletype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_moduletype' do
    expect{dsc_xiismodule[:dsc_moduletype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_moduletype' do
    expect{dsc_xiismodule[:dsc_moduletype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_moduletype' do
    expect{dsc_xiismodule[:dsc_moduletype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_endpointsetup' do
    expect{dsc_xiismodule[:dsc_endpointsetup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_endpointsetup' do
    dsc_xiismodule[:dsc_endpointsetup] = true
    expect(dsc_xiismodule[:dsc_endpointsetup]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_endpointsetup" do
    dsc_xiismodule[:dsc_endpointsetup] = 'true'
    expect(dsc_xiismodule[:dsc_endpointsetup]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_endpointsetup" do
    dsc_xiismodule[:dsc_endpointsetup] = 'false'
    expect(dsc_xiismodule[:dsc_endpointsetup]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_endpointsetup" do
    dsc_xiismodule[:dsc_endpointsetup] = 'True'
    expect(dsc_xiismodule[:dsc_endpointsetup]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_endpointsetup" do
    dsc_xiismodule[:dsc_endpointsetup] = 'False'
    expect(dsc_xiismodule[:dsc_endpointsetup]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_endpointsetup" do
    dsc_xiismodule[:dsc_endpointsetup] = :true
    expect(dsc_xiismodule[:dsc_endpointsetup]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_endpointsetup" do
    dsc_xiismodule[:dsc_endpointsetup] = :false
    expect(dsc_xiismodule[:dsc_endpointsetup]).to eq(false)
  end

  it 'should not accept int for dsc_endpointsetup' do
    expect{dsc_xiismodule[:dsc_endpointsetup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_endpointsetup' do
    expect{dsc_xiismodule[:dsc_endpointsetup] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xiismodule)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xiismodule)
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
        dsc_xiismodule[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xiismodule[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xiismodule.original_parameters[:dsc_ensure] = 'present'
        dsc_xiismodule[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xiismodule)
      end

      it "should update :ensure to :present" do
        expect(dsc_xiismodule[:ensure]).to eq(:present)
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
        dsc_xiismodule.original_parameters[:dsc_ensure] = 'absent'
        dsc_xiismodule[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xiismodule)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xiismodule[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xiismodule)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xiismodule)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xIisModule as $MSFT_xIisModule1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xIisModule/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xiismodule[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xiismodule)
      end

      it "should update :ensure to :present" do
        expect(dsc_xiismodule[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xiismodule[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xiismodule)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xiismodule[:ensure]).to eq(:absent)
      end

    end

  end
end
