module Mutations
  class DeleteSection < BaseDeleteMutation
    mutation_field

    argument :id, ID, required: true
  end
end
