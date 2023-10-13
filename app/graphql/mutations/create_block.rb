module Mutations
  class CreateBlock < BaseCreateMutation
    mutation_field

    argument :page_id, Integer, required: true
    argument :text, String, required: true
    argument :block_type, Integer, required: false
  end
end
