module Mutations
  class DeleteTask < BaseDeleteMutation
    mutation_field

    argument :id, ID, required: true
  end
end
