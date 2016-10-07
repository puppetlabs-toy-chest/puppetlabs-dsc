#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwebapplication) do

  let :dsc_xwebapplication do
    Puppet::Type.type(:dsc_xwebapplication).new(
      :name     => 'foo',
      :dsc_website => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xwebapplication).new(
      :name     => 'foo',
      :dsc_website => 'foo',
      :dsc_name => 'foo',
      :dsc_webapppool => 'foo',
      :dsc_physicalpath => 'foo',
      :dsc_ensure => 'Present',
      :dsc_sslflags => '',
      :dsc_authenticationinfo => {"Anonymous"=>true, "Basic"=>true, "Digest"=>true, "Windows"=>true},
      :dsc_preloadenabled => true,
      :dsc_serviceautostartenabled => true,
      :dsc_serviceautostartprovider => 'foo',
      :dsc_applicationtype => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xwebapplication.to_s).to eq("Dsc_xwebapplication[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xwebapplication[:ensure]).to eq :present
  end

  it 'should require that dsc_website is specified' do
    #dsc_xwebapplication[:dsc_website]
    expect { Puppet::Type.type(:dsc_xwebapplication).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_website is a required attribute/)
  end

  it 'should not accept array for dsc_website' do
    expect{dsc_xwebapplication[:dsc_website] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_website' do
    expect{dsc_xwebapplication[:dsc_website] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_website' do
    expect{dsc_xwebapplication[:dsc_website] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_website' do
    expect{dsc_xwebapplication[:dsc_website] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_name is specified' do
    #dsc_xwebapplication[:dsc_name]
    expect { Puppet::Type.type(:dsc_xwebapplication).new(
      :name     => 'foo',
      :dsc_website => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xwebapplication[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xwebapplication[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xwebapplication[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xwebapplication[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_webapppool' do
    expect{dsc_xwebapplication[:dsc_webapppool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webapppool' do
    expect{dsc_xwebapplication[:dsc_webapppool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webapppool' do
    expect{dsc_xwebapplication[:dsc_webapppool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webapppool' do
    expect{dsc_xwebapplication[:dsc_webapppool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_physicalpath' do
    expect{dsc_xwebapplication[:dsc_physicalpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_physicalpath' do
    expect{dsc_xwebapplication[:dsc_physicalpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_physicalpath' do
    expect{dsc_xwebapplication[:dsc_physicalpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_physicalpath' do
    expect{dsc_xwebapplication[:dsc_physicalpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xwebapplication[:dsc_ensure] = 'Present'
    expect(dsc_xwebapplication[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xwebapplication[:dsc_ensure] = 'present'
    expect(dsc_xwebapplication[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebapplication[:dsc_ensure] = 'present'
    expect(dsc_xwebapplication[:ensure]).to eq(dsc_xwebapplication[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xwebapplication[:dsc_ensure] = 'Absent'
    expect(dsc_xwebapplication[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xwebapplication[:dsc_ensure] = 'absent'
    expect(dsc_xwebapplication[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwebapplication[:dsc_ensure] = 'absent'
    expect(dsc_xwebapplication[:ensure]).to eq(dsc_xwebapplication[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapplication[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xwebapplication[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xwebapplication[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xwebapplication[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xwebapplication[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_sslflags predefined value ' do
    dsc_xwebapplication[:dsc_sslflags] = ''
    expect(dsc_xwebapplication[:dsc_sslflags]).to eq([''])
  end

  it 'should accept dsc_sslflags predefined value ' do
    dsc_xwebapplication[:dsc_sslflags] = ''
    expect(dsc_xwebapplication[:dsc_sslflags]).to eq([''])
  end

  it 'should accept dsc_sslflags predefined value Ssl' do
    dsc_xwebapplication[:dsc_sslflags] = 'Ssl'
    expect(dsc_xwebapplication[:dsc_sslflags]).to eq(['Ssl'])
  end

  it 'should accept dsc_sslflags predefined value ssl' do
    dsc_xwebapplication[:dsc_sslflags] = 'ssl'
    expect(dsc_xwebapplication[:dsc_sslflags]).to eq(['ssl'])
  end

  it 'should accept dsc_sslflags predefined value SslNegotiateCert' do
    dsc_xwebapplication[:dsc_sslflags] = 'SslNegotiateCert'
    expect(dsc_xwebapplication[:dsc_sslflags]).to eq(['SslNegotiateCert'])
  end

  it 'should accept dsc_sslflags predefined value sslnegotiatecert' do
    dsc_xwebapplication[:dsc_sslflags] = 'sslnegotiatecert'
    expect(dsc_xwebapplication[:dsc_sslflags]).to eq(['sslnegotiatecert'])
  end

  it 'should accept dsc_sslflags predefined value SslRequireCert' do
    dsc_xwebapplication[:dsc_sslflags] = 'SslRequireCert'
    expect(dsc_xwebapplication[:dsc_sslflags]).to eq(['SslRequireCert'])
  end

  it 'should accept dsc_sslflags predefined value sslrequirecert' do
    dsc_xwebapplication[:dsc_sslflags] = 'sslrequirecert'
    expect(dsc_xwebapplication[:dsc_sslflags]).to eq(['sslrequirecert'])
  end

  it 'should accept dsc_sslflags predefined value Ssl128' do
    dsc_xwebapplication[:dsc_sslflags] = 'Ssl128'
    expect(dsc_xwebapplication[:dsc_sslflags]).to eq(['Ssl128'])
  end

  it 'should accept dsc_sslflags predefined value ssl128' do
    dsc_xwebapplication[:dsc_sslflags] = 'ssl128'
    expect(dsc_xwebapplication[:dsc_sslflags]).to eq(['ssl128'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwebapplication[:dsc_sslflags] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_sslflags' do
    dsc_xwebapplication[:dsc_sslflags] = ["", "Ssl", "SslNegotiateCert", "SslRequireCert", "Ssl128"]
    expect(dsc_xwebapplication[:dsc_sslflags]).to eq(["", "Ssl", "SslNegotiateCert", "SslRequireCert", "Ssl128"])
  end

  it 'should not accept boolean for dsc_sslflags' do
    expect{dsc_xwebapplication[:dsc_sslflags] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sslflags' do
    expect{dsc_xwebapplication[:dsc_sslflags] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sslflags' do
    expect{dsc_xwebapplication[:dsc_sslflags] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_authenticationinfo' do
    expect{dsc_xwebapplication[:dsc_authenticationinfo] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_authenticationinfo' do
    expect{dsc_xwebapplication[:dsc_authenticationinfo] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_authenticationinfo' do
    expect{dsc_xwebapplication[:dsc_authenticationinfo] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_authenticationinfo' do
    expect{dsc_xwebapplication[:dsc_authenticationinfo] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_preloadenabled' do
    expect{dsc_xwebapplication[:dsc_preloadenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_preloadenabled' do
    dsc_xwebapplication[:dsc_preloadenabled] = true
    expect(dsc_xwebapplication[:dsc_preloadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebapplication[:dsc_preloadenabled] = 'true'
    expect(dsc_xwebapplication[:dsc_preloadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebapplication[:dsc_preloadenabled] = 'false'
    expect(dsc_xwebapplication[:dsc_preloadenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebapplication[:dsc_preloadenabled] = 'True'
    expect(dsc_xwebapplication[:dsc_preloadenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebapplication[:dsc_preloadenabled] = 'False'
    expect(dsc_xwebapplication[:dsc_preloadenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebapplication[:dsc_preloadenabled] = :true
    expect(dsc_xwebapplication[:dsc_preloadenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_preloadenabled" do
    dsc_xwebapplication[:dsc_preloadenabled] = :false
    expect(dsc_xwebapplication[:dsc_preloadenabled]).to eq(false)
  end

  it 'should not accept int for dsc_preloadenabled' do
    expect{dsc_xwebapplication[:dsc_preloadenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_preloadenabled' do
    expect{dsc_xwebapplication[:dsc_preloadenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serviceautostartenabled' do
    expect{dsc_xwebapplication[:dsc_serviceautostartenabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_serviceautostartenabled' do
    dsc_xwebapplication[:dsc_serviceautostartenabled] = true
    expect(dsc_xwebapplication[:dsc_serviceautostartenabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebapplication[:dsc_serviceautostartenabled] = 'true'
    expect(dsc_xwebapplication[:dsc_serviceautostartenabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebapplication[:dsc_serviceautostartenabled] = 'false'
    expect(dsc_xwebapplication[:dsc_serviceautostartenabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebapplication[:dsc_serviceautostartenabled] = 'True'
    expect(dsc_xwebapplication[:dsc_serviceautostartenabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebapplication[:dsc_serviceautostartenabled] = 'False'
    expect(dsc_xwebapplication[:dsc_serviceautostartenabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebapplication[:dsc_serviceautostartenabled] = :true
    expect(dsc_xwebapplication[:dsc_serviceautostartenabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_serviceautostartenabled" do
    dsc_xwebapplication[:dsc_serviceautostartenabled] = :false
    expect(dsc_xwebapplication[:dsc_serviceautostartenabled]).to eq(false)
  end

  it 'should not accept int for dsc_serviceautostartenabled' do
    expect{dsc_xwebapplication[:dsc_serviceautostartenabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceautostartenabled' do
    expect{dsc_xwebapplication[:dsc_serviceautostartenabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_serviceautostartprovider' do
    expect{dsc_xwebapplication[:dsc_serviceautostartprovider] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serviceautostartprovider' do
    expect{dsc_xwebapplication[:dsc_serviceautostartprovider] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serviceautostartprovider' do
    expect{dsc_xwebapplication[:dsc_serviceautostartprovider] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceautostartprovider' do
    expect{dsc_xwebapplication[:dsc_serviceautostartprovider] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationtype' do
    expect{dsc_xwebapplication[:dsc_applicationtype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationtype' do
    expect{dsc_xwebapplication[:dsc_applicationtype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationtype' do
    expect{dsc_xwebapplication[:dsc_applicationtype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationtype' do
    expect{dsc_xwebapplication[:dsc_applicationtype] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwebapplication)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwebapplication)
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
        dsc_xwebapplication.original_parameters[:dsc_ensure] = 'present'
        dsc_xwebapplication[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xwebapplication)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwebapplication[:ensure]).to eq(:present)
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
        dsc_xwebapplication.original_parameters[:dsc_ensure] = 'absent'
        dsc_xwebapplication[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xwebapplication)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwebapplication[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end
end
