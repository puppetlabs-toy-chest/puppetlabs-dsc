#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xiismimetypemapping) do

  let :dsc_xiismimetypemapping do
    Puppet::Type.type(:dsc_xiismimetypemapping).new(
      :name     => 'foo',
      :dsc_extension => 'foo',
      :dsc_mimetype => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xiismimetypemapping.to_s).to eq("Dsc_xiismimetypemapping[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xiismimetypemapping[:ensure]).to eq :present
  end

  it 'should require that dsc_extension is specified' do
    #dsc_xiismimetypemapping[:dsc_extension]
    expect { Puppet::Type.type(:dsc_xiismimetypemapping).new(
      :name     => 'foo',
      :dsc_mimetype => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_extension is a required attribute/)
  end

  it 'should not accept array for dsc_extension' do
    expect{dsc_xiismimetypemapping[:dsc_extension] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_extension' do
    expect{dsc_xiismimetypemapping[:dsc_extension] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_extension' do
    expect{dsc_xiismimetypemapping[:dsc_extension] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_extension' do
    expect{dsc_xiismimetypemapping[:dsc_extension] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_mimetype is specified' do
    #dsc_xiismimetypemapping[:dsc_mimetype]
    expect { Puppet::Type.type(:dsc_xiismimetypemapping).new(
      :name     => 'foo',
      :dsc_extension => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_mimetype is a required attribute/)
  end

  it 'should not accept array for dsc_mimetype' do
    expect{dsc_xiismimetypemapping[:dsc_mimetype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mimetype' do
    expect{dsc_xiismimetypemapping[:dsc_mimetype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mimetype' do
    expect{dsc_xiismimetypemapping[:dsc_mimetype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mimetype' do
    expect{dsc_xiismimetypemapping[:dsc_mimetype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xiismimetypemapping[:dsc_ensure] = 'Present'
    expect(dsc_xiismimetypemapping[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xiismimetypemapping[:dsc_ensure] = 'present'
    expect(dsc_xiismimetypemapping[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xiismimetypemapping[:dsc_ensure] = 'present'
    expect(dsc_xiismimetypemapping[:ensure]).to eq(dsc_xiismimetypemapping[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xiismimetypemapping[:dsc_ensure] = 'Absent'
    expect(dsc_xiismimetypemapping[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xiismimetypemapping[:dsc_ensure] = 'absent'
    expect(dsc_xiismimetypemapping[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xiismimetypemapping[:dsc_ensure] = 'absent'
    expect(dsc_xiismimetypemapping[:ensure]).to eq(dsc_xiismimetypemapping[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xiismimetypemapping[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xiismimetypemapping[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xiismimetypemapping[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xiismimetypemapping[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xiismimetypemapping[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xiismimetypemapping)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xiismimetypemapping)
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
        dsc_xiismimetypemapping.original_parameters[:dsc_ensure] = 'present'
        dsc_xiismimetypemapping[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xiismimetypemapping)
      end

      it "should update :ensure to :present" do
        expect(dsc_xiismimetypemapping[:ensure]).to eq(:present)
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
        dsc_xiismimetypemapping.original_parameters[:dsc_ensure] = 'absent'
        dsc_xiismimetypemapping[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xiismimetypemapping)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xiismimetypemapping[:ensure]).to eq(:absent)
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
