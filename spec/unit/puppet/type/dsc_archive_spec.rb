#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_archive) do

  let :dsc_archive do
    Puppet::Type.type(:dsc_archive).new(
      :name     => 'foo',
      :dsc_path => 'foo',
      :dsc_destination => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_archive.to_s).to eq("Dsc_archive[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_archive[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_archive[:dsc_ensure] = 'Present'
    expect(dsc_archive[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_archive[:dsc_ensure] = 'present'
    expect(dsc_archive[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_archive[:dsc_ensure] = 'present'
    expect(dsc_archive[:ensure]).to eq(dsc_archive[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_archive[:dsc_ensure] = 'Absent'
    expect(dsc_archive[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_archive[:dsc_ensure] = 'absent'
    expect(dsc_archive[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_archive[:dsc_ensure] = 'absent'
    expect(dsc_archive[:ensure]).to eq(dsc_archive[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_archive[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_archive[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_archive[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_archive[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_archive[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_path is specified' do
    #dsc_archive[:dsc_path]
    expect { Puppet::Type.type(:dsc_archive).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_destination => 'foo',
      :dsc_validate => true,
      :dsc_checksum => 'SHA-1',
      :dsc_force => true,
    )}.to raise_error(Puppet::Error, /dsc_path is a required attribute/)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_archive[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_archive[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_archive[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_archive[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_destination is specified' do
    #dsc_archive[:dsc_destination]
    expect { Puppet::Type.type(:dsc_archive).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_path => 'foo',
      :dsc_validate => true,
      :dsc_checksum => 'SHA-1',
      :dsc_force => true,
    )}.to raise_error(Puppet::Error, /dsc_destination is a required attribute/)
  end

  it 'should not accept array for dsc_destination' do
    expect{dsc_archive[:dsc_destination] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_destination' do
    expect{dsc_archive[:dsc_destination] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_destination' do
    expect{dsc_archive[:dsc_destination] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_destination' do
    expect{dsc_archive[:dsc_destination] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_validate' do
    expect{dsc_archive[:dsc_validate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_validate' do
    dsc_archive[:dsc_validate] = true
    expect(dsc_archive[:dsc_validate]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_validate" do
    dsc_archive[:dsc_validate] = 'true'
    expect(dsc_archive[:dsc_validate]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_validate" do
    dsc_archive[:dsc_validate] = 'false'
    expect(dsc_archive[:dsc_validate]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_validate" do
    dsc_archive[:dsc_validate] = 'True'
    expect(dsc_archive[:dsc_validate]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_validate" do
    dsc_archive[:dsc_validate] = 'False'
    expect(dsc_archive[:dsc_validate]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_validate" do
    dsc_archive[:dsc_validate] = :true
    expect(dsc_archive[:dsc_validate]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_validate" do
    dsc_archive[:dsc_validate] = :false
    expect(dsc_archive[:dsc_validate]).to eq(false)
  end

  it 'should not accept int for dsc_validate' do
    expect{dsc_archive[:dsc_validate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_validate' do
    expect{dsc_archive[:dsc_validate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_checksum predefined value SHA-1' do
    dsc_archive[:dsc_checksum] = 'SHA-1'
    expect(dsc_archive[:dsc_checksum]).to eq('SHA-1')
  end

  it 'should accept dsc_checksum predefined value sha-1' do
    dsc_archive[:dsc_checksum] = 'sha-1'
    expect(dsc_archive[:dsc_checksum]).to eq('sha-1')
  end

  it 'should accept dsc_checksum predefined value SHA-256' do
    dsc_archive[:dsc_checksum] = 'SHA-256'
    expect(dsc_archive[:dsc_checksum]).to eq('SHA-256')
  end

  it 'should accept dsc_checksum predefined value sha-256' do
    dsc_archive[:dsc_checksum] = 'sha-256'
    expect(dsc_archive[:dsc_checksum]).to eq('sha-256')
  end

  it 'should accept dsc_checksum predefined value SHA-512' do
    dsc_archive[:dsc_checksum] = 'SHA-512'
    expect(dsc_archive[:dsc_checksum]).to eq('SHA-512')
  end

  it 'should accept dsc_checksum predefined value sha-512' do
    dsc_archive[:dsc_checksum] = 'sha-512'
    expect(dsc_archive[:dsc_checksum]).to eq('sha-512')
  end

  it 'should accept dsc_checksum predefined value CreatedDate' do
    dsc_archive[:dsc_checksum] = 'CreatedDate'
    expect(dsc_archive[:dsc_checksum]).to eq('CreatedDate')
  end

  it 'should accept dsc_checksum predefined value createddate' do
    dsc_archive[:dsc_checksum] = 'createddate'
    expect(dsc_archive[:dsc_checksum]).to eq('createddate')
  end

  it 'should accept dsc_checksum predefined value ModifiedDate' do
    dsc_archive[:dsc_checksum] = 'ModifiedDate'
    expect(dsc_archive[:dsc_checksum]).to eq('ModifiedDate')
  end

  it 'should accept dsc_checksum predefined value modifieddate' do
    dsc_archive[:dsc_checksum] = 'modifieddate'
    expect(dsc_archive[:dsc_checksum]).to eq('modifieddate')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_archive[:dsc_checksum] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_checksum' do
    expect{dsc_archive[:dsc_checksum] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_checksum' do
    expect{dsc_archive[:dsc_checksum] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_checksum' do
    expect{dsc_archive[:dsc_checksum] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_checksum' do
    expect{dsc_archive[:dsc_checksum] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_force' do
    expect{dsc_archive[:dsc_force] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_force' do
    dsc_archive[:dsc_force] = true
    expect(dsc_archive[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_force" do
    dsc_archive[:dsc_force] = 'true'
    expect(dsc_archive[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_force" do
    dsc_archive[:dsc_force] = 'false'
    expect(dsc_archive[:dsc_force]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_force" do
    dsc_archive[:dsc_force] = 'True'
    expect(dsc_archive[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_force" do
    dsc_archive[:dsc_force] = 'False'
    expect(dsc_archive[:dsc_force]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_force" do
    dsc_archive[:dsc_force] = :true
    expect(dsc_archive[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_force" do
    dsc_archive[:dsc_force] = :false
    expect(dsc_archive[:dsc_force]).to eq(false)
  end

  it 'should not accept int for dsc_force' do
    expect{dsc_archive[:dsc_force] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_force' do
    expect{dsc_archive[:dsc_force] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_archive)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_archive)
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
        dsc_archive[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_archive[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_archive.original_parameters[:dsc_ensure] = 'present'
        dsc_archive[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_archive)
      end

      it "should update :ensure to :present" do
        expect(dsc_archive[:ensure]).to eq(:present)
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
        dsc_archive.original_parameters[:dsc_ensure] = 'absent'
        dsc_archive[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_archive)
      end

      it "should update :ensure to :absent" do
        expect(dsc_archive[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_archive)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_archive)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_ArchiveResource as $MSFT_ArchiveResource1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_ArchiveResource/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_archive[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_archive)
      end

      it "should update :ensure to :present" do
        expect(dsc_archive[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_archive[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_archive)
      end

      it "should update :ensure to :absent" do
        expect(dsc_archive[:ensure]).to eq(:absent)
      end

    end

  end
end
