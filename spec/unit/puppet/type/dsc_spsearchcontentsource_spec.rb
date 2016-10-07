#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spsearchcontentsource) do

  let :dsc_spsearchcontentsource do
    Puppet::Type.type(:dsc_spsearchcontentsource).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_serviceappname => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spsearchcontentsource).new(
      :name     => 'foo',
      :dsc_name => 'foo',
      :dsc_serviceappname => 'foo',
      :dsc_contentsourcetype => 'SharePoint',
      :dsc_addresses => ["foo", "bar", "spec"],
      :dsc_crawlsetting => 'CrawlEverything',
      :dsc_continuouscrawl => true,
      :dsc_incrementalschedule => {"ScheduleType"=>"None", "CrawlScheduleDaysOfMonth"=>32, "CrawlScheduleDaysOfWeek"=>"Everyday", "CrawlScheduleMonthsOfYear"=>"AllMonths", "StartHour"=>32, "StartMinute"=>32, "CrawlScheduleRepeatDuration"=>32, "CrawlScheduleRepeatInterval"=>32, "CrawlScheduleRunEveryInterval"=>32},
      :dsc_fullschedule => {"ScheduleType"=>"None", "CrawlScheduleDaysOfMonth"=>32, "CrawlScheduleDaysOfWeek"=>"Everyday", "CrawlScheduleMonthsOfYear"=>"AllMonths", "StartHour"=>32, "StartMinute"=>32, "CrawlScheduleRepeatDuration"=>32, "CrawlScheduleRepeatInterval"=>32, "CrawlScheduleRunEveryInterval"=>32},
      :dsc_priority => 'Normal',
      :dsc_limitpagedepth => 32,
      :dsc_limitserverhops => 32,
      :dsc_ensure => 'Present',
      :dsc_force => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spsearchcontentsource.to_s).to eq("Dsc_spsearchcontentsource[foo]")
  end

  it 'should default to ensure => present' do
    expect(dsc_spsearchcontentsource[:ensure]).to eq :present
  end

  it 'should require that dsc_name is specified' do
    #dsc_spsearchcontentsource[:dsc_name]
    expect { Puppet::Type.type(:dsc_spsearchcontentsource).new(
      :name     => 'foo',
      :dsc_serviceappname => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_name is a required attribute/)
  end

  it 'should not accept array for dsc_name' do
    expect{dsc_spsearchcontentsource[:dsc_name] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_name' do
    expect{dsc_spsearchcontentsource[:dsc_name] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_name' do
    expect{dsc_spsearchcontentsource[:dsc_name] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_name' do
    expect{dsc_spsearchcontentsource[:dsc_name] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should require that dsc_serviceappname is specified' do
    #dsc_spsearchcontentsource[:dsc_serviceappname]
    expect { Puppet::Type.type(:dsc_spsearchcontentsource).new(
      :name     => 'foo',
      :dsc_name => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_serviceappname is a required attribute/)
  end

  it 'should not accept array for dsc_serviceappname' do
    expect{dsc_spsearchcontentsource[:dsc_serviceappname] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_serviceappname' do
    expect{dsc_spsearchcontentsource[:dsc_serviceappname] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_serviceappname' do
    expect{dsc_spsearchcontentsource[:dsc_serviceappname] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_serviceappname' do
    expect{dsc_spsearchcontentsource[:dsc_serviceappname] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_contentsourcetype predefined value SharePoint' do
    dsc_spsearchcontentsource[:dsc_contentsourcetype] = 'SharePoint'
    expect(dsc_spsearchcontentsource[:dsc_contentsourcetype]).to eq('SharePoint')
  end

  it 'should accept dsc_contentsourcetype predefined value sharepoint' do
    dsc_spsearchcontentsource[:dsc_contentsourcetype] = 'sharepoint'
    expect(dsc_spsearchcontentsource[:dsc_contentsourcetype]).to eq('sharepoint')
  end

  it 'should accept dsc_contentsourcetype predefined value Website' do
    dsc_spsearchcontentsource[:dsc_contentsourcetype] = 'Website'
    expect(dsc_spsearchcontentsource[:dsc_contentsourcetype]).to eq('Website')
  end

  it 'should accept dsc_contentsourcetype predefined value website' do
    dsc_spsearchcontentsource[:dsc_contentsourcetype] = 'website'
    expect(dsc_spsearchcontentsource[:dsc_contentsourcetype]).to eq('website')
  end

  it 'should accept dsc_contentsourcetype predefined value FileShare' do
    dsc_spsearchcontentsource[:dsc_contentsourcetype] = 'FileShare'
    expect(dsc_spsearchcontentsource[:dsc_contentsourcetype]).to eq('FileShare')
  end

  it 'should accept dsc_contentsourcetype predefined value fileshare' do
    dsc_spsearchcontentsource[:dsc_contentsourcetype] = 'fileshare'
    expect(dsc_spsearchcontentsource[:dsc_contentsourcetype]).to eq('fileshare')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spsearchcontentsource[:dsc_contentsourcetype] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_contentsourcetype' do
    expect{dsc_spsearchcontentsource[:dsc_contentsourcetype] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_contentsourcetype' do
    expect{dsc_spsearchcontentsource[:dsc_contentsourcetype] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_contentsourcetype' do
    expect{dsc_spsearchcontentsource[:dsc_contentsourcetype] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_contentsourcetype' do
    expect{dsc_spsearchcontentsource[:dsc_contentsourcetype] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array for dsc_addresses' do
    dsc_spsearchcontentsource[:dsc_addresses] = ["foo", "bar", "spec"]
    expect(dsc_spsearchcontentsource[:dsc_addresses]).to eq(["foo", "bar", "spec"])
  end

  it 'should not accept boolean for dsc_addresses' do
    expect{dsc_spsearchcontentsource[:dsc_addresses] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_addresses' do
    expect{dsc_spsearchcontentsource[:dsc_addresses] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_addresses' do
    expect{dsc_spsearchcontentsource[:dsc_addresses] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_crawlsetting predefined value CrawlEverything' do
    dsc_spsearchcontentsource[:dsc_crawlsetting] = 'CrawlEverything'
    expect(dsc_spsearchcontentsource[:dsc_crawlsetting]).to eq('CrawlEverything')
  end

  it 'should accept dsc_crawlsetting predefined value crawleverything' do
    dsc_spsearchcontentsource[:dsc_crawlsetting] = 'crawleverything'
    expect(dsc_spsearchcontentsource[:dsc_crawlsetting]).to eq('crawleverything')
  end

  it 'should accept dsc_crawlsetting predefined value CrawlFirstOnly' do
    dsc_spsearchcontentsource[:dsc_crawlsetting] = 'CrawlFirstOnly'
    expect(dsc_spsearchcontentsource[:dsc_crawlsetting]).to eq('CrawlFirstOnly')
  end

  it 'should accept dsc_crawlsetting predefined value crawlfirstonly' do
    dsc_spsearchcontentsource[:dsc_crawlsetting] = 'crawlfirstonly'
    expect(dsc_spsearchcontentsource[:dsc_crawlsetting]).to eq('crawlfirstonly')
  end

  it 'should accept dsc_crawlsetting predefined value Custom' do
    dsc_spsearchcontentsource[:dsc_crawlsetting] = 'Custom'
    expect(dsc_spsearchcontentsource[:dsc_crawlsetting]).to eq('Custom')
  end

  it 'should accept dsc_crawlsetting predefined value custom' do
    dsc_spsearchcontentsource[:dsc_crawlsetting] = 'custom'
    expect(dsc_spsearchcontentsource[:dsc_crawlsetting]).to eq('custom')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spsearchcontentsource[:dsc_crawlsetting] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_crawlsetting' do
    expect{dsc_spsearchcontentsource[:dsc_crawlsetting] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_crawlsetting' do
    expect{dsc_spsearchcontentsource[:dsc_crawlsetting] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_crawlsetting' do
    expect{dsc_spsearchcontentsource[:dsc_crawlsetting] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_crawlsetting' do
    expect{dsc_spsearchcontentsource[:dsc_crawlsetting] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_continuouscrawl' do
    expect{dsc_spsearchcontentsource[:dsc_continuouscrawl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_continuouscrawl' do
    dsc_spsearchcontentsource[:dsc_continuouscrawl] = true
    expect(dsc_spsearchcontentsource[:dsc_continuouscrawl]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_continuouscrawl" do
    dsc_spsearchcontentsource[:dsc_continuouscrawl] = 'true'
    expect(dsc_spsearchcontentsource[:dsc_continuouscrawl]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_continuouscrawl" do
    dsc_spsearchcontentsource[:dsc_continuouscrawl] = 'false'
    expect(dsc_spsearchcontentsource[:dsc_continuouscrawl]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_continuouscrawl" do
    dsc_spsearchcontentsource[:dsc_continuouscrawl] = 'True'
    expect(dsc_spsearchcontentsource[:dsc_continuouscrawl]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_continuouscrawl" do
    dsc_spsearchcontentsource[:dsc_continuouscrawl] = 'False'
    expect(dsc_spsearchcontentsource[:dsc_continuouscrawl]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_continuouscrawl" do
    dsc_spsearchcontentsource[:dsc_continuouscrawl] = :true
    expect(dsc_spsearchcontentsource[:dsc_continuouscrawl]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_continuouscrawl" do
    dsc_spsearchcontentsource[:dsc_continuouscrawl] = :false
    expect(dsc_spsearchcontentsource[:dsc_continuouscrawl]).to eq(false)
  end

  it 'should not accept int for dsc_continuouscrawl' do
    expect{dsc_spsearchcontentsource[:dsc_continuouscrawl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_continuouscrawl' do
    expect{dsc_spsearchcontentsource[:dsc_continuouscrawl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_incrementalschedule' do
    expect{dsc_spsearchcontentsource[:dsc_incrementalschedule] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_incrementalschedule' do
    expect{dsc_spsearchcontentsource[:dsc_incrementalschedule] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_incrementalschedule' do
    expect{dsc_spsearchcontentsource[:dsc_incrementalschedule] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_incrementalschedule' do
    expect{dsc_spsearchcontentsource[:dsc_incrementalschedule] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_fullschedule' do
    expect{dsc_spsearchcontentsource[:dsc_fullschedule] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_fullschedule' do
    expect{dsc_spsearchcontentsource[:dsc_fullschedule] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_fullschedule' do
    expect{dsc_spsearchcontentsource[:dsc_fullschedule] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_fullschedule' do
    expect{dsc_spsearchcontentsource[:dsc_fullschedule] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_priority predefined value Normal' do
    dsc_spsearchcontentsource[:dsc_priority] = 'Normal'
    expect(dsc_spsearchcontentsource[:dsc_priority]).to eq('Normal')
  end

  it 'should accept dsc_priority predefined value normal' do
    dsc_spsearchcontentsource[:dsc_priority] = 'normal'
    expect(dsc_spsearchcontentsource[:dsc_priority]).to eq('normal')
  end

  it 'should accept dsc_priority predefined value High' do
    dsc_spsearchcontentsource[:dsc_priority] = 'High'
    expect(dsc_spsearchcontentsource[:dsc_priority]).to eq('High')
  end

  it 'should accept dsc_priority predefined value high' do
    dsc_spsearchcontentsource[:dsc_priority] = 'high'
    expect(dsc_spsearchcontentsource[:dsc_priority]).to eq('high')
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spsearchcontentsource[:dsc_priority] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_priority' do
    expect{dsc_spsearchcontentsource[:dsc_priority] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_priority' do
    expect{dsc_spsearchcontentsource[:dsc_priority] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_priority' do
    expect{dsc_spsearchcontentsource[:dsc_priority] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_priority' do
    expect{dsc_spsearchcontentsource[:dsc_priority] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_limitpagedepth' do
    expect{dsc_spsearchcontentsource[:dsc_limitpagedepth] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_limitpagedepth' do
    expect{dsc_spsearchcontentsource[:dsc_limitpagedepth] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_limitpagedepth' do
    dsc_spsearchcontentsource[:dsc_limitpagedepth] = 32
    expect(dsc_spsearchcontentsource[:dsc_limitpagedepth]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_limitpagedepth' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spsearchcontentsource[:dsc_limitpagedepth] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_limitpagedepth' do
    dsc_spsearchcontentsource[:dsc_limitpagedepth] = '16'
    expect(dsc_spsearchcontentsource[:dsc_limitpagedepth]).to eq(16)
  end

  it 'should accept string-like uint for dsc_limitpagedepth' do
    dsc_spsearchcontentsource[:dsc_limitpagedepth] = '32'
    expect(dsc_spsearchcontentsource[:dsc_limitpagedepth]).to eq(32)
  end

  it 'should accept string-like uint for dsc_limitpagedepth' do
    dsc_spsearchcontentsource[:dsc_limitpagedepth] = '64'
    expect(dsc_spsearchcontentsource[:dsc_limitpagedepth]).to eq(64)
  end

  it 'should not accept array for dsc_limitserverhops' do
    expect{dsc_spsearchcontentsource[:dsc_limitserverhops] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_limitserverhops' do
    expect{dsc_spsearchcontentsource[:dsc_limitserverhops] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept uint for dsc_limitserverhops' do
    dsc_spsearchcontentsource[:dsc_limitserverhops] = 32
    expect(dsc_spsearchcontentsource[:dsc_limitserverhops]).to eq(32)
  end

  it 'should not accept signed (negative) value for dsc_limitserverhops' do
    value = -32
    expect(value).to be < 0
    expect{dsc_spsearchcontentsource[:dsc_limitserverhops] = value}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept string-like uint for dsc_limitserverhops' do
    dsc_spsearchcontentsource[:dsc_limitserverhops] = '16'
    expect(dsc_spsearchcontentsource[:dsc_limitserverhops]).to eq(16)
  end

  it 'should accept string-like uint for dsc_limitserverhops' do
    dsc_spsearchcontentsource[:dsc_limitserverhops] = '32'
    expect(dsc_spsearchcontentsource[:dsc_limitserverhops]).to eq(32)
  end

  it 'should accept string-like uint for dsc_limitserverhops' do
    dsc_spsearchcontentsource[:dsc_limitserverhops] = '64'
    expect(dsc_spsearchcontentsource[:dsc_limitserverhops]).to eq(64)
  end

  it 'should accept dsc_ensure predefined value Present' do
    dsc_spsearchcontentsource[:dsc_ensure] = 'Present'
    expect(dsc_spsearchcontentsource[:dsc_ensure]).to eq('Present')
  end

  it 'should accept dsc_ensure predefined value present' do
    dsc_spsearchcontentsource[:dsc_ensure] = 'present'
    expect(dsc_spsearchcontentsource[:dsc_ensure]).to eq('present')
  end

  it 'should accept dsc_ensure predefined value present and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spsearchcontentsource[:dsc_ensure] = 'present'
    expect(dsc_spsearchcontentsource[:ensure]).to eq(dsc_spsearchcontentsource[:dsc_ensure].downcase.to_sym)
  end

  it 'should accept dsc_ensure predefined value Absent' do
    dsc_spsearchcontentsource[:dsc_ensure] = 'Absent'
    expect(dsc_spsearchcontentsource[:dsc_ensure]).to eq('Absent')
  end

  it 'should accept dsc_ensure predefined value absent' do
    dsc_spsearchcontentsource[:dsc_ensure] = 'absent'
    expect(dsc_spsearchcontentsource[:dsc_ensure]).to eq('absent')
  end

  it 'should accept dsc_ensure predefined value absent and update ensure with this value (ensure end value should be a symbol)' do
    dsc_spsearchcontentsource[:dsc_ensure] = 'absent'
    expect(dsc_spsearchcontentsource[:ensure]).to eq(dsc_spsearchcontentsource[:dsc_ensure].downcase.to_sym)
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spsearchcontentsource[:dsc_ensure] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_ensure' do
    expect{dsc_spsearchcontentsource[:dsc_ensure] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_ensure' do
    expect{dsc_spsearchcontentsource[:dsc_ensure] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_ensure' do
    expect{dsc_spsearchcontentsource[:dsc_ensure] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_ensure' do
    expect{dsc_spsearchcontentsource[:dsc_ensure] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_force' do
    expect{dsc_spsearchcontentsource[:dsc_force] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_force' do
    dsc_spsearchcontentsource[:dsc_force] = true
    expect(dsc_spsearchcontentsource[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_force" do
    dsc_spsearchcontentsource[:dsc_force] = 'true'
    expect(dsc_spsearchcontentsource[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_force" do
    dsc_spsearchcontentsource[:dsc_force] = 'false'
    expect(dsc_spsearchcontentsource[:dsc_force]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_force" do
    dsc_spsearchcontentsource[:dsc_force] = 'True'
    expect(dsc_spsearchcontentsource[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_force" do
    dsc_spsearchcontentsource[:dsc_force] = 'False'
    expect(dsc_spsearchcontentsource[:dsc_force]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_force" do
    dsc_spsearchcontentsource[:dsc_force] = :true
    expect(dsc_spsearchcontentsource[:dsc_force]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_force" do
    dsc_spsearchcontentsource[:dsc_force] = :false
    expect(dsc_spsearchcontentsource[:dsc_force]).to eq(false)
  end

  it 'should not accept int for dsc_force' do
    expect{dsc_spsearchcontentsource[:dsc_force] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_force' do
    expect{dsc_spsearchcontentsource[:dsc_force] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spsearchcontentsource[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spsearchcontentsource[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spsearchcontentsource[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spsearchcontentsource[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spsearchcontentsource[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spsearchcontentsource)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spsearchcontentsource)
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
        dsc_spsearchcontentsource.original_parameters[:dsc_ensure] = 'present'
        dsc_spsearchcontentsource[:dsc_ensure] = 'present'
        @provider = described_class.provider(:powershell).new(dsc_spsearchcontentsource)
      end

      it "should update :ensure to :present" do
        expect(dsc_spsearchcontentsource[:ensure]).to eq(:present)
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
        dsc_spsearchcontentsource.original_parameters[:dsc_ensure] = 'absent'
        dsc_spsearchcontentsource[:dsc_ensure] = 'absent'
        @provider = described_class.provider(:powershell).new(dsc_spsearchcontentsource)
      end

      it "should update :ensure to :absent" do
        expect(dsc_spsearchcontentsource[:ensure]).to eq(:absent)
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
