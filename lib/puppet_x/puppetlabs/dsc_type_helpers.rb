# rubocop:disable Style/ClassAndModuleChildren
module PuppetX
  module Dsc
    # Helpers for DSC types
    class TypeHelpers
      def self.munge_boolean(value)
        return true if value =~ %r{^(true|t|yes|y|1)$}i
        return false if value.empty? || value =~ %r{^(false|f|no|n|0)$}i

        raise ArgumentError, "invalid value: #{value}"
      end

      # This is used to recursively search the hash to find sensitive data
      # and ensure it is properly represented.
      # It will modify the values in the hash passed to it.
      def self.munge_sensitive_hash!(h)
        if h.is_a?(Hash) && h['__pcore_type__'] == 'Sensitive' && h.key?('__pcore_value__')
          Puppet::Pops::Types::PSensitiveType::Sensitive.new(h['__pcore_value__'])
        elsif h.is_a?(Hash) && h['__ptype'] == 'Sensitive' && h.key?('__pvalue')
          Puppet::Pops::Types::PSensitiveType::Sensitive.new(h['__pvalue'])
        else
          h.each_pair do |key, value|
            h[key] = munge_sensitive_hash!(value) if value.is_a?(Hash)
          end
        end
      end

      def self.munge_integer(value)
        value.is_a?(Array) ? value.map { |v| v.to_i } : value.to_i
      end

      def self.munge_embeddedinstance(mof_type, embeddedinstance_value)
        remapped_value = embeddedinstance_value.map do |key, value|
          if mof_type[key.downcase]
            case mof_type[key.downcase][:type]
            when 'bool', 'boolean'
              value = munge_boolean(value.to_s)
            # particularly important to Puppet 3.x which parses numbers as strings
            when 'uint8', 'uint16', 'uint32', 'uint64',
              'uint8[]', 'uint16[]', 'uint32[]', 'uint64[]',
              'int8', 'int16', 'int32', 'int64',
              'sint8', 'sint16', 'sint32', 'sint64',
              'int8[]', 'int16[]', 'int32[]', 'int64[]',
              'sint8[]', 'sint16[]', 'sint32[]', 'sint64[]'

              unless Array(value).all? { |v| v.is_a?(Numeric) || v =~ %r{^[-+]?\d+$} }
                raise "#{key} should only include numeric values: invalid value #{value}"
              end

              value = value.is_a?(Array) ? value.map { |v| v.to_i } : value.to_i
            end
          end

          [key, value]
        end

        Hash[remapped_value]
      end

      def self.validate_MSFT_Credential(name, value)
        unless value.is_a?(Hash)
          raise "Invalid value '#{value}'. Should be a hash"
        end

        required = ['user', 'password']
        required.each do |key|
          next unless value[key]
          unless (value[key].is_a? String) || (value[key].is_a? Puppet::Pops::Types::PSensitiveType::Sensitive)
            raise "#{key} for #{name} should be a String or Sensitive value"
          end
          raise "#{key} must not be empty" if value[key].to_s.empty?
        end

        specified_keys = value.keys.map(&:to_s)

        missing = required - specified_keys
        raise "#{name} is missing the following required keys: #{missing.join(',')}" unless missing.empty?

        extraneous = specified_keys - required
        raise "#{name} includes invalid keys: #{extraneous.join(',')}" unless extraneous.empty?
      end

      def self.validate_mof_type(mof_type, embeddedinstance_name, name, value)
        should_be_array = mof_type[:type].end_with?('[]')
        if !should_be_array && value.is_a?(Array)
          raise "#{name} of #{embeddedinstance_name} should not be an Array: invalid value #{value}"
        end

        case mof_type[:type]
        when 'bool', 'boolean'
          munge_boolean(value.to_s)
        when 'uint8', 'uint16', 'uint32', 'uint64',
          'uint8[]', 'uint16[]', 'uint32[]', 'uint64[]',
          'int8', 'int16', 'int32', 'int64',
          'sint8', 'sint16', 'sint32', 'sint64',
          'int8[]', 'int16[]', 'int32[]', 'int64[]',
          'sint8[]', 'sint16[]', 'sint32[]', 'sint64[]'

          width = mof_type[:type].gsub(%r{[^\d]}, '').to_i

          # signed values reserve 1 bit for sign
          # rubocop:disable Security/Eval
          signed = !mof_type[:type].start_with?('u')
          min = (signed ? eval('-0b' + '1' * (width - 1)) - 1 : 0)
          max = (signed ? eval('0b' + '1' * (width - 1)) : eval('0b' + '1' * width))
          # rubocop:enable Security/Eval

          # munging has not yet occurred to convert these values prior to validation
          values = Array(value)
          unless values.all? { |v| v.is_a?(Numeric) || v =~ %r{^[-+]?\d+$} }
            raise "#{name} of #{embeddedinstance_name} is not a numeric value: invalid value #{value}"
          end

          values = values.map { |v| v.to_i }
          unless values.all? { |v| (min <= v) && (v <= max) }
            raise "#{name} of #{embeddedinstance_name} is outside the valid range of values: #{min} to #{max}: invalid value #{value}"
          end

          if mof_type[:values] && !values.all? { |v| mof_type[:values].include?(v) }
            raise "Invalid value #{value}. Valid values are #{mof_type[:values].join(', ')}"
          end
        when 'string', 'string[]'
          values = Array(value)
          unless values.all? { |v| v.is_a? String }
            raise "#{name} of #{embeddedinstance_name} should be an Array: invalid value #{value}"
          end
          if mof_type[:values] && !values.all? { |v| mof_type[:values].any? { |allowed_v| v.casecmp(allowed_v).zero? } }
            raise "Invalid value #{value}. Valid values are #{mof_type[:values].join(', ')}"
          end
        when 'MSFT_Credential', 'MSFT_Credential[]'
          validate_MSFT_Credential(name, value)
        when 'MSFT_KeyValuePair'
          unless (value.is_a? Hash) && (value.length == 1)
            raise "#{name} of #{embeddedinstance_name} should be a Hash with 1 item: invalid value #{value}"
          end
        when 'MSFT_KeyValuePair[]'
          unless value.is_a? Hash
            raise "#{name} of #{embeddedinstance_name} should be a Hash: invalid value #{value}"
          end
        else
          validation_method = "validate_#{mof_type[:type]}"
          unless respond_to?(validation_method)
            raise "Unable to validate property #{name} (type #{mof_type[:type]}) of #{embeddedinstance_name}: value #{value}"
          end
          send(validation_method, name, value)
          # if respond_to?(validation_method)
          #   send(validation_method, name, value)
          # else
          #   raise "Unable to validate property #{name} (type #{mof_type[:type]}) of #{embeddedinstance_name}: value #{value}"
          # end
        end
      end

      def self.should_add_reboot_relationship(resource, reboot_resource, pending_relationships)
        return false unless reboot_resource

        # edge exists in graph from previous resource, so don't add
        return false if resource.catalog.relationship_graph.edge?(resource, reboot_resource) ||
                        # newly formed edges not yet in catalog include the edge, so don't add
                        pending_relationships.any? { |e| e.source == resource && e.target == reboot_resource }

        true
      end

      # if an edge already exists from Reboot[dsc_reboot] to this resource
      # Puppet will recognize the cyclic dependency automatically and fail with:
      # Error: Failed to apply catalog: Found 1 dependency cycle:
      # (Dsc_file[foo] => Reboot[dsc_reboot] => Dsc_file[foo])
      def self.ensure_reboot_relationship(resource, pending_relationships)
        reboot_resource = resource.catalog.resource(:reboot, 'dsc_reboot')

        # do nothing if no Reboot[dsc_reboot] or already an edge from resource to it
        if should_add_reboot_relationship(resource, reboot_resource, pending_relationships)
          # otherwise build resource[name] => Reboot[dsc_reboot]
          edge = Puppet::Relationship.new(resource, reboot_resource, callback: :refresh, event: :ALL_EVENTS)
          pending_relationships << edge
        end

        pending_relationships
      end
    end
  end
end
