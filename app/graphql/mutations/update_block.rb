module Mutations
  class UpdateBlock < BaseUpdateMutation
    mutation_field

    argument :id, Integer, required: true
    argument :text, String, required: true
    argument :block_type, Integer, required: false
  end
end
