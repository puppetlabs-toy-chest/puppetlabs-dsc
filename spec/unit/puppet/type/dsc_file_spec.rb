#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_file) do

  let :dsc_file do
    Puppet::Type.type(:dsc_file).new(
      :name     => 'foo',
      :dsc_destinationpath => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_file).new(
      :name     => 'foo',
      :dsc_destinationpath => 'foo',
      :dsc_ensure => 'Present',
      :dsc_type => 'File',
      :dsc_sourcepath => 'foo',
      :dsc_contents => 'foo',
      :dsc_checksum => 'SHA-1',
      :dsc_recurse => true,
      :dsc_force => true,
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_attributes => 'ReadOnly',
      :dsc_dependson => ["foo", "bar", "spec"],
      :dsc_matchsource => true,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_file.to_s).to eq("Dsc_file[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_file[:ensure]).to eq :present
  end

  it 'should require that dsc_destinationpath is specified' do
    #dsc_file[:dsc_destinationpath]
    expect { Puppet::Type.type(:dsc_file).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_destinationpath is a required attribute/)
  end

  it 'should not accept array for dsc_destinationpath' do
    expect{dsc_file[:dsc_destinationpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_destinationpath' do
    expect{dsc_file[:dsc_destinationpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_destinationpath' do
    expect{dsc_file[:dsc_destinationpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_destinationpath' do
    expect{dsc_file[:dsc_destinationpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_file[:dsc_ensure] = 'Present'
    expect(dsc_file[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_file[:dsc_ensure] = 'present'
    expect(dsc_file[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_file[:dsc_ensure] = 'present'
    expect(dsc_file[:ensure]).to eq(dsc_file[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_file[:dsc_ensure] = 'Absent'
    expect(dsc_file[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_file[:dsc_ensure] = 'absent'
    expect(dsc_file[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_file[:dsc_ensure] = 'absent'
    expect(dsc_file[:ensure]).to eq(dsc_file[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_file[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_file[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_file[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_file[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_file[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_type predefined value File' do
    dsc_file[:dsc_type] = 'File'
    expect(dsc_file[:dsc_type]).to eq('File')
  end

  it 'should accept dsc_type predefined value file' do
    dsc_file[:dsc_type] = 'file'
    expect(dsc_file[:dsc_type]).to eq('file')
  end

  it 'should accept dsc_type predefined value Directory' do
    dsc_file[:dsc_type] = 'Directory'
    expect(dsc_file[:dsc_type]).to eq('Directory')
  end

  it 'should accept dsc_type predefined value directory' do
    dsc_file[:dsc_type] = 'directory'
    expect(dsc_file[:dsc_type]).to eq('directory')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_file[:dsc_type] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_type' do
    expect{dsc_file[:dsc_type] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_type' do
    expect{dsc_file[:dsc_type] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_type' do
    expect{dsc_file[:dsc_type] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_type' do
    expect{dsc_file[:dsc_type] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_file[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_file[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_file[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_file[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_contents' do
    expect{dsc_file[:dsc_contents] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_contents' do
    expect{dsc_file[:dsc_contents] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_contents' do
    expect{dsc_file[:dsc_contents] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_contents' do
    expect{dsc_file[:dsc_contents] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_checksum predefined value SHA-1' do
    dsc_file[:dsc_checksum] = 'SHA-1'
    expect(dsc_file[:dsc_checksum]).to eq('SHA-1')
  end

  it 'should accept dsc_checksum predefined value sha-1' do
    dsc_file[:dsc_checksum] = 'sha-1'
    expect(dsc_file[:dsc_checksum]).to eq('sha-1')
  end

  it 'should accept dsc_checksum predefined value SHA-256' do
    dsc_file[:dsc_checksum] = 'SHA-256'
    expect(dsc_file[:dsc_checksum]).to eq('SHA-256')
  end

  it 'should accept dsc_checksum predefined value sha-256' do
    dsc_file[:dsc_checksum] = 'sha-256'
    expect(dsc_file[:dsc_checksum]).to eq('sha-256')
  end

  it 'should accept dsc_checksum predefined value SHA-512' do
    dsc_file[:dsc_checksum] = 'SHA-512'
    expect(dsc_file[:dsc_checksum]).to eq('SHA-512')
  end

  it 'should accept dsc_checksum predefined value sha-512' do
    dsc_file[:dsc_checksum] = 'sha-512'
    expect(dsc_file[:dsc_checksum]).to eq('sha-512')
  end

  it 'should accept dsc_checksum predefined value CreatedDate' do
    dsc_file[:dsc_checksum] = 'CreatedDate'
    expect(dsc_file[:dsc_checksum]).to eq('CreatedDate')
  end

  it 'should accept dsc_checksum predefined value createddate' do
    dsc_file[:dsc_checksum] = 'createddate'
    expect(dsc_file[:dsc_checksum]).to eq('createddate')
  end

  it 'should accept dsc_checksum predefined value ModifiedDate' do
    dsc_file[:dsc_checksum] = 'ModifiedDate'
    expect(dsc_file[:dsc_checksum]).to eq('ModifiedDate')
  end

  it 'should accept dsc_checksum predefined value modifieddate' do
    dsc_file[:dsc_checksum] = 'modifieddate'
    expect(dsc_file[:dsc_checksum]).to eq('modifieddate')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_file[:dsc_checksum] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_checksum' do
    expect{dsc_file[:dsc_checksum] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_checksum' do
    expect{dsc_file[:dsc_checksum] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_checksum' do
    expect{dsc_file[:dsc_checksum] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_checksum' do
    expect{dsc_file[:dsc_checksum] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_recurse' do
    expect{dsc_file[:dsc_recurse] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_recurse' do
    dsc_file[:dsc_recurse] = true
    expect(dsc_file[:dsc_recurse]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_recurse" do
    dsc_file[:dsc_recurse] = 'true'
    expect(dsc_file[:dsc_recurse]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_recurse" do
    dsc_file[:dsc_recurse] = 'false'
    expect(dsc_file[:dsc_recurse]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_recurse" do
    dsc_file[:dsc_recurse] = 'True'
    expect(dsc_file[:dsc_recurse]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_recurse" do
    dsc_file[:dsc_recurse] = 'False'
    expect(dsc_file[:dsc_recurse]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_recurse" do
    dsc_file[:dsc_recurse] = :true
    expect(dsc_file[:dsc_recurse]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_recurse" do
    dsc_file[:dsc_recurse] = :false
    expect(dsc_file[:dsc_recurse]).to eq(false)
  end

  it 'should not accept int for dsc_recurse' do
    expect{dsc_file[:dsc_recurse] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_recurse' do
    expect{dsc_file[:dsc_recurse] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_force' do
    expect{dsc_file[:dsc_force] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_force' do
    dsc_file[:dsc_force] = true
    expect(dsc_file[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_force" do
    dsc_file[:dsc_force] = 'true'
    expect(dsc_file[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_force" do
    dsc_file[:dsc_force] = 'false'
    expect(dsc_file[:dsc_force]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_force" do
    dsc_file[:dsc_force] = 'True'
    expect(dsc_file[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_force" do
    dsc_file[:dsc_force] = 'False'
    expect(dsc_file[:dsc_force]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_force" do
    dsc_file[:dsc_force] = :true
    expect(dsc_file[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_force" do
    dsc_file[:dsc_force] = :false
    expect(dsc_file[:dsc_force]).to eq(false)
  end

  it 'should not accept int for dsc_force' do
    expect{dsc_file[:dsc_force] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_force' do
    expect{dsc_file[:dsc_force] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_file[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_file[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_file[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_file[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_file[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_attributes predefined value ReadOnly' do
    dsc_file[:dsc_attributes] = 'ReadOnly'
    expect(dsc_file[:dsc_attributes]).to eq(['ReadOnly'])
  end

  it 'should accept dsc_attributes predefined value readonly' do
    dsc_file[:dsc_attributes] = 'readonly'
    expect(dsc_file[:dsc_attributes]).to eq(['readonly'])
  end

  it 'should accept dsc_attributes predefined value Hidden' do
    dsc_file[:dsc_attributes] = 'Hidden'
    expect(dsc_file[:dsc_attributes]).to eq(['Hidden'])
  end

  it 'should accept dsc_attributes predefined value hidden' do
    dsc_file[:dsc_attributes] = 'hidden'
    expect(dsc_file[:dsc_attributes]).to eq(['hidden'])
  end

  it 'should accept dsc_attributes predefined value System' do
    dsc_file[:dsc_attributes] = 'System'
    expect(dsc_file[:dsc_attributes]).to eq(['System'])
  end

  it 'should accept dsc_attributes predefined value system' do
    dsc_file[:dsc_attributes] = 'system'
    expect(dsc_file[:dsc_attributes]).to eq(['system'])
  end

  it 'should accept dsc_attributes predefined value Archive' do
    dsc_file[:dsc_attributes] = 'Archive'
    expect(dsc_file[:dsc_attributes]).to eq(['Archive'])
  end

  it 'should accept dsc_attributes predefined value archive' do
    dsc_file[:dsc_attributes] = 'archive'
    expect(dsc_file[:dsc_attributes]).to eq(['archive'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_file[:dsc_attributes] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_attributes' do
    dsc_file[:dsc_attributes] = ["ReadOnly", "Hidden", "System", "Archive"]
    expect(dsc_file[:dsc_attributes]).to eq(["ReadOnly", "Hidden", "System", "Archive"])
  end

  it 'should not accept boolean for dsc_attributes' do
    expect{dsc_file[:dsc_attributes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_attributes' do
    expect{dsc_file[:dsc_attributes] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_attributes' do
    expect{dsc_file[:dsc_attributes] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_dependson' do
    dsc_file[:dsc_dependson] = ["foo", "bar", "spec"]
    expect(dsc_file[:dsc_dependson]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_dependson' do
    expect{dsc_file[:dsc_dependson] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dependson' do
    expect{dsc_file[:dsc_dependson] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dependson' do
    expect{dsc_file[:dsc_dependson] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_matchsource' do
    expect{dsc_file[:dsc_matchsource] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_matchsource' do
    dsc_file[:dsc_matchsource] = true
    expect(dsc_file[:dsc_matchsource]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_matchsource" do
    dsc_file[:dsc_matchsource] = 'true'
    expect(dsc_file[:dsc_matchsource]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_matchsource" do
    dsc_file[:dsc_matchsource] = 'false'
    expect(dsc_file[:dsc_matchsource]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_matchsource" do
    dsc_file[:dsc_matchsource] = 'True'
    expect(dsc_file[:dsc_matchsource]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_matchsource" do
    dsc_file[:dsc_matchsource] = 'False'
    expect(dsc_file[:dsc_matchsource]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_matchsource" do
    dsc_file[:dsc_matchsource] = :true
    expect(dsc_file[:dsc_matchsource]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_matchsource" do
    dsc_file[:dsc_matchsource] = :false
    expect(dsc_file[:dsc_matchsource]).to eq(false)
  end

  it 'should not accept int for dsc_matchsource' do
    expect{dsc_file[:dsc_matchsource] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_matchsource' do
    expect{dsc_file[:dsc_matchsource] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_file)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_file)
    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_file.original_parameters[:dsc_ensure] = 'present'
        dsc_file[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_file)
      end

      it "should update :ensure to :present" do
        expect(dsc_file[:ensure]).to eq(:present)
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
        dsc_file.original_parameters[:dsc_ensure] = 'absent'
        dsc_file[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_file)
      end

      it "should update :ensure to :absent" do
        expect(dsc_file[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
