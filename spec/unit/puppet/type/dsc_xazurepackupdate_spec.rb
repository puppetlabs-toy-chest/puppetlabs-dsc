#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazurepackupdate) do

  let :dsc_xazurepackupdate do
    Puppet::Type.type(:dsc_xazurepackupdate).new(
      :name     => 'foo',
      :dsc_role => 'Admin API',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazurepackupdate.to_s).to eq("Dsc_xazurepackupdate[foo]")
  end

  it 'should require that dsc_role is specified' do
    #dsc_xazurepackupdate[:dsc_role]
    expect { Puppet::Type.type(:dsc_xazurepackupdate).new(
      :name     => 'foo',
      :dsc_sourcepath => 'foo',
      :dsc_sourcefolder => 'foo',
      :dsc_setupcredential => {"user"=>"user", "password"=>"password"},
    )}.to raise_error(Puppet::Error, /dsc_role is a required attribute/)
  end

  it 'should accept dsc_role predefined value Admin API' do
    dsc_xazurepackupdate[:dsc_role] = 'Admin API'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('Admin API')
  end

  it 'should accept dsc_role predefined value admin api' do
    dsc_xazurepackupdate[:dsc_role] = 'admin api'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('admin api')
  end

  it 'should accept dsc_role predefined value Tenant API' do
    dsc_xazurepackupdate[:dsc_role] = 'Tenant API'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('Tenant API')
  end

  it 'should accept dsc_role predefined value tenant api' do
    dsc_xazurepackupdate[:dsc_role] = 'tenant api'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('tenant api')
  end

  it 'should accept dsc_role predefined value Tenant Public API' do
    dsc_xazurepackupdate[:dsc_role] = 'Tenant Public API'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('Tenant Public API')
  end

  it 'should accept dsc_role predefined value tenant public api' do
    dsc_xazurepackupdate[:dsc_role] = 'tenant public api'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('tenant public api')
  end

  it 'should accept dsc_role predefined value SQL Server Extension' do
    dsc_xazurepackupdate[:dsc_role] = 'SQL Server Extension'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('SQL Server Extension')
  end

  it 'should accept dsc_role predefined value sql server extension' do
    dsc_xazurepackupdate[:dsc_role] = 'sql server extension'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('sql server extension')
  end

  it 'should accept dsc_role predefined value MySQL Extension' do
    dsc_xazurepackupdate[:dsc_role] = 'MySQL Extension'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('MySQL Extension')
  end

  it 'should accept dsc_role predefined value mysql extension' do
    dsc_xazurepackupdate[:dsc_role] = 'mysql extension'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('mysql extension')
  end

  it 'should accept dsc_role predefined value Admin Site' do
    dsc_xazurepackupdate[:dsc_role] = 'Admin Site'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('Admin Site')
  end

  it 'should accept dsc_role predefined value admin site' do
    dsc_xazurepackupdate[:dsc_role] = 'admin site'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('admin site')
  end

  it 'should accept dsc_role predefined value Admin Authentication Site' do
    dsc_xazurepackupdate[:dsc_role] = 'Admin Authentication Site'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('Admin Authentication Site')
  end

  it 'should accept dsc_role predefined value admin authentication site' do
    dsc_xazurepackupdate[:dsc_role] = 'admin authentication site'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('admin authentication site')
  end

  it 'should accept dsc_role predefined value Tenant Site' do
    dsc_xazurepackupdate[:dsc_role] = 'Tenant Site'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('Tenant Site')
  end

  it 'should accept dsc_role predefined value tenant site' do
    dsc_xazurepackupdate[:dsc_role] = 'tenant site'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('tenant site')
  end

  it 'should accept dsc_role predefined value Tenant Authentication Site' do
    dsc_xazurepackupdate[:dsc_role] = 'Tenant Authentication Site'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('Tenant Authentication Site')
  end

  it 'should accept dsc_role predefined value tenant authentication site' do
    dsc_xazurepackupdate[:dsc_role] = 'tenant authentication site'
    expect(dsc_xazurepackupdate[:dsc_role]).to eq('tenant authentication site')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazurepackupdate[:dsc_role] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_role' do
    expect{dsc_xazurepackupdate[:dsc_role] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_role' do
    expect{dsc_xazurepackupdate[:dsc_role] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_role' do
    expect{dsc_xazurepackupdate[:dsc_role] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_role' do
    expect{dsc_xazurepackupdate[:dsc_role] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcepath' do
    expect{dsc_xazurepackupdate[:dsc_sourcepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcepath' do
    expect{dsc_xazurepackupdate[:dsc_sourcepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcepath' do
    expect{dsc_xazurepackupdate[:dsc_sourcepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcepath' do
    expect{dsc_xazurepackupdate[:dsc_sourcepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_sourcefolder' do
    expect{dsc_xazurepackupdate[:dsc_sourcefolder] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_sourcefolder' do
    expect{dsc_xazurepackupdate[:dsc_sourcefolder] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sourcefolder' do
    expect{dsc_xazurepackupdate[:dsc_sourcefolder] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sourcefolder' do
    expect{dsc_xazurepackupdate[:dsc_sourcefolder] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_setupcredential" do
    expect{dsc_xazurepackupdate[:dsc_setupcredential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_setupcredential' do
    expect{dsc_xazurepackupdate[:dsc_setupcredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_setupcredential' do
    expect{dsc_xazurepackupdate[:dsc_setupcredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_setupcredential' do
    expect{dsc_xazurepackupdate[:dsc_setupcredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_setupcredential' do
    expect{dsc_xazurepackupdate[:dsc_setupcredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xazurepackupdate)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xazurepackupdate)
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
