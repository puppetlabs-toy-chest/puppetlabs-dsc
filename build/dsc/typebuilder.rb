# rubocop:disable Style/ClassAndModuleChildren
module Dsc
  # Build the type files
  class TypeBuilder < Manager
    def build_dsc_types
      type_pathes = []
      resources.each do |resource|
        if resource.friendlyname
          build_dsc_type(resource, @type_template_file, @target_module_path, @puppet_type_subpath, @module_path, type_pathes)
          build_dsc_type_spec(resource, @type_spec_template_file, @target_module_path, @puppet_type_spec_subpath, @module_path, type_pathes)
        else
          puts "#{resource.name} from #{resource.dsc_module} has invalid mof (no friendlyname defined)"
          puts "#{resource.name} will not be usable with puppet"
        end
      end
      type_pathes
    end

    def build_dsc_type(resource, type_template_file, target_module_path, puppet_type_subpath, module_path, type_pathes)
      type_template    = File.open(type_template_file, 'r').read
      type_erb         = ERB.new(type_template, nil, '-')
      puppet_type_path = "#{target_module_path}/#{puppet_type_subpath}"

      FileUtils.mkdir_p(puppet_type_path) unless File.exist?(puppet_type_path)

      File.open("#{puppet_type_path}/dsc_#{resource.friendlyname.downcase}.rb", 'w+') do |file|
        file.write(type_erb.result(binding))
        pn = Pathname.new(file.path).expand_path.relative_path_from(module_path)
        type_pathes << "Add type - #{pn}"
      end
    end

    def build_dsc_type_spec(resource, type_spec_template_file, target_module_path, puppet_type_spec_subpath, module_path, type_pathes)
      whitelist = ['archive', 'environment', 'file', 'group', 'groupset', 'log', 'package',
                   'processset', 'registry', 'script', 'service', 'serviceset', 'user', 'windowsfeature',
                   'windowsfeatureset', 'windowsoptionalfeature', 'windowsoptionalfeatureset', 'windowsprocess']

      type_spec_template    = File.open(type_spec_template_file, 'r').read
      type_spec_erb         = ERB.new(type_spec_template, nil, '-')
      puppet_type_spec_path = "#{target_module_path}/#{puppet_type_spec_subpath}"

      FileUtils.mkdir_p(puppet_type_spec_path) unless File.exist?(puppet_type_spec_path)

      return unless whitelist.include?(resource.friendlyname.downcase)
      File.open("#{puppet_type_spec_path}/dsc_#{resource.friendlyname.downcase}_spec.rb", 'w+') do |file|
        file.write(type_spec_erb.result(binding))
        pn = Pathname.new(file.path).expand_path.relative_path_from(module_path)
        type_pathes << "Add type spec - #{pn}"
      end
    end

    def format_type_value(type_value)
      case type_value.class.name
      when 'Symbol'
        ":#{type_value}"
      when 'String'
        "'#{type_value}'"
      when 'Numeric'
        type_value.to_s
      else
        type_value
      end
    end

    def format_newvalues(values)
      output = []
      values.each do |v|
        output << format_type_value(v)
        output << format_type_value(v.downcase) if v.respond_to?('downcase')
      end
      output.join(', ')
    end

    def get_spec_test_value(type)
      @spec_test_values = {
        'string'   => 'foo',
        'string[]' => ['foo', 'bar', 'spec'],
        'MSFT_Credential' => { 'user' => 'user', 'password' => 'password' },
        'MSFT_KeyValuePair' => { 'somekey' => 'somevalue' },
        'MSFT_KeyValuePair[]' => { 'somekey' => 'somevalue', 'somekey2' => 'somevalue2' },
        'bool'     => true,
        'boolean'  => true,
        'munged_bools' => ['true', 'false', 'True', 'False', :true, :false],
        'munged_ints' => ['16', '-16', '32', '-32'],
        'munged_uints' => ['16', '32', '64'],
        'int_not_bool_mungeable'  => -16,
        'uint_not_bool_mungeable' => 16,
        'datetime' => '20140711',
        'int8'     => -16,
        'int8[]'   => [-128, 0, 127],
        'int16'    => -16,
        'int16[]'  => [-16, 32, -64],
        'int32'    => -32,
        'int32[]'  => [-32, 64, -128],
        'int64'    => -64,
        'int64[]'  => [-64, 128, -256],
        'sint8'     => -128,
        'sint8[]'   => [-128, 0, 127],
        'sint16'    => -16,
        'sint16[]'  => [-16, 32, -64],
        'sint32'    => -32,
        'sint32[]'  => [-32, 64, -128],
        'sint64'    => -64,
        'sint64[]'  => [-64, 128, -256],
        'uint8'    => 1,
        'uint8[]'  => [0, 16, 255],
        'uint16'   => 16,
        'uint16[]' => [16, 32, 64],
        'uint32'   => 32,
        'uint32[]' => [32, 64, 128],
        'uint64'   => 64,
        'uint64[]' => [64, 128, 256],
        'real32'   => '32.000',
        'real64'   => '64.000',
      }
      # generate a hash here for any EmbeddedInstance type not seen yet
      unless @spec_test_values[type]
        type_name = type.gsub(%r{\[\]$}, '') # strip [] off end of MOF type name
        values = cim_classes_with_path
                 .select { |c| c[:klass].name == type_name }
                 .first[:klass]
                 .features
                 .map do |prop|
                   # use first value in ValueMap if present
                   val = if prop.qualifiers['Values']
                           prop.qualifiers['Values'].value.first
                         else
                           get_spec_test_value(prop.type.to_s)
                         end
                   [prop.name, val]
                 end
        @spec_test_values[type] = Hash[values]
      end

      @spec_test_values[type]
    end
  end
end
