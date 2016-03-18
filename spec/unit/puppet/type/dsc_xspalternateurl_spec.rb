#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspalternateurl) do

  let :dsc_xspalternateurl do
    Puppet::Type.type(:dsc_xspalternateurl).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_zone => 'Default',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xspalternateurl).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_zone => 'Default',
      :dsc_url => 'foo',
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xspalternateurl.to_s).to eq("Dsc_xspalternateurl[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xspalternateurl[:ensure]).to eq :present
  end

  it 'should require that dsc_webappurl is specified' do
    #dsc_xspalternateurl[:dsc_webappurl]
    expect { Puppet::Type.type(:dsc_xspalternateurl).new(
      :name     => 'foo',
      :dsc_zone => 'Default',
    )}.to raise_error(Puppet::Error, /dsc_webappurl is a required attribute/)
  end

  it 'should not accept array for dsc_webappurl' do
    expect{dsc_xspalternateurl[:dsc_webappurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webappurl' do
    expect{dsc_xspalternateurl[:dsc_webappurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webappurl' do
    expect{dsc_xspalternateurl[:dsc_webappurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webappurl' do
    expect{dsc_xspalternateurl[:dsc_webappurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_zone is specified' do
    #dsc_xspalternateurl[:dsc_zone]
    expect { Puppet::Type.type(:dsc_xspalternateurl).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_zone is a required attribute/)
  end

  it 'should accept dsc_zone predefined value Default' do
    dsc_xspalternateurl[:dsc_zone] = 'Default'
    expect(dsc_xspalternateurl[:dsc_zone]).to eq('Default')
  end

  it 'should accept dsc_zone predefined value default' do
    dsc_xspalternateurl[:dsc_zone] = 'default'
    expect(dsc_xspalternateurl[:dsc_zone]).to eq('default')
  end

  it 'should accept dsc_zone predefined value Intranet' do
    dsc_xspalternateurl[:dsc_zone] = 'Intranet'
    expect(dsc_xspalternateurl[:dsc_zone]).to eq('Intranet')
  end

  it 'should accept dsc_zone predefined value intranet' do
    dsc_xspalternateurl[:dsc_zone] = 'intranet'
    expect(dsc_xspalternateurl[:dsc_zone]).to eq('intranet')
  end

  it 'should accept dsc_zone predefined value Extranet' do
    dsc_xspalternateurl[:dsc_zone] = 'Extranet'
    expect(dsc_xspalternateurl[:dsc_zone]).to eq('Extranet')
  end

  it 'should accept dsc_zone predefined value extranet' do
    dsc_xspalternateurl[:dsc_zone] = 'extranet'
    expect(dsc_xspalternateurl[:dsc_zone]).to eq('extranet')
  end

  it 'should accept dsc_zone predefined value Custom' do
    dsc_xspalternateurl[:dsc_zone] = 'Custom'
    expect(dsc_xspalternateurl[:dsc_zone]).to eq('Custom')
  end

  it 'should accept dsc_zone predefined value custom' do
    dsc_xspalternateurl[:dsc_zone] = 'custom'
    expect(dsc_xspalternateurl[:dsc_zone]).to eq('custom')
  end

  it 'should accept dsc_zone predefined value Internet' do
    dsc_xspalternateurl[:dsc_zone] = 'Internet'
    expect(dsc_xspalternateurl[:dsc_zone]).to eq('Internet')
  end

  it 'should accept dsc_zone predefined value internet' do
    dsc_xspalternateurl[:dsc_zone] = 'internet'
    expect(dsc_xspalternateurl[:dsc_zone]).to eq('internet')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspalternateurl[:dsc_zone] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_zone' do
    expect{dsc_xspalternateurl[:dsc_zone] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_zone' do
    expect{dsc_xspalternateurl[:dsc_zone] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_zone' do
    expect{dsc_xspalternateurl[:dsc_zone] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_zone' do
    expect{dsc_xspalternateurl[:dsc_zone] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_url' do
    expect{dsc_xspalternateurl[:dsc_url] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_url' do
    expect{dsc_xspalternateurl[:dsc_url] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_url' do
    expect{dsc_xspalternateurl[:dsc_url] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_url' do
    expect{dsc_xspalternateurl[:dsc_url] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xspalternateurl[:dsc_ensure] = 'Present'
    expect(dsc_xspalternateurl[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xspalternateurl[:dsc_ensure] = 'present'
    expect(dsc_xspalternateurl[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspalternateurl[:dsc_ensure] = 'present'
    expect(dsc_xspalternateurl[:ensure]).to eq(dsc_xspalternateurl[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xspalternateurl[:dsc_ensure] = 'Absent'
    expect(dsc_xspalternateurl[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xspalternateurl[:dsc_ensure] = 'absent'
    expect(dsc_xspalternateurl[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspalternateurl[:dsc_ensure] = 'absent'
    expect(dsc_xspalternateurl[:ensure]).to eq(dsc_xspalternateurl[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspalternateurl[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xspalternateurl[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xspalternateurl[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xspalternateurl[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xspalternateurl[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspalternateurl[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspalternateurl[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspalternateurl[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspalternateurl[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspalternateurl[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspalternateurl)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspalternateurl)
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
        dsc_xspalternateurl.original_parameters[:dsc_ensure] = 'present'
        dsc_xspalternateurl[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xspalternateurl)
      end

      it "should update :ensure to :present" do
        expect(dsc_xspalternateurl[:ensure]).to eq(:present)
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
        dsc_xspalternateurl.original_parameters[:dsc_ensure] = 'absent'
        dsc_xspalternateurl[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xspalternateurl)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xspalternateurl[:ensure]).to eq(:absent)
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
