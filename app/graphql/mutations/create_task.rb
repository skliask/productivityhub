module Mutations
  class CreateTask < BaseCreateMutation
    mutation_field

    argument :section_id, Integer, required: true
    argument :title, String, required: true
    argument :text, String, required: false
    argument :completed, Boolean, required: false
    argument :due_date, String, required: false
    argument :description, String, required: false
  end
end
