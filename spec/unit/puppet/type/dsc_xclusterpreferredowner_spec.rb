#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xclusterpreferredowner) do

  let :dsc_xclusterpreferredowner do
    Puppet::Type.type(:dsc_xclusterpreferredowner).new(
      :name     => 'foo',
      :dsc_clustergroup => 'foo',
      :dsc_clustername => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xclusterpreferredowner).new(
      :name     => 'foo',
      :dsc_clustergroup => 'foo',
      :dsc_clustername => 'foo',
      :dsc_nodes => ["foo", "bar", "spec"],
      :dsc_clusterresources => ["foo", "bar", "spec"],
      :dsc_ensure => 'Present',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xclusterpreferredowner.to_s).to eq("Dsc_xclusterpreferredowner[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xclusterpreferredowner[:ensure]).to eq :present
  end

  it 'should require that dsc_clustergroup is specified' do
    #dsc_xclusterpreferredowner[:dsc_clustergroup]
    expect { Puppet::Type.type(:dsc_xclusterpreferredowner).new(
      :name     => 'foo',
      :dsc_clustername => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_clustergroup is a required attribute/)
  end

  it 'should not accept array for dsc_clustergroup' do
    expect{dsc_xclusterpreferredowner[:dsc_clustergroup] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_clustergroup' do
    expect{dsc_xclusterpreferredowner[:dsc_clustergroup] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_clustergroup' do
    expect{dsc_xclusterpreferredowner[:dsc_clustergroup] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clustergroup' do
    expect{dsc_xclusterpreferredowner[:dsc_clustergroup] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_clustername is specified' do
    #dsc_xclusterpreferredowner[:dsc_clustername]
    expect { Puppet::Type.type(:dsc_xclusterpreferredowner).new(
      :name     => 'foo',
      :dsc_clustergroup => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_clustername is a required attribute/)
  end

  it 'should not accept array for dsc_clustername' do
    expect{dsc_xclusterpreferredowner[:dsc_clustername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_clustername' do
    expect{dsc_xclusterpreferredowner[:dsc_clustername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_clustername' do
    expect{dsc_xclusterpreferredowner[:dsc_clustername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clustername' do
    expect{dsc_xclusterpreferredowner[:dsc_clustername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_nodes' do
    dsc_xclusterpreferredowner[:dsc_nodes] = ["foo", "bar", "spec"]
    expect(dsc_xclusterpreferredowner[:dsc_nodes]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_nodes' do
    expect{dsc_xclusterpreferredowner[:dsc_nodes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_nodes' do
    expect{dsc_xclusterpreferredowner[:dsc_nodes] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_nodes' do
    expect{dsc_xclusterpreferredowner[:dsc_nodes] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_clusterresources' do
    dsc_xclusterpreferredowner[:dsc_clusterresources] = ["foo", "bar", "spec"]
    expect(dsc_xclusterpreferredowner[:dsc_clusterresources]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_clusterresources' do
    expect{dsc_xclusterpreferredowner[:dsc_clusterresources] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_clusterresources' do
    expect{dsc_xclusterpreferredowner[:dsc_clusterresources] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_clusterresources' do
    expect{dsc_xclusterpreferredowner[:dsc_clusterresources] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xclusterpreferredowner[:dsc_ensure] = 'Present'
    expect(dsc_xclusterpreferredowner[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xclusterpreferredowner[:dsc_ensure] = 'present'
    expect(dsc_xclusterpreferredowner[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xclusterpreferredowner[:dsc_ensure] = 'present'
    expect(dsc_xclusterpreferredowner[:ensure]).to eq(dsc_xclusterpreferredowner[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xclusterpreferredowner[:dsc_ensure] = 'Absent'
    expect(dsc_xclusterpreferredowner[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xclusterpreferredowner[:dsc_ensure] = 'absent'
    expect(dsc_xclusterpreferredowner[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xclusterpreferredowner[:dsc_ensure] = 'absent'
    expect(dsc_xclusterpreferredowner[:ensure]).to eq(dsc_xclusterpreferredowner[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xclusterpreferredowner[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xclusterpreferredowner[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xclusterpreferredowner[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xclusterpreferredowner[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xclusterpreferredowner[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xclusterpreferredowner)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xclusterpreferredowner)
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
        dsc_xclusterpreferredowner.original_parameters[:dsc_ensure] = 'present'
        dsc_xclusterpreferredowner[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xclusterpreferredowner)
      end

      it "should update :ensure to :present" do
        expect(dsc_xclusterpreferredowner[:ensure]).to eq(:present)
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
        dsc_xclusterpreferredowner.original_parameters[:dsc_ensure] = 'absent'
        dsc_xclusterpreferredowner[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xclusterpreferredowner)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xclusterpreferredowner[:ensure]).to eq(:absent)
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
