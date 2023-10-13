module Mutations
  class DeleteBlock < BaseDeleteMutation
    mutation_field

    argument :id, ID, required: true
  end
end
