#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwindowsoptionalfeature) do

  let :dsc_xwindowsoptionalfeature do
    Puppet::Type.type(:dsc_xwindowsoptionalfeature).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xwindowsoptionalfeature.to_s).to eq("Dsc_xwindowsoptionalfeature[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xwindowsoptionalfeature[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xwindowsoptionalfeature[:dsc_name]
    expect { Puppet::Type.type(:dsc_xwindowsoptionalfeature).new(
      :name     => 'foo',
      :dsc_ensure => 'Present',
      :dsc_source => ["foo", "bar", "spec"],
      :dsc_nowindowsupdatecheck => true,
      :dsc_removefilesondisable => true,
      :dsc_loglevel => 'ErrorsOnly',
      :dsc_logpath => 'foo',
      :dsc_customproperties => ["foo", "bar", "spec"],
      :dsc_description => 'foo',
      :dsc_displayname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xwindowsoptionalfeature[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xwindowsoptionalfeature[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xwindowsoptionalfeature[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xwindowsoptionalfeature[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xwindowsoptionalfeature[:dsc_ensure] = 'Present'
    expect(dsc_xwindowsoptionalfeature[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xwindowsoptionalfeature[:dsc_ensure] = 'present'
    expect(dsc_xwindowsoptionalfeature[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwindowsoptionalfeature[:dsc_ensure] = 'present'
    expect(dsc_xwindowsoptionalfeature[:ensure]).to eq(dsc_xwindowsoptionalfeature[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xwindowsoptionalfeature[:dsc_ensure] = 'Absent'
    expect(dsc_xwindowsoptionalfeature[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xwindowsoptionalfeature[:dsc_ensure] = 'absent'
    expect(dsc_xwindowsoptionalfeature[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xwindowsoptionalfeature[:dsc_ensure] = 'absent'
    expect(dsc_xwindowsoptionalfeature[:ensure]).to eq(dsc_xwindowsoptionalfeature[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwindowsoptionalfeature[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xwindowsoptionalfeature[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xwindowsoptionalfeature[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xwindowsoptionalfeature[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xwindowsoptionalfeature[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_source' do
    dsc_xwindowsoptionalfeature[:dsc_source] = ["foo", "bar", "spec"]
    expect(dsc_xwindowsoptionalfeature[:dsc_source]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_source' do
    expect{dsc_xwindowsoptionalfeature[:dsc_source] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_source' do
    expect{dsc_xwindowsoptionalfeature[:dsc_source] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_source' do
    expect{dsc_xwindowsoptionalfeature[:dsc_source] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_nowindowsupdatecheck' do
    expect{dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_nowindowsupdatecheck' do
    dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck] = true
    expect(dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck] = 'true'
    expect(dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck] = 'false'
    expect(dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck] = 'True'
    expect(dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck] = 'False'
    expect(dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck] = :true
    expect(dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_nowindowsupdatecheck" do
    dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck] = :false
    expect(dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck]).to eq(false)
  end

  it 'should not accept int for dsc_nowindowsupdatecheck' do
    expect{dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_nowindowsupdatecheck' do
    expect{dsc_xwindowsoptionalfeature[:dsc_nowindowsupdatecheck] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_removefilesondisable' do
    expect{dsc_xwindowsoptionalfeature[:dsc_removefilesondisable] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_removefilesondisable' do
    dsc_xwindowsoptionalfeature[:dsc_removefilesondisable] = true
    expect(dsc_xwindowsoptionalfeature[:dsc_removefilesondisable]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_removefilesondisable" do
    dsc_xwindowsoptionalfeature[:dsc_removefilesondisable] = 'true'
    expect(dsc_xwindowsoptionalfeature[:dsc_removefilesondisable]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_removefilesondisable" do
    dsc_xwindowsoptionalfeature[:dsc_removefilesondisable] = 'false'
    expect(dsc_xwindowsoptionalfeature[:dsc_removefilesondisable]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_removefilesondisable" do
    dsc_xwindowsoptionalfeature[:dsc_removefilesondisable] = 'True'
    expect(dsc_xwindowsoptionalfeature[:dsc_removefilesondisable]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_removefilesondisable" do
    dsc_xwindowsoptionalfeature[:dsc_removefilesondisable] = 'False'
    expect(dsc_xwindowsoptionalfeature[:dsc_removefilesondisable]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_removefilesondisable" do
    dsc_xwindowsoptionalfeature[:dsc_removefilesondisable] = :true
    expect(dsc_xwindowsoptionalfeature[:dsc_removefilesondisable]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_removefilesondisable" do
    dsc_xwindowsoptionalfeature[:dsc_removefilesondisable] = :false
    expect(dsc_xwindowsoptionalfeature[:dsc_removefilesondisable]).to eq(false)
  end

  it 'should not accept int for dsc_removefilesondisable' do
    expect{dsc_xwindowsoptionalfeature[:dsc_removefilesondisable] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_removefilesondisable' do
    expect{dsc_xwindowsoptionalfeature[:dsc_removefilesondisable] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_loglevel predefined value ErrorsOnly' do
    dsc_xwindowsoptionalfeature[:dsc_loglevel] = 'ErrorsOnly'
    expect(dsc_xwindowsoptionalfeature[:dsc_loglevel]).to eq('ErrorsOnly')
  end

  it 'should accept dsc_loglevel predefined value errorsonly' do
    dsc_xwindowsoptionalfeature[:dsc_loglevel] = 'errorsonly'
    expect(dsc_xwindowsoptionalfeature[:dsc_loglevel]).to eq('errorsonly')
  end

  it 'should accept dsc_loglevel predefined value ErrorsAndWarning' do
    dsc_xwindowsoptionalfeature[:dsc_loglevel] = 'ErrorsAndWarning'
    expect(dsc_xwindowsoptionalfeature[:dsc_loglevel]).to eq('ErrorsAndWarning')
  end

  it 'should accept dsc_loglevel predefined value errorsandwarning' do
    dsc_xwindowsoptionalfeature[:dsc_loglevel] = 'errorsandwarning'
    expect(dsc_xwindowsoptionalfeature[:dsc_loglevel]).to eq('errorsandwarning')
  end

  it 'should accept dsc_loglevel predefined value ErrorsAndWarningAndInformation' do
    dsc_xwindowsoptionalfeature[:dsc_loglevel] = 'ErrorsAndWarningAndInformation'
    expect(dsc_xwindowsoptionalfeature[:dsc_loglevel]).to eq('ErrorsAndWarningAndInformation')
  end

  it 'should accept dsc_loglevel predefined value errorsandwarningandinformation' do
    dsc_xwindowsoptionalfeature[:dsc_loglevel] = 'errorsandwarningandinformation'
    expect(dsc_xwindowsoptionalfeature[:dsc_loglevel]).to eq('errorsandwarningandinformation')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwindowsoptionalfeature[:dsc_loglevel] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_loglevel' do
    expect{dsc_xwindowsoptionalfeature[:dsc_loglevel] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_loglevel' do
    expect{dsc_xwindowsoptionalfeature[:dsc_loglevel] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_loglevel' do
    expect{dsc_xwindowsoptionalfeature[:dsc_loglevel] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_loglevel' do
    expect{dsc_xwindowsoptionalfeature[:dsc_loglevel] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_logpath' do
    expect{dsc_xwindowsoptionalfeature[:dsc_logpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_logpath' do
    expect{dsc_xwindowsoptionalfeature[:dsc_logpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_logpath' do
    expect{dsc_xwindowsoptionalfeature[:dsc_logpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_logpath' do
    expect{dsc_xwindowsoptionalfeature[:dsc_logpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_customproperties' do
    dsc_xwindowsoptionalfeature[:dsc_customproperties] = ["foo", "bar", "spec"]
    expect(dsc_xwindowsoptionalfeature[:dsc_customproperties]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_customproperties' do
    expect{dsc_xwindowsoptionalfeature[:dsc_customproperties] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_customproperties' do
    expect{dsc_xwindowsoptionalfeature[:dsc_customproperties] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_customproperties' do
    expect{dsc_xwindowsoptionalfeature[:dsc_customproperties] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xwindowsoptionalfeature[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xwindowsoptionalfeature[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xwindowsoptionalfeature[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xwindowsoptionalfeature[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_xwindowsoptionalfeature[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_xwindowsoptionalfeature[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_xwindowsoptionalfeature[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_xwindowsoptionalfeature[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "dsc_configuration provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:dsc_configuration).new(dsc_xwindowsoptionalfeature)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_configuration).new(dsc_xwindowsoptionalfeature)
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
        dsc_xwindowsoptionalfeature[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('test')).not_to match(/Import-DscResource/)
      end

      it "should compute powershell dsc set script without Import-DscResource" do
        dsc_xwindowsoptionalfeature[:dscmeta_import_resource] = false
        expect(@provider.ps_script_content('set')).not_to match(/Import-DscResource/)
      end

    end

    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xwindowsoptionalfeature.original_parameters[:dsc_ensure] = 'present'
        dsc_xwindowsoptionalfeature[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xwindowsoptionalfeature)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwindowsoptionalfeature[:ensure]).to eq(:present)
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
        dsc_xwindowsoptionalfeature.original_parameters[:dsc_ensure] = 'absent'
        dsc_xwindowsoptionalfeature[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_configuration).new(dsc_xwindowsoptionalfeature)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwindowsoptionalfeature[:ensure]).to eq(:absent)
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
      described_class.provider(:dsc_mof).new(dsc_xwindowsoptionalfeature)
    end

    before(:each) do
      @provider = described_class.provider(:dsc_mof).new(dsc_xwindowsoptionalfeature)
    end

    it "should successfully build mof file" do
#     expect(@provider.mof_test_content).to match(/instance of MSFT_xWindowsOptionalFeature as $MSFT_xWindowsOptionalFeature1ref$/)
      expect(@provider.mof_test_content).to match(/instance of MSFT_xWindowsOptionalFeature/)
    end


    describe "when dsc_ensure is 'present'" do

      before(:each) do
        dsc_xwindowsoptionalfeature[:dsc_ensure] = 'present'
        @provider = described_class.provider(:dsc_mof).new(dsc_xwindowsoptionalfeature)
      end

      it "should update :ensure to :present" do
        expect(dsc_xwindowsoptionalfeature[:ensure]).to eq(:present)
      end

    end

    describe "when dsc_ensure is 'absent'" do

      before(:each) do
        dsc_xwindowsoptionalfeature[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:dsc_mof).new(dsc_xwindowsoptionalfeature)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xwindowsoptionalfeature[:ensure]).to eq(:absent)
      end

    end

  end
end
