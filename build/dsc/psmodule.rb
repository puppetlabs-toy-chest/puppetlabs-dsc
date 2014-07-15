module Dsc
  class Psmodule

    attr_accessor :name

    def initialize(module_name, module_manifest_path)
      @name = module_name
      @module_manifest_path = module_manifest_path
      @attributes = nil
    end

    def version
      raise "ModuleVersion not found for module #{@name} / #{@module_manifest_path}" if attributes['ModuleVersion'].empty?
      attributes['ModuleVersion']
    end

    def attributes
      begin
        unless @attributes
          attrs = {}
          regex = /^(.*) *= *'(.*)' *$/
          begin
            File.open(@module_manifest_path, 'r:UTF-8') do |psd1|
              while line = psd1.gets
                matches = regex.match(line)
                attrs[matches[1].strip] = matches[2] if matches
              end
            end
            @attributes = attrs
          rescue ArgumentError
            File.open(@module_manifest_path, 'r:ISO-8859-1') do |psd1|
              while line = psd1.gets
                matches = regex.match(line)
                attrs[matches[1].strip] = matches[2] if matches
              end
            end
            @attributes = attrs
          end
        end
        @attributes
      rescue => e
        binding.pry
        raise "could not read psd1 manifest file for #{@name} / #{@module_manifest_path}: #{e}"
      end
    end

  end
end
