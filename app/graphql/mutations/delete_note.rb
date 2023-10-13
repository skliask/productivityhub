module Mutations
  class DeleteNote < BaseDeleteMutation
    mutation_field

    argument :id, ID, required: true
  end
end
