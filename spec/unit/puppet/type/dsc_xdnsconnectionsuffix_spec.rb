#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdnsconnectionsuffix) do

  let :dsc_xdnsconnectionsuffix do
    Puppet::Type.type(:dsc_xdnsconnectionsuffix).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xdnsconnectionsuffix).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
      :dsc_connectionspecificsuffix => 'foo',
      :dsc_registerthisconnectionsaddress => true,
      :dsc_usesuffixwhenregistering => true,
      :dsc_ensure => 'Present',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xdnsconnectionsuffix.to_s).to eq("Dsc_xdnsconnectionsuffix[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdnsconnectionsuffix[:ensure]).to eq :present
  end

  it 'should require that dsc_interfacealias is specified' do
    #dsc_xdnsconnectionsuffix[:dsc_interfacealias]
    expect { Puppet::Type.type(:dsc_xdnsconnectionsuffix).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_interfacealias is a required attribute/)
  end

  it 'should not accept array for dsc_interfacealias' do
    expect{dsc_xdnsconnectionsuffix[:dsc_interfacealias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_interfacealias' do
    expect{dsc_xdnsconnectionsuffix[:dsc_interfacealias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_interfacealias' do
    expect{dsc_xdnsconnectionsuffix[:dsc_interfacealias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_interfacealias' do
    expect{dsc_xdnsconnectionsuffix[:dsc_interfacealias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectionspecificsuffix' do
    expect{dsc_xdnsconnectionsuffix[:dsc_connectionspecificsuffix] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectionspecificsuffix' do
    expect{dsc_xdnsconnectionsuffix[:dsc_connectionspecificsuffix] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectionspecificsuffix' do
    expect{dsc_xdnsconnectionsuffix[:dsc_connectionspecificsuffix] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectionspecificsuffix' do
    expect{dsc_xdnsconnectionsuffix[:dsc_connectionspecificsuffix] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_registerthisconnectionsaddress' do
    expect{dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_registerthisconnectionsaddress' do
    dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress] = true
    expect(dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_registerthisconnectionsaddress" do
    dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress] = 'true'
    expect(dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_registerthisconnectionsaddress" do
    dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress] = 'false'
    expect(dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_registerthisconnectionsaddress" do
    dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress] = 'True'
    expect(dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_registerthisconnectionsaddress" do
    dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress] = 'False'
    expect(dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_registerthisconnectionsaddress" do
    dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress] = :true
    expect(dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_registerthisconnectionsaddress" do
    dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress] = :false
    expect(dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress]).to eq(false)
  end

  it 'should not accept int for dsc_registerthisconnectionsaddress' do
    expect{dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_registerthisconnectionsaddress' do
    expect{dsc_xdnsconnectionsuffix[:dsc_registerthisconnectionsaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usesuffixwhenregistering' do
    expect{dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_usesuffixwhenregistering' do
    dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering] = true
    expect(dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_usesuffixwhenregistering" do
    dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering] = 'true'
    expect(dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_usesuffixwhenregistering" do
    dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering] = 'false'
    expect(dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_usesuffixwhenregistering" do
    dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering] = 'True'
    expect(dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_usesuffixwhenregistering" do
    dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering] = 'False'
    expect(dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_usesuffixwhenregistering" do
    dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering] = :true
    expect(dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_usesuffixwhenregistering" do
    dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering] = :false
    expect(dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering]).to eq(false)
  end

  it 'should not accept int for dsc_usesuffixwhenregistering' do
    expect{dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usesuffixwhenregistering' do
    expect{dsc_xdnsconnectionsuffix[:dsc_usesuffixwhenregistering] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdnsconnectionsuffix[:dsc_ensure] = 'Present'
    expect(dsc_xdnsconnectionsuffix[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdnsconnectionsuffix[:dsc_ensure] = 'present'
    expect(dsc_xdnsconnectionsuffix[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdnsconnectionsuffix[:dsc_ensure] = 'present'
    expect(dsc_xdnsconnectionsuffix[:ensure]).to eq(dsc_xdnsconnectionsuffix[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdnsconnectionsuffix[:dsc_ensure] = 'Absent'
    expect(dsc_xdnsconnectionsuffix[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdnsconnectionsuffix[:dsc_ensure] = 'absent'
    expect(dsc_xdnsconnectionsuffix[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdnsconnectionsuffix[:dsc_ensure] = 'absent'
    expect(dsc_xdnsconnectionsuffix[:ensure]).to eq(dsc_xdnsconnectionsuffix[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdnsconnectionsuffix[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdnsconnectionsuffix[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdnsconnectionsuffix[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdnsconnectionsuffix[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdnsconnectionsuffix[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdnsconnectionsuffix)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdnsconnectionsuffix)
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
        dsc_xdnsconnectionsuffix.original_parameters[:dsc_ensure] = 'present'
        dsc_xdnsconnectionsuffix[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xdnsconnectionsuffix)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdnsconnectionsuffix[:ensure]).to eq(:present)
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
        dsc_xdnsconnectionsuffix.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdnsconnectionsuffix[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xdnsconnectionsuffix)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdnsconnectionsuffix[:ensure]).to eq(:absent)
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
