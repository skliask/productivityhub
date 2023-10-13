module Mutations
  class DeletePage < BaseDeleteMutation
    mutation_field

    argument :id, ID, required: true
  end
end
