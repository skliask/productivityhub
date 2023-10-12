module Mutations
  class UpdateProject < BaseUpdateMutation
    mutation_field

    argument :id, Integer, required: true
    argument :title, String, required: true
    argument :description, String, required: false
  end
end
