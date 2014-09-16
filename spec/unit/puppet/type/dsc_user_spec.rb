#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_user) do

  let :dsc_user do
    Puppet::Type.type(:dsc_user).new(
      :name     => 'foo',
      :dsc_username => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_user.to_s).to eq("Dsc_user[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_user[:ensure]).to eq :present
  end

  it 'should require that dsc_username is specified' do
    #dsc_user[:dsc_username]
    expect { Puppet::Type.type(:dsc_user).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_fullname => 'foo',
      :dsc_description => 'foo',
      :dsc_password => 'foo',
      :dsc_disabled => true,
      :dsc_passwordneverexpires => true,
      :dsc_passwordchangerequired => true,
      :dsc_passwordchangenotallowed => true,
    )}.to raise_error(Puppet::Error, /dsc_username is a required attribute/)
  end

  it 'should not accept array for dsc_username' do
    expect{dsc_user[:dsc_username] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_username' do
    expect{dsc_user[:dsc_username] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_username' do
    expect{dsc_user[:dsc_username] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_username' do
    expect{dsc_user[:dsc_username] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_user[:dsc_ensure] = 'Present'
    expect(dsc_user[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_user[:dsc_ensure] = 'present'
    expect(dsc_user[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_user[:dsc_ensure] = 'present'
    expect(dsc_user[:ensure]).to eq(dsc_user[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_user[:dsc_ensure] = 'Absent'
    expect(dsc_user[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_user[:dsc_ensure] = 'absent'
    expect(dsc_user[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_user[:dsc_ensure] = 'absent'
    expect(dsc_user[:ensure]).to eq(dsc_user[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_user[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_user[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_user[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_user[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_user[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_fullname' do
    expect{dsc_user[:dsc_fullname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_fullname' do
    expect{dsc_user[:dsc_fullname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_fullname' do
    expect{dsc_user[:dsc_fullname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_fullname' do
    expect{dsc_user[:dsc_fullname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_user[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_user[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_user[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_user[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_password' do
    expect{dsc_user[:dsc_password] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_password' do
    expect{dsc_user[:dsc_password] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_password' do
    expect{dsc_user[:dsc_password] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_password' do
    expect{dsc_user[:dsc_password] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_disabled' do
    expect{dsc_user[:dsc_disabled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_disabled' do
    dsc_user[:dsc_disabled] = true
    expect(dsc_user[:dsc_disabled]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_disabled" do
    dsc_user[:dsc_disabled] = 'true'
    expect(dsc_user[:dsc_disabled]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_disabled" do
    dsc_user[:dsc_disabled] = 'false'
    expect(dsc_user[:dsc_disabled]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_disabled" do
    dsc_user[:dsc_disabled] = 'True'
    expect(dsc_user[:dsc_disabled]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_disabled" do
    dsc_user[:dsc_disabled] = 'False'
    expect(dsc_user[:dsc_disabled]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_disabled" do
    dsc_user[:dsc_disabled] = :true
    expect(dsc_user[:dsc_disabled]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_disabled" do
    dsc_user[:dsc_disabled] = :false
    expect(dsc_user[:dsc_disabled]).to eq(false)
  end

  it 'should not accept int for dsc_disabled' do
    expect{dsc_user[:dsc_disabled] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_disabled' do
    expect{dsc_user[:dsc_disabled] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_passwordneverexpires' do
    expect{dsc_user[:dsc_passwordneverexpires] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_passwordneverexpires' do
    dsc_user[:dsc_passwordneverexpires] = true
    expect(dsc_user[:dsc_passwordneverexpires]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_user[:dsc_passwordneverexpires] = 'true'
    expect(dsc_user[:dsc_passwordneverexpires]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_user[:dsc_passwordneverexpires] = 'false'
    expect(dsc_user[:dsc_passwordneverexpires]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_user[:dsc_passwordneverexpires] = 'True'
    expect(dsc_user[:dsc_passwordneverexpires]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_user[:dsc_passwordneverexpires] = 'False'
    expect(dsc_user[:dsc_passwordneverexpires]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_user[:dsc_passwordneverexpires] = :true
    expect(dsc_user[:dsc_passwordneverexpires]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_passwordneverexpires" do
    dsc_user[:dsc_passwordneverexpires] = :false
    expect(dsc_user[:dsc_passwordneverexpires]).to eq(false)
  end

  it 'should not accept int for dsc_passwordneverexpires' do
    expect{dsc_user[:dsc_passwordneverexpires] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_passwordneverexpires' do
    expect{dsc_user[:dsc_passwordneverexpires] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_passwordchangerequired' do
    expect{dsc_user[:dsc_passwordchangerequired] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_passwordchangerequired' do
    dsc_user[:dsc_passwordchangerequired] = true
    expect(dsc_user[:dsc_passwordchangerequired]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_passwordchangerequired" do
    dsc_user[:dsc_passwordchangerequired] = 'true'
    expect(dsc_user[:dsc_passwordchangerequired]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_passwordchangerequired" do
    dsc_user[:dsc_passwordchangerequired] = 'false'
    expect(dsc_user[:dsc_passwordchangerequired]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_passwordchangerequired" do
    dsc_user[:dsc_passwordchangerequired] = 'True'
    expect(dsc_user[:dsc_passwordchangerequired]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_passwordchangerequired" do
    dsc_user[:dsc_passwordchangerequired] = 'False'
    expect(dsc_user[:dsc_passwordchangerequired]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_passwordchangerequired" do
    dsc_user[:dsc_passwordchangerequired] = :true
    expect(dsc_user[:dsc_passwordchangerequired]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_passwordchangerequired" do
    dsc_user[:dsc_passwordchangerequired] = :false
    expect(dsc_user[:dsc_passwordchangerequired]).to eq(false)
  end

  it 'should not accept int for dsc_passwordchangerequired' do
    expect{dsc_user[:dsc_passwordchangerequired] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_passwordchangerequired' do
    expect{dsc_user[:dsc_passwordchangerequired] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_passwordchangenotallowed' do
    expect{dsc_user[:dsc_passwordchangenotallowed] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_passwordchangenotallowed' do
    dsc_user[:dsc_passwordchangenotallowed] = true
    expect(dsc_user[:dsc_passwordchangenotallowed]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_passwordchangenotallowed" do
    dsc_user[:dsc_passwordchangenotallowed] = 'true'
    expect(dsc_user[:dsc_passwordchangenotallowed]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_passwordchangenotallowed" do
    dsc_user[:dsc_passwordchangenotallowed] = 'false'
    expect(dsc_user[:dsc_passwordchangenotallowed]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_passwordchangenotallowed" do
    dsc_user[:dsc_passwordchangenotallowed] = 'True'
    expect(dsc_user[:dsc_passwordchangenotallowed]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_passwordchangenotallowed" do
    dsc_user[:dsc_passwordchangenotallowed] = 'False'
    expect(dsc_user[:dsc_passwordchangenotallowed]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_passwordchangenotallowed" do
    dsc_user[:dsc_passwordchangenotallowed] = :true
    expect(dsc_user[:dsc_passwordchangenotallowed]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_passwordchangenotallowed" do
    dsc_user[:dsc_passwordchangenotallowed] = :false
    expect(dsc_user[:dsc_passwordchangenotallowed]).to eq(false)
  end

  it 'should not accept int for dsc_passwordchangenotallowed' do
    expect{dsc_user[:dsc_passwordchangenotallowed] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_passwordchangenotallowed' do
    expect{dsc_user[:dsc_passwordchangenotallowed] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_user)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_user)
    end

    describe "when dscmeta_import_resource is true (default) and dscmeta_module_name existing/is defined " do

      it "should compute powershell dsc test script with Import-DscResource" do
        expect(@provider.ps_script_content('test')).to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script with Import-DscResource" do
        expect(@provider.ps_script_content('set')).to match(/Import-DscResource/)
      end

    end

    describe "when dscmeta_import_resource is false" do

      it "should compute powershell dsc test script without Import-DscResource" do
        dsc_user[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_user[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_user.original_parameters[:dsc_ensure] = 'present'
        dsc_user[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_user)
      end

      it "should update :ensure to :present" do
        expect(dsc_user[:ensure]).to eq(:present)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'present'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'present'/)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_user.original_parameters[:dsc_ensure] = 'absent'
        dsc_user[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_user)
      end

      it "should update :ensure to :absent" do
        expect(dsc_user[:ensure]).to eq(:absent)
      end

      it "should compute powershell dsc test script in which ensure value is 'present'" do
        @provider.set_test_dsc_parameters
        expect(@provider.ps_script_content('test')).to match(/ensure = 'present'/)
      end

      it "should compute powershell dsc set script in which ensure value is 'absent'" do
        @provider.set_original_dsc_parameters
        expect(@provider.ps_script_content('set')).to match(/ensure = 'absent'/)
      end

    end

  end

  # mof PROVIDERS TESTS

  describe "mof provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_mof).new(dsc_user)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_user)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_UserResource as $MSFT_UserResource1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_UserResource/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_user[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_user)
      end

      it "should update :ensure to :present" do
        expect(dsc_user[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_user[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_user)
      end

      it "should update :ensure to :absent" do
        expect(dsc_user[:ensure]).to eq(:absent)
      end

    end

  end
end
