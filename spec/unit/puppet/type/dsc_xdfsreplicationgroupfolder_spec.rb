#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdfsreplicationgroupfolder) do

  let :dsc_xdfsreplicationgroupfolder do
    Puppet::Type.type(:dsc_xdfsreplicationgroupfolder).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_foldername => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroupfolder).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_foldername => 'foo',
      :dsc_description => 'foo',
      :dsc_filenametoexclude => ["foo", "bar", "spec"],
      :dsc_directorynametoexclude => ["foo", "bar", "spec"],
      :dsc_dfsnpath => 'foo',
      :dsc_domainname => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xdfsreplicationgroupfolder.to_s).to eq("Dsc_xdfsreplicationgroupfolder[foo]")
  end

  it 'should require that dsc_groupname is specified' do
    #dsc_xdfsreplicationgroupfolder[:dsc_groupname]
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroupfolder).new(
      :name     => 'foo',
      :dsc_foldername => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_groupname is a required attribute/)
  end

  it 'should not accept array for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_groupname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_groupname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_groupname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_groupname' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_groupname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_foldername is specified' do
    #dsc_xdfsreplicationgroupfolder[:dsc_foldername]
    expect { Puppet::Type.type(:dsc_xdfsreplicationgroupfolder).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_foldername is a required attribute/)
  end

  it 'should not accept array for dsc_foldername' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_foldername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_foldername' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_foldername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_foldername' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_foldername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_foldername' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_foldername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_filenametoexclude' do
    dsc_xdfsreplicationgroupfolder[:dsc_filenametoexclude] = ["foo", "bar", "spec"]
    expect(dsc_xdfsreplicationgroupfolder[:dsc_filenametoexclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_filenametoexclude' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_filenametoexclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_filenametoexclude' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_filenametoexclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_filenametoexclude' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_filenametoexclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_directorynametoexclude' do
    dsc_xdfsreplicationgroupfolder[:dsc_directorynametoexclude] = ["foo", "bar", "spec"]
    expect(dsc_xdfsreplicationgroupfolder[:dsc_directorynametoexclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_directorynametoexclude' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_directorynametoexclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_directorynametoexclude' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_directorynametoexclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_directorynametoexclude' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_directorynametoexclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dfsnpath' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_dfsnpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dfsnpath' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_dfsnpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dfsnpath' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_dfsnpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dfsnpath' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_dfsnpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xdfsreplicationgroupfolder[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdfsreplicationgroupfolder)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdfsreplicationgroupfolder)
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
