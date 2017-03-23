require 'spec_helper'
require File.join(File.dirname(__FILE__), '../../build/dsc/psmodule')

charlock_holmes_available = false
begin
  require 'charlock_holmes'
  charlock_holmes_available = true
rescue LoadError
  # If any LoadErrors are thrown then charlock_holmes is not available as a gem
end

describe Dsc::Psmodule, :if => charlock_holmes_available do
  describe "when parsing a psd1 manifest" do

    describe "with single quotes" do
      let (:psmodule){ 
        module_name = 'foo'
        module_manifest_path = File.join(File.dirname(__FILE__), '../fixtures/singlequotes.psd1')
        Dsc::Psmodule.new(module_name, module_manifest_path)
      }

      it "should parse" do
        attributes = psmodule.attributes
        expect(attributes).not_to eq(nil)
      end
    end

    describe "with double quotes" do
      let (:psmodule){ 
        module_name = 'foo'
        module_manifest_path = File.join(File.dirname(__FILE__), '../fixtures/doublequotes.psd1')
        Dsc::Psmodule.new(module_name, module_manifest_path)
      }
      it "should parse" do
        attributes = psmodule.attributes
        expect(attributes).not_to eq(nil)
      end
    end

    describe "that is invlaid" do
      let (:psmodule){ 
        module_name = 'foo'
        module_manifest_path = File.join(File.dirname(__FILE__), '../fixtures/bad.psd1')
        Dsc::Psmodule.new(module_name, module_manifest_path)
      }

      it "should fail" do
        expect{psmodule.attributes}.to raise_error(RuntimeError,/could not read psd1 manifest file for foo/)
      end
    end

  end
end
