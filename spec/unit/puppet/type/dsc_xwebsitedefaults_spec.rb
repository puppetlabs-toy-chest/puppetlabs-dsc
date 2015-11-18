#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwebsitedefaults) do

  let :dsc_xwebsitedefaults do
    Puppet::Type.type(:dsc_xwebsitedefaults).new(
      :name     => 'foo',
      :dsc_applyto => 'Machine',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwebsitedefaults.to_s).to eq("Dsc_xwebsitedefaults[foo]")
  end

  it 'should require that dsc_applyto is specified' do
    #dsc_xwebsitedefaults[:dsc_applyto]
    expect { Puppet::Type.type(:dsc_xwebsitedefaults).new(
      :name     => 'foo',
      :dsc_logformat => 'W3C',
      :dsc_logdirectory => 'foo',
      :dsc_tracelogdirectory => 'foo',
      :dsc_defaultapplicationpool => 'foo',
      :dsc_allowsubdirconfig => 'true',
    )}.to raise_error(Puppet::Error, /dsc_applyto is a required attribute/)
  end

  it 'should accept dsc_applyto predefined value Machine' do
    dsc_xwebsitedefaults[:dsc_applyto] = 'Machine'
    expect(dsc_xwebsitedefaults[:dsc_applyto]).to eq('Machine')
  end

  it 'should accept dsc_applyto predefined value machine' do
    dsc_xwebsitedefaults[:dsc_applyto] = 'machine'
    expect(dsc_xwebsitedefaults[:dsc_applyto]).to eq('machine')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebsitedefaults[:dsc_applyto] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applyto' do
    expect{dsc_xwebsitedefaults[:dsc_applyto] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applyto' do
    expect{dsc_xwebsitedefaults[:dsc_applyto] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applyto' do
    expect{dsc_xwebsitedefaults[:dsc_applyto] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applyto' do
    expect{dsc_xwebsitedefaults[:dsc_applyto] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_logformat predefined value W3C' do
    dsc_xwebsitedefaults[:dsc_logformat] = 'W3C'
    expect(dsc_xwebsitedefaults[:dsc_logformat]).to eq('W3C')
  end

  it 'should accept dsc_logformat predefined value w3c' do
    dsc_xwebsitedefaults[:dsc_logformat] = 'w3c'
    expect(dsc_xwebsitedefaults[:dsc_logformat]).to eq('w3c')
  end

  it 'should accept dsc_logformat predefined value IIS' do
    dsc_xwebsitedefaults[:dsc_logformat] = 'IIS'
    expect(dsc_xwebsitedefaults[:dsc_logformat]).to eq('IIS')
  end

  it 'should accept dsc_logformat predefined value iis' do
    dsc_xwebsitedefaults[:dsc_logformat] = 'iis'
    expect(dsc_xwebsitedefaults[:dsc_logformat]).to eq('iis')
  end

  it 'should accept dsc_logformat predefined value NCSA' do
    dsc_xwebsitedefaults[:dsc_logformat] = 'NCSA'
    expect(dsc_xwebsitedefaults[:dsc_logformat]).to eq('NCSA')
  end

  it 'should accept dsc_logformat predefined value ncsa' do
    dsc_xwebsitedefaults[:dsc_logformat] = 'ncsa'
    expect(dsc_xwebsitedefaults[:dsc_logformat]).to eq('ncsa')
  end

  it 'should accept dsc_logformat predefined value Custom' do
    dsc_xwebsitedefaults[:dsc_logformat] = 'Custom'
    expect(dsc_xwebsitedefaults[:dsc_logformat]).to eq('Custom')
  end

  it 'should accept dsc_logformat predefined value custom' do
    dsc_xwebsitedefaults[:dsc_logformat] = 'custom'
    expect(dsc_xwebsitedefaults[:dsc_logformat]).to eq('custom')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebsitedefaults[:dsc_logformat] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logformat' do
    expect{dsc_xwebsitedefaults[:dsc_logformat] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logformat' do
    expect{dsc_xwebsitedefaults[:dsc_logformat] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logformat' do
    expect{dsc_xwebsitedefaults[:dsc_logformat] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logformat' do
    expect{dsc_xwebsitedefaults[:dsc_logformat] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logdirectory' do
    expect{dsc_xwebsitedefaults[:dsc_logdirectory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logdirectory' do
    expect{dsc_xwebsitedefaults[:dsc_logdirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logdirectory' do
    expect{dsc_xwebsitedefaults[:dsc_logdirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logdirectory' do
    expect{dsc_xwebsitedefaults[:dsc_logdirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tracelogdirectory' do
    expect{dsc_xwebsitedefaults[:dsc_tracelogdirectory] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tracelogdirectory' do
    expect{dsc_xwebsitedefaults[:dsc_tracelogdirectory] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_tracelogdirectory' do
    expect{dsc_xwebsitedefaults[:dsc_tracelogdirectory] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_tracelogdirectory' do
    expect{dsc_xwebsitedefaults[:dsc_tracelogdirectory] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_defaultapplicationpool' do
    expect{dsc_xwebsitedefaults[:dsc_defaultapplicationpool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_defaultapplicationpool' do
    expect{dsc_xwebsitedefaults[:dsc_defaultapplicationpool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_defaultapplicationpool' do
    expect{dsc_xwebsitedefaults[:dsc_defaultapplicationpool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_defaultapplicationpool' do
    expect{dsc_xwebsitedefaults[:dsc_defaultapplicationpool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_allowsubdirconfig predefined value true' do
    dsc_xwebsitedefaults[:dsc_allowsubdirconfig] = 'true'
    expect(dsc_xwebsitedefaults[:dsc_allowsubdirconfig]).to eq('true')
  end

  it 'should accept dsc_allowsubdirconfig predefined value true' do
    dsc_xwebsitedefaults[:dsc_allowsubdirconfig] = 'true'
    expect(dsc_xwebsitedefaults[:dsc_allowsubdirconfig]).to eq('true')
  end

  it 'should accept dsc_allowsubdirconfig predefined value false' do
    dsc_xwebsitedefaults[:dsc_allowsubdirconfig] = 'false'
    expect(dsc_xwebsitedefaults[:dsc_allowsubdirconfig]).to eq('false')
  end

  it 'should accept dsc_allowsubdirconfig predefined value false' do
    dsc_xwebsitedefaults[:dsc_allowsubdirconfig] = 'false'
    expect(dsc_xwebsitedefaults[:dsc_allowsubdirconfig]).to eq('false')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebsitedefaults[:dsc_allowsubdirconfig] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowsubdirconfig' do
    expect{dsc_xwebsitedefaults[:dsc_allowsubdirconfig] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_allowsubdirconfig' do
    expect{dsc_xwebsitedefaults[:dsc_allowsubdirconfig] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_allowsubdirconfig' do
    expect{dsc_xwebsitedefaults[:dsc_allowsubdirconfig] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowsubdirconfig' do
    expect{dsc_xwebsitedefaults[:dsc_allowsubdirconfig] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwebsitedefaults)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwebsitedefaults)
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
