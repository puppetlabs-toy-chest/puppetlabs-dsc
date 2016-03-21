#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspoutgoingemailsettings) do

  let :dsc_xspoutgoingemailsettings do
    Puppet::Type.type(:dsc_xspoutgoingemailsettings).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xspoutgoingemailsettings).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_smtpserver => 'foo',
      :dsc_fromaddress => 'foo',
      :dsc_replytoaddress => 'foo',
      :dsc_characterset => 'foo',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xspoutgoingemailsettings.to_s).to eq("Dsc_xspoutgoingemailsettings[foo]")
  end

  it 'should require that dsc_webappurl is specified' do
    #dsc_xspoutgoingemailsettings[:dsc_webappurl]
    expect { Puppet::Type.type(:dsc_xspoutgoingemailsettings).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_webappurl is a required attribute/)
  end

  it 'should not accept array for dsc_webappurl' do
    expect{dsc_xspoutgoingemailsettings[:dsc_webappurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webappurl' do
    expect{dsc_xspoutgoingemailsettings[:dsc_webappurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webappurl' do
    expect{dsc_xspoutgoingemailsettings[:dsc_webappurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webappurl' do
    expect{dsc_xspoutgoingemailsettings[:dsc_webappurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_smtpserver' do
    expect{dsc_xspoutgoingemailsettings[:dsc_smtpserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_smtpserver' do
    expect{dsc_xspoutgoingemailsettings[:dsc_smtpserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_smtpserver' do
    expect{dsc_xspoutgoingemailsettings[:dsc_smtpserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_smtpserver' do
    expect{dsc_xspoutgoingemailsettings[:dsc_smtpserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_fromaddress' do
    expect{dsc_xspoutgoingemailsettings[:dsc_fromaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_fromaddress' do
    expect{dsc_xspoutgoingemailsettings[:dsc_fromaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_fromaddress' do
    expect{dsc_xspoutgoingemailsettings[:dsc_fromaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_fromaddress' do
    expect{dsc_xspoutgoingemailsettings[:dsc_fromaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_replytoaddress' do
    expect{dsc_xspoutgoingemailsettings[:dsc_replytoaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_replytoaddress' do
    expect{dsc_xspoutgoingemailsettings[:dsc_replytoaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_replytoaddress' do
    expect{dsc_xspoutgoingemailsettings[:dsc_replytoaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_replytoaddress' do
    expect{dsc_xspoutgoingemailsettings[:dsc_replytoaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_characterset' do
    expect{dsc_xspoutgoingemailsettings[:dsc_characterset] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_characterset' do
    expect{dsc_xspoutgoingemailsettings[:dsc_characterset] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_characterset' do
    expect{dsc_xspoutgoingemailsettings[:dsc_characterset] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_characterset' do
    expect{dsc_xspoutgoingemailsettings[:dsc_characterset] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspoutgoingemailsettings[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspoutgoingemailsettings[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspoutgoingemailsettings[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspoutgoingemailsettings[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspoutgoingemailsettings[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspoutgoingemailsettings)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspoutgoingemailsettings)
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
