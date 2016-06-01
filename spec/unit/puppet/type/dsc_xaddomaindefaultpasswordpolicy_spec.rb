#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xaddomaindefaultpasswordpolicy) do

  let :dsc_xaddomaindefaultpasswordpolicy do
    Puppet::Type.type(:dsc_xaddomaindefaultpasswordpolicy).new(
      :name     => 'foo',
      :dsc_domainname => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xaddomaindefaultpasswordpolicy).new(
      :name     => 'foo',
      :dsc_domainname => 'foo',
      :dsc_complexityenabled => true,
      :dsc_lockoutduration => 32,
      :dsc_lockoutobservationwindow => 32,
      :dsc_lockoutthreshold => 32,
      :dsc_minpasswordage => 32,
      :dsc_maxpasswordage => 32,
      :dsc_minpasswordlength => 32,
      :dsc_passwordhistorycount => 32,
      :dsc_reversibleencryptionenabled => true,
      :dsc_domaincontroller => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xaddomaindefaultpasswordpolicy.to_s).to eq("Dsc_xaddomaindefaultpasswordpolicy[foo]")
  end

  it 'should require that dsc_domainname is specified' do
    #dsc_xaddomaindefaultpasswordpolicy[:dsc_domainname]
    expect { Puppet::Type.type(:dsc_xaddomaindefaultpasswordpolicy).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_domainname is a required attribute/)
  end

  it 'should not accept array for dsc_domainname' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_domainname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domainname' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_domainname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domainname' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_domainname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domainname' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_domainname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_complexityenabled' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_complexityenabled' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled] = true
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_complexityenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled] = 'true'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_complexityenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled] = 'false'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_complexityenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled] = 'True'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_complexityenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled] = 'False'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_complexityenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled] = :true
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_complexityenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled] = :false
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled]).to eq(false)
  end

  it 'should not accept int for dsc_complexityenabled' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_complexityenabled' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_complexityenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_lockoutduration' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutduration] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_lockoutduration' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutduration] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_lockoutduration' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutduration] = 32
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutduration]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_lockoutduration' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutduration] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_lockoutduration' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutduration] = '16'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutduration]).to eq(16)
  end

  it 'should accept string-like uint for dsc_lockoutduration' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutduration] = '32'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutduration]).to eq(32)
  end

  it 'should accept string-like uint for dsc_lockoutduration' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutduration] = '64'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutduration]).to eq(64)
  end

  it 'should not accept array for dsc_lockoutobservationwindow' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutobservationwindow] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_lockoutobservationwindow' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutobservationwindow] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_lockoutobservationwindow' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutobservationwindow] = 32
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutobservationwindow]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_lockoutobservationwindow' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutobservationwindow] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_lockoutobservationwindow' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutobservationwindow] = '16'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutobservationwindow]).to eq(16)
  end

  it 'should accept string-like uint for dsc_lockoutobservationwindow' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutobservationwindow] = '32'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutobservationwindow]).to eq(32)
  end

  it 'should accept string-like uint for dsc_lockoutobservationwindow' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutobservationwindow] = '64'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutobservationwindow]).to eq(64)
  end

  it 'should not accept array for dsc_lockoutthreshold' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutthreshold] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_lockoutthreshold' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutthreshold] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_lockoutthreshold' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutthreshold] = 32
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutthreshold]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_lockoutthreshold' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutthreshold] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_lockoutthreshold' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutthreshold] = '16'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutthreshold]).to eq(16)
  end

  it 'should accept string-like uint for dsc_lockoutthreshold' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutthreshold] = '32'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutthreshold]).to eq(32)
  end

  it 'should accept string-like uint for dsc_lockoutthreshold' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutthreshold] = '64'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_lockoutthreshold]).to eq(64)
  end

  it 'should not accept array for dsc_minpasswordage' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_minpasswordage' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_minpasswordage' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordage] = 32
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordage]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_minpasswordage' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordage] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_minpasswordage' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordage] = '16'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordage]).to eq(16)
  end

  it 'should accept string-like uint for dsc_minpasswordage' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordage] = '32'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordage]).to eq(32)
  end

  it 'should accept string-like uint for dsc_minpasswordage' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordage] = '64'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordage]).to eq(64)
  end

  it 'should not accept array for dsc_maxpasswordage' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_maxpasswordage] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_maxpasswordage' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_maxpasswordage] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_maxpasswordage' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_maxpasswordage] = 32
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_maxpasswordage]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_maxpasswordage' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_maxpasswordage] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_maxpasswordage' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_maxpasswordage] = '16'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_maxpasswordage]).to eq(16)
  end

  it 'should accept string-like uint for dsc_maxpasswordage' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_maxpasswordage] = '32'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_maxpasswordage]).to eq(32)
  end

  it 'should accept string-like uint for dsc_maxpasswordage' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_maxpasswordage] = '64'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_maxpasswordage]).to eq(64)
  end

  it 'should not accept array for dsc_minpasswordlength' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordlength] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_minpasswordlength' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordlength] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_minpasswordlength' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordlength] = 32
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordlength]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_minpasswordlength' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordlength] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_minpasswordlength' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordlength] = '16'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordlength]).to eq(16)
  end

  it 'should accept string-like uint for dsc_minpasswordlength' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordlength] = '32'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordlength]).to eq(32)
  end

  it 'should accept string-like uint for dsc_minpasswordlength' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordlength] = '64'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_minpasswordlength]).to eq(64)
  end

  it 'should not accept array for dsc_passwordhistorycount' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_passwordhistorycount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_passwordhistorycount' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_passwordhistorycount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_passwordhistorycount' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_passwordhistorycount] = 32
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_passwordhistorycount]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_passwordhistorycount' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_passwordhistorycount] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_passwordhistorycount' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_passwordhistorycount] = '16'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_passwordhistorycount]).to eq(16)
  end

  it 'should accept string-like uint for dsc_passwordhistorycount' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_passwordhistorycount] = '32'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_passwordhistorycount]).to eq(32)
  end

  it 'should accept string-like uint for dsc_passwordhistorycount' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_passwordhistorycount] = '64'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_passwordhistorycount]).to eq(64)
  end

  it 'should not accept array for dsc_reversibleencryptionenabled' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_reversibleencryptionenabled' do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled] = true
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_reversibleencryptionenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled] = 'true'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_reversibleencryptionenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled] = 'false'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_reversibleencryptionenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled] = 'True'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_reversibleencryptionenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled] = 'False'
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_reversibleencryptionenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled] = :true
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_reversibleencryptionenabled" do
    dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled] = :false
    expect(dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled]).to eq(false)
  end

  it 'should not accept int for dsc_reversibleencryptionenabled' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_reversibleencryptionenabled' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_reversibleencryptionenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xaddomaindefaultpasswordpolicy[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xaddomaindefaultpasswordpolicy)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xaddomaindefaultpasswordpolicy)
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
