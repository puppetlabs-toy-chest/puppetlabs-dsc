#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xexchecpvirtualdirectory) do

  let :dsc_xexchecpvirtualdirectory do
    Puppet::Type.type(:dsc_xexchecpvirtualdirectory).new(
      :name     => 'foo',
      :dsc_identity => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xexchecpvirtualdirectory.to_s).to eq("Dsc_xexchecpvirtualdirectory[foo]")
  end

  it 'should require that dsc_identity is specified' do
    #dsc_xexchecpvirtualdirectory[:dsc_identity]
    expect { Puppet::Type.type(:dsc_xexchecpvirtualdirectory).new(
      :name     => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_allowservicerestart => true,
      :dsc_adfsauthentication => true,
      :dsc_basicauthentication => true,
      :dsc_digestauthentication => true,
      :dsc_domaincontroller => 'foo',
      :dsc_externalauthenticationmethods => ["foo", "bar", "spec"],
      :dsc_formsauthentication => true,
      :dsc_externalurl => 'foo',
      :dsc_internalurl => 'foo',
      :dsc_windowsauthentication => true,
    )}.to raise_error(Puppet::Error, /dsc_identity is a required attribute/)
  end

  it 'should not accept array for dsc_identity' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_identity] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_identity' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_identity] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_identity' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_identity] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_identity' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_identity] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xexchecpvirtualdirectory[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allowservicerestart' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allowservicerestart' do
    dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart] = true
    expect(dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart] = 'true'
    expect(dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart] = 'false'
    expect(dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart] = 'True'
    expect(dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart] = 'False'
    expect(dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart] = :true
    expect(dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allowservicerestart" do
    dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart] = :false
    expect(dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart]).to eq(false)
  end

  it 'should not accept int for dsc_allowservicerestart' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allowservicerestart' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_allowservicerestart] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_adfsauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_adfsauthentication' do
    dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication] = true
    expect(dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication] = 'true'
    expect(dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication] = 'false'
    expect(dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication] = 'True'
    expect(dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication] = 'False'
    expect(dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication] = :true
    expect(dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_adfsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication] = :false
    expect(dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_adfsauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_adfsauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_adfsauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_basicauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_basicauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_basicauthentication' do
    dsc_xexchecpvirtualdirectory[:dsc_basicauthentication] = true
    expect(dsc_xexchecpvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_basicauthentication] = 'true'
    expect(dsc_xexchecpvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_basicauthentication] = 'false'
    expect(dsc_xexchecpvirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_basicauthentication] = 'True'
    expect(dsc_xexchecpvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_basicauthentication] = 'False'
    expect(dsc_xexchecpvirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_basicauthentication] = :true
    expect(dsc_xexchecpvirtualdirectory[:dsc_basicauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_basicauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_basicauthentication] = :false
    expect(dsc_xexchecpvirtualdirectory[:dsc_basicauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_basicauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_basicauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_basicauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_basicauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_digestauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_digestauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_digestauthentication' do
    dsc_xexchecpvirtualdirectory[:dsc_digestauthentication] = true
    expect(dsc_xexchecpvirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_digestauthentication] = 'true'
    expect(dsc_xexchecpvirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_digestauthentication] = 'false'
    expect(dsc_xexchecpvirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_digestauthentication] = 'True'
    expect(dsc_xexchecpvirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_digestauthentication] = 'False'
    expect(dsc_xexchecpvirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_digestauthentication] = :true
    expect(dsc_xexchecpvirtualdirectory[:dsc_digestauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_digestauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_digestauthentication] = :false
    expect(dsc_xexchecpvirtualdirectory[:dsc_digestauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_digestauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_digestauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_digestauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_digestauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_externalauthenticationmethods' do
    dsc_xexchecpvirtualdirectory[:dsc_externalauthenticationmethods] = ["foo", "bar", "spec"]
    expect(dsc_xexchecpvirtualdirectory[:dsc_externalauthenticationmethods]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_externalauthenticationmethods' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_externalauthenticationmethods] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalauthenticationmethods' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_externalauthenticationmethods] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalauthenticationmethods' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_externalauthenticationmethods] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_formsauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_formsauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_formsauthentication' do
    dsc_xexchecpvirtualdirectory[:dsc_formsauthentication] = true
    expect(dsc_xexchecpvirtualdirectory[:dsc_formsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_formsauthentication] = 'true'
    expect(dsc_xexchecpvirtualdirectory[:dsc_formsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_formsauthentication] = 'false'
    expect(dsc_xexchecpvirtualdirectory[:dsc_formsauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_formsauthentication] = 'True'
    expect(dsc_xexchecpvirtualdirectory[:dsc_formsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_formsauthentication] = 'False'
    expect(dsc_xexchecpvirtualdirectory[:dsc_formsauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_formsauthentication] = :true
    expect(dsc_xexchecpvirtualdirectory[:dsc_formsauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_formsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_formsauthentication] = :false
    expect(dsc_xexchecpvirtualdirectory[:dsc_formsauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_formsauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_formsauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_formsauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_formsauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_externalurl' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_externalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_externalurl' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_externalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_externalurl' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_externalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_externalurl' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_externalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_internalurl' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_internalurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_internalurl' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_internalurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_internalurl' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_internalurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_internalurl' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_internalurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_windowsauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_windowsauthentication' do
    dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication] = true
    expect(dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication] = 'true'
    expect(dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication] = 'false'
    expect(dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication] = 'True'
    expect(dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication] = 'False'
    expect(dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication] = :true
    expect(dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_windowsauthentication" do
    dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication] = :false
    expect(dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication]).to eq(false)
  end

  it 'should not accept int for dsc_windowsauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_windowsauthentication' do
    expect{dsc_xexchecpvirtualdirectory[:dsc_windowsauthentication] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xexchecpvirtualdirectory)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xexchecpvirtualdirectory)
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
