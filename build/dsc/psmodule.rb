module Dsc
  class Psmodule

    attr_accessor :name

    ENCODING = Encoding::UTF_8
    ENCODING_OPTIONS = {
      invalid: :replace,
      undef:   :replace,
      replace: ''
    }.freeze

    def initialize(module_name, module_manifest_path)
      @name = module_name
      @module_manifest_path = module_manifest_path
      @attributes = nil
    end

    def version
      raise "ModuleVersion not found for module #{@name} / #{@module_manifest_path}" if !attributes.key?('ModuleVersion') || attributes['ModuleVersion'].empty?
      attributes['ModuleVersion']
    end

    def attributes
      begin
        unless @attributes
          attrs = {}
          regex = /^(.*) *= *['"](.*)['"] *(;)? *$/
          File.open(@module_manifest_path, 'r') do |psd1|
            content = File.read(psd1)
            if content.empty?
              raise "could not read psd1 manifest file for #{@name} / #{@module_manifest_path}: empty"
            end
            utf8_encoded_content = utf8_encode_content(content)
            utf8_encoded_content.lines.each do |line|
              dos2unix(line)
              matches = regex.match(line)
              attrs[matches[1].strip] = matches[2] if matches
            end
            @attributes = attrs
          end
        end
        @attributes
      rescue => e
        raise "could not read psd1 manifest file for #{@name} / #{@module_manifest_path}: #{e}"
      end
    end

    private

    def utf8_encode_content(content)
      content.force_encoding(ENCODING)
      unless content.valid_encoding?
        content.encode!(ENCODING, ENCODING_OPTIONS)
      end
      content
    end

    def dos2unix(line)
      line.gsub!(/\r\n$/, "\n")
    end

  end
end
