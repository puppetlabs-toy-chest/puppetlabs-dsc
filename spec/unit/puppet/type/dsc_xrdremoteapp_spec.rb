#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xrdremoteapp) do

  let :dsc_xrdremoteapp do
    Puppet::Type.type(:dsc_xrdremoteapp).new(
      :name     => 'foo',
      :dsc_alias => 'foo',
      :dsc_collectionname => 'foo',
      :dsc_displayname => 'foo',
      :dsc_filepath => 'foo',
    )
  end

  it "should stringify normally" do
    expect(dsc_xrdremoteapp.to_s).to eq("Dsc_xrdremoteapp[foo]")
  end

  it 'should require that dsc_alias is specified' do
    #dsc_xrdremoteapp[:dsc_alias]
    expect { Puppet::Type.type(:dsc_xrdremoteapp).new(
      :name     => 'foo',
      :dsc_collectionname => 'foo',
      :dsc_displayname => 'foo',
      :dsc_filepath => 'foo',
      :dsc_filevirtualpath => 'foo',
      :dsc_foldername => 'foo',
      :dsc_commandlinesetting => 'foo',
      :dsc_requiredcommandline => 'foo',
      :dsc_iconindex => 32,
      :dsc_iconpath => 'foo',
      :dsc_usergroups => 'foo',
      :dsc_showinwebaccess => true,
    )}.to raise_error(Puppet::Error, /dsc_alias is a required attribute/)
  end

  it 'should not accept array for dsc_alias' do
    expect{dsc_xrdremoteapp[:dsc_alias] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_alias' do
    expect{dsc_xrdremoteapp[:dsc_alias] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_alias' do
    expect{dsc_xrdremoteapp[:dsc_alias] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_alias' do
    expect{dsc_xrdremoteapp[:dsc_alias] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_collectionname is specified' do
    #dsc_xrdremoteapp[:dsc_collectionname]
    expect { Puppet::Type.type(:dsc_xrdremoteapp).new(
      :name     => 'foo',
      :dsc_alias => 'foo',
      :dsc_displayname => 'foo',
      :dsc_filepath => 'foo',
      :dsc_filevirtualpath => 'foo',
      :dsc_foldername => 'foo',
      :dsc_commandlinesetting => 'foo',
      :dsc_requiredcommandline => 'foo',
      :dsc_iconindex => 32,
      :dsc_iconpath => 'foo',
      :dsc_usergroups => 'foo',
      :dsc_showinwebaccess => true,
    )}.to raise_error(Puppet::Error, /dsc_collectionname is a required attribute/)
  end

  it 'should not accept array for dsc_collectionname' do
    expect{dsc_xrdremoteapp[:dsc_collectionname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_collectionname' do
    expect{dsc_xrdremoteapp[:dsc_collectionname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_collectionname' do
    expect{dsc_xrdremoteapp[:dsc_collectionname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_collectionname' do
    expect{dsc_xrdremoteapp[:dsc_collectionname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_displayname is specified' do
    #dsc_xrdremoteapp[:dsc_displayname]
    expect { Puppet::Type.type(:dsc_xrdremoteapp).new(
      :name     => 'foo',
      :dsc_alias => 'foo',
      :dsc_collectionname => 'foo',
      :dsc_filepath => 'foo',
      :dsc_filevirtualpath => 'foo',
      :dsc_foldername => 'foo',
      :dsc_commandlinesetting => 'foo',
      :dsc_requiredcommandline => 'foo',
      :dsc_iconindex => 32,
      :dsc_iconpath => 'foo',
      :dsc_usergroups => 'foo',
      :dsc_showinwebaccess => true,
    )}.to raise_error(Puppet::Error, /dsc_displayname is a required attribute/)
  end

  it 'should not accept array for dsc_displayname' do
    expect{dsc_xrdremoteapp[:dsc_displayname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_displayname' do
    expect{dsc_xrdremoteapp[:dsc_displayname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_displayname' do
    expect{dsc_xrdremoteapp[:dsc_displayname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_displayname' do
    expect{dsc_xrdremoteapp[:dsc_displayname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_filepath is specified' do
    #dsc_xrdremoteapp[:dsc_filepath]
    expect { Puppet::Type.type(:dsc_xrdremoteapp).new(
      :name     => 'foo',
      :dsc_alias => 'foo',
      :dsc_collectionname => 'foo',
      :dsc_displayname => 'foo',
      :dsc_filevirtualpath => 'foo',
      :dsc_foldername => 'foo',
      :dsc_commandlinesetting => 'foo',
      :dsc_requiredcommandline => 'foo',
      :dsc_iconindex => 32,
      :dsc_iconpath => 'foo',
      :dsc_usergroups => 'foo',
      :dsc_showinwebaccess => true,
    )}.to raise_error(Puppet::Error, /dsc_filepath is a required attribute/)
  end

  it 'should not accept array for dsc_filepath' do
    expect{dsc_xrdremoteapp[:dsc_filepath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_filepath' do
    expect{dsc_xrdremoteapp[:dsc_filepath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_filepath' do
    expect{dsc_xrdremoteapp[:dsc_filepath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_filepath' do
    expect{dsc_xrdremoteapp[:dsc_filepath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_filevirtualpath' do
    expect{dsc_xrdremoteapp[:dsc_filevirtualpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_filevirtualpath' do
    expect{dsc_xrdremoteapp[:dsc_filevirtualpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_filevirtualpath' do
    expect{dsc_xrdremoteapp[:dsc_filevirtualpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_filevirtualpath' do
    expect{dsc_xrdremoteapp[:dsc_filevirtualpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_foldername' do
    expect{dsc_xrdremoteapp[:dsc_foldername] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_foldername' do
    expect{dsc_xrdremoteapp[:dsc_foldername] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_foldername' do
    expect{dsc_xrdremoteapp[:dsc_foldername] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_foldername' do
    expect{dsc_xrdremoteapp[:dsc_foldername] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_commandlinesetting' do
    expect{dsc_xrdremoteapp[:dsc_commandlinesetting] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_commandlinesetting' do
    expect{dsc_xrdremoteapp[:dsc_commandlinesetting] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_commandlinesetting' do
    expect{dsc_xrdremoteapp[:dsc_commandlinesetting] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_commandlinesetting' do
    expect{dsc_xrdremoteapp[:dsc_commandlinesetting] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_requiredcommandline' do
    expect{dsc_xrdremoteapp[:dsc_requiredcommandline] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_requiredcommandline' do
    expect{dsc_xrdremoteapp[:dsc_requiredcommandline] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_requiredcommandline' do
    expect{dsc_xrdremoteapp[:dsc_requiredcommandline] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_requiredcommandline' do
    expect{dsc_xrdremoteapp[:dsc_requiredcommandline] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_iconindex' do
    expect{dsc_xrdremoteapp[:dsc_iconindex] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_iconindex' do
    expect{dsc_xrdremoteapp[:dsc_iconindex] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_iconindex' do
    dsc_xrdremoteapp[:dsc_iconindex] = 32
    expect(dsc_xrdremoteapp[:dsc_iconindex]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_iconindex' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xrdremoteapp[:dsc_iconindex] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_iconindex' do
    dsc_xrdremoteapp[:dsc_iconindex] = '16'
    expect(dsc_xrdremoteapp[:dsc_iconindex]).to eq(16)
  end

  it 'should accept string-like uint for dsc_iconindex' do
    dsc_xrdremoteapp[:dsc_iconindex] = '32'
    expect(dsc_xrdremoteapp[:dsc_iconindex]).to eq(32)
  end

  it 'should accept string-like uint for dsc_iconindex' do
    dsc_xrdremoteapp[:dsc_iconindex] = '64'
    expect(dsc_xrdremoteapp[:dsc_iconindex]).to eq(64)
  end

  it 'should not accept array for dsc_iconpath' do
    expect{dsc_xrdremoteapp[:dsc_iconpath] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_iconpath' do
    expect{dsc_xrdremoteapp[:dsc_iconpath] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_iconpath' do
    expect{dsc_xrdremoteapp[:dsc_iconpath] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_iconpath' do
    expect{dsc_xrdremoteapp[:dsc_iconpath] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_usergroups' do
    expect{dsc_xrdremoteapp[:dsc_usergroups] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_usergroups' do
    expect{dsc_xrdremoteapp[:dsc_usergroups] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_usergroups' do
    expect{dsc_xrdremoteapp[:dsc_usergroups] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_usergroups' do
    expect{dsc_xrdremoteapp[:dsc_usergroups] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_showinwebaccess' do
    expect{dsc_xrdremoteapp[:dsc_showinwebaccess] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_showinwebaccess' do
    dsc_xrdremoteapp[:dsc_showinwebaccess] = true
    expect(dsc_xrdremoteapp[:dsc_showinwebaccess]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_showinwebaccess" do
    dsc_xrdremoteapp[:dsc_showinwebaccess] = 'true'
    expect(dsc_xrdremoteapp[:dsc_showinwebaccess]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_showinwebaccess" do
    dsc_xrdremoteapp[:dsc_showinwebaccess] = 'false'
    expect(dsc_xrdremoteapp[:dsc_showinwebaccess]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_showinwebaccess" do
    dsc_xrdremoteapp[:dsc_showinwebaccess] = 'True'
    expect(dsc_xrdremoteapp[:dsc_showinwebaccess]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_showinwebaccess" do
    dsc_xrdremoteapp[:dsc_showinwebaccess] = 'False'
    expect(dsc_xrdremoteapp[:dsc_showinwebaccess]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_showinwebaccess" do
    dsc_xrdremoteapp[:dsc_showinwebaccess] = :true
    expect(dsc_xrdremoteapp[:dsc_showinwebaccess]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_showinwebaccess" do
    dsc_xrdremoteapp[:dsc_showinwebaccess] = :false
    expect(dsc_xrdremoteapp[:dsc_showinwebaccess]).to eq(false)
  end

  it 'should not accept int for dsc_showinwebaccess' do
    expect{dsc_xrdremoteapp[:dsc_showinwebaccess] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_showinwebaccess' do
    expect{dsc_xrdremoteapp[:dsc_showinwebaccess] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xrdremoteapp)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xrdremoteapp)
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

  end
end
