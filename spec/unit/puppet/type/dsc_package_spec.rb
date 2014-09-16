#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_package) do

  let :dsc_package do
    Puppet::Type.type(:dsc_package).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_productid => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_package.to_s).to eq("Dsc_package[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_package[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_package[:dsc_ensure] = 'Present'
    expect(dsc_package[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_package[:dsc_ensure] = 'present'
    expect(dsc_package[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_package[:dsc_ensure] = 'present'
    expect(dsc_package[:ensure]).to eq(dsc_package[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_package[:dsc_ensure] = 'Absent'
    expect(dsc_package[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_package[:dsc_ensure] = 'absent'
    expect(dsc_package[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_package[:dsc_ensure] = 'absent'
    expect(dsc_package[:ensure]).to eq(dsc_package[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_package[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_package[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_package[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_package[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_package[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_package[:dsc_name]
    expect { Puppet::Type.type(:dsc_package).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_path => 'foo',
      :dsc_productid => 'foo',
      :dsc_arguments => 'foo',
      :dsc_credential => 'foo',
      :dsc_returncode => [32, 64, 128],
      :dsc_logpath => 'foo',
      :dsc_packagedescription => 'foo',
      :dsc_publisher => 'foo',
      :dsc_installedon => 'foo',
      :dsc_size => 32,
      :dsc_version => 'foo',
      :dsc_installed => true,
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_package[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_package[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_package[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_package[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_package[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_package[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_package[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_package[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_productid is specified' do
    #dsc_package[:dsc_productid]
    expect { Puppet::Type.type(:dsc_package).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_name => 'foo',
      :dsc_path => 'foo',
      :dsc_arguments => 'foo',
      :dsc_credential => 'foo',
      :dsc_returncode => [32, 64, 128],
      :dsc_logpath => 'foo',
      :dsc_packagedescription => 'foo',
      :dsc_publisher => 'foo',
      :dsc_installedon => 'foo',
      :dsc_size => 32,
      :dsc_version => 'foo',
      :dsc_installed => true,
    )}.to raise_error(Puppet::Error, /dsc_productid is a required attribute/)
  end

  it 'should not accept array for dsc_productid' do
    expect{dsc_package[:dsc_productid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_productid' do
    expect{dsc_package[:dsc_productid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_productid' do
    expect{dsc_package[:dsc_productid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_productid' do
    expect{dsc_package[:dsc_productid] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_arguments' do
    expect{dsc_package[:dsc_arguments] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_arguments' do
    expect{dsc_package[:dsc_arguments] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_arguments' do
    expect{dsc_package[:dsc_arguments] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_arguments' do
    expect{dsc_package[:dsc_arguments] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_package[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_package[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_package[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_package[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_returncode' do
    dsc_package[:dsc_returncode] = [32, 64, 128]
    expect(dsc_package[:dsc_returncode]).to eq([32, 64, 128])
  end

  it 'should not accept boolean for dsc_returncode' do
    expect{dsc_package[:dsc_returncode] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_returncode' do
    expect{dsc_package[:dsc_returncode] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_returncode' do
    expect{dsc_package[:dsc_returncode] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logpath' do
    expect{dsc_package[:dsc_logpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logpath' do
    expect{dsc_package[:dsc_logpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logpath' do
    expect{dsc_package[:dsc_logpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logpath' do
    expect{dsc_package[:dsc_logpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_packagedescription' do
    expect{dsc_package[:dsc_packagedescription] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_packagedescription' do
    expect{dsc_package[:dsc_packagedescription] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_packagedescription' do
    expect{dsc_package[:dsc_packagedescription] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_packagedescription' do
    expect{dsc_package[:dsc_packagedescription] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_publisher' do
    expect{dsc_package[:dsc_publisher] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_publisher' do
    expect{dsc_package[:dsc_publisher] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_publisher' do
    expect{dsc_package[:dsc_publisher] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_publisher' do
    expect{dsc_package[:dsc_publisher] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installedon' do
    expect{dsc_package[:dsc_installedon] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installedon' do
    expect{dsc_package[:dsc_installedon] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installedon' do
    expect{dsc_package[:dsc_installedon] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installedon' do
    expect{dsc_package[:dsc_installedon] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_size' do
    expect{dsc_package[:dsc_size] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_size' do
    expect{dsc_package[:dsc_size] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_size' do
    expect{dsc_package[:dsc_size] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_size' do
    dsc_package[:dsc_size] = 32
    expect(dsc_package[:dsc_size]).to eq(32)
  end


  it 'should accept string-like int for dsc_size' do
    dsc_package[:dsc_size] = '16'
    expect(dsc_package[:dsc_size]).to eq(16)
  end


  it 'should accept string-like int for dsc_size' do
    dsc_package[:dsc_size] = '32'
    expect(dsc_package[:dsc_size]).to eq(32)
  end


  it 'should accept string-like int for dsc_size' do
    dsc_package[:dsc_size] = '64'
    expect(dsc_package[:dsc_size]).to eq(64)
  end

  it 'should not accept array for dsc_version' do
    expect{dsc_package[:dsc_version] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_version' do
    expect{dsc_package[:dsc_version] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_version' do
    expect{dsc_package[:dsc_version] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_version' do
    expect{dsc_package[:dsc_version] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installed' do
    expect{dsc_package[:dsc_installed] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_installed' do
    dsc_package[:dsc_installed] = true
    expect(dsc_package[:dsc_installed]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_installed" do
    dsc_package[:dsc_installed] = 'true'
    expect(dsc_package[:dsc_installed]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_installed" do
    dsc_package[:dsc_installed] = 'false'
    expect(dsc_package[:dsc_installed]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_installed" do
    dsc_package[:dsc_installed] = 'True'
    expect(dsc_package[:dsc_installed]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_installed" do
    dsc_package[:dsc_installed] = 'False'
    expect(dsc_package[:dsc_installed]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_installed" do
    dsc_package[:dsc_installed] = :true
    expect(dsc_package[:dsc_installed]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_installed" do
    dsc_package[:dsc_installed] = :false
    expect(dsc_package[:dsc_installed]).to eq(false)
  end

  it 'should not accept int for dsc_installed' do
    expect{dsc_package[:dsc_installed] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installed' do
    expect{dsc_package[:dsc_installed] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_package)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_package)
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
        dsc_package[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_package[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_package.original_parameters[:dsc_ensure] = 'present'
        dsc_package[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_package)
      end

      it "should update :ensure to :present" do
        expect(dsc_package[:ensure]).to eq(:present)
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
        dsc_package.original_parameters[:dsc_ensure] = 'absent'
        dsc_package[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_package)
      end

      it "should update :ensure to :absent" do
        expect(dsc_package[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_package)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_package)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_PackageResource as $MSFT_PackageResource1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_PackageResource/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_package[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_package)
      end

      it "should update :ensure to :present" do
        expect(dsc_package[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_package[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_package)
      end

      it "should update :ensure to :absent" do
        expect(dsc_package[:ensure]).to eq(:absent)
      end

    end

  end
end
