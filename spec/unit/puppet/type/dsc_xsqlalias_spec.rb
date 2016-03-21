#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xsqlalias) do

  let :dsc_xsqlalias do
    Puppet::Type.type(:dsc_xsqlalias).new(
      :name     => 'foo',
      :dsc_sqlservername => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xsqlalias).new(
      :name     => 'foo',
      :dsc_sqlservername => 'foo',
      :dsc_protocol => 'TCP',
      :dsc_servername => 'foo',
      :dsc_tcpport => -32,
      :dsc_pipename => 'foo',
      :dsc_ensure => 'Present',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xsqlalias.to_s).to eq("Dsc_xsqlalias[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xsqlalias[:ensure]).to eq :present
  end

  it 'should require that dsc_sqlservername is specified' do
    #dsc_xsqlalias[:dsc_sqlservername]
    expect { Puppet::Type.type(:dsc_xsqlalias).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_sqlservername is a required attribute/)
  end

  it 'should not accept array for dsc_sqlservername' do
    expect{dsc_xsqlalias[:dsc_sqlservername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sqlservername' do
    expect{dsc_xsqlalias[:dsc_sqlservername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sqlservername' do
    expect{dsc_xsqlalias[:dsc_sqlservername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sqlservername' do
    expect{dsc_xsqlalias[:dsc_sqlservername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_protocol predefined value TCP' do
    dsc_xsqlalias[:dsc_protocol] = 'TCP'
    expect(dsc_xsqlalias[:dsc_protocol]).to eq('TCP')
  end

  it 'should accept dsc_protocol predefined value tcp' do
    dsc_xsqlalias[:dsc_protocol] = 'tcp'
    expect(dsc_xsqlalias[:dsc_protocol]).to eq('tcp')
  end

  it 'should accept dsc_protocol predefined value NP' do
    dsc_xsqlalias[:dsc_protocol] = 'NP'
    expect(dsc_xsqlalias[:dsc_protocol]).to eq('NP')
  end

  it 'should accept dsc_protocol predefined value np' do
    dsc_xsqlalias[:dsc_protocol] = 'np'
    expect(dsc_xsqlalias[:dsc_protocol]).to eq('np')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlalias[:dsc_protocol] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_protocol' do
    expect{dsc_xsqlalias[:dsc_protocol] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_protocol' do
    expect{dsc_xsqlalias[:dsc_protocol] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_protocol' do
    expect{dsc_xsqlalias[:dsc_protocol] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_protocol' do
    expect{dsc_xsqlalias[:dsc_protocol] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_servername' do
    expect{dsc_xsqlalias[:dsc_servername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servername' do
    expect{dsc_xsqlalias[:dsc_servername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servername' do
    expect{dsc_xsqlalias[:dsc_servername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servername' do
    expect{dsc_xsqlalias[:dsc_servername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_tcpport' do
    expect{dsc_xsqlalias[:dsc_tcpport] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_tcpport' do
    expect{dsc_xsqlalias[:dsc_tcpport] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept int for dsc_tcpport' do
    dsc_xsqlalias[:dsc_tcpport] = -32
    expect(dsc_xsqlalias[:dsc_tcpport]).to eq(-32)
  end

  it 'should accept string-like int for dsc_tcpport' do
    dsc_xsqlalias[:dsc_tcpport] = '16'
    expect(dsc_xsqlalias[:dsc_tcpport]).to eq(16)
  end

  it 'should accept string-like int for dsc_tcpport' do
    dsc_xsqlalias[:dsc_tcpport] = '-16'
    expect(dsc_xsqlalias[:dsc_tcpport]).to eq(-16)
  end

  it 'should accept string-like int for dsc_tcpport' do
    dsc_xsqlalias[:dsc_tcpport] = '32'
    expect(dsc_xsqlalias[:dsc_tcpport]).to eq(32)
  end

  it 'should accept string-like int for dsc_tcpport' do
    dsc_xsqlalias[:dsc_tcpport] = '-32'
    expect(dsc_xsqlalias[:dsc_tcpport]).to eq(-32)
  end


  it 'should not accept array for dsc_pipename' do
    expect{dsc_xsqlalias[:dsc_pipename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_pipename' do
    expect{dsc_xsqlalias[:dsc_pipename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_pipename' do
    expect{dsc_xsqlalias[:dsc_pipename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_pipename' do
    expect{dsc_xsqlalias[:dsc_pipename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xsqlalias[:dsc_ensure] = 'Present'
    expect(dsc_xsqlalias[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xsqlalias[:dsc_ensure] = 'present'
    expect(dsc_xsqlalias[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlalias[:dsc_ensure] = 'present'
    expect(dsc_xsqlalias[:ensure]).to eq(dsc_xsqlalias[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xsqlalias[:dsc_ensure] = 'Absent'
    expect(dsc_xsqlalias[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xsqlalias[:dsc_ensure] = 'absent'
    expect(dsc_xsqlalias[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xsqlalias[:dsc_ensure] = 'absent'
    expect(dsc_xsqlalias[:ensure]).to eq(dsc_xsqlalias[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xsqlalias[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xsqlalias[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xsqlalias[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xsqlalias[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xsqlalias[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xsqlalias)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xsqlalias)
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
        dsc_xsqlalias.original_parameters[:dsc_ensure] = 'present'
        dsc_xsqlalias[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xsqlalias)
      end

      it "should update :ensure to :present" do
        expect(dsc_xsqlalias[:ensure]).to eq(:present)
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
        dsc_xsqlalias.original_parameters[:dsc_ensure] = 'absent'
        dsc_xsqlalias[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xsqlalias)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xsqlalias[:ensure]).to eq(:absent)
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
