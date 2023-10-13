module Mutations
  class UpdateTask < BaseUpdateMutation
    mutation_field

    argument :id, Integer, required: true
    argument :title, String, required: false
    argument :text, String, required: false
    argument :completed, Boolean, required: false
    argument :due_date, String, required: false
    argument :description, String, required: false
  end
end
