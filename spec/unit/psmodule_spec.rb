require 'spec_helper'
require File.join(File.dirname(__FILE__), '../../build/dsc/psmodule')

# rubocop:disable RSpec/FilePath
# We turn this rule off because requiring charlock_holmes _will_ blow up if it is
# unavailable, which we want to ignore so we can skip this suite instead of failing.
# rubocop:disable Lint/HandleExceptions
charlock_holmes_available = false
begin
  require 'charlock_holmes'
  charlock_holmes_available = true
rescue LoadError
  # If any LoadErrors are thrown then charlock_holmes is not available as a gem
end
# rubocop:enable Lint/HandleExceptions

describe Dsc::Psmodule, if: charlock_holmes_available do
  describe 'when parsing a psd1 manifest' do
    describe 'with single quotes' do
      before(:each) {}
      let(:psmodule) do
        module_name = 'foo'
        module_manifest_path = File.join(File.dirname(__FILE__), '../fixtures/singlequotes.psd1')
        Dsc::Psmodule.new(module_name, module_manifest_path)
      end

      it 'parses' do
        data = psmodule.version
        expect(data).not_to eq(nil)
      end
    end

    describe 'with double quotes' do
      let(:psmodule) do
        module_name = 'foo'
        module_manifest_path = File.join(File.dirname(__FILE__), '../fixtures/doublequotes.psd1')
        Dsc::Psmodule.new(module_name, module_manifest_path)
      end

      it 'parses' do
        data = psmodule.version
        expect(data).not_to eq(nil)
      end
    end

    describe 'that is invlaid' do
      let(:psmodule) do
        module_name = 'foo'
        module_manifest_path = File.join(File.dirname(__FILE__), '../fixtures/bad.psd1')
        Dsc::Psmodule.new(module_name, module_manifest_path)
      end

      it 'fails' do
        expect { psmodule.version }.to raise_error(RuntimeError, %r{could not read psd1 manifest file for foo})
      end
    end
  end
end
