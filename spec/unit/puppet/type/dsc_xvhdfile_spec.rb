#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xvhdfile) do

  let :dsc_xvhdfile do
    Puppet::Type.type(:dsc_xvhdfile).new(
      :name     => 'foo',
      :dsc_vhdpath => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xvhdfile.to_s).to eq("Dsc_xvhdfile[foo]")
  end

  it 'should require that dsc_vhdpath is specified' do
    #dsc_xvhdfile[:dsc_vhdpath]
    expect { Puppet::Type.type(:dsc_xvhdfile).new(
      :name     => 'foo',
      :dsc_filedirectory => {"DestinationPath"=>"c:/foo/bar", "Recurse"=>true},
      :dsc_checksum => 'ModifiedDate',
    )}.to raise_error(Puppet::Error, /dsc_vhdpath is a required attribute/)
  end

  it 'should not accept array for dsc_vhdpath' do
    expect{dsc_xvhdfile[:dsc_vhdpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_vhdpath' do
    expect{dsc_xvhdfile[:dsc_vhdpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_vhdpath' do
    expect{dsc_xvhdfile[:dsc_vhdpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_vhdpath' do
    expect{dsc_xvhdfile[:dsc_vhdpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept a hash for dsc_filedirectory' do
    dsc_xvhdfile[:dsc_filedirectory] = {"DestinationPath"=>"c:/foo/bar", "Recurse"=>true}
    expect(dsc_xvhdfile[:dsc_filedirectory]).to eq([{"DestinationPath"=>"c:/foo/bar", "Recurse"=>true}])
  end

  it 'should accept a an array of hashes for dsc_filedirectory' do
    dsc_xvhdfile[:dsc_filedirectory] = [{"DestinationPath"=>"c:/foo/bar", "Recurse"=>true}]
    expect(dsc_xvhdfile[:dsc_filedirectory]).to eq([{"DestinationPath"=>"c:/foo/bar", "Recurse"=>true}])
  end

  it 'should not accept boolean for dsc_filedirectory' do
    expect{dsc_xvhdfile[:dsc_filedirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_filedirectory' do
    expect{dsc_xvhdfile[:dsc_filedirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_filedirectory' do
    expect{dsc_xvhdfile[:dsc_filedirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_checksum predefined value ModifiedDate' do
    dsc_xvhdfile[:dsc_checksum] = 'ModifiedDate'
    expect(dsc_xvhdfile[:dsc_checksum]).to eq('ModifiedDate')
  end

  it 'should accept dsc_checksum predefined value modifieddate' do
    dsc_xvhdfile[:dsc_checksum] = 'modifieddate'
    expect(dsc_xvhdfile[:dsc_checksum]).to eq('modifieddate')
  end

  it 'should accept dsc_checksum predefined value SHA-1' do
    dsc_xvhdfile[:dsc_checksum] = 'SHA-1'
    expect(dsc_xvhdfile[:dsc_checksum]).to eq('SHA-1')
  end

  it 'should accept dsc_checksum predefined value sha-1' do
    dsc_xvhdfile[:dsc_checksum] = 'sha-1'
    expect(dsc_xvhdfile[:dsc_checksum]).to eq('sha-1')
  end

  it 'should accept dsc_checksum predefined value SHA-256' do
    dsc_xvhdfile[:dsc_checksum] = 'SHA-256'
    expect(dsc_xvhdfile[:dsc_checksum]).to eq('SHA-256')
  end

  it 'should accept dsc_checksum predefined value sha-256' do
    dsc_xvhdfile[:dsc_checksum] = 'sha-256'
    expect(dsc_xvhdfile[:dsc_checksum]).to eq('sha-256')
  end

  it 'should accept dsc_checksum predefined value SHA-512' do
    dsc_xvhdfile[:dsc_checksum] = 'SHA-512'
    expect(dsc_xvhdfile[:dsc_checksum]).to eq('SHA-512')
  end

  it 'should accept dsc_checksum predefined value sha-512' do
    dsc_xvhdfile[:dsc_checksum] = 'sha-512'
    expect(dsc_xvhdfile[:dsc_checksum]).to eq('sha-512')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xvhdfile[:dsc_checksum] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_checksum' do
    expect{dsc_xvhdfile[:dsc_checksum] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_checksum' do
    expect{dsc_xvhdfile[:dsc_checksum] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_checksum' do
    expect{dsc_xvhdfile[:dsc_checksum] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_checksum' do
    expect{dsc_xvhdfile[:dsc_checksum] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xvhdfile)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xvhdfile)
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
