#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwebapppooldefaults) do

  let :dsc_xwebapppooldefaults do
    Puppet::Type.type(:dsc_xwebapppooldefaults).new(
      :name     => 'foo',
      :dsc_applyto => 'Machine',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwebapppooldefaults.to_s).to eq("Dsc_xwebapppooldefaults[foo]")
  end

  it 'should require that dsc_applyto is specified' do
    #dsc_xwebapppooldefaults[:dsc_applyto]
    expect { Puppet::Type.type(:dsc_xwebapppooldefaults).new(
      :name     => 'foo',
      :dsc_managedruntimeversion => '',
      :dsc_identitytype => 'ApplicationPoolIdentity',
    )}.to raise_error(Puppet::Error, /dsc_applyto is a required attribute/)
  end

  it 'should accept dsc_applyto predefined value Machine' do
    dsc_xwebapppooldefaults[:dsc_applyto] = 'Machine'
    expect(dsc_xwebapppooldefaults[:dsc_applyto]).to eq('Machine')
  end

  it 'should accept dsc_applyto predefined value machine' do
    dsc_xwebapppooldefaults[:dsc_applyto] = 'machine'
    expect(dsc_xwebapppooldefaults[:dsc_applyto]).to eq('machine')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppooldefaults[:dsc_applyto] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applyto' do
    expect{dsc_xwebapppooldefaults[:dsc_applyto] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applyto' do
    expect{dsc_xwebapppooldefaults[:dsc_applyto] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applyto' do
    expect{dsc_xwebapppooldefaults[:dsc_applyto] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applyto' do
    expect{dsc_xwebapppooldefaults[:dsc_applyto] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_managedruntimeversion predefined value ' do
    dsc_xwebapppooldefaults[:dsc_managedruntimeversion] = ''
    expect(dsc_xwebapppooldefaults[:dsc_managedruntimeversion]).to eq('')
  end

  it 'should accept dsc_managedruntimeversion predefined value ' do
    dsc_xwebapppooldefaults[:dsc_managedruntimeversion] = ''
    expect(dsc_xwebapppooldefaults[:dsc_managedruntimeversion]).to eq('')
  end

  it 'should accept dsc_managedruntimeversion predefined value v2.0' do
    dsc_xwebapppooldefaults[:dsc_managedruntimeversion] = 'v2.0'
    expect(dsc_xwebapppooldefaults[:dsc_managedruntimeversion]).to eq('v2.0')
  end

  it 'should accept dsc_managedruntimeversion predefined value v2.0' do
    dsc_xwebapppooldefaults[:dsc_managedruntimeversion] = 'v2.0'
    expect(dsc_xwebapppooldefaults[:dsc_managedruntimeversion]).to eq('v2.0')
  end

  it 'should accept dsc_managedruntimeversion predefined value v4.0' do
    dsc_xwebapppooldefaults[:dsc_managedruntimeversion] = 'v4.0'
    expect(dsc_xwebapppooldefaults[:dsc_managedruntimeversion]).to eq('v4.0')
  end

  it 'should accept dsc_managedruntimeversion predefined value v4.0' do
    dsc_xwebapppooldefaults[:dsc_managedruntimeversion] = 'v4.0'
    expect(dsc_xwebapppooldefaults[:dsc_managedruntimeversion]).to eq('v4.0')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppooldefaults[:dsc_managedruntimeversion] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_managedruntimeversion' do
    expect{dsc_xwebapppooldefaults[:dsc_managedruntimeversion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_managedruntimeversion' do
    expect{dsc_xwebapppooldefaults[:dsc_managedruntimeversion] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_managedruntimeversion' do
    expect{dsc_xwebapppooldefaults[:dsc_managedruntimeversion] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_managedruntimeversion' do
    expect{dsc_xwebapppooldefaults[:dsc_managedruntimeversion] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_identitytype predefined value ApplicationPoolIdentity' do
    dsc_xwebapppooldefaults[:dsc_identitytype] = 'ApplicationPoolIdentity'
    expect(dsc_xwebapppooldefaults[:dsc_identitytype]).to eq('ApplicationPoolIdentity')
  end

  it 'should accept dsc_identitytype predefined value applicationpoolidentity' do
    dsc_xwebapppooldefaults[:dsc_identitytype] = 'applicationpoolidentity'
    expect(dsc_xwebapppooldefaults[:dsc_identitytype]).to eq('applicationpoolidentity')
  end

  it 'should accept dsc_identitytype predefined value LocalService' do
    dsc_xwebapppooldefaults[:dsc_identitytype] = 'LocalService'
    expect(dsc_xwebapppooldefaults[:dsc_identitytype]).to eq('LocalService')
  end

  it 'should accept dsc_identitytype predefined value localservice' do
    dsc_xwebapppooldefaults[:dsc_identitytype] = 'localservice'
    expect(dsc_xwebapppooldefaults[:dsc_identitytype]).to eq('localservice')
  end

  it 'should accept dsc_identitytype predefined value LocalSystem' do
    dsc_xwebapppooldefaults[:dsc_identitytype] = 'LocalSystem'
    expect(dsc_xwebapppooldefaults[:dsc_identitytype]).to eq('LocalSystem')
  end

  it 'should accept dsc_identitytype predefined value localsystem' do
    dsc_xwebapppooldefaults[:dsc_identitytype] = 'localsystem'
    expect(dsc_xwebapppooldefaults[:dsc_identitytype]).to eq('localsystem')
  end

  it 'should accept dsc_identitytype predefined value NetworkService' do
    dsc_xwebapppooldefaults[:dsc_identitytype] = 'NetworkService'
    expect(dsc_xwebapppooldefaults[:dsc_identitytype]).to eq('NetworkService')
  end

  it 'should accept dsc_identitytype predefined value networkservice' do
    dsc_xwebapppooldefaults[:dsc_identitytype] = 'networkservice'
    expect(dsc_xwebapppooldefaults[:dsc_identitytype]).to eq('networkservice')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapppooldefaults[:dsc_identitytype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_identitytype' do
    expect{dsc_xwebapppooldefaults[:dsc_identitytype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identitytype' do
    expect{dsc_xwebapppooldefaults[:dsc_identitytype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identitytype' do
    expect{dsc_xwebapppooldefaults[:dsc_identitytype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identitytype' do
    expect{dsc_xwebapppooldefaults[:dsc_identitytype] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwebapppooldefaults)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwebapppooldefaults)
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
