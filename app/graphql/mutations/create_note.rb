module Mutations
  class CreateNote < BaseCreateMutation
    mutation_field

    argument :project_id, Integer, required: true
    argument :title, String, required: true
  end
end
