module Mutations
  class UpdateNote < BaseUpdateMutation
    mutation_field

    argument :id, Integer, required: true
    argument :title, String, required: true
  end
end
