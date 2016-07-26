#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdfsreplicationgroupmembership) do

  let :dsc_xdfsreplicationgroupmembership do
    Puppet::Type.type(:dsc_xdfsreplicationgroupmembership).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_foldername => 'foo',
      :dsc_computername => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroupmembership).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_foldername => 'foo',
      :dsc_computername => 'foo',
      :dsc_contentpath => 'foo',
      :dsc_stagingpath => 'foo',
      :dsc_conflictanddeletedpath => 'foo',
      :dsc_readonly => true,
      :dsc_primarymember => true,
      :dsc_domainname => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xdfsreplicationgroupmembership.to_s).to eq("Dsc_xdfsreplicationgroupmembership[foo]")
  end

  it 'should require that dsc_groupname is specified' do
    #dsc_xdfsreplicationgroupmembership[:dsc_groupname]
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroupmembership).new(
      :name     => 'foo',
      :dsc_foldername => 'foo',
      :dsc_computername => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_groupname is a required attribute/)
  end

  it 'should not accept array for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_groupname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_groupname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_groupname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_groupname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_foldername is specified' do
    #dsc_xdfsreplicationgroupmembership[:dsc_foldername]
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroupmembership).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_computername => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_foldername is a required attribute/)
  end

  it 'should not accept array for dsc_foldername' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_foldername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_foldername' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_foldername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_foldername' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_foldername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_foldername' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_foldername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_computername is specified' do
    #dsc_xdfsreplicationgroupmembership[:dsc_computername]
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroupmembership).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_foldername => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_computername is a required attribute/)
  end

  it 'should not accept array for dsc_computername' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_computername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_computername' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_computername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_computername' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_computername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_computername' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_computername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_contentpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_contentpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_contentpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_contentpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_contentpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_contentpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_contentpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_contentpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_stagingpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_stagingpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_stagingpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_stagingpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_stagingpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_stagingpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_stagingpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_stagingpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_conflictanddeletedpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_conflictanddeletedpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_conflictanddeletedpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_conflictanddeletedpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_conflictanddeletedpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_conflictanddeletedpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_conflictanddeletedpath' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_conflictanddeletedpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_readonly' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_readonly] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_readonly' do
    dsc_xdfsreplicationgroupmembership[:dsc_readonly] = true
    expect(dsc_xdfsreplicationgroupmembership[:dsc_readonly]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_readonly" do
    dsc_xdfsreplicationgroupmembership[:dsc_readonly] = 'true'
    expect(dsc_xdfsreplicationgroupmembership[:dsc_readonly]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_readonly" do
    dsc_xdfsreplicationgroupmembership[:dsc_readonly] = 'false'
    expect(dsc_xdfsreplicationgroupmembership[:dsc_readonly]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_readonly" do
    dsc_xdfsreplicationgroupmembership[:dsc_readonly] = 'True'
    expect(dsc_xdfsreplicationgroupmembership[:dsc_readonly]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_readonly" do
    dsc_xdfsreplicationgroupmembership[:dsc_readonly] = 'False'
    expect(dsc_xdfsreplicationgroupmembership[:dsc_readonly]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_readonly" do
    dsc_xdfsreplicationgroupmembership[:dsc_readonly] = :true
    expect(dsc_xdfsreplicationgroupmembership[:dsc_readonly]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_readonly" do
    dsc_xdfsreplicationgroupmembership[:dsc_readonly] = :false
    expect(dsc_xdfsreplicationgroupmembership[:dsc_readonly]).to eq(false)
  end

  it 'should not accept int for dsc_readonly' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_readonly] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_readonly' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_readonly] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_primarymember' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_primarymember] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_primarymember' do
    dsc_xdfsreplicationgroupmembership[:dsc_primarymember] = true
    expect(dsc_xdfsreplicationgroupmembership[:dsc_primarymember]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_primarymember" do
    dsc_xdfsreplicationgroupmembership[:dsc_primarymember] = 'true'
    expect(dsc_xdfsreplicationgroupmembership[:dsc_primarymember]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_primarymember" do
    dsc_xdfsreplicationgroupmembership[:dsc_primarymember] = 'false'
    expect(dsc_xdfsreplicationgroupmembership[:dsc_primarymember]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_primarymember" do
    dsc_xdfsreplicationgroupmembership[:dsc_primarymember] = 'True'
    expect(dsc_xdfsreplicationgroupmembership[:dsc_primarymember]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_primarymember" do
    dsc_xdfsreplicationgroupmembership[:dsc_primarymember] = 'False'
    expect(dsc_xdfsreplicationgroupmembership[:dsc_primarymember]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_primarymember" do
    dsc_xdfsreplicationgroupmembership[:dsc_primarymember] = :true
    expect(dsc_xdfsreplicationgroupmembership[:dsc_primarymember]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_primarymember" do
    dsc_xdfsreplicationgroupmembership[:dsc_primarymember] = :false
    expect(dsc_xdfsreplicationgroupmembership[:dsc_primarymember]).to eq(false)
  end

  it 'should not accept int for dsc_primarymember' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_primarymember] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_primarymember' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_primarymember] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupmembership[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdfsreplicationgroupmembership)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdfsreplicationgroupmembership)
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

  end
end
