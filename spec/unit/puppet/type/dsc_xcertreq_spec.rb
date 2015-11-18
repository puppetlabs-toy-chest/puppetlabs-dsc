#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xcertreq) do

  let :dsc_xcertreq do
    Puppet::Type.type(:dsc_xcertreq).new(
      :name     => 'foo',
      :dsc_subject => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xcertreq.to_s).to eq("Dsc_xcertreq[foo]")
  end

  it 'should require that dsc_subject is specified' do
    #dsc_xcertreq[:dsc_subject]
    expect { Puppet::Type.type(:dsc_xcertreq).new(
      :name     => 'foo',
      :dsc_caserverfqdn => 'foo',
      :dsc_carootname => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_autorenew => true,
    )}.to raise_error(Puppet::Error, /dsc_subject is a required attribute/)
  end

  it 'should not accept array for dsc_subject' do
    expect{dsc_xcertreq[:dsc_subject] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_subject' do
    expect{dsc_xcertreq[:dsc_subject] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_subject' do
    expect{dsc_xcertreq[:dsc_subject] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_subject' do
    expect{dsc_xcertreq[:dsc_subject] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_caserverfqdn' do
    expect{dsc_xcertreq[:dsc_caserverfqdn] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_caserverfqdn' do
    expect{dsc_xcertreq[:dsc_caserverfqdn] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_caserverfqdn' do
    expect{dsc_xcertreq[:dsc_caserverfqdn] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_caserverfqdn' do
    expect{dsc_xcertreq[:dsc_caserverfqdn] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_carootname' do
    expect{dsc_xcertreq[:dsc_carootname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_carootname' do
    expect{dsc_xcertreq[:dsc_carootname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_carootname' do
    expect{dsc_xcertreq[:dsc_carootname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_carootname' do
    expect{dsc_xcertreq[:dsc_carootname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xcertreq[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xcertreq[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xcertreq[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xcertreq[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xcertreq[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_autorenew' do
    expect{dsc_xcertreq[:dsc_autorenew] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_autorenew' do
    dsc_xcertreq[:dsc_autorenew] = true
    expect(dsc_xcertreq[:dsc_autorenew]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_autorenew" do
    dsc_xcertreq[:dsc_autorenew] = 'true'
    expect(dsc_xcertreq[:dsc_autorenew]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_autorenew" do
    dsc_xcertreq[:dsc_autorenew] = 'false'
    expect(dsc_xcertreq[:dsc_autorenew]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_autorenew" do
    dsc_xcertreq[:dsc_autorenew] = 'True'
    expect(dsc_xcertreq[:dsc_autorenew]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_autorenew" do
    dsc_xcertreq[:dsc_autorenew] = 'False'
    expect(dsc_xcertreq[:dsc_autorenew]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_autorenew" do
    dsc_xcertreq[:dsc_autorenew] = :true
    expect(dsc_xcertreq[:dsc_autorenew]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_autorenew" do
    dsc_xcertreq[:dsc_autorenew] = :false
    expect(dsc_xcertreq[:dsc_autorenew]).to eq(false)
  end

  it 'should not accept int for dsc_autorenew' do
    expect{dsc_xcertreq[:dsc_autorenew] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_autorenew' do
    expect{dsc_xcertreq[:dsc_autorenew] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xcertreq)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xcertreq)
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
