#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xadgroup) do

  let :dsc_xadgroup do
    Puppet::Type.type(:dsc_xadgroup).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xadgroup).new(
      :name     => 'foo',
      :dsc_groupname => 'foo',
      :dsc_groupscope => 'DomainLocal',
      :dsc_category => 'Security',
      :dsc_path => 'foo',
      :dsc_ensure => 'Present',
      :dsc_description => 'foo',
      :dsc_displayname => 'foo',
      :dsc_credential => {"user"=>"user", "password"=>"password"},
      :dsc_domaincontroller => 'foo',
      :dsc_members => ["foo", "bar", "spec"],
      :dsc_memberstoinclude => ["foo", "bar", "spec"],
      :dsc_memberstoexclude => ["foo", "bar", "spec"],
      :dsc_membershipattribute => 'SamAccountName',
      :dsc_managedby => 'foo',
      :dsc_notes => 'foo',
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xadgroup.to_s).to eq("Dsc_xadgroup[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_xadgroup[:ensure]).to eq :present
  end

  it 'should require that dsc_groupname is specified' do
    #dsc_xadgroup[:dsc_groupname]
    expect { Puppet::Type.type(:dsc_xadgroup).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_groupname is a required attribute/)
  end

  it 'should not accept array for dsc_groupname' do
    expect{dsc_xadgroup[:dsc_groupname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_groupname' do
    expect{dsc_xadgroup[:dsc_groupname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_groupname' do
    expect{dsc_xadgroup[:dsc_groupname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_groupname' do
    expect{dsc_xadgroup[:dsc_groupname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_groupscope predefined value DomainLocal' do
    dsc_xadgroup[:dsc_groupscope] = 'DomainLocal'
    expect(dsc_xadgroup[:dsc_groupscope]).to eq('DomainLocal')
  end

  it 'should accept dsc_groupscope predefined value domainlocal' do
    dsc_xadgroup[:dsc_groupscope] = 'domainlocal'
    expect(dsc_xadgroup[:dsc_groupscope]).to eq('domainlocal')
  end

  it 'should accept dsc_groupscope predefined value Global' do
    dsc_xadgroup[:dsc_groupscope] = 'Global'
    expect(dsc_xadgroup[:dsc_groupscope]).to eq('Global')
  end

  it 'should accept dsc_groupscope predefined value global' do
    dsc_xadgroup[:dsc_groupscope] = 'global'
    expect(dsc_xadgroup[:dsc_groupscope]).to eq('global')
  end

  it 'should accept dsc_groupscope predefined value Universal' do
    dsc_xadgroup[:dsc_groupscope] = 'Universal'
    expect(dsc_xadgroup[:dsc_groupscope]).to eq('Universal')
  end

  it 'should accept dsc_groupscope predefined value universal' do
    dsc_xadgroup[:dsc_groupscope] = 'universal'
    expect(dsc_xadgroup[:dsc_groupscope]).to eq('universal')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xadgroup[:dsc_groupscope] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_groupscope' do
    expect{dsc_xadgroup[:dsc_groupscope] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_groupscope' do
    expect{dsc_xadgroup[:dsc_groupscope] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_groupscope' do
    expect{dsc_xadgroup[:dsc_groupscope] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_groupscope' do
    expect{dsc_xadgroup[:dsc_groupscope] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_category predefined value Security' do
    dsc_xadgroup[:dsc_category] = 'Security'
    expect(dsc_xadgroup[:dsc_category]).to eq('Security')
  end

  it 'should accept dsc_category predefined value security' do
    dsc_xadgroup[:dsc_category] = 'security'
    expect(dsc_xadgroup[:dsc_category]).to eq('security')
  end

  it 'should accept dsc_category predefined value Distribution' do
    dsc_xadgroup[:dsc_category] = 'Distribution'
    expect(dsc_xadgroup[:dsc_category]).to eq('Distribution')
  end

  it 'should accept dsc_category predefined value distribution' do
    dsc_xadgroup[:dsc_category] = 'distribution'
    expect(dsc_xadgroup[:dsc_category]).to eq('distribution')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xadgroup[:dsc_category] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_category' do
    expect{dsc_xadgroup[:dsc_category] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_category' do
    expect{dsc_xadgroup[:dsc_category] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_category' do
    expect{dsc_xadgroup[:dsc_category] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_category' do
    expect{dsc_xadgroup[:dsc_category] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_path' do
    expect{dsc_xadgroup[:dsc_path] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_path' do
    expect{dsc_xadgroup[:dsc_path] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_path' do
    expect{dsc_xadgroup[:dsc_path] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_path' do
    expect{dsc_xadgroup[:dsc_path] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_xadgroup[:dsc_ensure] = 'Present'
    expect(dsc_xadgroup[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_xadgroup[:dsc_ensure] = 'present'
    expect(dsc_xadgroup[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xadgroup[:dsc_ensure] = 'present'
    expect(dsc_xadgroup[:ensure]).to eq(dsc_xadgroup[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_xadgroup[:dsc_ensure] = 'Absent'
    expect(dsc_xadgroup[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_xadgroup[:dsc_ensure] = 'absent'
    expect(dsc_xadgroup[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_xadgroup[:dsc_ensure] = 'absent'
    expect(dsc_xadgroup[:ensure]).to eq(dsc_xadgroup[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xadgroup[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_xadgroup[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_xadgroup[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_xadgroup[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_xadgroup[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_description' do
    expect{dsc_xadgroup[:dsc_description] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_description' do
    expect{dsc_xadgroup[:dsc_description] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_description' do
    expect{dsc_xadgroup[:dsc_description] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_description' do
    expect{dsc_xadgroup[:dsc_description] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_xadgroup[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_xadgroup[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_xadgroup[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_xadgroup[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_credential" do
    expect{dsc_xadgroup[:dsc_credential] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_credential' do
    expect{dsc_xadgroup[:dsc_credential] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_credential' do
    expect{dsc_xadgroup[:dsc_credential] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_credential' do
    expect{dsc_xadgroup[:dsc_credential] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_credential' do
    expect{dsc_xadgroup[:dsc_credential] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_domaincontroller' do
    expect{dsc_xadgroup[:dsc_domaincontroller] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_domaincontroller' do
    expect{dsc_xadgroup[:dsc_domaincontroller] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_domaincontroller' do
    expect{dsc_xadgroup[:dsc_domaincontroller] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_domaincontroller' do
    expect{dsc_xadgroup[:dsc_domaincontroller] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_members' do
    dsc_xadgroup[:dsc_members] = ["foo", "bar", "spec"]
    expect(dsc_xadgroup[:dsc_members]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_members' do
    expect{dsc_xadgroup[:dsc_members] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_members' do
    expect{dsc_xadgroup[:dsc_members] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_members' do
    expect{dsc_xadgroup[:dsc_members] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_memberstoinclude' do
    dsc_xadgroup[:dsc_memberstoinclude] = ["foo", "bar", "spec"]
    expect(dsc_xadgroup[:dsc_memberstoinclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_memberstoinclude' do
    expect{dsc_xadgroup[:dsc_memberstoinclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoinclude' do
    expect{dsc_xadgroup[:dsc_memberstoinclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoinclude' do
    expect{dsc_xadgroup[:dsc_memberstoinclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_memberstoexclude' do
    dsc_xadgroup[:dsc_memberstoexclude] = ["foo", "bar", "spec"]
    expect(dsc_xadgroup[:dsc_memberstoexclude]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_memberstoexclude' do
    expect{dsc_xadgroup[:dsc_memberstoexclude] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_memberstoexclude' do
    expect{dsc_xadgroup[:dsc_memberstoexclude] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_memberstoexclude' do
    expect{dsc_xadgroup[:dsc_memberstoexclude] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_membershipattribute predefined value SamAccountName' do
    dsc_xadgroup[:dsc_membershipattribute] = 'SamAccountName'
    expect(dsc_xadgroup[:dsc_membershipattribute]).to eq('SamAccountName')
  end

  it 'should accept dsc_membershipattribute predefined value samaccountname' do
    dsc_xadgroup[:dsc_membershipattribute] = 'samaccountname'
    expect(dsc_xadgroup[:dsc_membershipattribute]).to eq('samaccountname')
  end

  it 'should accept dsc_membershipattribute predefined value DistinguishedName' do
    dsc_xadgroup[:dsc_membershipattribute] = 'DistinguishedName'
    expect(dsc_xadgroup[:dsc_membershipattribute]).to eq('DistinguishedName')
  end

  it 'should accept dsc_membershipattribute predefined value distinguishedname' do
    dsc_xadgroup[:dsc_membershipattribute] = 'distinguishedname'
    expect(dsc_xadgroup[:dsc_membershipattribute]).to eq('distinguishedname')
  end

  it 'should accept dsc_membershipattribute predefined value ObjectGUID' do
    dsc_xadgroup[:dsc_membershipattribute] = 'ObjectGUID'
    expect(dsc_xadgroup[:dsc_membershipattribute]).to eq('ObjectGUID')
  end

  it 'should accept dsc_membershipattribute predefined value objectguid' do
    dsc_xadgroup[:dsc_membershipattribute] = 'objectguid'
    expect(dsc_xadgroup[:dsc_membershipattribute]).to eq('objectguid')
  end

  it 'should accept dsc_membershipattribute predefined value SID' do
    dsc_xadgroup[:dsc_membershipattribute] = 'SID'
    expect(dsc_xadgroup[:dsc_membershipattribute]).to eq('SID')
  end

  it 'should accept dsc_membershipattribute predefined value sid' do
    dsc_xadgroup[:dsc_membershipattribute] = 'sid'
    expect(dsc_xadgroup[:dsc_membershipattribute]).to eq('sid')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xadgroup[:dsc_membershipattribute] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_membershipattribute' do
    expect{dsc_xadgroup[:dsc_membershipattribute] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_membershipattribute' do
    expect{dsc_xadgroup[:dsc_membershipattribute] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_membershipattribute' do
    expect{dsc_xadgroup[:dsc_membershipattribute] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_membershipattribute' do
    expect{dsc_xadgroup[:dsc_membershipattribute] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_managedby' do
    expect{dsc_xadgroup[:dsc_managedby] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_managedby' do
    expect{dsc_xadgroup[:dsc_managedby] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_managedby' do
    expect{dsc_xadgroup[:dsc_managedby] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_managedby' do
    expect{dsc_xadgroup[:dsc_managedby] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_notes' do
    expect{dsc_xadgroup[:dsc_notes] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_notes' do
    expect{dsc_xadgroup[:dsc_notes] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_notes' do
    expect{dsc_xadgroup[:dsc_notes] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_notes' do
    expect{dsc_xadgroup[:dsc_notes] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xadgroup)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xadgroup)
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
        dsc_xadgroup.original_parameters[:dsc_ensure] = 'present'
        dsc_xadgroup[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_xadgroup)
      end

      it "should update :ensure to :present" do
        expect(dsc_xadgroup[:ensure]).to eq(:present)
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
        dsc_xadgroup.original_parameters[:dsc_ensure] = 'absent'
        dsc_xadgroup[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_xadgroup)
      end

      it "should update :ensure to :absent" do
        expect(dsc_xadgroup[:ensure]).to eq(:absent)
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
