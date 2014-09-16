#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurequickvm) do

  let :dsc_xazurequickvm do
    Puppet::Type.type(:dsc_xazurequickvm).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazurequickvm.to_s).to eq("Dsc_xazurequickvm[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xazurequickvm[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xazurequickvm[:dsc_name]
    expect { Puppet::Type.type(:dsc_xazurequickvm).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_imagename => 'foo',
      :dsc_servicename => 'foo',
      :dsc_linux => true,
      :dsc_linuxuser => 'foo',
      :dsc_windows => true,
      :dsc_adminusername => 'foo',
      :dsc_password => 'foo',
      :dsc_instancesize => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xazurequickvm[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xazurequickvm[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xazurequickvm[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xazurequickvm[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xazurequickvm[:dsc_ensure] = 'Present'
    expect(dsc_xazurequickvm[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xazurequickvm[:dsc_ensure] = 'present'
    expect(dsc_xazurequickvm[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazurequickvm[:dsc_ensure] = 'present'
    expect(dsc_xazurequickvm[:ensure]).to eq(dsc_xazurequickvm[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xazurequickvm[:dsc_ensure] = 'Absent'
    expect(dsc_xazurequickvm[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xazurequickvm[:dsc_ensure] = 'absent'
    expect(dsc_xazurequickvm[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazurequickvm[:dsc_ensure] = 'absent'
    expect(dsc_xazurequickvm[:ensure]).to eq(dsc_xazurequickvm[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurequickvm[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xazurequickvm[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xazurequickvm[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xazurequickvm[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xazurequickvm[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_imagename' do
    expect{dsc_xazurequickvm[:dsc_imagename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_imagename' do
    expect{dsc_xazurequickvm[:dsc_imagename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_imagename' do
    expect{dsc_xazurequickvm[:dsc_imagename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_imagename' do
    expect{dsc_xazurequickvm[:dsc_imagename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_servicename' do
    expect{dsc_xazurequickvm[:dsc_servicename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servicename' do
    expect{dsc_xazurequickvm[:dsc_servicename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servicename' do
    expect{dsc_xazurequickvm[:dsc_servicename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servicename' do
    expect{dsc_xazurequickvm[:dsc_servicename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_linux' do
    expect{dsc_xazurequickvm[:dsc_linux] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_linux' do
    dsc_xazurequickvm[:dsc_linux] = true
    expect(dsc_xazurequickvm[:dsc_linux]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_linux" do
    dsc_xazurequickvm[:dsc_linux] = 'true'
    expect(dsc_xazurequickvm[:dsc_linux]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_linux" do
    dsc_xazurequickvm[:dsc_linux] = 'false'
    expect(dsc_xazurequickvm[:dsc_linux]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_linux" do
    dsc_xazurequickvm[:dsc_linux] = 'True'
    expect(dsc_xazurequickvm[:dsc_linux]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_linux" do
    dsc_xazurequickvm[:dsc_linux] = 'False'
    expect(dsc_xazurequickvm[:dsc_linux]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_linux" do
    dsc_xazurequickvm[:dsc_linux] = :true
    expect(dsc_xazurequickvm[:dsc_linux]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_linux" do
    dsc_xazurequickvm[:dsc_linux] = :false
    expect(dsc_xazurequickvm[:dsc_linux]).to eq(false)
  end

  it 'should not accept int for dsc_linux' do
    expect{dsc_xazurequickvm[:dsc_linux] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_linux' do
    expect{dsc_xazurequickvm[:dsc_linux] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_linuxuser' do
    expect{dsc_xazurequickvm[:dsc_linuxuser] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_linuxuser' do
    expect{dsc_xazurequickvm[:dsc_linuxuser] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_linuxuser' do
    expect{dsc_xazurequickvm[:dsc_linuxuser] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_linuxuser' do
    expect{dsc_xazurequickvm[:dsc_linuxuser] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_windows' do
    expect{dsc_xazurequickvm[:dsc_windows] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_windows' do
    dsc_xazurequickvm[:dsc_windows] = true
    expect(dsc_xazurequickvm[:dsc_windows]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_windows" do
    dsc_xazurequickvm[:dsc_windows] = 'true'
    expect(dsc_xazurequickvm[:dsc_windows]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_windows" do
    dsc_xazurequickvm[:dsc_windows] = 'false'
    expect(dsc_xazurequickvm[:dsc_windows]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_windows" do
    dsc_xazurequickvm[:dsc_windows] = 'True'
    expect(dsc_xazurequickvm[:dsc_windows]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_windows" do
    dsc_xazurequickvm[:dsc_windows] = 'False'
    expect(dsc_xazurequickvm[:dsc_windows]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_windows" do
    dsc_xazurequickvm[:dsc_windows] = :true
    expect(dsc_xazurequickvm[:dsc_windows]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_windows" do
    dsc_xazurequickvm[:dsc_windows] = :false
    expect(dsc_xazurequickvm[:dsc_windows]).to eq(false)
  end

  it 'should not accept int for dsc_windows' do
    expect{dsc_xazurequickvm[:dsc_windows] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_windows' do
    expect{dsc_xazurequickvm[:dsc_windows] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adminusername' do
    expect{dsc_xazurequickvm[:dsc_adminusername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_adminusername' do
    expect{dsc_xazurequickvm[:dsc_adminusername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_adminusername' do
    expect{dsc_xazurequickvm[:dsc_adminusername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adminusername' do
    expect{dsc_xazurequickvm[:dsc_adminusername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_password' do
    expect{dsc_xazurequickvm[:dsc_password] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_password' do
    expect{dsc_xazurequickvm[:dsc_password] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_password' do
    expect{dsc_xazurequickvm[:dsc_password] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_password' do
    expect{dsc_xazurequickvm[:dsc_password] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_instancesize' do
    expect{dsc_xazurequickvm[:dsc_instancesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancesize' do
    expect{dsc_xazurequickvm[:dsc_instancesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancesize' do
    expect{dsc_xazurequickvm[:dsc_instancesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancesize' do
    expect{dsc_xazurequickvm[:dsc_instancesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xazurequickvm)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xazurequickvm)
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
        dsc_xazurequickvm[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xazurequickvm[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xazurequickvm.original_parameters[:dsc_ensure] = 'present'
        dsc_xazurequickvm[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xazurequickvm)
      end

      it "should update :ensure to :present" do
        expect(dsc_xazurequickvm[:ensure]).to eq(:present)
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
        dsc_xazurequickvm.original_parameters[:dsc_ensure] = 'absent'
        dsc_xazurequickvm[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xazurequickvm)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xazurequickvm[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xazurequickvm)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xazurequickvm)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xAzureQuickVM as $MSFT_xAzureQuickVM1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xAzureQuickVM/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xazurequickvm[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xazurequickvm)
      end

      it "should update :ensure to :present" do
        expect(dsc_xazurequickvm[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xazurequickvm[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xazurequickvm)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xazurequickvm[:ensure]).to eq(:absent)
      end

    end

  end
end
