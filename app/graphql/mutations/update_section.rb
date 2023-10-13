module Mutations
  class UpdateSection < BaseUpdateMutation
    mutation_field

    argument :id, Integer, required: true
    argument :title, String, required: true
  end
end
