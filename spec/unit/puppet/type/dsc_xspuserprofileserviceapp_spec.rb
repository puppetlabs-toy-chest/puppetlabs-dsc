#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xspuserprofileserviceapp) do

  let :dsc_xspuserprofileserviceapp do
    Puppet::Type.type(:dsc_xspuserprofileserviceapp).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xspuserprofileserviceapp).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_applicationpool => 'foo',
      :dsc_farmaccount => {"user"=>"user", "password"=>"password"},
      :dsc_mysitehostlocation => 'foo',
      :dsc_profiledbname => 'foo',
      :dsc_profiledbserver => 'foo',
      :dsc_socialdbname => 'foo',
      :dsc_socialdbserver => 'foo',
      :dsc_syncdbname => 'foo',
      :dsc_syncdbserver => 'foo',
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xspuserprofileserviceapp.to_s).to eq("Dsc_xspuserprofileserviceapp[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xspuserprofileserviceapp[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xspuserprofileserviceapp[:dsc_name]
    expect { Puppet::Type.type(:dsc_xspuserprofileserviceapp).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xspuserprofileserviceapp[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xspuserprofileserviceapp[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xspuserprofileserviceapp[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xspuserprofileserviceapp[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_applicationpool' do
    expect{dsc_xspuserprofileserviceapp[:dsc_applicationpool] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_applicationpool' do
    expect{dsc_xspuserprofileserviceapp[:dsc_applicationpool] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_applicationpool' do
    expect{dsc_xspuserprofileserviceapp[:dsc_applicationpool] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_applicationpool' do
    expect{dsc_xspuserprofileserviceapp[:dsc_applicationpool] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_farmaccount" do
    expect{dsc_xspuserprofileserviceapp[:dsc_farmaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_farmaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_farmaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_farmaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_farmaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_farmaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_farmaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_farmaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_farmaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_mysitehostlocation' do
    expect{dsc_xspuserprofileserviceapp[:dsc_mysitehostlocation] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_mysitehostlocation' do
    expect{dsc_xspuserprofileserviceapp[:dsc_mysitehostlocation] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_mysitehostlocation' do
    expect{dsc_xspuserprofileserviceapp[:dsc_mysitehostlocation] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_mysitehostlocation' do
    expect{dsc_xspuserprofileserviceapp[:dsc_mysitehostlocation] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_profiledbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_profiledbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_profiledbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_profiledbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_profiledbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_profiledbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_profiledbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_profiledbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_profiledbserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_socialdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_socialdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_socialdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_socialdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_socialdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_socialdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_socialdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_socialdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_socialdbserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_syncdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_syncdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_syncdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_syncdbname' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_syncdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbserver] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_syncdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbserver] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_syncdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbserver] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_syncdbserver' do
    expect{dsc_xspuserprofileserviceapp[:dsc_syncdbserver] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xspuserprofileserviceapp[:dsc_ensure] = 'Present'
    expect(dsc_xspuserprofileserviceapp[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xspuserprofileserviceapp[:dsc_ensure] = 'present'
    expect(dsc_xspuserprofileserviceapp[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspuserprofileserviceapp[:dsc_ensure] = 'present'
    expect(dsc_xspuserprofileserviceapp[:ensure]).to eq(dsc_xspuserprofileserviceapp[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xspuserprofileserviceapp[:dsc_ensure] = 'Absent'
    expect(dsc_xspuserprofileserviceapp[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xspuserprofileserviceapp[:dsc_ensure] = 'absent'
    expect(dsc_xspuserprofileserviceapp[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xspuserprofileserviceapp[:dsc_ensure] = 'absent'
    expect(dsc_xspuserprofileserviceapp[:ensure]).to eq(dsc_xspuserprofileserviceapp[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xspuserprofileserviceapp[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xspuserprofileserviceapp[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xspuserprofileserviceapp[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xspuserprofileserviceapp[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xspuserprofileserviceapp[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_xspuserprofileserviceapp[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_xspuserprofileserviceapp[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xspuserprofileserviceapp)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xspuserprofileserviceapp)
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
        dsc_xspuserprofileserviceapp.original_parameters[:dsc_ensure] = 'present'
        dsc_xspuserprofileserviceapp[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xspuserprofileserviceapp)
      end

      it "should update :ensure to :present" do
        expect(dsc_xspuserprofileserviceapp[:ensure]).to eq(:present)
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
        dsc_xspuserprofileserviceapp.original_parameters[:dsc_ensure] = 'absent'
        dsc_xspuserprofileserviceapp[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xspuserprofileserviceapp)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xspuserprofileserviceapp[:ensure]).to eq(:absent)
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
