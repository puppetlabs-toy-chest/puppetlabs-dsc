#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spwebapplicationappdomain) do

  let :dsc_spwebapplicationappdomain do
    Puppet::Type.type(:dsc_spwebapplicationappdomain).new(
      :name     => 'foo',
      :dsc_webapplication => 'foo',
      :dsc_zone => 'Default',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spwebapplicationappdomain).new(
      :name     => 'foo',
      :dsc_webapplication => 'foo',
      :dsc_zone => 'Default',
      :dsc_appdomain => 'foo',
      :dsc_port => 'foo',
      :dsc_ssl => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spwebapplicationappdomain.to_s).to eq("Dsc_spwebapplicationappdomain[foo]")
  end

  it 'should require that dsc_webapplication is specified' do
    #dsc_spwebapplicationappdomain[:dsc_webapplication]
    expect { Puppet::Type.type(:dsc_spwebapplicationappdomain).new(
      :name     => 'foo',
      :dsc_zone => 'Default',
    )}.to raise_error(Puppet::Error, /dsc_webapplication is a required attribute/)
  end

  it 'should not accept array for dsc_webapplication' do
    expect{dsc_spwebapplicationappdomain[:dsc_webapplication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webapplication' do
    expect{dsc_spwebapplicationappdomain[:dsc_webapplication] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webapplication' do
    expect{dsc_spwebapplicationappdomain[:dsc_webapplication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webapplication' do
    expect{dsc_spwebapplicationappdomain[:dsc_webapplication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_zone is specified' do
    #dsc_spwebapplicationappdomain[:dsc_zone]
    expect { Puppet::Type.type(:dsc_spwebapplicationappdomain).new(
      :name     => 'foo',
      :dsc_webapplication => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_zone is a required attribute/)
  end

  it 'should accept dsc_zone predefined value Default' do
    dsc_spwebapplicationappdomain[:dsc_zone] = 'Default'
    expect(dsc_spwebapplicationappdomain[:dsc_zone]).to eq('Default')
  end

  it 'should accept dsc_zone predefined value default' do
    dsc_spwebapplicationappdomain[:dsc_zone] = 'default'
    expect(dsc_spwebapplicationappdomain[:dsc_zone]).to eq('default')
  end

  it 'should accept dsc_zone predefined value Internet' do
    dsc_spwebapplicationappdomain[:dsc_zone] = 'Internet'
    expect(dsc_spwebapplicationappdomain[:dsc_zone]).to eq('Internet')
  end

  it 'should accept dsc_zone predefined value internet' do
    dsc_spwebapplicationappdomain[:dsc_zone] = 'internet'
    expect(dsc_spwebapplicationappdomain[:dsc_zone]).to eq('internet')
  end

  it 'should accept dsc_zone predefined value Intranet' do
    dsc_spwebapplicationappdomain[:dsc_zone] = 'Intranet'
    expect(dsc_spwebapplicationappdomain[:dsc_zone]).to eq('Intranet')
  end

  it 'should accept dsc_zone predefined value intranet' do
    dsc_spwebapplicationappdomain[:dsc_zone] = 'intranet'
    expect(dsc_spwebapplicationappdomain[:dsc_zone]).to eq('intranet')
  end

  it 'should accept dsc_zone predefined value Extranet' do
    dsc_spwebapplicationappdomain[:dsc_zone] = 'Extranet'
    expect(dsc_spwebapplicationappdomain[:dsc_zone]).to eq('Extranet')
  end

  it 'should accept dsc_zone predefined value extranet' do
    dsc_spwebapplicationappdomain[:dsc_zone] = 'extranet'
    expect(dsc_spwebapplicationappdomain[:dsc_zone]).to eq('extranet')
  end

  it 'should accept dsc_zone predefined value Custom' do
    dsc_spwebapplicationappdomain[:dsc_zone] = 'Custom'
    expect(dsc_spwebapplicationappdomain[:dsc_zone]).to eq('Custom')
  end

  it 'should accept dsc_zone predefined value custom' do
    dsc_spwebapplicationappdomain[:dsc_zone] = 'custom'
    expect(dsc_spwebapplicationappdomain[:dsc_zone]).to eq('custom')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spwebapplicationappdomain[:dsc_zone] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_zone' do
    expect{dsc_spwebapplicationappdomain[:dsc_zone] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_zone' do
    expect{dsc_spwebapplicationappdomain[:dsc_zone] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_zone' do
    expect{dsc_spwebapplicationappdomain[:dsc_zone] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_zone' do
    expect{dsc_spwebapplicationappdomain[:dsc_zone] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_appdomain' do
    expect{dsc_spwebapplicationappdomain[:dsc_appdomain] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_appdomain' do
    expect{dsc_spwebapplicationappdomain[:dsc_appdomain] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_appdomain' do
    expect{dsc_spwebapplicationappdomain[:dsc_appdomain] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_appdomain' do
    expect{dsc_spwebapplicationappdomain[:dsc_appdomain] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_port' do
    expect{dsc_spwebapplicationappdomain[:dsc_port] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_port' do
    expect{dsc_spwebapplicationappdomain[:dsc_port] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_port' do
    expect{dsc_spwebapplicationappdomain[:dsc_port] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_port' do
    expect{dsc_spwebapplicationappdomain[:dsc_port] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ssl' do
    expect{dsc_spwebapplicationappdomain[:dsc_ssl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_ssl' do
    dsc_spwebapplicationappdomain[:dsc_ssl] = true
    expect(dsc_spwebapplicationappdomain[:dsc_ssl]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_ssl" do
    dsc_spwebapplicationappdomain[:dsc_ssl] = 'true'
    expect(dsc_spwebapplicationappdomain[:dsc_ssl]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_ssl" do
    dsc_spwebapplicationappdomain[:dsc_ssl] = 'false'
    expect(dsc_spwebapplicationappdomain[:dsc_ssl]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_ssl" do
    dsc_spwebapplicationappdomain[:dsc_ssl] = 'True'
    expect(dsc_spwebapplicationappdomain[:dsc_ssl]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_ssl" do
    dsc_spwebapplicationappdomain[:dsc_ssl] = 'False'
    expect(dsc_spwebapplicationappdomain[:dsc_ssl]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_ssl" do
    dsc_spwebapplicationappdomain[:dsc_ssl] = :true
    expect(dsc_spwebapplicationappdomain[:dsc_ssl]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_ssl" do
    dsc_spwebapplicationappdomain[:dsc_ssl] = :false
    expect(dsc_spwebapplicationappdomain[:dsc_ssl]).to eq(false)
  end

  it 'should not accept int for dsc_ssl' do
    expect{dsc_spwebapplicationappdomain[:dsc_ssl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ssl' do
    expect{dsc_spwebapplicationappdomain[:dsc_ssl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spwebapplicationappdomain[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spwebapplicationappdomain[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spwebapplicationappdomain[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spwebapplicationappdomain[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spwebapplicationappdomain[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spwebapplicationappdomain)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spwebapplicationappdomain)
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

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
