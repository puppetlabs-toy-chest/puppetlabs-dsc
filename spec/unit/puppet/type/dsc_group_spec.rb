#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_group) do

  let :dsc_group do
    Puppet::Type.type(:dsc_group).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_group.to_s).to eq("Dsc_group[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_group[:ensure]).to eq :present
  end

  it 'should require that dsc_groupname is specified' do
    #dsc_group[:dsc_groupname]
    expect { Puppet::Type.type(:dsc_group).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_description => 'foo',
      :dsc_members => ["foo", "bar", "spec"],
      :dsc_memberstoinclude => ["foo", "bar", "spec"],
      :dsc_memberstoexclude => ["foo", "bar", "spec"],
      :dsc_credential => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_groupname is a required attribute/)
  end

  it 'should not accept array for dsc_groupname' do
    expect{dsc_group[:dsc_groupname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_groupname' do
    expect{dsc_group[:dsc_groupname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_groupname' do
    expect{dsc_group[:dsc_groupname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_groupname' do
    expect{dsc_group[:dsc_groupname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_group[:dsc_ensure] = 'Present'
    expect(dsc_group[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_group[:dsc_ensure] = 'present'
    expect(dsc_group[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_group[:dsc_ensure] = 'present'
    expect(dsc_group[:ensure]).to eq(dsc_group[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_group[:dsc_ensure] = 'Absent'
    expect(dsc_group[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_group[:dsc_ensure] = 'absent'
    expect(dsc_group[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_group[:dsc_ensure] = 'absent'
    expect(dsc_group[:ensure]).to eq(dsc_group[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_group[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_group[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_group[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_group[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_group[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_group[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_group[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_group[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_group[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_members' do
    dsc_group[:dsc_members] = ["foo", "bar", "spec"]
    expect(dsc_group[:dsc_members]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_members' do
    expect{dsc_group[:dsc_members] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_members' do
    expect{dsc_group[:dsc_members] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_members' do
    expect{dsc_group[:dsc_members] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_memberstoinclude' do
    dsc_group[:dsc_memberstoinclude] = ["foo", "bar", "spec"]
    expect(dsc_group[:dsc_memberstoinclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_memberstoinclude' do
    expect{dsc_group[:dsc_memberstoinclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoinclude' do
    expect{dsc_group[:dsc_memberstoinclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoinclude' do
    expect{dsc_group[:dsc_memberstoinclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_memberstoexclude' do
    dsc_group[:dsc_memberstoexclude] = ["foo", "bar", "spec"]
    expect(dsc_group[:dsc_memberstoexclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_memberstoexclude' do
    expect{dsc_group[:dsc_memberstoexclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoexclude' do
    expect{dsc_group[:dsc_memberstoexclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoexclude' do
    expect{dsc_group[:dsc_memberstoexclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_group[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_group[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_group[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_group[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_group)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_group)
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
        dsc_group[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_group[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_group.original_parameters[:dsc_ensure] = 'present'
        dsc_group[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_group)
      end

      it "should update :ensure to :present" do
        expect(dsc_group[:ensure]).to eq(:present)
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
        dsc_group.original_parameters[:dsc_ensure] = 'absent'
        dsc_group[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_group)
      end

      it "should update :ensure to :absent" do
        expect(dsc_group[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_group)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_group)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_GroupResource as $MSFT_GroupResource1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_GroupResource/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_group[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_group)
      end

      it "should update :ensure to :present" do
        expect(dsc_group[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_group[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_group)
      end

      it "should update :ensure to :absent" do
        expect(dsc_group[:ensure]).to eq(:absent)
      end

    end

  end
end
