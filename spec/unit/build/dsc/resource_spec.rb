require 'spec_helper'
require File.join(File.dirname(__FILE__), '../../../../build/dsc/resource')
require File.join(File.dirname(__FILE__), '../../../../build/dsc/psmodule')

fixture_path = File.expand_path(File.join(__FILE__, '..', '..', '..', '..', 'fixtures'))

def create_mock_cim_class(name, friendlyname)
  obj = MockCIMClass.new(name)
  obj.qualifiers['Friendlyname'] = MockCIMQualifier.new(friendlyname)

  obj
end

describe 'Dsc::Resource' do
  let(:dsc_resource) { Dsc::Resource.new(mof_class, mof_path) }

  describe '#ps_module' do
    context 'with a default style DSC Resource module' do
      let(:mof_class) { create_mock_cim_class('default', 'defaultfriendly') }
      let(:mof_path) { File.join(fixture_path, 'dsc_modules', 'default', 'DSCResources') }

      it 'creates a PS Module object' do
        result = dsc_resource.ps_module

        expect(result.name).to eq('default')
        expect(result.module_manifest_path).to match(%r{\/default.psd1$})
      end
    end

    context 'with a PSD1 file which has different casing than the DSC Resource module ' do
      let(:mof_class) { create_mock_cim_class('mixedCase', 'mixedCasefriendly') }
      let(:mof_path) { File.join(fixture_path, 'dsc_modules', 'mixedCase', 'DSCResources') }

      it 'creates a PS Module object' do
        result = dsc_resource.ps_module

        expect(result.name).to eq('mixedCase')
        expect(result.module_manifest_path).to match(%r{\/MIXEDCase.psd1$})
      end
    end

    context 'with a multiple PSD1 files which have different casing than the DSC Resource module ' do
      let(:mof_class) { create_mock_cim_class('multiCase', 'multiCasefriendly') }
      let(:mof_path) { File.join(fixture_path, 'dsc_modules', 'multiCase', 'DSCResources') }

      it 'creates a PS Module object' do
        result = dsc_resource.ps_module

        expect(result.name).to eq('multiCase')
        expect(result.module_manifest_path).to match(%r{\/MuLTICase.psd1$})
      end
    end

    context 'with no PSD1 file in the DSC Resource module ' do
      let(:mof_class) { create_mock_cim_class('missing', 'missingfriendly') }
      let(:mof_path) { File.join(fixture_path, 'dsc_modules', 'missing', 'DSCResources') }

      it 'raises an error' do
        expect { dsc_resource.ps_module }.to raise_error(%r{module manifest .+ not found})
      end
    end
  end
end
