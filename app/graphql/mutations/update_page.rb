module Mutations
  class UpdatePage < BaseUpdateMutation
    mutation_field

    argument :id, Integer, required: true
    argument :title, String, required: true
  end
end
