#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xazuresqldatabaseserverfirewallrule) do

  let :dsc_xazuresqldatabaseserverfirewallrule do
    Puppet::Type.type(:dsc_xazuresqldatabaseserverfirewallrule).new(
      :name     => 'foo',
      :dsc_rulename => 'foo',
      :dsc_servername => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xazuresqldatabaseserverfirewallrule.to_s).to eq("Dsc_xazuresqldatabaseserverfirewallrule[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xazuresqldatabaseserverfirewallrule[:ensure]).to eq :present
  end

  it 'should require that dsc_rulename is specified' do
    #dsc_xazuresqldatabaseserverfirewallrule[:dsc_rulename]
    expect { Puppet::Type.type(:dsc_xazuresqldatabaseserverfirewallrule).new(
      :name     => 'foo',
      :dsc_servername => 'foo',
      :dsc_startipaddress => 'foo',
      :dsc_endipaddress => 'foo',
      :dsc_azuresubscriptionname => 'foo',
      :dsc_azurepublishsettingsfile => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_rulename is a required attribute/)
  end

  it 'should not accept array for dsc_rulename' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_rulename] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_rulename' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_rulename] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_rulename' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_rulename] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rulename' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_rulename] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_servername is specified' do
    #dsc_xazuresqldatabaseserverfirewallrule[:dsc_servername]
    expect { Puppet::Type.type(:dsc_xazuresqldatabaseserverfirewallrule).new(
      :name     => 'foo',
      :dsc_rulename => 'foo',
      :dsc_startipaddress => 'foo',
      :dsc_endipaddress => 'foo',
      :dsc_azuresubscriptionname => 'foo',
      :dsc_azurepublishsettingsfile => 'foo',
      :dsc_ensure => 'Present',
    )}.to raise_error(Puppet::Error, /dsc_servername is a required attribute/)
  end

  it 'should not accept array for dsc_servername' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_servername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_servername' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_servername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_servername' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_servername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_servername' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_servername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_startipaddress' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_startipaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_startipaddress' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_startipaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_startipaddress' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_startipaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_startipaddress' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_startipaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_endipaddress' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_endipaddress] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_endipaddress' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_endipaddress] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_endipaddress' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_endipaddress] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_endipaddress' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_endipaddress] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_azuresubscriptionname' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_azuresubscriptionname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_azuresubscriptionname' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_azuresubscriptionname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_azuresubscriptionname' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_azuresubscriptionname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_azuresubscriptionname' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_azuresubscriptionname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_azurepublishsettingsfile' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_azurepublishsettingsfile] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_azurepublishsettingsfile' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_azurepublishsettingsfile] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_azurepublishsettingsfile' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_azurepublishsettingsfile] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_azurepublishsettingsfile' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_azurepublishsettingsfile] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = 'Present'
    expect(dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = 'present'
    expect(dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = 'present'
    expect(dsc_xazuresqldatabaseserverfirewallrule[:ensure]).to eq(dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = 'Absent'
    expect(dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = 'absent'
    expect(dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = 'absent'
    expect(dsc_xazuresqldatabaseserverfirewallrule[:ensure]).to eq(dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xazuresqldatabaseserverfirewallrule)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xazuresqldatabaseserverfirewallrule)
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
        dsc_xazuresqldatabaseserverfirewallrule.original_parameters[:dsc_ensure] = 'present'
        dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xazuresqldatabaseserverfirewallrule)
      end

      it "should update :ensure to :present" do
        expect(dsc_xazuresqldatabaseserverfirewallrule[:ensure]).to eq(:present)
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
        dsc_xazuresqldatabaseserverfirewallrule.original_parameters[:dsc_ensure] = 'absent'
        dsc_xazuresqldatabaseserverfirewallrule[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xazuresqldatabaseserverfirewallrule)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xazuresqldatabaseserverfirewallrule[:ensure]).to eq(:absent)
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
