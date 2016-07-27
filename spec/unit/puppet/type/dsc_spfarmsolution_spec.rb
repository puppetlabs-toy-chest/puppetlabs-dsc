#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spfarmsolution) do

  let :dsc_spfarmsolution do
    Puppet::Type.type(:dsc_spfarmsolution).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spfarmsolution).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_literalpath => 'foo',
      :dsc_webapplications => ["foo", "bar", "spec"],
      :dsc_ensure => 'Present',
      :dsc_version => 'foo',
      :dsc_deployed => true,
      :dsc_solutionlevel => '14',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spfarmsolution.to_s).to eq("Dsc_spfarmsolution[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spfarmsolution[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_spfarmsolution[:dsc_name]
    expect { Puppet::Type.type(:dsc_spfarmsolution).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spfarmsolution[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spfarmsolution[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spfarmsolution[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spfarmsolution[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_literalpath' do
    expect{dsc_spfarmsolution[:dsc_literalpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_literalpath' do
    expect{dsc_spfarmsolution[:dsc_literalpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_literalpath' do
    expect{dsc_spfarmsolution[:dsc_literalpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_literalpath' do
    expect{dsc_spfarmsolution[:dsc_literalpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_webapplications' do
    dsc_spfarmsolution[:dsc_webapplications] = ["foo", "bar", "spec"]
    expect(dsc_spfarmsolution[:dsc_webapplications]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_webapplications' do
    expect{dsc_spfarmsolution[:dsc_webapplications] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webapplications' do
    expect{dsc_spfarmsolution[:dsc_webapplications] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webapplications' do
    expect{dsc_spfarmsolution[:dsc_webapplications] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spfarmsolution[:dsc_ensure] = 'Present'
    expect(dsc_spfarmsolution[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spfarmsolution[:dsc_ensure] = 'present'
    expect(dsc_spfarmsolution[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spfarmsolution[:dsc_ensure] = 'present'
    expect(dsc_spfarmsolution[:ensure]).to eq(dsc_spfarmsolution[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spfarmsolution[:dsc_ensure] = 'Absent'
    expect(dsc_spfarmsolution[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spfarmsolution[:dsc_ensure] = 'absent'
    expect(dsc_spfarmsolution[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spfarmsolution[:dsc_ensure] = 'absent'
    expect(dsc_spfarmsolution[:ensure]).to eq(dsc_spfarmsolution[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spfarmsolution[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spfarmsolution[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spfarmsolution[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spfarmsolution[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spfarmsolution[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_version' do
    expect{dsc_spfarmsolution[:dsc_version] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_version' do
    expect{dsc_spfarmsolution[:dsc_version] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_version' do
    expect{dsc_spfarmsolution[:dsc_version] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_version' do
    expect{dsc_spfarmsolution[:dsc_version] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_deployed' do
    expect{dsc_spfarmsolution[:dsc_deployed] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_deployed' do
    dsc_spfarmsolution[:dsc_deployed] = true
    expect(dsc_spfarmsolution[:dsc_deployed]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_deployed" do
    dsc_spfarmsolution[:dsc_deployed] = 'true'
    expect(dsc_spfarmsolution[:dsc_deployed]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_deployed" do
    dsc_spfarmsolution[:dsc_deployed] = 'false'
    expect(dsc_spfarmsolution[:dsc_deployed]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_deployed" do
    dsc_spfarmsolution[:dsc_deployed] = 'True'
    expect(dsc_spfarmsolution[:dsc_deployed]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_deployed" do
    dsc_spfarmsolution[:dsc_deployed] = 'False'
    expect(dsc_spfarmsolution[:dsc_deployed]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_deployed" do
    dsc_spfarmsolution[:dsc_deployed] = :true
    expect(dsc_spfarmsolution[:dsc_deployed]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_deployed" do
    dsc_spfarmsolution[:dsc_deployed] = :false
    expect(dsc_spfarmsolution[:dsc_deployed]).to eq(false)
  end

  it 'should not accept int for dsc_deployed' do
    expect{dsc_spfarmsolution[:dsc_deployed] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_deployed' do
    expect{dsc_spfarmsolution[:dsc_deployed] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_solutionlevel predefined value 14' do
    dsc_spfarmsolution[:dsc_solutionlevel] = '14'
    expect(dsc_spfarmsolution[:dsc_solutionlevel]).to eq('14')
  end

  it 'should accept dsc_solutionlevel predefined value 14' do
    dsc_spfarmsolution[:dsc_solutionlevel] = '14'
    expect(dsc_spfarmsolution[:dsc_solutionlevel]).to eq('14')
  end

  it 'should accept dsc_solutionlevel predefined value 15' do
    dsc_spfarmsolution[:dsc_solutionlevel] = '15'
    expect(dsc_spfarmsolution[:dsc_solutionlevel]).to eq('15')
  end

  it 'should accept dsc_solutionlevel predefined value 15' do
    dsc_spfarmsolution[:dsc_solutionlevel] = '15'
    expect(dsc_spfarmsolution[:dsc_solutionlevel]).to eq('15')
  end

  it 'should accept dsc_solutionlevel predefined value All' do
    dsc_spfarmsolution[:dsc_solutionlevel] = 'All'
    expect(dsc_spfarmsolution[:dsc_solutionlevel]).to eq('All')
  end

  it 'should accept dsc_solutionlevel predefined value all' do
    dsc_spfarmsolution[:dsc_solutionlevel] = 'all'
    expect(dsc_spfarmsolution[:dsc_solutionlevel]).to eq('all')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spfarmsolution[:dsc_solutionlevel] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_solutionlevel' do
    expect{dsc_spfarmsolution[:dsc_solutionlevel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_solutionlevel' do
    expect{dsc_spfarmsolution[:dsc_solutionlevel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_solutionlevel' do
    expect{dsc_spfarmsolution[:dsc_solutionlevel] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_solutionlevel' do
    expect{dsc_spfarmsolution[:dsc_solutionlevel] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spfarmsolution[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spfarmsolution[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spfarmsolution[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spfarmsolution[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spfarmsolution[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spfarmsolution)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spfarmsolution)
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
        dsc_spfarmsolution.original_parameters[:dsc_ensure] = 'present'
        dsc_spfarmsolution[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spfarmsolution)
      end

      it "should update :ensure to :present" do
        expect(dsc_spfarmsolution[:ensure]).to eq(:present)
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
        dsc_spfarmsolution.original_parameters[:dsc_ensure] = 'absent'
        dsc_spfarmsolution[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spfarmsolution)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spfarmsolution[:ensure]).to eq(:absent)
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
