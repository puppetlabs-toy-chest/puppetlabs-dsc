#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdfsreplicationgroup) do

  let :dsc_xdfsreplicationgroup do
    Puppet::Type.type(:dsc_xdfsreplicationgroup).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroup).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_ensure => 'Present',
      :dsc_description => 'foo',
      :dsc_members => ["foo", "bar", "spec"],
      :dsc_folders => ["foo", "bar", "spec"],
      :dsc_topology => 'Fullmesh',
      :dsc_contentpaths => ["foo", "bar", "spec"],
      :dsc_domainname => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xdfsreplicationgroup.to_s).to eq("Dsc_xdfsreplicationgroup[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdfsreplicationgroup[:ensure]).to eq :present
  end

  it 'should require that dsc_groupname is specified' do
    #dsc_xdfsreplicationgroup[:dsc_groupname]
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroup).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_groupname is a required attribute/)
  end

  it 'should not accept array for dsc_groupname' do
    expect{dsc_xdfsreplicationgroup[:dsc_groupname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_groupname' do
    expect{dsc_xdfsreplicationgroup[:dsc_groupname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_groupname' do
    expect{dsc_xdfsreplicationgroup[:dsc_groupname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_groupname' do
    expect{dsc_xdfsreplicationgroup[:dsc_groupname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdfsreplicationgroup[:dsc_ensure] = 'Present'
    expect(dsc_xdfsreplicationgroup[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdfsreplicationgroup[:dsc_ensure] = 'present'
    expect(dsc_xdfsreplicationgroup[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdfsreplicationgroup[:dsc_ensure] = 'present'
    expect(dsc_xdfsreplicationgroup[:ensure]).to eq(dsc_xdfsreplicationgroup[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdfsreplicationgroup[:dsc_ensure] = 'Absent'
    expect(dsc_xdfsreplicationgroup[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdfsreplicationgroup[:dsc_ensure] = 'absent'
    expect(dsc_xdfsreplicationgroup[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdfsreplicationgroup[:dsc_ensure] = 'absent'
    expect(dsc_xdfsreplicationgroup[:ensure]).to eq(dsc_xdfsreplicationgroup[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdfsreplicationgroup[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdfsreplicationgroup[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdfsreplicationgroup[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdfsreplicationgroup[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdfsreplicationgroup[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xdfsreplicationgroup[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xdfsreplicationgroup[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xdfsreplicationgroup[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xdfsreplicationgroup[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_members' do
    dsc_xdfsreplicationgroup[:dsc_members] = ["foo", "bar", "spec"]
    expect(dsc_xdfsreplicationgroup[:dsc_members]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_members' do
    expect{dsc_xdfsreplicationgroup[:dsc_members] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_members' do
    expect{dsc_xdfsreplicationgroup[:dsc_members] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_members' do
    expect{dsc_xdfsreplicationgroup[:dsc_members] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_folders' do
    dsc_xdfsreplicationgroup[:dsc_folders] = ["foo", "bar", "spec"]
    expect(dsc_xdfsreplicationgroup[:dsc_folders]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_folders' do
    expect{dsc_xdfsreplicationgroup[:dsc_folders] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_folders' do
    expect{dsc_xdfsreplicationgroup[:dsc_folders] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_folders' do
    expect{dsc_xdfsreplicationgroup[:dsc_folders] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_topology predefined value Fullmesh' do
    dsc_xdfsreplicationgroup[:dsc_topology] = 'Fullmesh'
    expect(dsc_xdfsreplicationgroup[:dsc_topology]).to eq('Fullmesh')
  end

  it 'should accept dsc_topology predefined value fullmesh' do
    dsc_xdfsreplicationgroup[:dsc_topology] = 'fullmesh'
    expect(dsc_xdfsreplicationgroup[:dsc_topology]).to eq('fullmesh')
  end

  it 'should accept dsc_topology predefined value Manual' do
    dsc_xdfsreplicationgroup[:dsc_topology] = 'Manual'
    expect(dsc_xdfsreplicationgroup[:dsc_topology]).to eq('Manual')
  end

  it 'should accept dsc_topology predefined value manual' do
    dsc_xdfsreplicationgroup[:dsc_topology] = 'manual'
    expect(dsc_xdfsreplicationgroup[:dsc_topology]).to eq('manual')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdfsreplicationgroup[:dsc_topology] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_topology' do
    expect{dsc_xdfsreplicationgroup[:dsc_topology] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_topology' do
    expect{dsc_xdfsreplicationgroup[:dsc_topology] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_topology' do
    expect{dsc_xdfsreplicationgroup[:dsc_topology] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_topology' do
    expect{dsc_xdfsreplicationgroup[:dsc_topology] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_contentpaths' do
    dsc_xdfsreplicationgroup[:dsc_contentpaths] = ["foo", "bar", "spec"]
    expect(dsc_xdfsreplicationgroup[:dsc_contentpaths]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_contentpaths' do
    expect{dsc_xdfsreplicationgroup[:dsc_contentpaths] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_contentpaths' do
    expect{dsc_xdfsreplicationgroup[:dsc_contentpaths] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_contentpaths' do
    expect{dsc_xdfsreplicationgroup[:dsc_contentpaths] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xdfsreplicationgroup[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xdfsreplicationgroup[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xdfsreplicationgroup[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xdfsreplicationgroup[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdfsreplicationgroup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdfsreplicationgroup)
    end

    describe "when dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Invoke-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Test" do
        expect(@provider.ps_script_content('test')).to match(/Method\s+=\s*'test'/)
      end

      it "should compute powershell dsc set script with Invoke-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Invoke-DscResource/)
      end

      it "should compute powershell dsc test script with method Set" do
        expect(@provider.ps_script_content('set')).to match(/Method\s+=\s*'set'/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xdfsreplicationgroup.original_parameters[:dsc_ensure] = 'present'
        dsc_xdfsreplicationgroup[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xdfsreplicationgroup)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdfsreplicationgroup[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xdfsreplicationgroup.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdfsreplicationgroup[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xdfsreplicationgroup)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdfsreplicationgroup[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
