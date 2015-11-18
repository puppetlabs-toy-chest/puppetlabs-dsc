#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchmaintenancemode) do

  let :dsc_xexchmaintenancemode do
    Puppet::Type.type(:dsc_xexchmaintenancemode).new(
      :name     => 'foo',
      :dsc_enabled => true,
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchmaintenancemode.to_s).to eq("Dsc_xexchmaintenancemode[foo]")
  end

  it 'should require that dsc_enabled is specified' do
    #dsc_xexchmaintenancemode[:dsc_enabled]
    expect { Puppet::Type.type(:dsc_xexchmaintenancemode).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_additionalcomponentstoactivate => ["foo", "bar", "spec"],
      :dsc_domaincontroller => 'foo',
      :dsc_movepreferreddatabasesback => true,
      :dsc_setinactivecomponentsfromanyrequestertoactive => true,
      :dsc_upgradedserverversion => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_enabled is a required attribute/)
  end

  it 'should not accept array for dsc_enabled' do
    expect{dsc_xexchmaintenancemode[:dsc_enabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_enabled' do
    dsc_xexchmaintenancemode[:dsc_enabled] = true
    expect(dsc_xexchmaintenancemode[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_enabled" do
    dsc_xexchmaintenancemode[:dsc_enabled] = 'true'
    expect(dsc_xexchmaintenancemode[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_enabled" do
    dsc_xexchmaintenancemode[:dsc_enabled] = 'false'
    expect(dsc_xexchmaintenancemode[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_enabled" do
    dsc_xexchmaintenancemode[:dsc_enabled] = 'True'
    expect(dsc_xexchmaintenancemode[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_enabled" do
    dsc_xexchmaintenancemode[:dsc_enabled] = 'False'
    expect(dsc_xexchmaintenancemode[:dsc_enabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_enabled" do
    dsc_xexchmaintenancemode[:dsc_enabled] = :true
    expect(dsc_xexchmaintenancemode[:dsc_enabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_enabled" do
    dsc_xexchmaintenancemode[:dsc_enabled] = :false
    expect(dsc_xexchmaintenancemode[:dsc_enabled]).to eq(false)
  end

  it 'should not accept int for dsc_enabled' do
    expect{dsc_xexchmaintenancemode[:dsc_enabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_enabled' do
    expect{dsc_xexchmaintenancemode[:dsc_enabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchmaintenancemode[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchmaintenancemode[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchmaintenancemode[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchmaintenancemode[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchmaintenancemode[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_additionalcomponentstoactivate' do
    dsc_xexchmaintenancemode[:dsc_additionalcomponentstoactivate] = ["foo", "bar", "spec"]
    expect(dsc_xexchmaintenancemode[:dsc_additionalcomponentstoactivate]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_additionalcomponentstoactivate' do
    expect{dsc_xexchmaintenancemode[:dsc_additionalcomponentstoactivate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_additionalcomponentstoactivate' do
    expect{dsc_xexchmaintenancemode[:dsc_additionalcomponentstoactivate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_additionalcomponentstoactivate' do
    expect{dsc_xexchmaintenancemode[:dsc_additionalcomponentstoactivate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchmaintenancemode[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchmaintenancemode[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchmaintenancemode[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchmaintenancemode[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_movepreferreddatabasesback' do
    expect{dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_movepreferreddatabasesback' do
    dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback] = true
    expect(dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_movepreferreddatabasesback" do
    dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback] = 'true'
    expect(dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_movepreferreddatabasesback" do
    dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback] = 'false'
    expect(dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_movepreferreddatabasesback" do
    dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback] = 'True'
    expect(dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_movepreferreddatabasesback" do
    dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback] = 'False'
    expect(dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_movepreferreddatabasesback" do
    dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback] = :true
    expect(dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_movepreferreddatabasesback" do
    dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback] = :false
    expect(dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback]).to eq(false)
  end

  it 'should not accept int for dsc_movepreferreddatabasesback' do
    expect{dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_movepreferreddatabasesback' do
    expect{dsc_xexchmaintenancemode[:dsc_movepreferreddatabasesback] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setinactivecomponentsfromanyrequestertoactive' do
    expect{dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_setinactivecomponentsfromanyrequestertoactive' do
    dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive] = true
    expect(dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_setinactivecomponentsfromanyrequestertoactive" do
    dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive] = 'true'
    expect(dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_setinactivecomponentsfromanyrequestertoactive" do
    dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive] = 'false'
    expect(dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_setinactivecomponentsfromanyrequestertoactive" do
    dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive] = 'True'
    expect(dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_setinactivecomponentsfromanyrequestertoactive" do
    dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive] = 'False'
    expect(dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_setinactivecomponentsfromanyrequestertoactive" do
    dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive] = :true
    expect(dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_setinactivecomponentsfromanyrequestertoactive" do
    dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive] = :false
    expect(dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive]).to eq(false)
  end

  it 'should not accept int for dsc_setinactivecomponentsfromanyrequestertoactive' do
    expect{dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setinactivecomponentsfromanyrequestertoactive' do
    expect{dsc_xexchmaintenancemode[:dsc_setinactivecomponentsfromanyrequestertoactive] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_upgradedserverversion' do
    expect{dsc_xexchmaintenancemode[:dsc_upgradedserverversion] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_upgradedserverversion' do
    expect{dsc_xexchmaintenancemode[:dsc_upgradedserverversion] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_upgradedserverversion' do
    expect{dsc_xexchmaintenancemode[:dsc_upgradedserverversion] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_upgradedserverversion' do
    expect{dsc_xexchmaintenancemode[:dsc_upgradedserverversion] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchmaintenancemode)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchmaintenancemode)
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
