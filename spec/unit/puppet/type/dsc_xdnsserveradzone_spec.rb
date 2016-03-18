#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xdnsserveradzone) do

  let :dsc_xdnsserveradzone do
    Puppet::Type.type(:dsc_xdnsserveradzone).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xdnsserveradzone.to_s).to eq("Dsc_xdnsserveradzone[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xdnsserveradzone[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_xdnsserveradzone[:dsc_name]
    expect { Puppet::Type.type(:dsc_xdnsserveradzone).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_xdnsserveradzone[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_xdnsserveradzone[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_xdnsserveradzone[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_xdnsserveradzone[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_dynamicupdate predefined value None' do
    dsc_xdnsserveradzone[:dsc_dynamicupdate] = 'None'
    expect(dsc_xdnsserveradzone[:dsc_dynamicupdate]).to eq('None')
  end

  it 'should accept dsc_dynamicupdate predefined value none' do
    dsc_xdnsserveradzone[:dsc_dynamicupdate] = 'none'
    expect(dsc_xdnsserveradzone[:dsc_dynamicupdate]).to eq('none')
  end

  it 'should accept dsc_dynamicupdate predefined value NonsecureAndSecure' do
    dsc_xdnsserveradzone[:dsc_dynamicupdate] = 'NonsecureAndSecure'
    expect(dsc_xdnsserveradzone[:dsc_dynamicupdate]).to eq('NonsecureAndSecure')
  end

  it 'should accept dsc_dynamicupdate predefined value nonsecureandsecure' do
    dsc_xdnsserveradzone[:dsc_dynamicupdate] = 'nonsecureandsecure'
    expect(dsc_xdnsserveradzone[:dsc_dynamicupdate]).to eq('nonsecureandsecure')
  end

  it 'should accept dsc_dynamicupdate predefined value Secure' do
    dsc_xdnsserveradzone[:dsc_dynamicupdate] = 'Secure'
    expect(dsc_xdnsserveradzone[:dsc_dynamicupdate]).to eq('Secure')
  end

  it 'should accept dsc_dynamicupdate predefined value secure' do
    dsc_xdnsserveradzone[:dsc_dynamicupdate] = 'secure'
    expect(dsc_xdnsserveradzone[:dsc_dynamicupdate]).to eq('secure')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdnsserveradzone[:dsc_dynamicupdate] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_dynamicupdate' do
    expect{dsc_xdnsserveradzone[:dsc_dynamicupdate] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_dynamicupdate' do
    expect{dsc_xdnsserveradzone[:dsc_dynamicupdate] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_dynamicupdate' do
    expect{dsc_xdnsserveradzone[:dsc_dynamicupdate] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_dynamicupdate' do
    expect{dsc_xdnsserveradzone[:dsc_dynamicupdate] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_replicationscope predefined value Custom' do
    dsc_xdnsserveradzone[:dsc_replicationscope] = 'Custom'
    expect(dsc_xdnsserveradzone[:dsc_replicationscope]).to eq('Custom')
  end

  it 'should accept dsc_replicationscope predefined value custom' do
    dsc_xdnsserveradzone[:dsc_replicationscope] = 'custom'
    expect(dsc_xdnsserveradzone[:dsc_replicationscope]).to eq('custom')
  end

  it 'should accept dsc_replicationscope predefined value Domain' do
    dsc_xdnsserveradzone[:dsc_replicationscope] = 'Domain'
    expect(dsc_xdnsserveradzone[:dsc_replicationscope]).to eq('Domain')
  end

  it 'should accept dsc_replicationscope predefined value domain' do
    dsc_xdnsserveradzone[:dsc_replicationscope] = 'domain'
    expect(dsc_xdnsserveradzone[:dsc_replicationscope]).to eq('domain')
  end

  it 'should accept dsc_replicationscope predefined value Forest' do
    dsc_xdnsserveradzone[:dsc_replicationscope] = 'Forest'
    expect(dsc_xdnsserveradzone[:dsc_replicationscope]).to eq('Forest')
  end

  it 'should accept dsc_replicationscope predefined value forest' do
    dsc_xdnsserveradzone[:dsc_replicationscope] = 'forest'
    expect(dsc_xdnsserveradzone[:dsc_replicationscope]).to eq('forest')
  end

  it 'should accept dsc_replicationscope predefined value Legacy' do
    dsc_xdnsserveradzone[:dsc_replicationscope] = 'Legacy'
    expect(dsc_xdnsserveradzone[:dsc_replicationscope]).to eq('Legacy')
  end

  it 'should accept dsc_replicationscope predefined value legacy' do
    dsc_xdnsserveradzone[:dsc_replicationscope] = 'legacy'
    expect(dsc_xdnsserveradzone[:dsc_replicationscope]).to eq('legacy')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdnsserveradzone[:dsc_replicationscope] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_replicationscope' do
    expect{dsc_xdnsserveradzone[:dsc_replicationscope] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_replicationscope' do
    expect{dsc_xdnsserveradzone[:dsc_replicationscope] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_replicationscope' do
    expect{dsc_xdnsserveradzone[:dsc_replicationscope] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_replicationscope' do
    expect{dsc_xdnsserveradzone[:dsc_replicationscope] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_directorypartitionname' do
    expect{dsc_xdnsserveradzone[:dsc_directorypartitionname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_directorypartitionname' do
    expect{dsc_xdnsserveradzone[:dsc_directorypartitionname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_directorypartitionname' do
    expect{dsc_xdnsserveradzone[:dsc_directorypartitionname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_directorypartitionname' do
    expect{dsc_xdnsserveradzone[:dsc_directorypartitionname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_computername' do
    expect{dsc_xdnsserveradzone[:dsc_computername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_computername' do
    expect{dsc_xdnsserveradzone[:dsc_computername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_computername' do
    expect{dsc_xdnsserveradzone[:dsc_computername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_computername' do
    expect{dsc_xdnsserveradzone[:dsc_computername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xdnsserveradzone[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xdnsserveradzone[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xdnsserveradzone[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xdnsserveradzone[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xdnsserveradzone[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xdnsserveradzone[:dsc_ensure] = 'Present'
    expect(dsc_xdnsserveradzone[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xdnsserveradzone[:dsc_ensure] = 'present'
    expect(dsc_xdnsserveradzone[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdnsserveradzone[:dsc_ensure] = 'present'
    expect(dsc_xdnsserveradzone[:ensure]).to eq(dsc_xdnsserveradzone[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xdnsserveradzone[:dsc_ensure] = 'Absent'
    expect(dsc_xdnsserveradzone[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xdnsserveradzone[:dsc_ensure] = 'absent'
    expect(dsc_xdnsserveradzone[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xdnsserveradzone[:dsc_ensure] = 'absent'
    expect(dsc_xdnsserveradzone[:ensure]).to eq(dsc_xdnsserveradzone[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xdnsserveradzone[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xdnsserveradzone[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xdnsserveradzone[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xdnsserveradzone[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xdnsserveradzone[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xdnsserveradzone)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xdnsserveradzone)
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
        dsc_xdnsserveradzone.original_parameters[:dsc_ensure] = 'present'
        dsc_xdnsserveradzone[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xdnsserveradzone)
      end

      it "should update :ensure to :present" do
        expect(dsc_xdnsserveradzone[:ensure]).to eq(:present)
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
        dsc_xdnsserveradzone.original_parameters[:dsc_ensure] = 'absent'
        dsc_xdnsserveradzone[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xdnsserveradzone)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xdnsserveradzone[:ensure]).to eq(:absent)
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
