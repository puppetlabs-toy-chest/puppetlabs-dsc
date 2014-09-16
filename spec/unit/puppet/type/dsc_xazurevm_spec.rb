#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurevm) do

  let :dsc_xazurevm do
    Puppet::Type.type(:dsc_xazurevm).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazurevm.to_s).to eq("Dsc_xazurevm[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xazurevm[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xazurevm[:dsc_name]
    expect { Puppet::Type.type(:dsc_xazurevm).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_imagename => 'foo',
      :dsc_servicename => 'foo',
      :dsc_storageaccountname => 'foo',
      :dsc_instancesize => 'foo',
      :dsc_linux => true,
      :dsc_windows => true,
      :dsc_credential => 'foo',
      :dsc_extensioncontainername => 'foo',
      :dsc_extensionfilelist => 'foo',
      :dsc_extensionscriptname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xazurevm[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xazurevm[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xazurevm[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xazurevm[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xazurevm[:dsc_ensure] = 'Present'
    expect(dsc_xazurevm[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xazurevm[:dsc_ensure] = 'present'
    expect(dsc_xazurevm[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazurevm[:dsc_ensure] = 'present'
    expect(dsc_xazurevm[:ensure]).to eq(dsc_xazurevm[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xazurevm[:dsc_ensure] = 'Absent'
    expect(dsc_xazurevm[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xazurevm[:dsc_ensure] = 'absent'
    expect(dsc_xazurevm[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazurevm[:dsc_ensure] = 'absent'
    expect(dsc_xazurevm[:ensure]).to eq(dsc_xazurevm[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurevm[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xazurevm[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xazurevm[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xazurevm[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xazurevm[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_imagename' do
    expect{dsc_xazurevm[:dsc_imagename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_imagename' do
    expect{dsc_xazurevm[:dsc_imagename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_imagename' do
    expect{dsc_xazurevm[:dsc_imagename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_imagename' do
    expect{dsc_xazurevm[:dsc_imagename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_servicename' do
    expect{dsc_xazurevm[:dsc_servicename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servicename' do
    expect{dsc_xazurevm[:dsc_servicename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servicename' do
    expect{dsc_xazurevm[:dsc_servicename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servicename' do
    expect{dsc_xazurevm[:dsc_servicename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_storageaccountname' do
    expect{dsc_xazurevm[:dsc_storageaccountname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_storageaccountname' do
    expect{dsc_xazurevm[:dsc_storageaccountname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_storageaccountname' do
    expect{dsc_xazurevm[:dsc_storageaccountname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_storageaccountname' do
    expect{dsc_xazurevm[:dsc_storageaccountname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_instancesize' do
    expect{dsc_xazurevm[:dsc_instancesize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_instancesize' do
    expect{dsc_xazurevm[:dsc_instancesize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_instancesize' do
    expect{dsc_xazurevm[:dsc_instancesize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_instancesize' do
    expect{dsc_xazurevm[:dsc_instancesize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_linux' do
    expect{dsc_xazurevm[:dsc_linux] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_linux' do
    dsc_xazurevm[:dsc_linux] = true
    expect(dsc_xazurevm[:dsc_linux]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_linux" do
    dsc_xazurevm[:dsc_linux] = 'true'
    expect(dsc_xazurevm[:dsc_linux]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_linux" do
    dsc_xazurevm[:dsc_linux] = 'false'
    expect(dsc_xazurevm[:dsc_linux]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_linux" do
    dsc_xazurevm[:dsc_linux] = 'True'
    expect(dsc_xazurevm[:dsc_linux]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_linux" do
    dsc_xazurevm[:dsc_linux] = 'False'
    expect(dsc_xazurevm[:dsc_linux]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_linux" do
    dsc_xazurevm[:dsc_linux] = :true
    expect(dsc_xazurevm[:dsc_linux]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_linux" do
    dsc_xazurevm[:dsc_linux] = :false
    expect(dsc_xazurevm[:dsc_linux]).to eq(false)
  end

  it 'should not accept int for dsc_linux' do
    expect{dsc_xazurevm[:dsc_linux] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_linux' do
    expect{dsc_xazurevm[:dsc_linux] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_windows' do
    expect{dsc_xazurevm[:dsc_windows] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_windows' do
    dsc_xazurevm[:dsc_windows] = true
    expect(dsc_xazurevm[:dsc_windows]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_windows" do
    dsc_xazurevm[:dsc_windows] = 'true'
    expect(dsc_xazurevm[:dsc_windows]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_windows" do
    dsc_xazurevm[:dsc_windows] = 'false'
    expect(dsc_xazurevm[:dsc_windows]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_windows" do
    dsc_xazurevm[:dsc_windows] = 'True'
    expect(dsc_xazurevm[:dsc_windows]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_windows" do
    dsc_xazurevm[:dsc_windows] = 'False'
    expect(dsc_xazurevm[:dsc_windows]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_windows" do
    dsc_xazurevm[:dsc_windows] = :true
    expect(dsc_xazurevm[:dsc_windows]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_windows" do
    dsc_xazurevm[:dsc_windows] = :false
    expect(dsc_xazurevm[:dsc_windows]).to eq(false)
  end

  it 'should not accept int for dsc_windows' do
    expect{dsc_xazurevm[:dsc_windows] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_windows' do
    expect{dsc_xazurevm[:dsc_windows] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xazurevm[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xazurevm[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xazurevm[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xazurevm[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_extensioncontainername' do
    expect{dsc_xazurevm[:dsc_extensioncontainername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_extensioncontainername' do
    expect{dsc_xazurevm[:dsc_extensioncontainername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_extensioncontainername' do
    expect{dsc_xazurevm[:dsc_extensioncontainername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_extensioncontainername' do
    expect{dsc_xazurevm[:dsc_extensioncontainername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_extensionfilelist' do
    expect{dsc_xazurevm[:dsc_extensionfilelist] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_extensionfilelist' do
    expect{dsc_xazurevm[:dsc_extensionfilelist] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_extensionfilelist' do
    expect{dsc_xazurevm[:dsc_extensionfilelist] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_extensionfilelist' do
    expect{dsc_xazurevm[:dsc_extensionfilelist] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_extensionscriptname' do
    expect{dsc_xazurevm[:dsc_extensionscriptname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_extensionscriptname' do
    expect{dsc_xazurevm[:dsc_extensionscriptname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_extensionscriptname' do
    expect{dsc_xazurevm[:dsc_extensionscriptname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_extensionscriptname' do
    expect{dsc_xazurevm[:dsc_extensionscriptname] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xazurevm)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xazurevm)
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
        dsc_xazurevm[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xazurevm[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xazurevm.original_parameters[:dsc_ensure] = 'present'
        dsc_xazurevm[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xazurevm)
      end

      it "should update :ensure to :present" do
        expect(dsc_xazurevm[:ensure]).to eq(:present)
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
        dsc_xazurevm.original_parameters[:dsc_ensure] = 'absent'
        dsc_xazurevm[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xazurevm)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xazurevm[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xazurevm)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xazurevm)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xAzureVM as $MSFT_xAzureVM1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xAzureVM/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xazurevm[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xazurevm)
      end

      it "should update :ensure to :present" do
        expect(dsc_xazurevm[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xazurevm[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xazurevm)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xazurevm[:ensure]).to eq(:absent)
      end

    end

  end
end
