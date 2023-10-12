module Mutations
  class DeleteProject < BaseDeleteMutation
    mutation_field

    argument :id, ID, required: true
  end
end
