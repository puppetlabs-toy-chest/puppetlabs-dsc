#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xaddomaintrust) do

  let :dsc_xaddomaintrust do
    Puppet::Type.type(:dsc_xaddomaintrust).new(
      :name     => 'foo',
      :dsc_targetdomainname => 'foo',
      :dsc_sourcedomainname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xaddomaintrust.to_s).to eq("Dsc_xaddomaintrust[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xaddomaintrust[:ensure]).to eq :present
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xaddomaintrust[:dsc_ensure] = 'Present'
    expect(dsc_xaddomaintrust[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xaddomaintrust[:dsc_ensure] = 'present'
    expect(dsc_xaddomaintrust[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xaddomaintrust[:dsc_ensure] = 'present'
    expect(dsc_xaddomaintrust[:ensure]).to eq(dsc_xaddomaintrust[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xaddomaintrust[:dsc_ensure] = 'Absent'
    expect(dsc_xaddomaintrust[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xaddomaintrust[:dsc_ensure] = 'absent'
    expect(dsc_xaddomaintrust[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xaddomaintrust[:dsc_ensure] = 'absent'
    expect(dsc_xaddomaintrust[:ensure]).to eq(dsc_xaddomaintrust[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xaddomaintrust[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xaddomaintrust[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xaddomaintrust[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xaddomaintrust[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xaddomaintrust[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_targetdomainadministratorcredential' do
    expect{dsc_xaddomaintrust[:dsc_targetdomainadministratorcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_targetdomainadministratorcredential' do
    expect{dsc_xaddomaintrust[:dsc_targetdomainadministratorcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_targetdomainadministratorcredential' do
    expect{dsc_xaddomaintrust[:dsc_targetdomainadministratorcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_targetdomainadministratorcredential' do
    expect{dsc_xaddomaintrust[:dsc_targetdomainadministratorcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_targetdomainname is specified' do
    #dsc_xaddomaintrust[:dsc_targetdomainname]
    expect { Puppet::Type.type(:dsc_xaddomaintrust).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_targetdomainadministratorcredential => 'foo',
      :dsc_trusttype => 'External',
      :dsc_trustdirection => 'Bidirectional',
      :dsc_sourcedomainname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_targetdomainname is a required attribute/)
  end

  it 'should not accept array for dsc_targetdomainname' do
    expect{dsc_xaddomaintrust[:dsc_targetdomainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_targetdomainname' do
    expect{dsc_xaddomaintrust[:dsc_targetdomainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_targetdomainname' do
    expect{dsc_xaddomaintrust[:dsc_targetdomainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_targetdomainname' do
    expect{dsc_xaddomaintrust[:dsc_targetdomainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_trusttype predefined value External' do
    dsc_xaddomaintrust[:dsc_trusttype] = 'External'
    expect(dsc_xaddomaintrust[:dsc_trusttype]).to eq('External')
  end

  it 'should accept dsc_trusttype predefined value external' do
    dsc_xaddomaintrust[:dsc_trusttype] = 'external'
    expect(dsc_xaddomaintrust[:dsc_trusttype]).to eq('external')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xaddomaintrust[:dsc_trusttype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_trusttype' do
    expect{dsc_xaddomaintrust[:dsc_trusttype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_trusttype' do
    expect{dsc_xaddomaintrust[:dsc_trusttype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_trusttype' do
    expect{dsc_xaddomaintrust[:dsc_trusttype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_trusttype' do
    expect{dsc_xaddomaintrust[:dsc_trusttype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_trustdirection predefined value Bidirectional' do
    dsc_xaddomaintrust[:dsc_trustdirection] = 'Bidirectional'
    expect(dsc_xaddomaintrust[:dsc_trustdirection]).to eq('Bidirectional')
  end

  it 'should accept dsc_trustdirection predefined value bidirectional' do
    dsc_xaddomaintrust[:dsc_trustdirection] = 'bidirectional'
    expect(dsc_xaddomaintrust[:dsc_trustdirection]).to eq('bidirectional')
  end

  it 'should accept dsc_trustdirection predefined value Inbound' do
    dsc_xaddomaintrust[:dsc_trustdirection] = 'Inbound'
    expect(dsc_xaddomaintrust[:dsc_trustdirection]).to eq('Inbound')
  end

  it 'should accept dsc_trustdirection predefined value inbound' do
    dsc_xaddomaintrust[:dsc_trustdirection] = 'inbound'
    expect(dsc_xaddomaintrust[:dsc_trustdirection]).to eq('inbound')
  end

  it 'should accept dsc_trustdirection predefined value Outbound' do
    dsc_xaddomaintrust[:dsc_trustdirection] = 'Outbound'
    expect(dsc_xaddomaintrust[:dsc_trustdirection]).to eq('Outbound')
  end

  it 'should accept dsc_trustdirection predefined value outbound' do
    dsc_xaddomaintrust[:dsc_trustdirection] = 'outbound'
    expect(dsc_xaddomaintrust[:dsc_trustdirection]).to eq('outbound')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xaddomaintrust[:dsc_trustdirection] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_trustdirection' do
    expect{dsc_xaddomaintrust[:dsc_trustdirection] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_trustdirection' do
    expect{dsc_xaddomaintrust[:dsc_trustdirection] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_trustdirection' do
    expect{dsc_xaddomaintrust[:dsc_trustdirection] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_trustdirection' do
    expect{dsc_xaddomaintrust[:dsc_trustdirection] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_sourcedomainname is specified' do
    #dsc_xaddomaintrust[:dsc_sourcedomainname]
    expect { Puppet::Type.type(:dsc_xaddomaintrust).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_targetdomainadministratorcredential => 'foo',
      :dsc_targetdomainname => 'foo',
      :dsc_trusttype => 'External',
      :dsc_trustdirection => 'Bidirectional',
    )}.to raise_error(Puppet::Error, /dsc_sourcedomainname is a required attribute/)
  end

  it 'should not accept array for dsc_sourcedomainname' do
    expect{dsc_xaddomaintrust[:dsc_sourcedomainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcedomainname' do
    expect{dsc_xaddomaintrust[:dsc_sourcedomainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcedomainname' do
    expect{dsc_xaddomaintrust[:dsc_sourcedomainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcedomainname' do
    expect{dsc_xaddomaintrust[:dsc_sourcedomainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xaddomaintrust)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xaddomaintrust)
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
        dsc_xaddomaintrust[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xaddomaintrust[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xaddomaintrust.original_parameters[:dsc_ensure] = 'present'
        dsc_xaddomaintrust[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xaddomaintrust)
      end

      it "should update :ensure to :present" do
        expect(dsc_xaddomaintrust[:ensure]).to eq(:present)
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
        dsc_xaddomaintrust.original_parameters[:dsc_ensure] = 'absent'
        dsc_xaddomaintrust[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xaddomaintrust)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xaddomaintrust[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xaddomaintrust)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xaddomaintrust)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xADDomainTrust as $MSFT_xADDomainTrust1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xADDomainTrust/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xaddomaintrust[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xaddomaintrust)
      end

      it "should update :ensure to :present" do
        expect(dsc_xaddomaintrust[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xaddomaintrust[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xaddomaintrust)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xaddomaintrust[:ensure]).to eq(:absent)
      end

    end

  end
end
