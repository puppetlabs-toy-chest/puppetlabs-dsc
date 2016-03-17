#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspuserprofilesection) do

  let :dsc_xspuserprofilesection do
    Puppet::Type.type(:dsc_xspuserprofilesection).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xspuserprofilesection.to_s).to eq("Dsc_xspuserprofilesection[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xspuserprofilesection[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspuserprofilesection[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspuserprofilesection).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_userprofileservice => 'foo',
      :dsc_displayname => 'foo',
      :dsc_displayorder => 32,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspuserprofilesection[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspuserprofilesection[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspuserprofilesection[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspuserprofilesection[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xspuserprofilesection[:dsc_ensure] = 'Present'
    expect(dsc_xspuserprofilesection[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xspuserprofilesection[:dsc_ensure] = 'present'
    expect(dsc_xspuserprofilesection[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspuserprofilesection[:dsc_ensure] = 'present'
    expect(dsc_xspuserprofilesection[:ensure]).to eq(dsc_xspuserprofilesection[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xspuserprofilesection[:dsc_ensure] = 'Absent'
    expect(dsc_xspuserprofilesection[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xspuserprofilesection[:dsc_ensure] = 'absent'
    expect(dsc_xspuserprofilesection[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspuserprofilesection[:dsc_ensure] = 'absent'
    expect(dsc_xspuserprofilesection[:ensure]).to eq(dsc_xspuserprofilesection[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspuserprofilesection[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xspuserprofilesection[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xspuserprofilesection[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xspuserprofilesection[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xspuserprofilesection[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_userprofileservice' do
    expect{dsc_xspuserprofilesection[:dsc_userprofileservice] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_userprofileservice' do
    expect{dsc_xspuserprofilesection[:dsc_userprofileservice] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_userprofileservice' do
    expect{dsc_xspuserprofilesection[:dsc_userprofileservice] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_userprofileservice' do
    expect{dsc_xspuserprofilesection[:dsc_userprofileservice] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_xspuserprofilesection[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_xspuserprofilesection[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_xspuserprofilesection[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_xspuserprofilesection[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayorder' do
    expect{dsc_xspuserprofilesection[:dsc_displayorder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayorder' do
    expect{dsc_xspuserprofilesection[:dsc_displayorder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_displayorder' do
    dsc_xspuserprofilesection[:dsc_displayorder] = 32
    expect(dsc_xspuserprofilesection[:dsc_displayorder]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_displayorder' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xspuserprofilesection[:dsc_displayorder] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_displayorder' do
    dsc_xspuserprofilesection[:dsc_displayorder] = '16'
    expect(dsc_xspuserprofilesection[:dsc_displayorder]).to eq(16)
  end

  it 'should accept string-like uint for dsc_displayorder' do
    dsc_xspuserprofilesection[:dsc_displayorder] = '32'
    expect(dsc_xspuserprofilesection[:dsc_displayorder]).to eq(32)
  end

  it 'should accept string-like uint for dsc_displayorder' do
    dsc_xspuserprofilesection[:dsc_displayorder] = '64'
    expect(dsc_xspuserprofilesection[:dsc_displayorder]).to eq(64)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspuserprofilesection[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspuserprofilesection[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspuserprofilesection[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspuserprofilesection[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspuserprofilesection[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspuserprofilesection)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspuserprofilesection)
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
        dsc_xspuserprofilesection.original_parameters[:dsc_ensure] = 'present'
        dsc_xspuserprofilesection[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xspuserprofilesection)
      end

      it "should update :ensure to :present" do
        expect(dsc_xspuserprofilesection[:ensure]).to eq(:present)
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
        dsc_xspuserprofilesection.original_parameters[:dsc_ensure] = 'absent'
        dsc_xspuserprofilesection[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xspuserprofilesection)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xspuserprofilesection[:ensure]).to eq(:absent)
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
