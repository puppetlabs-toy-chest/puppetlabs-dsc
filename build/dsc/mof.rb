module Dsc
  class Mof

    attr_accessor :dsc_invalid_resources

    def initialize(options)
      @base_qualifiers_folder       = options[:base_qualifiers_folder]
      @dmtf_mof_folder              = options[:dmtf_mof_folder]
      @dsc_modules_folder           = options[:dsc_modules_folder]

      @dmtf_cim_mof                 = Dir[ @dmtf_mof_folder + '/cim_schema_*.mof'].first
      @dmtf_qualifiers_mof          = "#{@dmtf_mof_folder}/qualifiers.mof"
      @dmtf_qualifiers_optional_mof = "#{@dmtf_mof_folder}/qualifiers_optional.mof"

      @dsc_mof_file_pathes          = nil
      @dsc_invalid_resources        = {}
    end

    def base_mof_file_pathes
      @base_mof_file_pathes ||= Dir[ @base_qualifiers_folder + '/**/*.mof' ] 
    end

    def dsc_mof_file_pathes
      # require 'pry'; binding.pry
      @dsc_mof_file_pathes ||= Dir.chdir(@dsc_modules_folder) do Dir.glob('**/*.[sS]chema.mof') end
    end

    def dsc_results
      all_result.select{|k,v| dsc_mof_file_pathes.include?(k)}
    end

    def all_result

      moffiles, options = MOF::Parser.argv_handler "moflint", []
      options[:style] ||= :wmi
      options[:includes] ||= []
      options[:quiet] ||= false

      options[:includes].unshift(@dsc_modules_folder, @base_qualifiers_folder)

      moffiles.unshift @dmtf_cim_mof unless moffiles.include? @dmtf_cim_mof
      moffiles.unshift @dmtf_qualifiers_optional_mof unless moffiles.include? @dmtf_qualifiers_optional_mof
      moffiles.unshift @dmtf_qualifiers_mof unless moffiles.include? @dmtf_qualifiers_mof
      moffiles = (base_mof_file_pathes + moffiles).uniq

      parser = MOF::Parser.new options

      results = dsc_mof_file_pathes.map do |file|
        begin
          result = parser.parse(moffiles + [file])
        rescue Exception => e
          @dsc_invalid_resources[file] = e
          puts "Last processed #{file} file could not be parsed: #{e}"
          # exit 1
        end
        # return mof result
        result
      end

      results.inject(:merge)
    end
  end
end
