#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchautomountpoint) do

  let :dsc_xexchautomountpoint do
    Puppet::Type.type(:dsc_xexchautomountpoint).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchautomountpoint.to_s).to eq("Dsc_xexchautomountpoint[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchautomountpoint[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchautomountpoint).new(
      :name     => 'foo',
      :dsc_autodagdatabasesrootfolderpath => 'foo',
      :dsc_autodagvolumesrootfolderpath => 'foo',
      :dsc_disktodbmap => ["foo", "bar", "spec"],
      :dsc_sparevolumecount => 32,
      :dsc_ensureexchangevolumemountpointislast => true,
      :dsc_createsubfolders => true,
      :dsc_filesystem => 'NTFS',
      :dsc_mindisksize => 'foo',
      :dsc_partitioningscheme => 'MBR',
      :dsc_unitsize => 'foo',
      :dsc_volumeprefix => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchautomountpoint[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchautomountpoint[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchautomountpoint[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchautomountpoint[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autodagdatabasesrootfolderpath' do
    expect{dsc_xexchautomountpoint[:dsc_autodagdatabasesrootfolderpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autodagdatabasesrootfolderpath' do
    expect{dsc_xexchautomountpoint[:dsc_autodagdatabasesrootfolderpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autodagdatabasesrootfolderpath' do
    expect{dsc_xexchautomountpoint[:dsc_autodagdatabasesrootfolderpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autodagdatabasesrootfolderpath' do
    expect{dsc_xexchautomountpoint[:dsc_autodagdatabasesrootfolderpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autodagvolumesrootfolderpath' do
    expect{dsc_xexchautomountpoint[:dsc_autodagvolumesrootfolderpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_autodagvolumesrootfolderpath' do
    expect{dsc_xexchautomountpoint[:dsc_autodagvolumesrootfolderpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_autodagvolumesrootfolderpath' do
    expect{dsc_xexchautomountpoint[:dsc_autodagvolumesrootfolderpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autodagvolumesrootfolderpath' do
    expect{dsc_xexchautomountpoint[:dsc_autodagvolumesrootfolderpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_disktodbmap' do
    dsc_xexchautomountpoint[:dsc_disktodbmap] = ["foo", "bar", "spec"]
    expect(dsc_xexchautomountpoint[:dsc_disktodbmap]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_disktodbmap' do
    expect{dsc_xexchautomountpoint[:dsc_disktodbmap] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_disktodbmap' do
    expect{dsc_xexchautomountpoint[:dsc_disktodbmap] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disktodbmap' do
    expect{dsc_xexchautomountpoint[:dsc_disktodbmap] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sparevolumecount' do
    expect{dsc_xexchautomountpoint[:dsc_sparevolumecount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sparevolumecount' do
    expect{dsc_xexchautomountpoint[:dsc_sparevolumecount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_sparevolumecount' do
    dsc_xexchautomountpoint[:dsc_sparevolumecount] = 32
    expect(dsc_xexchautomountpoint[:dsc_sparevolumecount]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_sparevolumecount' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xexchautomountpoint[:dsc_sparevolumecount] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_sparevolumecount' do
    dsc_xexchautomountpoint[:dsc_sparevolumecount] = '16'
    expect(dsc_xexchautomountpoint[:dsc_sparevolumecount]).to eq(16)
  end

  it 'should accept string-like uint for dsc_sparevolumecount' do
    dsc_xexchautomountpoint[:dsc_sparevolumecount] = '32'
    expect(dsc_xexchautomountpoint[:dsc_sparevolumecount]).to eq(32)
  end

  it 'should accept string-like uint for dsc_sparevolumecount' do
    dsc_xexchautomountpoint[:dsc_sparevolumecount] = '64'
    expect(dsc_xexchautomountpoint[:dsc_sparevolumecount]).to eq(64)
  end

  it 'should not accept array for dsc_ensureexchangevolumemountpointislast' do
    expect{dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_ensureexchangevolumemountpointislast' do
    dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast] = true
    expect(dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_ensureexchangevolumemountpointislast" do
    dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast] = 'true'
    expect(dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_ensureexchangevolumemountpointislast" do
    dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast] = 'false'
    expect(dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_ensureexchangevolumemountpointislast" do
    dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast] = 'True'
    expect(dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_ensureexchangevolumemountpointislast" do
    dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast] = 'False'
    expect(dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_ensureexchangevolumemountpointislast" do
    dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast] = :true
    expect(dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_ensureexchangevolumemountpointislast" do
    dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast] = :false
    expect(dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast]).to eq(false)
  end

  it 'should not accept int for dsc_ensureexchangevolumemountpointislast' do
    expect{dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensureexchangevolumemountpointislast' do
    expect{dsc_xexchautomountpoint[:dsc_ensureexchangevolumemountpointislast] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_createsubfolders' do
    expect{dsc_xexchautomountpoint[:dsc_createsubfolders] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_createsubfolders' do
    dsc_xexchautomountpoint[:dsc_createsubfolders] = true
    expect(dsc_xexchautomountpoint[:dsc_createsubfolders]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_createsubfolders" do
    dsc_xexchautomountpoint[:dsc_createsubfolders] = 'true'
    expect(dsc_xexchautomountpoint[:dsc_createsubfolders]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_createsubfolders" do
    dsc_xexchautomountpoint[:dsc_createsubfolders] = 'false'
    expect(dsc_xexchautomountpoint[:dsc_createsubfolders]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_createsubfolders" do
    dsc_xexchautomountpoint[:dsc_createsubfolders] = 'True'
    expect(dsc_xexchautomountpoint[:dsc_createsubfolders]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_createsubfolders" do
    dsc_xexchautomountpoint[:dsc_createsubfolders] = 'False'
    expect(dsc_xexchautomountpoint[:dsc_createsubfolders]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_createsubfolders" do
    dsc_xexchautomountpoint[:dsc_createsubfolders] = :true
    expect(dsc_xexchautomountpoint[:dsc_createsubfolders]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_createsubfolders" do
    dsc_xexchautomountpoint[:dsc_createsubfolders] = :false
    expect(dsc_xexchautomountpoint[:dsc_createsubfolders]).to eq(false)
  end

  it 'should not accept int for dsc_createsubfolders' do
    expect{dsc_xexchautomountpoint[:dsc_createsubfolders] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_createsubfolders' do
    expect{dsc_xexchautomountpoint[:dsc_createsubfolders] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_filesystem predefined value NTFS' do
    dsc_xexchautomountpoint[:dsc_filesystem] = 'NTFS'
    expect(dsc_xexchautomountpoint[:dsc_filesystem]).to eq('NTFS')
  end

  it 'should accept dsc_filesystem predefined value ntfs' do
    dsc_xexchautomountpoint[:dsc_filesystem] = 'ntfs'
    expect(dsc_xexchautomountpoint[:dsc_filesystem]).to eq('ntfs')
  end

  it 'should accept dsc_filesystem predefined value REFS' do
    dsc_xexchautomountpoint[:dsc_filesystem] = 'REFS'
    expect(dsc_xexchautomountpoint[:dsc_filesystem]).to eq('REFS')
  end

  it 'should accept dsc_filesystem predefined value refs' do
    dsc_xexchautomountpoint[:dsc_filesystem] = 'refs'
    expect(dsc_xexchautomountpoint[:dsc_filesystem]).to eq('refs')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchautomountpoint[:dsc_filesystem] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_filesystem' do
    expect{dsc_xexchautomountpoint[:dsc_filesystem] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_filesystem' do
    expect{dsc_xexchautomountpoint[:dsc_filesystem] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_filesystem' do
    expect{dsc_xexchautomountpoint[:dsc_filesystem] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_filesystem' do
    expect{dsc_xexchautomountpoint[:dsc_filesystem] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mindisksize' do
    expect{dsc_xexchautomountpoint[:dsc_mindisksize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mindisksize' do
    expect{dsc_xexchautomountpoint[:dsc_mindisksize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mindisksize' do
    expect{dsc_xexchautomountpoint[:dsc_mindisksize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mindisksize' do
    expect{dsc_xexchautomountpoint[:dsc_mindisksize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_partitioningscheme predefined value MBR' do
    dsc_xexchautomountpoint[:dsc_partitioningscheme] = 'MBR'
    expect(dsc_xexchautomountpoint[:dsc_partitioningscheme]).to eq('MBR')
  end

  it 'should accept dsc_partitioningscheme predefined value mbr' do
    dsc_xexchautomountpoint[:dsc_partitioningscheme] = 'mbr'
    expect(dsc_xexchautomountpoint[:dsc_partitioningscheme]).to eq('mbr')
  end

  it 'should accept dsc_partitioningscheme predefined value GPT' do
    dsc_xexchautomountpoint[:dsc_partitioningscheme] = 'GPT'
    expect(dsc_xexchautomountpoint[:dsc_partitioningscheme]).to eq('GPT')
  end

  it 'should accept dsc_partitioningscheme predefined value gpt' do
    dsc_xexchautomountpoint[:dsc_partitioningscheme] = 'gpt'
    expect(dsc_xexchautomountpoint[:dsc_partitioningscheme]).to eq('gpt')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xexchautomountpoint[:dsc_partitioningscheme] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_partitioningscheme' do
    expect{dsc_xexchautomountpoint[:dsc_partitioningscheme] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_partitioningscheme' do
    expect{dsc_xexchautomountpoint[:dsc_partitioningscheme] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_partitioningscheme' do
    expect{dsc_xexchautomountpoint[:dsc_partitioningscheme] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_partitioningscheme' do
    expect{dsc_xexchautomountpoint[:dsc_partitioningscheme] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_unitsize' do
    expect{dsc_xexchautomountpoint[:dsc_unitsize] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_unitsize' do
    expect{dsc_xexchautomountpoint[:dsc_unitsize] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_unitsize' do
    expect{dsc_xexchautomountpoint[:dsc_unitsize] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_unitsize' do
    expect{dsc_xexchautomountpoint[:dsc_unitsize] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_volumeprefix' do
    expect{dsc_xexchautomountpoint[:dsc_volumeprefix] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_volumeprefix' do
    expect{dsc_xexchautomountpoint[:dsc_volumeprefix] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_volumeprefix' do
    expect{dsc_xexchautomountpoint[:dsc_volumeprefix] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_volumeprefix' do
    expect{dsc_xexchautomountpoint[:dsc_volumeprefix] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchautomountpoint)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchautomountpoint)
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
