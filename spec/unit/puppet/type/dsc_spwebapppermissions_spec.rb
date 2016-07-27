#!/usr/bin/env ruby
require 'spec_helper'

describe Puppet::Type.type(:dsc_spwebapppermissions) do

  let :dsc_spwebapppermissions do
    Puppet::Type.type(:dsc_spwebapppermissions).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
    )
  end

  it 'should allow all properties to be specified' do
    expect { Puppet::Type.type(:dsc_spwebapppermissions).new(
      :name     => 'foo',
      :dsc_webappurl => 'foo',
      :dsc_listpermissions => 'Manage Lists',
      :dsc_sitepermissions => 'Manage Permissions',
      :dsc_personalpermissions => 'Manage Personal Views',
      :dsc_allpermissions => true,
      :dsc_installaccount => {"user"=>"user", "password"=>"password"},
    )}.to_not raise_error
  end

  it "should stringify normally" do
    expect(dsc_spwebapppermissions.to_s).to eq("Dsc_spwebapppermissions[foo]")
  end

  it 'should require that dsc_webappurl is specified' do
    #dsc_spwebapppermissions[:dsc_webappurl]
    expect { Puppet::Type.type(:dsc_spwebapppermissions).new(
      :name     => 'foo',
    )}.to raise_error(Puppet::Error, /dsc_webappurl is a required attribute/)
  end

  it 'should not accept array for dsc_webappurl' do
    expect{dsc_spwebapppermissions[:dsc_webappurl] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_webappurl' do
    expect{dsc_spwebapppermissions[:dsc_webappurl] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_webappurl' do
    expect{dsc_spwebapppermissions[:dsc_webappurl] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_webappurl' do
    expect{dsc_spwebapppermissions[:dsc_webappurl] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_listpermissions predefined value Manage Lists' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'Manage Lists'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['Manage Lists'])
  end

  it 'should accept dsc_listpermissions predefined value manage lists' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'manage lists'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['manage lists'])
  end

  it 'should accept dsc_listpermissions predefined value Override List Behaviors' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'Override List Behaviors'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['Override List Behaviors'])
  end

  it 'should accept dsc_listpermissions predefined value override list behaviors' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'override list behaviors'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['override list behaviors'])
  end

  it 'should accept dsc_listpermissions predefined value Add Items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'Add Items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['Add Items'])
  end

  it 'should accept dsc_listpermissions predefined value add items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'add items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['add items'])
  end

  it 'should accept dsc_listpermissions predefined value Edit Items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'Edit Items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['Edit Items'])
  end

  it 'should accept dsc_listpermissions predefined value edit items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'edit items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['edit items'])
  end

  it 'should accept dsc_listpermissions predefined value Delete Items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'Delete Items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['Delete Items'])
  end

  it 'should accept dsc_listpermissions predefined value delete items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'delete items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['delete items'])
  end

  it 'should accept dsc_listpermissions predefined value View Items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'View Items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['View Items'])
  end

  it 'should accept dsc_listpermissions predefined value view items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'view items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['view items'])
  end

  it 'should accept dsc_listpermissions predefined value Approve Items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'Approve Items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['Approve Items'])
  end

  it 'should accept dsc_listpermissions predefined value approve items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'approve items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['approve items'])
  end

  it 'should accept dsc_listpermissions predefined value Open Items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'Open Items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['Open Items'])
  end

  it 'should accept dsc_listpermissions predefined value open items' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'open items'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['open items'])
  end

  it 'should accept dsc_listpermissions predefined value View Versions' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'View Versions'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['View Versions'])
  end

  it 'should accept dsc_listpermissions predefined value view versions' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'view versions'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['view versions'])
  end

  it 'should accept dsc_listpermissions predefined value Delete Versions' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'Delete Versions'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['Delete Versions'])
  end

  it 'should accept dsc_listpermissions predefined value delete versions' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'delete versions'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['delete versions'])
  end

  it 'should accept dsc_listpermissions predefined value Create Alerts' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'Create Alerts'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['Create Alerts'])
  end

  it 'should accept dsc_listpermissions predefined value create alerts' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'create alerts'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['create alerts'])
  end

  it 'should accept dsc_listpermissions predefined value View Application Pages' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'View Application Pages'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['View Application Pages'])
  end

  it 'should accept dsc_listpermissions predefined value view application pages' do
    dsc_spwebapppermissions[:dsc_listpermissions] = 'view application pages'
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(['view application pages'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spwebapppermissions[:dsc_listpermissions] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_listpermissions' do
    dsc_spwebapppermissions[:dsc_listpermissions] = ["Manage Lists", "Override List Behaviors", "Add Items", "Edit Items", "Delete Items", "View Items", "Approve Items", "Open Items", "View Versions", "Delete Versions", "Create Alerts", "View Application Pages"]
    expect(dsc_spwebapppermissions[:dsc_listpermissions]).to eq(["Manage Lists", "Override List Behaviors", "Add Items", "Edit Items", "Delete Items", "View Items", "Approve Items", "Open Items", "View Versions", "Delete Versions", "Create Alerts", "View Application Pages"])
  end

  it 'should not accept boolean for dsc_listpermissions' do
    expect{dsc_spwebapppermissions[:dsc_listpermissions] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_listpermissions' do
    expect{dsc_spwebapppermissions[:dsc_listpermissions] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_listpermissions' do
    expect{dsc_spwebapppermissions[:dsc_listpermissions] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_sitepermissions predefined value Manage Permissions' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Manage Permissions'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Manage Permissions'])
  end

  it 'should accept dsc_sitepermissions predefined value manage permissions' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'manage permissions'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['manage permissions'])
  end

  it 'should accept dsc_sitepermissions predefined value View Web Analytics Data' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'View Web Analytics Data'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['View Web Analytics Data'])
  end

  it 'should accept dsc_sitepermissions predefined value view web analytics data' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'view web analytics data'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['view web analytics data'])
  end

  it 'should accept dsc_sitepermissions predefined value Create Subsites' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Create Subsites'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Create Subsites'])
  end

  it 'should accept dsc_sitepermissions predefined value create subsites' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'create subsites'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['create subsites'])
  end

  it 'should accept dsc_sitepermissions predefined value Manage Web Site' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Manage Web Site'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Manage Web Site'])
  end

  it 'should accept dsc_sitepermissions predefined value manage web site' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'manage web site'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['manage web site'])
  end

  it 'should accept dsc_sitepermissions predefined value Add and Customize Pages' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Add and Customize Pages'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Add and Customize Pages'])
  end

  it 'should accept dsc_sitepermissions predefined value add and customize pages' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'add and customize pages'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['add and customize pages'])
  end

  it 'should accept dsc_sitepermissions predefined value Apply Themes and Borders' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Apply Themes and Borders'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Apply Themes and Borders'])
  end

  it 'should accept dsc_sitepermissions predefined value apply themes and borders' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'apply themes and borders'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['apply themes and borders'])
  end

  it 'should accept dsc_sitepermissions predefined value Apply Style Sheets' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Apply Style Sheets'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Apply Style Sheets'])
  end

  it 'should accept dsc_sitepermissions predefined value apply style sheets' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'apply style sheets'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['apply style sheets'])
  end

  it 'should accept dsc_sitepermissions predefined value Create Groups' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Create Groups'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Create Groups'])
  end

  it 'should accept dsc_sitepermissions predefined value create groups' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'create groups'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['create groups'])
  end

  it 'should accept dsc_sitepermissions predefined value Browse Directories' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Browse Directories'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Browse Directories'])
  end

  it 'should accept dsc_sitepermissions predefined value browse directories' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'browse directories'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['browse directories'])
  end

  it 'should accept dsc_sitepermissions predefined value Use Self-Service Site Creation' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Use Self-Service Site Creation'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Use Self-Service Site Creation'])
  end

  it 'should accept dsc_sitepermissions predefined value use self-service site creation' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'use self-service site creation'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['use self-service site creation'])
  end

  it 'should accept dsc_sitepermissions predefined value View Pages' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'View Pages'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['View Pages'])
  end

  it 'should accept dsc_sitepermissions predefined value view pages' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'view pages'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['view pages'])
  end

  it 'should accept dsc_sitepermissions predefined value Enumerate Permissions' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Enumerate Permissions'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Enumerate Permissions'])
  end

  it 'should accept dsc_sitepermissions predefined value enumerate permissions' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'enumerate permissions'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['enumerate permissions'])
  end

  it 'should accept dsc_sitepermissions predefined value Browse User Information' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Browse User Information'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Browse User Information'])
  end

  it 'should accept dsc_sitepermissions predefined value browse user information' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'browse user information'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['browse user information'])
  end

  it 'should accept dsc_sitepermissions predefined value Manage Alerts' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Manage Alerts'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Manage Alerts'])
  end

  it 'should accept dsc_sitepermissions predefined value manage alerts' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'manage alerts'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['manage alerts'])
  end

  it 'should accept dsc_sitepermissions predefined value Use Remote Interfaces' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Use Remote Interfaces'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Use Remote Interfaces'])
  end

  it 'should accept dsc_sitepermissions predefined value use remote interfaces' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'use remote interfaces'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['use remote interfaces'])
  end

  it 'should accept dsc_sitepermissions predefined value Use Client Integration Features' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Use Client Integration Features'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Use Client Integration Features'])
  end

  it 'should accept dsc_sitepermissions predefined value use client integration features' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'use client integration features'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['use client integration features'])
  end

  it 'should accept dsc_sitepermissions predefined value Open' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Open'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Open'])
  end

  it 'should accept dsc_sitepermissions predefined value open' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'open'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['open'])
  end

  it 'should accept dsc_sitepermissions predefined value Edit Personal User Information' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'Edit Personal User Information'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['Edit Personal User Information'])
  end

  it 'should accept dsc_sitepermissions predefined value edit personal user information' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = 'edit personal user information'
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(['edit personal user information'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spwebapppermissions[:dsc_sitepermissions] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_sitepermissions' do
    dsc_spwebapppermissions[:dsc_sitepermissions] = ["Manage Permissions", "View Web Analytics Data", "Create Subsites", "Manage Web Site", "Add and Customize Pages", "Apply Themes and Borders", "Apply Style Sheets", "Create Groups", "Browse Directories", "Use Self-Service Site Creation", "View Pages", "Enumerate Permissions", "Browse User Information", "Manage Alerts", "Use Remote Interfaces", "Use Client Integration Features", "Open", "Edit Personal User Information"]
    expect(dsc_spwebapppermissions[:dsc_sitepermissions]).to eq(["Manage Permissions", "View Web Analytics Data", "Create Subsites", "Manage Web Site", "Add and Customize Pages", "Apply Themes and Borders", "Apply Style Sheets", "Create Groups", "Browse Directories", "Use Self-Service Site Creation", "View Pages", "Enumerate Permissions", "Browse User Information", "Manage Alerts", "Use Remote Interfaces", "Use Client Integration Features", "Open", "Edit Personal User Information"])
  end

  it 'should not accept boolean for dsc_sitepermissions' do
    expect{dsc_spwebapppermissions[:dsc_sitepermissions] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_sitepermissions' do
    expect{dsc_spwebapppermissions[:dsc_sitepermissions] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_sitepermissions' do
    expect{dsc_spwebapppermissions[:dsc_sitepermissions] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept dsc_personalpermissions predefined value Manage Personal Views' do
    dsc_spwebapppermissions[:dsc_personalpermissions] = 'Manage Personal Views'
    expect(dsc_spwebapppermissions[:dsc_personalpermissions]).to eq(['Manage Personal Views'])
  end

  it 'should accept dsc_personalpermissions predefined value manage personal views' do
    dsc_spwebapppermissions[:dsc_personalpermissions] = 'manage personal views'
    expect(dsc_spwebapppermissions[:dsc_personalpermissions]).to eq(['manage personal views'])
  end

  it 'should accept dsc_personalpermissions predefined value Add/Remove Personal Web Parts' do
    dsc_spwebapppermissions[:dsc_personalpermissions] = 'Add/Remove Personal Web Parts'
    expect(dsc_spwebapppermissions[:dsc_personalpermissions]).to eq(['Add/Remove Personal Web Parts'])
  end

  it 'should accept dsc_personalpermissions predefined value add/remove personal web parts' do
    dsc_spwebapppermissions[:dsc_personalpermissions] = 'add/remove personal web parts'
    expect(dsc_spwebapppermissions[:dsc_personalpermissions]).to eq(['add/remove personal web parts'])
  end

  it 'should accept dsc_personalpermissions predefined value Update Personal Web Parts' do
    dsc_spwebapppermissions[:dsc_personalpermissions] = 'Update Personal Web Parts'
    expect(dsc_spwebapppermissions[:dsc_personalpermissions]).to eq(['Update Personal Web Parts'])
  end

  it 'should accept dsc_personalpermissions predefined value update personal web parts' do
    dsc_spwebapppermissions[:dsc_personalpermissions] = 'update personal web parts'
    expect(dsc_spwebapppermissions[:dsc_personalpermissions]).to eq(['update personal web parts'])
  end

  it 'should not accept values not equal to predefined values' do
    expect{dsc_spwebapppermissions[:dsc_personalpermissions] = 'invalid value'}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept array of predefined values for dsc_personalpermissions' do
    dsc_spwebapppermissions[:dsc_personalpermissions] = ["Manage Personal Views", "Add/Remove Personal Web Parts", "Update Personal Web Parts"]
    expect(dsc_spwebapppermissions[:dsc_personalpermissions]).to eq(["Manage Personal Views", "Add/Remove Personal Web Parts", "Update Personal Web Parts"])
  end

  it 'should not accept boolean for dsc_personalpermissions' do
    expect{dsc_spwebapppermissions[:dsc_personalpermissions] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_personalpermissions' do
    expect{dsc_spwebapppermissions[:dsc_personalpermissions] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_personalpermissions' do
    expect{dsc_spwebapppermissions[:dsc_personalpermissions] = 16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_allpermissions' do
    expect{dsc_spwebapppermissions[:dsc_allpermissions] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should accept boolean for dsc_allpermissions' do
    dsc_spwebapppermissions[:dsc_allpermissions] = true
    expect(dsc_spwebapppermissions[:dsc_allpermissions]).to eq(true)
  end

  it "should accept boolean-like value 'true' and munge this value to boolean for dsc_allpermissions" do
    dsc_spwebapppermissions[:dsc_allpermissions] = 'true'
    expect(dsc_spwebapppermissions[:dsc_allpermissions]).to eq(true)
  end

  it "should accept boolean-like value 'false' and munge this value to boolean for dsc_allpermissions" do
    dsc_spwebapppermissions[:dsc_allpermissions] = 'false'
    expect(dsc_spwebapppermissions[:dsc_allpermissions]).to eq(false)
  end

  it "should accept boolean-like value 'True' and munge this value to boolean for dsc_allpermissions" do
    dsc_spwebapppermissions[:dsc_allpermissions] = 'True'
    expect(dsc_spwebapppermissions[:dsc_allpermissions]).to eq(true)
  end

  it "should accept boolean-like value 'False' and munge this value to boolean for dsc_allpermissions" do
    dsc_spwebapppermissions[:dsc_allpermissions] = 'False'
    expect(dsc_spwebapppermissions[:dsc_allpermissions]).to eq(false)
  end

  it "should accept boolean-like value :true and munge this value to boolean for dsc_allpermissions" do
    dsc_spwebapppermissions[:dsc_allpermissions] = :true
    expect(dsc_spwebapppermissions[:dsc_allpermissions]).to eq(true)
  end

  it "should accept boolean-like value :false and munge this value to boolean for dsc_allpermissions" do
    dsc_spwebapppermissions[:dsc_allpermissions] = :false
    expect(dsc_spwebapppermissions[:dsc_allpermissions]).to eq(false)
  end

  it 'should not accept int for dsc_allpermissions' do
    expect{dsc_spwebapppermissions[:dsc_allpermissions] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_allpermissions' do
    expect{dsc_spwebapppermissions[:dsc_allpermissions] = 16}.to raise_error(Puppet::ResourceError)
  end

  it "should not accept empty password for dsc_installaccount" do
    expect{dsc_spwebapppermissions[:dsc_installaccount] = {"user"=>"user", "password"=>""}}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept array for dsc_installaccount' do
    expect{dsc_spwebapppermissions[:dsc_installaccount] = ["foo", "bar", "spec"]}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept boolean for dsc_installaccount' do
    expect{dsc_spwebapppermissions[:dsc_installaccount] = true}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept int for dsc_installaccount' do
    expect{dsc_spwebapppermissions[:dsc_installaccount] = -16}.to raise_error(Puppet::ResourceError)
  end

  it 'should not accept uint for dsc_installaccount' do
    expect{dsc_spwebapppermissions[:dsc_installaccount] = 16}.to raise_error(Puppet::ResourceError)
  end

  # Configuration PROVIDER TESTS

  describe "powershell provider tests" do

    it "should successfully instanciate the provider" do
      described_class.provider(:powershell).new(dsc_spwebapppermissions)
    end

    before(:each) do
      @provider = described_class.provider(:powershell).new(dsc_spwebapppermissions)
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

    describe "when dsc_resource has credentials" do

      it "should convert credential hash to a pscredential object" do
        expect(@provider.ps_script_content('test')).to match(/| new-pscredential'/)
      end

    end


  end
end
