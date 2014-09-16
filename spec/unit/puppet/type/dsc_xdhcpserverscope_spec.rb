#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdhcpserverscope) do

  let :dsc_xdhcpserverscope do
    Puppet::Type.type(:dsc_xdhcpserverscope).new(
      :name     => 'foo',
      :dsc_ipstartrange => 'foo',
      :dsc_ipendrange => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdhcpserverscope.to_s).to eq("Dsc_xdhcpserverscope[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdhcpserverscope[:ensure]).to eq :present
  end

  it 'should require that dsc_ipstartrange is specified' do
    #dsc_xdhcpserverscope[:dsc_ipstartrange]
    expect { Puppet::Type.type(:dsc_xdhcpserverscope).new(
      :name     => 'foo',
      :dsc_ipendrange => 'foo',
      :dsc_name => 'foo',
      :dsc_subnetmask => 'foo',
      :dsc_leaseduration => 'foo',
      :dsc_state => 'Active',
      :dsc_addressfamily => 'IPv4',
      :dsc_ensure => 'Present',
      :dsc_scopeid => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_ipstartrange is a required attribute/)
  end

  it 'should not accept array for dsc_ipstartrange' do
    expect{dsc_xdhcpserverscope[:dsc_ipstartrange] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ipstartrange' do
    expect{dsc_xdhcpserverscope[:dsc_ipstartrange] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ipstartrange' do
    expect{dsc_xdhcpserverscope[:dsc_ipstartrange] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ipstartrange' do
    expect{dsc_xdhcpserverscope[:dsc_ipstartrange] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_ipendrange is specified' do
    #dsc_xdhcpserverscope[:dsc_ipendrange]
    expect { Puppet::Type.type(:dsc_xdhcpserverscope).new(
      :name     => 'foo',
      :dsc_ipstartrange => 'foo',
      :dsc_name => 'foo',
      :dsc_subnetmask => 'foo',
      :dsc_leaseduration => 'foo',
      :dsc_state => 'Active',
      :dsc_addressfamily => 'IPv4',
      :dsc_ensure => 'Present',
      :dsc_scopeid => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_ipendrange is a required attribute/)
  end

  it 'should not accept array for dsc_ipendrange' do
    expect{dsc_xdhcpserverscope[:dsc_ipendrange] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ipendrange' do
    expect{dsc_xdhcpserverscope[:dsc_ipendrange] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ipendrange' do
    expect{dsc_xdhcpserverscope[:dsc_ipendrange] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ipendrange' do
    expect{dsc_xdhcpserverscope[:dsc_ipendrange] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xdhcpserverscope[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xdhcpserverscope[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xdhcpserverscope[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xdhcpserverscope[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_subnetmask' do
    expect{dsc_xdhcpserverscope[:dsc_subnetmask] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_subnetmask' do
    expect{dsc_xdhcpserverscope[:dsc_subnetmask] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_subnetmask' do
    expect{dsc_xdhcpserverscope[:dsc_subnetmask] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_subnetmask' do
    expect{dsc_xdhcpserverscope[:dsc_subnetmask] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_leaseduration' do
    expect{dsc_xdhcpserverscope[:dsc_leaseduration] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_leaseduration' do
    expect{dsc_xdhcpserverscope[:dsc_leaseduration] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_leaseduration' do
    expect{dsc_xdhcpserverscope[:dsc_leaseduration] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_leaseduration' do
    expect{dsc_xdhcpserverscope[:dsc_leaseduration] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_state predefined value Active' do
    dsc_xdhcpserverscope[:dsc_state] = 'Active'
    expect(dsc_xdhcpserverscope[:dsc_state]).to eq('Active')
  end

  it 'should accept dsc_state predefined value active' do
    dsc_xdhcpserverscope[:dsc_state] = 'active'
    expect(dsc_xdhcpserverscope[:dsc_state]).to eq('active')
  end

  it 'should accept dsc_state predefined value Inactive' do
    dsc_xdhcpserverscope[:dsc_state] = 'Inactive'
    expect(dsc_xdhcpserverscope[:dsc_state]).to eq('Inactive')
  end

  it 'should accept dsc_state predefined value inactive' do
    dsc_xdhcpserverscope[:dsc_state] = 'inactive'
    expect(dsc_xdhcpserverscope[:dsc_state]).to eq('inactive')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdhcpserverscope[:dsc_state] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_state' do
    expect{dsc_xdhcpserverscope[:dsc_state] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_state' do
    expect{dsc_xdhcpserverscope[:dsc_state] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_state' do
    expect{dsc_xdhcpserverscope[:dsc_state] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_state' do
    expect{dsc_xdhcpserverscope[:dsc_state] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_addressfamily predefined value IPv4' do
    dsc_xdhcpserverscope[:dsc_addressfamily] = 'IPv4'
    expect(dsc_xdhcpserverscope[:dsc_addressfamily]).to eq('IPv4')
  end

  it 'should accept dsc_addressfamily predefined value ipv4' do
    dsc_xdhcpserverscope[:dsc_addressfamily] = 'ipv4'
    expect(dsc_xdhcpserverscope[:dsc_addressfamily]).to eq('ipv4')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdhcpserverscope[:dsc_addressfamily] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_addressfamily' do
    expect{dsc_xdhcpserverscope[:dsc_addressfamily] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_addressfamily' do
    expect{dsc_xdhcpserverscope[:dsc_addressfamily] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_addressfamily' do
    expect{dsc_xdhcpserverscope[:dsc_addressfamily] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_addressfamily' do
    expect{dsc_xdhcpserverscope[:dsc_addressfamily] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdhcpserverscope[:dsc_ensure] = 'Present'
    expect(dsc_xdhcpserverscope[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdhcpserverscope[:dsc_ensure] = 'present'
    expect(dsc_xdhcpserverscope[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdhcpserverscope[:dsc_ensure] = 'present'
    expect(dsc_xdhcpserverscope[:ensure]).to eq(dsc_xdhcpserverscope[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdhcpserverscope[:dsc_ensure] = 'Absent'
    expect(dsc_xdhcpserverscope[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdhcpserverscope[:dsc_ensure] = 'absent'
    expect(dsc_xdhcpserverscope[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdhcpserverscope[:dsc_ensure] = 'absent'
    expect(dsc_xdhcpserverscope[:ensure]).to eq(dsc_xdhcpserverscope[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdhcpserverscope[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdhcpserverscope[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdhcpserverscope[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdhcpserverscope[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdhcpserverscope[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_scopeid' do
    expect{dsc_xdhcpserverscope[:dsc_scopeid] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_scopeid' do
    expect{dsc_xdhcpserverscope[:dsc_scopeid] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_scopeid' do
    expect{dsc_xdhcpserverscope[:dsc_scopeid] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_scopeid' do
    expect{dsc_xdhcpserverscope[:dsc_scopeid] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xdhcpserverscope)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xdhcpserverscope)
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
        dsc_xdhcpserverscope[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xdhcpserverscope[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xdhcpserverscope.original_parameters[:dsc_ensure] = 'present'
        dsc_xdhcpserverscope[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xdhcpserverscope)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdhcpserverscope[:ensure]).to eq(:present)
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
        dsc_xdhcpserverscope.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdhcpserverscope[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xdhcpserverscope)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdhcpserverscope[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xdhcpserverscope)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xdhcpserverscope)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xDhcpServerScope as $MSFT_xDhcpServerScope1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xDhcpServerScope/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xdhcpserverscope[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xdhcpserverscope)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdhcpserverscope[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xdhcpserverscope[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xdhcpserverscope)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdhcpserverscope[:ensure]).to eq(:absent)
      end

    end

  end
end
