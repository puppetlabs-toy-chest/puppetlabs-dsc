#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spmanagedpath) do

  let :dsc_spmanagedpath do
    Puppet::Type.type(:dsc_spmanagedpath).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_relativeurl => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spmanagedpath).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_relativeurl => 'foo',
      :dsc_explicit => true,
      :dsc_hostheader => true,
      :dsc_ensure => 'Present',
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spmanagedpath.to_s).to eq("Dsc_spmanagedpath[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spmanagedpath[:ensure]).to eq :present
  end

  it 'should require that dsc_webappurl is specified' do
    #dsc_spmanagedpath[:dsc_webappurl]
    expect { Puppet::Type.type(:dsc_spmanagedpath).new(
      :name     => 'foo',
      :dsc_relativeurl => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_webappurl is a required attribute/)
  end

  it 'should not accept array for dsc_webappurl' do
    expect{dsc_spmanagedpath[:dsc_webappurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webappurl' do
    expect{dsc_spmanagedpath[:dsc_webappurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webappurl' do
    expect{dsc_spmanagedpath[:dsc_webappurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webappurl' do
    expect{dsc_spmanagedpath[:dsc_webappurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_relativeurl is specified' do
    #dsc_spmanagedpath[:dsc_relativeurl]
    expect { Puppet::Type.type(:dsc_spmanagedpath).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_relativeurl is a required attribute/)
  end

  it 'should not accept array for dsc_relativeurl' do
    expect{dsc_spmanagedpath[:dsc_relativeurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_relativeurl' do
    expect{dsc_spmanagedpath[:dsc_relativeurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_relativeurl' do
    expect{dsc_spmanagedpath[:dsc_relativeurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_relativeurl' do
    expect{dsc_spmanagedpath[:dsc_relativeurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_explicit' do
    expect{dsc_spmanagedpath[:dsc_explicit] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_explicit' do
    dsc_spmanagedpath[:dsc_explicit] = true
    expect(dsc_spmanagedpath[:dsc_explicit]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_explicit" do
    dsc_spmanagedpath[:dsc_explicit] = 'true'
    expect(dsc_spmanagedpath[:dsc_explicit]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_explicit" do
    dsc_spmanagedpath[:dsc_explicit] = 'false'
    expect(dsc_spmanagedpath[:dsc_explicit]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_explicit" do
    dsc_spmanagedpath[:dsc_explicit] = 'True'
    expect(dsc_spmanagedpath[:dsc_explicit]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_explicit" do
    dsc_spmanagedpath[:dsc_explicit] = 'False'
    expect(dsc_spmanagedpath[:dsc_explicit]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_explicit" do
    dsc_spmanagedpath[:dsc_explicit] = :true
    expect(dsc_spmanagedpath[:dsc_explicit]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_explicit" do
    dsc_spmanagedpath[:dsc_explicit] = :false
    expect(dsc_spmanagedpath[:dsc_explicit]).to eq(false)
  end

  it 'should not accept int for dsc_explicit' do
    expect{dsc_spmanagedpath[:dsc_explicit] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_explicit' do
    expect{dsc_spmanagedpath[:dsc_explicit] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_hostheader' do
    expect{dsc_spmanagedpath[:dsc_hostheader] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_hostheader' do
    dsc_spmanagedpath[:dsc_hostheader] = true
    expect(dsc_spmanagedpath[:dsc_hostheader]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_hostheader" do
    dsc_spmanagedpath[:dsc_hostheader] = 'true'
    expect(dsc_spmanagedpath[:dsc_hostheader]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_hostheader" do
    dsc_spmanagedpath[:dsc_hostheader] = 'false'
    expect(dsc_spmanagedpath[:dsc_hostheader]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_hostheader" do
    dsc_spmanagedpath[:dsc_hostheader] = 'True'
    expect(dsc_spmanagedpath[:dsc_hostheader]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_hostheader" do
    dsc_spmanagedpath[:dsc_hostheader] = 'False'
    expect(dsc_spmanagedpath[:dsc_hostheader]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_hostheader" do
    dsc_spmanagedpath[:dsc_hostheader] = :true
    expect(dsc_spmanagedpath[:dsc_hostheader]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_hostheader" do
    dsc_spmanagedpath[:dsc_hostheader] = :false
    expect(dsc_spmanagedpath[:dsc_hostheader]).to eq(false)
  end

  it 'should not accept int for dsc_hostheader' do
    expect{dsc_spmanagedpath[:dsc_hostheader] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_hostheader' do
    expect{dsc_spmanagedpath[:dsc_hostheader] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spmanagedpath[:dsc_ensure] = 'Present'
    expect(dsc_spmanagedpath[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spmanagedpath[:dsc_ensure] = 'present'
    expect(dsc_spmanagedpath[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spmanagedpath[:dsc_ensure] = 'present'
    expect(dsc_spmanagedpath[:ensure]).to eq(dsc_spmanagedpath[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spmanagedpath[:dsc_ensure] = 'Absent'
    expect(dsc_spmanagedpath[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spmanagedpath[:dsc_ensure] = 'absent'
    expect(dsc_spmanagedpath[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spmanagedpath[:dsc_ensure] = 'absent'
    expect(dsc_spmanagedpath[:ensure]).to eq(dsc_spmanagedpath[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spmanagedpath[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spmanagedpath[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spmanagedpath[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spmanagedpath[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spmanagedpath[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spmanagedpath[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spmanagedpath[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spmanagedpath[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spmanagedpath[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spmanagedpath[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spmanagedpath)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spmanagedpath)
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
        dsc_spmanagedpath.original_parameters[:dsc_ensure] = 'present'
        dsc_spmanagedpath[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spmanagedpath)
      end

      it "should update :ensure to :present" do
        expect(dsc_spmanagedpath[:ensure]).to eq(:present)
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
        dsc_spmanagedpath.original_parameters[:dsc_ensure] = 'absent'
        dsc_spmanagedpath[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spmanagedpath)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spmanagedpath[:ensure]).to eq(:absent)
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
