module Mutations
  class BaseCreateMutation < BaseMutation
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
      @entity_klass_name ||= to_s.demodulize.gsub('Create', '')
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

    def after_create(_record)
      true
    end

    def create_args(**args)
      binding.pry
      args
    end

    def resolve(**args)
      record = self.class.model_klass.new(args)

      if record.save
        after_create(record)

        { success: true, self.class.record_field_name => record, errors: [] }
      else
        { success: false, self.class.record_field_name => nil, errors: format_errors(record) }
      end
    rescue ActiveRecord::RecordNotUnique
      record_not_unique_error
    end

    def record_not_unique_error
      {
        success: false,
        errors: [
          {
            code: 'record-not-unique',
            path: [self.class.name.demodulize.camelize(:lower)],
            message: 'record not unique'
          }
        ],
        self.class.record_field_name => nil
      }
    end
  end
end
