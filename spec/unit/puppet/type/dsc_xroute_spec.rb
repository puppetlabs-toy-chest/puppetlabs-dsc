#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xroute) do

  let :dsc_xroute do
    Puppet::Type.type(:dsc_xroute).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
      :dsc_addressfamily => 'IPv4',
      :dsc_destinationprefix => 'foo',
      :dsc_nexthop => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xroute.to_s).to eq("Dsc_xroute[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xroute[:ensure]).to eq :present
  end

  it 'should require that dsc_interfacealias is specified' do
    #dsc_xroute[:dsc_interfacealias]
    expect { Puppet::Type.type(:dsc_xroute).new(
      :name     => 'foo',
      :dsc_addressfamily => 'IPv4',
      :dsc_destinationprefix => 'foo',
      :dsc_nexthop => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_interfacealias is a required attribute/)
  end

  it 'should not accept array for dsc_interfacealias' do
    expect{dsc_xroute[:dsc_interfacealias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_interfacealias' do
    expect{dsc_xroute[:dsc_interfacealias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_interfacealias' do
    expect{dsc_xroute[:dsc_interfacealias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_interfacealias' do
    expect{dsc_xroute[:dsc_interfacealias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_addressfamily is specified' do
    #dsc_xroute[:dsc_addressfamily]
    expect { Puppet::Type.type(:dsc_xroute).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
      :dsc_destinationprefix => 'foo',
      :dsc_nexthop => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_addressfamily is a required attribute/)
  end

  it 'should accept dsc_addressfamily predefined value IPv4' do
    dsc_xroute[:dsc_addressfamily] = 'IPv4'
    expect(dsc_xroute[:dsc_addressfamily]).to eq('IPv4')
  end

  it 'should accept dsc_addressfamily predefined value ipv4' do
    dsc_xroute[:dsc_addressfamily] = 'ipv4'
    expect(dsc_xroute[:dsc_addressfamily]).to eq('ipv4')
  end

  it 'should accept dsc_addressfamily predefined value IPv6' do
    dsc_xroute[:dsc_addressfamily] = 'IPv6'
    expect(dsc_xroute[:dsc_addressfamily]).to eq('IPv6')
  end

  it 'should accept dsc_addressfamily predefined value ipv6' do
    dsc_xroute[:dsc_addressfamily] = 'ipv6'
    expect(dsc_xroute[:dsc_addressfamily]).to eq('ipv6')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xroute[:dsc_addressfamily] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_addressfamily' do
    expect{dsc_xroute[:dsc_addressfamily] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_addressfamily' do
    expect{dsc_xroute[:dsc_addressfamily] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_addressfamily' do
    expect{dsc_xroute[:dsc_addressfamily] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_addressfamily' do
    expect{dsc_xroute[:dsc_addressfamily] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_destinationprefix is specified' do
    #dsc_xroute[:dsc_destinationprefix]
    expect { Puppet::Type.type(:dsc_xroute).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
      :dsc_addressfamily => 'IPv4',
      :dsc_nexthop => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_destinationprefix is a required attribute/)
  end

  it 'should not accept array for dsc_destinationprefix' do
    expect{dsc_xroute[:dsc_destinationprefix] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_destinationprefix' do
    expect{dsc_xroute[:dsc_destinationprefix] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_destinationprefix' do
    expect{dsc_xroute[:dsc_destinationprefix] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_destinationprefix' do
    expect{dsc_xroute[:dsc_destinationprefix] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_nexthop is specified' do
    #dsc_xroute[:dsc_nexthop]
    expect { Puppet::Type.type(:dsc_xroute).new(
      :name     => 'foo',
      :dsc_interfacealias => 'foo',
      :dsc_addressfamily => 'IPv4',
      :dsc_destinationprefix => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_nexthop is a required attribute/)
  end

  it 'should not accept array for dsc_nexthop' do
    expect{dsc_xroute[:dsc_nexthop] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_nexthop' do
    expect{dsc_xroute[:dsc_nexthop] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_nexthop' do
    expect{dsc_xroute[:dsc_nexthop] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_nexthop' do
    expect{dsc_xroute[:dsc_nexthop] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xroute[:dsc_ensure] = 'Present'
    expect(dsc_xroute[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xroute[:dsc_ensure] = 'present'
    expect(dsc_xroute[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xroute[:dsc_ensure] = 'present'
    expect(dsc_xroute[:ensure]).to eq(dsc_xroute[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xroute[:dsc_ensure] = 'Absent'
    expect(dsc_xroute[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xroute[:dsc_ensure] = 'absent'
    expect(dsc_xroute[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xroute[:dsc_ensure] = 'absent'
    expect(dsc_xroute[:ensure]).to eq(dsc_xroute[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xroute[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xroute[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xroute[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xroute[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xroute[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_routemetric' do
    expect{dsc_xroute[:dsc_routemetric] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_routemetric' do
    expect{dsc_xroute[:dsc_routemetric] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_routemetric' do
    dsc_xroute[:dsc_routemetric] = 16
    expect(dsc_xroute[:dsc_routemetric]).to eq(16)
  end

  it 'should not accept signed (negative) value for dsc_routemetric' do
    value = -16
    expect(value).to be < 0
    expect{dsc_xroute[:dsc_routemetric] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_routemetric' do
    dsc_xroute[:dsc_routemetric] = '16'
    expect(dsc_xroute[:dsc_routemetric]).to eq(16)
  end

  it 'should accept string-like uint for dsc_routemetric' do
    dsc_xroute[:dsc_routemetric] = '32'
    expect(dsc_xroute[:dsc_routemetric]).to eq(32)
  end

  it 'should accept string-like uint for dsc_routemetric' do
    dsc_xroute[:dsc_routemetric] = '64'
    expect(dsc_xroute[:dsc_routemetric]).to eq(64)
  end

  it 'should accept dsc_publish predefined value No' do
    dsc_xroute[:dsc_publish] = 'No'
    expect(dsc_xroute[:dsc_publish]).to eq('No')
  end

  it 'should accept dsc_publish predefined value no' do
    dsc_xroute[:dsc_publish] = 'no'
    expect(dsc_xroute[:dsc_publish]).to eq('no')
  end

  it 'should accept dsc_publish predefined value Yes' do
    dsc_xroute[:dsc_publish] = 'Yes'
    expect(dsc_xroute[:dsc_publish]).to eq('Yes')
  end

  it 'should accept dsc_publish predefined value yes' do
    dsc_xroute[:dsc_publish] = 'yes'
    expect(dsc_xroute[:dsc_publish]).to eq('yes')
  end

  it 'should accept dsc_publish predefined value Age' do
    dsc_xroute[:dsc_publish] = 'Age'
    expect(dsc_xroute[:dsc_publish]).to eq('Age')
  end

  it 'should accept dsc_publish predefined value age' do
    dsc_xroute[:dsc_publish] = 'age'
    expect(dsc_xroute[:dsc_publish]).to eq('age')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xroute[:dsc_publish] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_publish' do
    expect{dsc_xroute[:dsc_publish] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_publish' do
    expect{dsc_xroute[:dsc_publish] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_publish' do
    expect{dsc_xroute[:dsc_publish] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_publish' do
    expect{dsc_xroute[:dsc_publish] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_preferredlifetime' do
    expect{dsc_xroute[:dsc_preferredlifetime] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_preferredlifetime' do
    expect{dsc_xroute[:dsc_preferredlifetime] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_preferredlifetime' do
    expect{dsc_xroute[:dsc_preferredlifetime] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_preferredlifetime' do
    expect{dsc_xroute[:dsc_preferredlifetime] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xroute)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xroute)
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
        dsc_xroute.original_parameters[:dsc_ensure] = 'present'
        dsc_xroute[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xroute)
      end

      it "should update :ensure to :present" do
        expect(dsc_xroute[:ensure]).to eq(:present)
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
        dsc_xroute.original_parameters[:dsc_ensure] = 'absent'
        dsc_xroute[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xroute)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xroute[:ensure]).to eq(:absent)
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
