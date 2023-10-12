module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    field :success, Boolean, null: false, description: 'Flag indicating if the mutation was performed'
    field :errors, [Types::MutationErrorType], null: false, description: 'List of errors (if any) that occurred during the mutation'

    def format_errors(record)
      unless record
        return [{
          path: ['record'],
          message: 'record was not found',
          code: :not_found
        }]
      end

      error_list = record.errors.attribute_names.map do |a|
        [record.errors.details[a].map { |e| e[:error] }, record.errors[a]]
          .transpose
          .map do |e|
            {
              attribute: a.to_s.camelize(:lower),
              code: format_error_code(a, e[0]),
              message: [a.to_s, e[1]].join(' ')
            }
          end
      end.flatten

      error_list.map do |error|
        path = ['attributes', error[:attribute]]

        {
          path: path,
          message: error[:message],
          code: error[:code]
        }
      end
    end

    def format_error_code(attribute, error)
      [attribute, error].join(' ').dasherize.parameterize
    end
  end
end
