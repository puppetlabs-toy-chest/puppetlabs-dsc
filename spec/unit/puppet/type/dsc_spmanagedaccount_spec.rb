#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spmanagedaccount) do

  let :dsc_spmanagedaccount do
    Puppet::Type.type(:dsc_spmanagedaccount).new(
      :name     => 'foo',
      :dsc_accountname => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spmanagedaccount).new(
      :name     => 'foo',
      :dsc_accountname => 'foo',
      :dsc_account => {"user"=>"user", "password"=>"password"},
      :dsc_emailnotification => 32,
      :dsc_preexpiredays => 32,
      :dsc_schedule => 'foo',
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spmanagedaccount.to_s).to eq("Dsc_spmanagedaccount[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spmanagedaccount[:ensure]).to eq :present
  end

  it 'should require that dsc_accountname is specified' do
    #dsc_spmanagedaccount[:dsc_accountname]
    expect { Puppet::Type.type(:dsc_spmanagedaccount).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_accountname is a required attribute/)
  end

  it 'should not accept array for dsc_accountname' do
    expect{dsc_spmanagedaccount[:dsc_accountname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_accountname' do
    expect{dsc_spmanagedaccount[:dsc_accountname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_accountname' do
    expect{dsc_spmanagedaccount[:dsc_accountname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_accountname' do
    expect{dsc_spmanagedaccount[:dsc_accountname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_account" do
    expect{dsc_spmanagedaccount[:dsc_account] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_account' do
    expect{dsc_spmanagedaccount[:dsc_account] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_account' do
    expect{dsc_spmanagedaccount[:dsc_account] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_account' do
    expect{dsc_spmanagedaccount[:dsc_account] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_account' do
    expect{dsc_spmanagedaccount[:dsc_account] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_emailnotification' do
    expect{dsc_spmanagedaccount[:dsc_emailnotification] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_emailnotification' do
    expect{dsc_spmanagedaccount[:dsc_emailnotification] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_emailnotification' do
    dsc_spmanagedaccount[:dsc_emailnotification] = 32
    expect(dsc_spmanagedaccount[:dsc_emailnotification]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_emailnotification' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spmanagedaccount[:dsc_emailnotification] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_emailnotification' do
    dsc_spmanagedaccount[:dsc_emailnotification] = '16'
    expect(dsc_spmanagedaccount[:dsc_emailnotification]).to eq(16)
  end

  it 'should accept string-like uint for dsc_emailnotification' do
    dsc_spmanagedaccount[:dsc_emailnotification] = '32'
    expect(dsc_spmanagedaccount[:dsc_emailnotification]).to eq(32)
  end

  it 'should accept string-like uint for dsc_emailnotification' do
    dsc_spmanagedaccount[:dsc_emailnotification] = '64'
    expect(dsc_spmanagedaccount[:dsc_emailnotification]).to eq(64)
  end

  it 'should not accept array for dsc_preexpiredays' do
    expect{dsc_spmanagedaccount[:dsc_preexpiredays] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_preexpiredays' do
    expect{dsc_spmanagedaccount[:dsc_preexpiredays] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_preexpiredays' do
    dsc_spmanagedaccount[:dsc_preexpiredays] = 32
    expect(dsc_spmanagedaccount[:dsc_preexpiredays]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_preexpiredays' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spmanagedaccount[:dsc_preexpiredays] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_preexpiredays' do
    dsc_spmanagedaccount[:dsc_preexpiredays] = '16'
    expect(dsc_spmanagedaccount[:dsc_preexpiredays]).to eq(16)
  end

  it 'should accept string-like uint for dsc_preexpiredays' do
    dsc_spmanagedaccount[:dsc_preexpiredays] = '32'
    expect(dsc_spmanagedaccount[:dsc_preexpiredays]).to eq(32)
  end

  it 'should accept string-like uint for dsc_preexpiredays' do
    dsc_spmanagedaccount[:dsc_preexpiredays] = '64'
    expect(dsc_spmanagedaccount[:dsc_preexpiredays]).to eq(64)
  end

  it 'should not accept array for dsc_schedule' do
    expect{dsc_spmanagedaccount[:dsc_schedule] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_schedule' do
    expect{dsc_spmanagedaccount[:dsc_schedule] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_schedule' do
    expect{dsc_spmanagedaccount[:dsc_schedule] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_schedule' do
    expect{dsc_spmanagedaccount[:dsc_schedule] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spmanagedaccount[:dsc_ensure] = 'Present'
    expect(dsc_spmanagedaccount[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spmanagedaccount[:dsc_ensure] = 'present'
    expect(dsc_spmanagedaccount[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spmanagedaccount[:dsc_ensure] = 'present'
    expect(dsc_spmanagedaccount[:ensure]).to eq(dsc_spmanagedaccount[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spmanagedaccount[:dsc_ensure] = 'Absent'
    expect(dsc_spmanagedaccount[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spmanagedaccount[:dsc_ensure] = 'absent'
    expect(dsc_spmanagedaccount[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spmanagedaccount[:dsc_ensure] = 'absent'
    expect(dsc_spmanagedaccount[:ensure]).to eq(dsc_spmanagedaccount[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spmanagedaccount[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spmanagedaccount[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spmanagedaccount[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spmanagedaccount[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spmanagedaccount[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spmanagedaccount[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spmanagedaccount[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spmanagedaccount[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spmanagedaccount[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spmanagedaccount[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spmanagedaccount)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spmanagedaccount)
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
        dsc_spmanagedaccount.original_parameters[:dsc_ensure] = 'present'
        dsc_spmanagedaccount[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spmanagedaccount)
      end

      it "should update :ensure to :present" do
        expect(dsc_spmanagedaccount[:ensure]).to eq(:present)
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
        dsc_spmanagedaccount.original_parameters[:dsc_ensure] = 'absent'
        dsc_spmanagedaccount[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spmanagedaccount)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spmanagedaccount[:ensure]).to eq(:absent)
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
