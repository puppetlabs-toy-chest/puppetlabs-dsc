#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xmysqlgrant) do

  let :dsc_xmysqlgrant do
    Puppet::Type.type(:dsc_xmysqlgrant).new(
      :name     => 'foo',
      :dsc_username => 'foo',
      :dsc_databasename => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xmysqlgrant.to_s).to eq("Dsc_xmysqlgrant[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xmysqlgrant[:ensure]).to eq :present
  end

  it 'should require that dsc_username is specified' do
    #dsc_xmysqlgrant[:dsc_username]
    expect { Puppet::Type.type(:dsc_xmysqlgrant).new(
      :name     => 'foo',
      :dsc_databasename => 'foo',
      :dsc_connectioncredential => 'foo',
      :dsc_permissiontype => 'ALL PRIVILEGES',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_username is a required attribute/)
  end

  it 'should not accept array for dsc_username' do
    expect{dsc_xmysqlgrant[:dsc_username] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_username' do
    expect{dsc_xmysqlgrant[:dsc_username] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_username' do
    expect{dsc_xmysqlgrant[:dsc_username] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_username' do
    expect{dsc_xmysqlgrant[:dsc_username] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_databasename is specified' do
    #dsc_xmysqlgrant[:dsc_databasename]
    expect { Puppet::Type.type(:dsc_xmysqlgrant).new(
      :name     => 'foo',
      :dsc_username => 'foo',
      :dsc_connectioncredential => 'foo',
      :dsc_permissiontype => 'ALL PRIVILEGES',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_databasename is a required attribute/)
  end

  it 'should not accept array for dsc_databasename' do
    expect{dsc_xmysqlgrant[:dsc_databasename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_databasename' do
    expect{dsc_xmysqlgrant[:dsc_databasename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_databasename' do
    expect{dsc_xmysqlgrant[:dsc_databasename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_databasename' do
    expect{dsc_xmysqlgrant[:dsc_databasename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_connectioncredential' do
    expect{dsc_xmysqlgrant[:dsc_connectioncredential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_connectioncredential' do
    expect{dsc_xmysqlgrant[:dsc_connectioncredential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_connectioncredential' do
    expect{dsc_xmysqlgrant[:dsc_connectioncredential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_connectioncredential' do
    expect{dsc_xmysqlgrant[:dsc_connectioncredential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_permissiontype predefined value ALL PRIVILEGES' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'ALL PRIVILEGES'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('ALL PRIVILEGES')
  end

  it 'should accept dsc_permissiontype predefined value all privileges' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'all privileges'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('all privileges')
  end

  it 'should accept dsc_permissiontype predefined value CREATE' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'CREATE'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('CREATE')
  end

  it 'should accept dsc_permissiontype predefined value create' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'create'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('create')
  end

  it 'should accept dsc_permissiontype predefined value DROP' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'DROP'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('DROP')
  end

  it 'should accept dsc_permissiontype predefined value drop' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'drop'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('drop')
  end

  it 'should accept dsc_permissiontype predefined value DELETE' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'DELETE'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('DELETE')
  end

  it 'should accept dsc_permissiontype predefined value delete' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'delete'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('delete')
  end

  it 'should accept dsc_permissiontype predefined value INSERT' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'INSERT'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('INSERT')
  end

  it 'should accept dsc_permissiontype predefined value insert' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'insert'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('insert')
  end

  it 'should accept dsc_permissiontype predefined value SELECT' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'SELECT'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('SELECT')
  end

  it 'should accept dsc_permissiontype predefined value select' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'select'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('select')
  end

  it 'should accept dsc_permissiontype predefined value UPDATE' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'UPDATE'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('UPDATE')
  end

  it 'should accept dsc_permissiontype predefined value update' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'update'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('update')
  end

  it 'should accept dsc_permissiontype predefined value EXECUTE' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'EXECUTE'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('EXECUTE')
  end

  it 'should accept dsc_permissiontype predefined value execute' do
    dsc_xmysqlgrant[:dsc_permissiontype] = 'execute'
    expect(dsc_xmysqlgrant[:dsc_permissiontype]).to eq('execute')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmysqlgrant[:dsc_permissiontype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_permissiontype' do
    expect{dsc_xmysqlgrant[:dsc_permissiontype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_permissiontype' do
    expect{dsc_xmysqlgrant[:dsc_permissiontype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_permissiontype' do
    expect{dsc_xmysqlgrant[:dsc_permissiontype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_permissiontype' do
    expect{dsc_xmysqlgrant[:dsc_permissiontype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xmysqlgrant[:dsc_ensure] = 'Present'
    expect(dsc_xmysqlgrant[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xmysqlgrant[:dsc_ensure] = 'present'
    expect(dsc_xmysqlgrant[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xmysqlgrant[:dsc_ensure] = 'present'
    expect(dsc_xmysqlgrant[:ensure]).to eq(dsc_xmysqlgrant[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xmysqlgrant[:dsc_ensure] = 'Absent'
    expect(dsc_xmysqlgrant[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xmysqlgrant[:dsc_ensure] = 'absent'
    expect(dsc_xmysqlgrant[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xmysqlgrant[:dsc_ensure] = 'absent'
    expect(dsc_xmysqlgrant[:ensure]).to eq(dsc_xmysqlgrant[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xmysqlgrant[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xmysqlgrant[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xmysqlgrant[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xmysqlgrant[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xmysqlgrant[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xmysqlgrant)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xmysqlgrant)
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
        dsc_xmysqlgrant[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xmysqlgrant[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xmysqlgrant.original_parameters[:dsc_ensure] = 'present'
        dsc_xmysqlgrant[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xmysqlgrant)
      end

      it "should update :ensure to :present" do
        expect(dsc_xmysqlgrant[:ensure]).to eq(:present)
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
        dsc_xmysqlgrant.original_parameters[:dsc_ensure] = 'absent'
        dsc_xmysqlgrant[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xmysqlgrant)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xmysqlgrant[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xmysqlgrant)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xmysqlgrant)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xMySqlGrant as $MSFT_xMySqlGrant1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xMySqlGrant/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xmysqlgrant[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xmysqlgrant)
      end

      it "should update :ensure to :present" do
        expect(dsc_xmysqlgrant[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xmysqlgrant[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xmysqlgrant)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xmysqlgrant[:ensure]).to eq(:absent)
      end

    end

  end
end
