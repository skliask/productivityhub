module Mutations
  class BaseUpdateMutation < BaseMutation
    null true

    def self.mutation_field(field_name = nil, type_name: nil)
      @record_field_name = field_name&.to_sym
      @entity_type_name = type_name
      field(record_field_name, entity_type, null: true)
    end

    def self.record_field_name
      @record_field_name ||= entity_klass_name.to_s.underscore.to_sym
    end

    def self.entity_klass_name
      @entity_klass_name ||= to_s.demodulize.gsub('Update', '')
    end

    def self.entity_type_name
      @entity_type_name ||= entity_klass_name
    end

    def self.entity_type
      @entity_type ||= "Types::#{entity_type_name}Type".constantize
    end

    def self.model_klass
      @model_klass ||= entity_klass_name.constantize
    end

    def find_record(id:, **_args)
      self.class.model_klass.find_by(id: id)
    end

    def after_update(_record)
      true
    end

    def resolve(**args)
      ActiveRecord::Base.transaction do
        record = find_record(**args)&.lock!

        if record&.update(args)
          after_update(record)

          { success: true, self.class.record_field_name => record, errors: [] }
        else
          { success: false, self.class.record_field_name => nil, errors: format_errors(record) }
        end
      end
    end
  end
end
