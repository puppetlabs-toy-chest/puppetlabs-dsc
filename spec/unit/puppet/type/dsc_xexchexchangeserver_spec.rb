#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchexchangeserver) do

  let :dsc_xexchexchangeserver do
    Puppet::Type.type(:dsc_xexchexchangeserver).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchexchangeserver.to_s).to eq("Dsc_xexchexchangeserver[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchexchangeserver[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchexchangeserver).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_allowservicerestart => true,
      :dsc_customerfeedbackenabled => true,
      :dsc_domaincontroller => 'foo',
      :dsc_internetwebproxy => 'foo',
      :dsc_monitoringgroup => 'foo',
      :dsc_productkey => 'foo',
      :dsc_workloadmanagementpolicy => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchexchangeserver[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchexchangeserver[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchexchangeserver[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchexchangeserver[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchexchangeserver[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchexchangeserver[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchexchangeserver[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchexchangeserver[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchexchangeserver[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchexchangeserver[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchexchangeserver[:dsc_allowservicerestart] = true
    expect(dsc_xexchexchangeserver[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchexchangeserver[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchexchangeserver[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchexchangeserver[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchexchangeserver[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchexchangeserver[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchexchangeserver[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchexchangeserver[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchexchangeserver[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchexchangeserver[:dsc_allowservicerestart] = :true
    expect(dsc_xexchexchangeserver[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchexchangeserver[:dsc_allowservicerestart] = :false
    expect(dsc_xexchexchangeserver[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchexchangeserver[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchexchangeserver[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_customerfeedbackenabled' do
    expect{dsc_xexchexchangeserver[:dsc_customerfeedbackenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_customerfeedbackenabled' do
    dsc_xexchexchangeserver[:dsc_customerfeedbackenabled] = true
    expect(dsc_xexchexchangeserver[:dsc_customerfeedbackenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_customerfeedbackenabled" do
    dsc_xexchexchangeserver[:dsc_customerfeedbackenabled] = 'true'
    expect(dsc_xexchexchangeserver[:dsc_customerfeedbackenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_customerfeedbackenabled" do
    dsc_xexchexchangeserver[:dsc_customerfeedbackenabled] = 'false'
    expect(dsc_xexchexchangeserver[:dsc_customerfeedbackenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_customerfeedbackenabled" do
    dsc_xexchexchangeserver[:dsc_customerfeedbackenabled] = 'True'
    expect(dsc_xexchexchangeserver[:dsc_customerfeedbackenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_customerfeedbackenabled" do
    dsc_xexchexchangeserver[:dsc_customerfeedbackenabled] = 'False'
    expect(dsc_xexchexchangeserver[:dsc_customerfeedbackenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_customerfeedbackenabled" do
    dsc_xexchexchangeserver[:dsc_customerfeedbackenabled] = :true
    expect(dsc_xexchexchangeserver[:dsc_customerfeedbackenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_customerfeedbackenabled" do
    dsc_xexchexchangeserver[:dsc_customerfeedbackenabled] = :false
    expect(dsc_xexchexchangeserver[:dsc_customerfeedbackenabled]).to eq(false)
  end

  it 'should not accept int for dsc_customerfeedbackenabled' do
    expect{dsc_xexchexchangeserver[:dsc_customerfeedbackenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_customerfeedbackenabled' do
    expect{dsc_xexchexchangeserver[:dsc_customerfeedbackenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchexchangeserver[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchexchangeserver[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchexchangeserver[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchexchangeserver[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internetwebproxy' do
    expect{dsc_xexchexchangeserver[:dsc_internetwebproxy] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internetwebproxy' do
    expect{dsc_xexchexchangeserver[:dsc_internetwebproxy] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internetwebproxy' do
    expect{dsc_xexchexchangeserver[:dsc_internetwebproxy] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internetwebproxy' do
    expect{dsc_xexchexchangeserver[:dsc_internetwebproxy] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_monitoringgroup' do
    expect{dsc_xexchexchangeserver[:dsc_monitoringgroup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_monitoringgroup' do
    expect{dsc_xexchexchangeserver[:dsc_monitoringgroup] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_monitoringgroup' do
    expect{dsc_xexchexchangeserver[:dsc_monitoringgroup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_monitoringgroup' do
    expect{dsc_xexchexchangeserver[:dsc_monitoringgroup] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_productkey' do
    expect{dsc_xexchexchangeserver[:dsc_productkey] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_productkey' do
    expect{dsc_xexchexchangeserver[:dsc_productkey] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_productkey' do
    expect{dsc_xexchexchangeserver[:dsc_productkey] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_productkey' do
    expect{dsc_xexchexchangeserver[:dsc_productkey] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_workloadmanagementpolicy' do
    expect{dsc_xexchexchangeserver[:dsc_workloadmanagementpolicy] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_workloadmanagementpolicy' do
    expect{dsc_xexchexchangeserver[:dsc_workloadmanagementpolicy] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_workloadmanagementpolicy' do
    expect{dsc_xexchexchangeserver[:dsc_workloadmanagementpolicy] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_workloadmanagementpolicy' do
    expect{dsc_xexchexchangeserver[:dsc_workloadmanagementpolicy] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchexchangeserver)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchexchangeserver)
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
