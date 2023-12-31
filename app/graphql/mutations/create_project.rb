module Mutations
  class CreateProject < BaseCreateMutation
    mutation_field

    argument :title, String, required: true
    argument :description, String, required: false
  end
end
