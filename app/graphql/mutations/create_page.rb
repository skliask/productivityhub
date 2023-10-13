module Mutations
  class CreatePage < BaseCreateMutation
    mutation_field

    argument :note_id, Integer, required: true
    argument :title, String, required: true
  end
end
