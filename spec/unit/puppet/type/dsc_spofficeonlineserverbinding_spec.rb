#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spofficeonlineserverbinding) do

  let :dsc_spofficeonlineserverbinding do
    Puppet::Type.type(:dsc_spofficeonlineserverbinding).new(
      :name     => 'foo',
      :dsc_zone => 'Internal-HTTP',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spofficeonlineserverbinding).new(
      :name     => 'foo',
      :dsc_zone => 'Internal-HTTP',
      :dsc_dnsname => 'foo',
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spofficeonlineserverbinding.to_s).to eq("Dsc_spofficeonlineserverbinding[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spofficeonlineserverbinding[:ensure]).to eq :present
  end

  it 'should require that dsc_zone is specified' do
    #dsc_spofficeonlineserverbinding[:dsc_zone]
    expect { Puppet::Type.type(:dsc_spofficeonlineserverbinding).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_zone is a required attribute/)
  end

  it 'should accept dsc_zone predefined value Internal-HTTP' do
    dsc_spofficeonlineserverbinding[:dsc_zone] = 'Internal-HTTP'
    expect(dsc_spofficeonlineserverbinding[:dsc_zone]).to eq('Internal-HTTP')
  end

  it 'should accept dsc_zone predefined value internal-http' do
    dsc_spofficeonlineserverbinding[:dsc_zone] = 'internal-http'
    expect(dsc_spofficeonlineserverbinding[:dsc_zone]).to eq('internal-http')
  end

  it 'should accept dsc_zone predefined value Internal-HTTPS' do
    dsc_spofficeonlineserverbinding[:dsc_zone] = 'Internal-HTTPS'
    expect(dsc_spofficeonlineserverbinding[:dsc_zone]).to eq('Internal-HTTPS')
  end

  it 'should accept dsc_zone predefined value internal-https' do
    dsc_spofficeonlineserverbinding[:dsc_zone] = 'internal-https'
    expect(dsc_spofficeonlineserverbinding[:dsc_zone]).to eq('internal-https')
  end

  it 'should accept dsc_zone predefined value External-HTTP' do
    dsc_spofficeonlineserverbinding[:dsc_zone] = 'External-HTTP'
    expect(dsc_spofficeonlineserverbinding[:dsc_zone]).to eq('External-HTTP')
  end

  it 'should accept dsc_zone predefined value external-http' do
    dsc_spofficeonlineserverbinding[:dsc_zone] = 'external-http'
    expect(dsc_spofficeonlineserverbinding[:dsc_zone]).to eq('external-http')
  end

  it 'should accept dsc_zone predefined value External-HTTPS' do
    dsc_spofficeonlineserverbinding[:dsc_zone] = 'External-HTTPS'
    expect(dsc_spofficeonlineserverbinding[:dsc_zone]).to eq('External-HTTPS')
  end

  it 'should accept dsc_zone predefined value external-https' do
    dsc_spofficeonlineserverbinding[:dsc_zone] = 'external-https'
    expect(dsc_spofficeonlineserverbinding[:dsc_zone]).to eq('external-https')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spofficeonlineserverbinding[:dsc_zone] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_zone' do
    expect{dsc_spofficeonlineserverbinding[:dsc_zone] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_zone' do
    expect{dsc_spofficeonlineserverbinding[:dsc_zone] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_zone' do
    expect{dsc_spofficeonlineserverbinding[:dsc_zone] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_zone' do
    expect{dsc_spofficeonlineserverbinding[:dsc_zone] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dnsname' do
    expect{dsc_spofficeonlineserverbinding[:dsc_dnsname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dnsname' do
    expect{dsc_spofficeonlineserverbinding[:dsc_dnsname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dnsname' do
    expect{dsc_spofficeonlineserverbinding[:dsc_dnsname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dnsname' do
    expect{dsc_spofficeonlineserverbinding[:dsc_dnsname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spofficeonlineserverbinding[:dsc_ensure] = 'Present'
    expect(dsc_spofficeonlineserverbinding[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spofficeonlineserverbinding[:dsc_ensure] = 'present'
    expect(dsc_spofficeonlineserverbinding[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spofficeonlineserverbinding[:dsc_ensure] = 'present'
    expect(dsc_spofficeonlineserverbinding[:ensure]).to eq(dsc_spofficeonlineserverbinding[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spofficeonlineserverbinding[:dsc_ensure] = 'Absent'
    expect(dsc_spofficeonlineserverbinding[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spofficeonlineserverbinding[:dsc_ensure] = 'absent'
    expect(dsc_spofficeonlineserverbinding[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spofficeonlineserverbinding[:dsc_ensure] = 'absent'
    expect(dsc_spofficeonlineserverbinding[:ensure]).to eq(dsc_spofficeonlineserverbinding[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spofficeonlineserverbinding[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spofficeonlineserverbinding[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spofficeonlineserverbinding[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spofficeonlineserverbinding[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spofficeonlineserverbinding[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spofficeonlineserverbinding[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spofficeonlineserverbinding[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spofficeonlineserverbinding[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spofficeonlineserverbinding[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spofficeonlineserverbinding[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spofficeonlineserverbinding)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spofficeonlineserverbinding)
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
        dsc_spofficeonlineserverbinding.original_parameters[:dsc_ensure] = 'present'
        dsc_spofficeonlineserverbinding[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spofficeonlineserverbinding)
      end

      it "should update :ensure to :present" do
        expect(dsc_spofficeonlineserverbinding[:ensure]).to eq(:present)
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
        dsc_spofficeonlineserverbinding.original_parameters[:dsc_ensure] = 'absent'
        dsc_spofficeonlineserverbinding[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spofficeonlineserverbinding)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spofficeonlineserverbinding[:ensure]).to eq(:absent)
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
