#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdfsreplicationgroupconnection) do

  let :dsc_xdfsreplicationgroupconnection do
    Puppet::Type.type(:dsc_xdfsreplicationgroupconnection).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_sourcecomputername => 'foo',
      :dsc_destinationcomputername => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroupconnection).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_sourcecomputername => 'foo',
      :dsc_destinationcomputername => 'foo',
      :dsc_ensure => 'Present',
      :dsc_description => 'foo',
      :dsc_ensureenabled => 'Enabled',
      :dsc_ensurerdcenabled => 'Enabled',
      :dsc_domainname => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xdfsreplicationgroupconnection.to_s).to eq("Dsc_xdfsreplicationgroupconnection[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdfsreplicationgroupconnection[:ensure]).to eq :present
  end

  it 'should require that dsc_groupname is specified' do
    #dsc_xdfsreplicationgroupconnection[:dsc_groupname]
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroupconnection).new(
      :name     => 'foo',
      :dsc_sourcecomputername => 'foo',
      :dsc_destinationcomputername => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_groupname is a required attribute/)
  end

  it 'should not accept array for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_groupname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_groupname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_groupname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_groupname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_sourcecomputername is specified' do
    #dsc_xdfsreplicationgroupconnection[:dsc_sourcecomputername]
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroupconnection).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_destinationcomputername => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_sourcecomputername is a required attribute/)
  end

  it 'should not accept array for dsc_sourcecomputername' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_sourcecomputername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcecomputername' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_sourcecomputername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcecomputername' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_sourcecomputername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcecomputername' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_sourcecomputername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_destinationcomputername is specified' do
    #dsc_xdfsreplicationgroupconnection[:dsc_destinationcomputername]
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroupconnection).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_sourcecomputername => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_destinationcomputername is a required attribute/)
  end

  it 'should not accept array for dsc_destinationcomputername' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_destinationcomputername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_destinationcomputername' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_destinationcomputername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_destinationcomputername' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_destinationcomputername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_destinationcomputername' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_destinationcomputername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensure] = 'Present'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensure] = 'present'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensure] = 'present'
    expect(dsc_xdfsreplicationgroupconnection[:ensure]).to eq(dsc_xdfsreplicationgroupconnection[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensure] = 'Absent'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensure] = 'absent'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensure] = 'absent'
    expect(dsc_xdfsreplicationgroupconnection[:ensure]).to eq(dsc_xdfsreplicationgroupconnection[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensureenabled predefined value Enabled' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled] = 'Enabled'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled]).to eq('Enabled')
  end

  it 'should accept dsc_ensureenabled predefined value enabled' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled] = 'enabled'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled]).to eq('enabled')
  end

  it 'should accept dsc_ensureenabled predefined value Disabled' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled] = 'Disabled'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled]).to eq('Disabled')
  end

  it 'should accept dsc_ensureenabled predefined value disabled' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled] = 'disabled'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled]).to eq('disabled')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensureenabled' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensureenabled' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensureenabled' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensureenabled' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensureenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensurerdcenabled predefined value Enabled' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled] = 'Enabled'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled]).to eq('Enabled')
  end

  it 'should accept dsc_ensurerdcenabled predefined value enabled' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled] = 'enabled'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled]).to eq('enabled')
  end

  it 'should accept dsc_ensurerdcenabled predefined value Disabled' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled] = 'Disabled'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled]).to eq('Disabled')
  end

  it 'should accept dsc_ensurerdcenabled predefined value disabled' do
    dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled] = 'disabled'
    expect(dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled]).to eq('disabled')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensurerdcenabled' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensurerdcenabled' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensurerdcenabled' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensurerdcenabled' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_ensurerdcenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupconnection[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdfsreplicationgroupconnection)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdfsreplicationgroupconnection)
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
        dsc_xdfsreplicationgroupconnection.original_parameters[:dsc_ensure] = 'present'
        dsc_xdfsreplicationgroupconnection[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xdfsreplicationgroupconnection)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdfsreplicationgroupconnection[:ensure]).to eq(:present)
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
        dsc_xdfsreplicationgroupconnection.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdfsreplicationgroupconnection[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xdfsreplicationgroupconnection)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdfsreplicationgroupconnection[:ensure]).to eq(:absent)
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
