#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_xwindowsupdateagent) do

  let :dsc_xwindowsupdateagent do
    Puppet::Type.type(:dsc_xwindowsupdateagent).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_xwindowsupdateagent).new(
      :name     => 'foo',
      :dsc_issingleinstance => 'Yes',
      :dsc_category => 'Security',
      :dsc_notifications => 'Disabled',
      :dsc_source => 'WindowsUpdate',
      :dsc_updatenow => true,
      :dsc_automaticupdatesnotificationsetting => 'foo',
      :dsc_totalupdatesnotinstalled => 32,
      :dsc_rebootrequired => true,
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_xwindowsupdateagent.to_s).to eq("Dsc_xwindowsupdateagent[foo]")
  end

  it 'should require that dsc_issingleinstance is specified' do
    #dsc_xwindowsupdateagent[:dsc_issingleinstance]
    expect { Puppet::Type.type(:dsc_xwindowsupdateagent).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_issingleinstance is a required attribute/)
  end

  it 'should accept dsc_issingleinstance predefined value Yes' do
    dsc_xwindowsupdateagent[:dsc_issingleinstance] = 'Yes'
    expect(dsc_xwindowsupdateagent[:dsc_issingleinstance]).to eq('Yes')
  end

  it 'should accept dsc_issingleinstance predefined value yes' do
    dsc_xwindowsupdateagent[:dsc_issingleinstance] = 'yes'
    expect(dsc_xwindowsupdateagent[:dsc_issingleinstance]).to eq('yes')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwindowsupdateagent[:dsc_issingleinstance] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_issingleinstance' do
    expect{dsc_xwindowsupdateagent[:dsc_issingleinstance] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_issingleinstance' do
    expect{dsc_xwindowsupdateagent[:dsc_issingleinstance] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_issingleinstance' do
    expect{dsc_xwindowsupdateagent[:dsc_issingleinstance] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_issingleinstance' do
    expect{dsc_xwindowsupdateagent[:dsc_issingleinstance] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_category predefined value Security' do
    dsc_xwindowsupdateagent[:dsc_category] = 'Security'
    expect(dsc_xwindowsupdateagent[:dsc_category]).to eq(['Security'])
  end

  it 'should accept dsc_category predefined value security' do
    dsc_xwindowsupdateagent[:dsc_category] = 'security'
    expect(dsc_xwindowsupdateagent[:dsc_category]).to eq(['security'])
  end

  it 'should accept dsc_category predefined value Important' do
    dsc_xwindowsupdateagent[:dsc_category] = 'Important'
    expect(dsc_xwindowsupdateagent[:dsc_category]).to eq(['Important'])
  end

  it 'should accept dsc_category predefined value important' do
    dsc_xwindowsupdateagent[:dsc_category] = 'important'
    expect(dsc_xwindowsupdateagent[:dsc_category]).to eq(['important'])
  end

  it 'should accept dsc_category predefined value Optional' do
    dsc_xwindowsupdateagent[:dsc_category] = 'Optional'
    expect(dsc_xwindowsupdateagent[:dsc_category]).to eq(['Optional'])
  end

  it 'should accept dsc_category predefined value optional' do
    dsc_xwindowsupdateagent[:dsc_category] = 'optional'
    expect(dsc_xwindowsupdateagent[:dsc_category]).to eq(['optional'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwindowsupdateagent[:dsc_category] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_category' do
    dsc_xwindowsupdateagent[:dsc_category] = ["Security", "Important", "Optional"]
    expect(dsc_xwindowsupdateagent[:dsc_category]).to eq(["Security", "Important", "Optional"])
  end

  it 'should not accept boolean for dsc_category' do
    expect{dsc_xwindowsupdateagent[:dsc_category] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_category' do
    expect{dsc_xwindowsupdateagent[:dsc_category] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_category' do
    expect{dsc_xwindowsupdateagent[:dsc_category] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_notifications predefined value Disabled' do
    dsc_xwindowsupdateagent[:dsc_notifications] = 'Disabled'
    expect(dsc_xwindowsupdateagent[:dsc_notifications]).to eq('Disabled')
  end

  it 'should accept dsc_notifications predefined value disabled' do
    dsc_xwindowsupdateagent[:dsc_notifications] = 'disabled'
    expect(dsc_xwindowsupdateagent[:dsc_notifications]).to eq('disabled')
  end

  it 'should accept dsc_notifications predefined value ScheduledInstallation' do
    dsc_xwindowsupdateagent[:dsc_notifications] = 'ScheduledInstallation'
    expect(dsc_xwindowsupdateagent[:dsc_notifications]).to eq('ScheduledInstallation')
  end

  it 'should accept dsc_notifications predefined value scheduledinstallation' do
    dsc_xwindowsupdateagent[:dsc_notifications] = 'scheduledinstallation'
    expect(dsc_xwindowsupdateagent[:dsc_notifications]).to eq('scheduledinstallation')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwindowsupdateagent[:dsc_notifications] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_notifications' do
    expect{dsc_xwindowsupdateagent[:dsc_notifications] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_notifications' do
    expect{dsc_xwindowsupdateagent[:dsc_notifications] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_notifications' do
    expect{dsc_xwindowsupdateagent[:dsc_notifications] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_notifications' do
    expect{dsc_xwindowsupdateagent[:dsc_notifications] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_source predefined value WindowsUpdate' do
    dsc_xwindowsupdateagent[:dsc_source] = 'WindowsUpdate'
    expect(dsc_xwindowsupdateagent[:dsc_source]).to eq('WindowsUpdate')
  end

  it 'should accept dsc_source predefined value windowsupdate' do
    dsc_xwindowsupdateagent[:dsc_source] = 'windowsupdate'
    expect(dsc_xwindowsupdateagent[:dsc_source]).to eq('windowsupdate')
  end

  it 'should accept dsc_source predefined value MicrosoftUpdate' do
    dsc_xwindowsupdateagent[:dsc_source] = 'MicrosoftUpdate'
    expect(dsc_xwindowsupdateagent[:dsc_source]).to eq('MicrosoftUpdate')
  end

  it 'should accept dsc_source predefined value microsoftupdate' do
    dsc_xwindowsupdateagent[:dsc_source] = 'microsoftupdate'
    expect(dsc_xwindowsupdateagent[:dsc_source]).to eq('microsoftupdate')
  end

  it 'should accept dsc_source predefined value WSUS' do
    dsc_xwindowsupdateagent[:dsc_source] = 'WSUS'
    expect(dsc_xwindowsupdateagent[:dsc_source]).to eq('WSUS')
  end

  it 'should accept dsc_source predefined value wsus' do
    dsc_xwindowsupdateagent[:dsc_source] = 'wsus'
    expect(dsc_xwindowsupdateagent[:dsc_source]).to eq('wsus')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_xwindowsupdateagent[:dsc_source] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_source' do
    expect{dsc_xwindowsupdateagent[:dsc_source] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_source' do
    expect{dsc_xwindowsupdateagent[:dsc_source] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_source' do
    expect{dsc_xwindowsupdateagent[:dsc_source] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_source' do
    expect{dsc_xwindowsupdateagent[:dsc_source] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_updatenow' do
    expect{dsc_xwindowsupdateagent[:dsc_updatenow] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_updatenow' do
    dsc_xwindowsupdateagent[:dsc_updatenow] = true
    expect(dsc_xwindowsupdateagent[:dsc_updatenow]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_updatenow" do
    dsc_xwindowsupdateagent[:dsc_updatenow] = 'true'
    expect(dsc_xwindowsupdateagent[:dsc_updatenow]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_updatenow" do
    dsc_xwindowsupdateagent[:dsc_updatenow] = 'false'
    expect(dsc_xwindowsupdateagent[:dsc_updatenow]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_updatenow" do
    dsc_xwindowsupdateagent[:dsc_updatenow] = 'True'
    expect(dsc_xwindowsupdateagent[:dsc_updatenow]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_updatenow" do
    dsc_xwindowsupdateagent[:dsc_updatenow] = 'False'
    expect(dsc_xwindowsupdateagent[:dsc_updatenow]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_updatenow" do
    dsc_xwindowsupdateagent[:dsc_updatenow] = :true
    expect(dsc_xwindowsupdateagent[:dsc_updatenow]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_updatenow" do
    dsc_xwindowsupdateagent[:dsc_updatenow] = :false
    expect(dsc_xwindowsupdateagent[:dsc_updatenow]).to eq(false)
  end

  it 'should not accept int for dsc_updatenow' do
    expect{dsc_xwindowsupdateagent[:dsc_updatenow] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_updatenow' do
    expect{dsc_xwindowsupdateagent[:dsc_updatenow] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_automaticupdatesnotificationsetting' do
    expect{dsc_xwindowsupdateagent[:dsc_automaticupdatesnotificationsetting] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_automaticupdatesnotificationsetting' do
    expect{dsc_xwindowsupdateagent[:dsc_automaticupdatesnotificationsetting] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_automaticupdatesnotificationsetting' do
    expect{dsc_xwindowsupdateagent[:dsc_automaticupdatesnotificationsetting] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_automaticupdatesnotificationsetting' do
    expect{dsc_xwindowsupdateagent[:dsc_automaticupdatesnotificationsetting] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_totalupdatesnotinstalled' do
    expect{dsc_xwindowsupdateagent[:dsc_totalupdatesnotinstalled] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_totalupdatesnotinstalled' do
    expect{dsc_xwindowsupdateagent[:dsc_totalupdatesnotinstalled] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_totalupdatesnotinstalled' do
    dsc_xwindowsupdateagent[:dsc_totalupdatesnotinstalled] = 32
    expect(dsc_xwindowsupdateagent[:dsc_totalupdatesnotinstalled]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_totalupdatesnotinstalled' do
    value = -32
    expect(value).to be < 0
    expect{dsc_xwindowsupdateagent[:dsc_totalupdatesnotinstalled] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_totalupdatesnotinstalled' do
    dsc_xwindowsupdateagent[:dsc_totalupdatesnotinstalled] = '16'
    expect(dsc_xwindowsupdateagent[:dsc_totalupdatesnotinstalled]).to eq(16)
  end

  it 'should accept string-like uint for dsc_totalupdatesnotinstalled' do
    dsc_xwindowsupdateagent[:dsc_totalupdatesnotinstalled] = '32'
    expect(dsc_xwindowsupdateagent[:dsc_totalupdatesnotinstalled]).to eq(32)
  end

  it 'should accept string-like uint for dsc_totalupdatesnotinstalled' do
    dsc_xwindowsupdateagent[:dsc_totalupdatesnotinstalled] = '64'
    expect(dsc_xwindowsupdateagent[:dsc_totalupdatesnotinstalled]).to eq(64)
  end

  it 'should not accept array for dsc_rebootrequired' do
    expect{dsc_xwindowsupdateagent[:dsc_rebootrequired] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_rebootrequired' do
    dsc_xwindowsupdateagent[:dsc_rebootrequired] = true
    expect(dsc_xwindowsupdateagent[:dsc_rebootrequired]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_rebootrequired" do
    dsc_xwindowsupdateagent[:dsc_rebootrequired] = 'true'
    expect(dsc_xwindowsupdateagent[:dsc_rebootrequired]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_rebootrequired" do
    dsc_xwindowsupdateagent[:dsc_rebootrequired] = 'false'
    expect(dsc_xwindowsupdateagent[:dsc_rebootrequired]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_rebootrequired" do
    dsc_xwindowsupdateagent[:dsc_rebootrequired] = 'True'
    expect(dsc_xwindowsupdateagent[:dsc_rebootrequired]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_rebootrequired" do
    dsc_xwindowsupdateagent[:dsc_rebootrequired] = 'False'
    expect(dsc_xwindowsupdateagent[:dsc_rebootrequired]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_rebootrequired" do
    dsc_xwindowsupdateagent[:dsc_rebootrequired] = :true
    expect(dsc_xwindowsupdateagent[:dsc_rebootrequired]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_rebootrequired" do
    dsc_xwindowsupdateagent[:dsc_rebootrequired] = :false
    expect(dsc_xwindowsupdateagent[:dsc_rebootrequired]).to eq(false)
  end

  it 'should not accept int for dsc_rebootrequired' do
    expect{dsc_xwindowsupdateagent[:dsc_rebootrequired] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_rebootrequired' do
    expect{dsc_xwindowsupdateagent[:dsc_rebootrequired] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_xwindowsupdateagent)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_xwindowsupdateagent)
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
