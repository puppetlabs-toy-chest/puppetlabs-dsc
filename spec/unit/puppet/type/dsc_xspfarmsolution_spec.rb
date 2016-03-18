#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspfarmsolution) do

  let :dsc_xspfarmsolution do
    Puppet::Type.type(:dsc_xspfarmsolution).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspfarmsolution.to_s).to eq("Dsc_xspfarmsolution[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xspfarmsolution[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspfarmsolution[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspfarmsolution).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspfarmsolution[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspfarmsolution[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspfarmsolution[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspfarmsolution[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_literalpath' do
    expect{dsc_xspfarmsolution[:dsc_literalpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_literalpath' do
    expect{dsc_xspfarmsolution[:dsc_literalpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_literalpath' do
    expect{dsc_xspfarmsolution[:dsc_literalpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_literalpath' do
    expect{dsc_xspfarmsolution[:dsc_literalpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_webapplications' do
    dsc_xspfarmsolution[:dsc_webapplications] = ["foo", "bar", "spec"]
    expect(dsc_xspfarmsolution[:dsc_webapplications]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_webapplications' do
    expect{dsc_xspfarmsolution[:dsc_webapplications] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webapplications' do
    expect{dsc_xspfarmsolution[:dsc_webapplications] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webapplications' do
    expect{dsc_xspfarmsolution[:dsc_webapplications] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xspfarmsolution[:dsc_ensure] = 'Present'
    expect(dsc_xspfarmsolution[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xspfarmsolution[:dsc_ensure] = 'present'
    expect(dsc_xspfarmsolution[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspfarmsolution[:dsc_ensure] = 'present'
    expect(dsc_xspfarmsolution[:ensure]).to eq(dsc_xspfarmsolution[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspfarmsolution[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xspfarmsolution[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xspfarmsolution[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xspfarmsolution[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xspfarmsolution[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_version' do
    expect{dsc_xspfarmsolution[:dsc_version] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_version' do
    expect{dsc_xspfarmsolution[:dsc_version] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_version' do
    expect{dsc_xspfarmsolution[:dsc_version] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_version' do
    expect{dsc_xspfarmsolution[:dsc_version] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_deployed' do
    expect{dsc_xspfarmsolution[:dsc_deployed] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_deployed' do
    dsc_xspfarmsolution[:dsc_deployed] = true
    expect(dsc_xspfarmsolution[:dsc_deployed]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_deployed" do
    dsc_xspfarmsolution[:dsc_deployed] = 'true'
    expect(dsc_xspfarmsolution[:dsc_deployed]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_deployed" do
    dsc_xspfarmsolution[:dsc_deployed] = 'false'
    expect(dsc_xspfarmsolution[:dsc_deployed]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_deployed" do
    dsc_xspfarmsolution[:dsc_deployed] = 'True'
    expect(dsc_xspfarmsolution[:dsc_deployed]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_deployed" do
    dsc_xspfarmsolution[:dsc_deployed] = 'False'
    expect(dsc_xspfarmsolution[:dsc_deployed]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_deployed" do
    dsc_xspfarmsolution[:dsc_deployed] = :true
    expect(dsc_xspfarmsolution[:dsc_deployed]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_deployed" do
    dsc_xspfarmsolution[:dsc_deployed] = :false
    expect(dsc_xspfarmsolution[:dsc_deployed]).to eq(false)
  end

  it 'should not accept int for dsc_deployed' do
    expect{dsc_xspfarmsolution[:dsc_deployed] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_deployed' do
    expect{dsc_xspfarmsolution[:dsc_deployed] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspfarmsolution[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspfarmsolution[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspfarmsolution[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspfarmsolution[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspfarmsolution[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspfarmsolution)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspfarmsolution)
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
        dsc_xspfarmsolution.original_parameters[:dsc_ensure] = 'present'
        dsc_xspfarmsolution[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xspfarmsolution)
      end

      it "should update :ensure to :present" do
        expect(dsc_xspfarmsolution[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end


    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
