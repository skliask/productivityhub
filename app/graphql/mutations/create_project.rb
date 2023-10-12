module Mutations
  class CreateProject < BaseMutation
    # TODO: define return fields
    field :project, Types::ProjectType, null: true
    field :errors, [String], null: false
    field :sucess, Boolean, null: false

    # TODO: define arguments
    argument :title, String, required: true
    argument :description, String, required: false

    def resolve(title:, description: nil)
      record = Project.new(
        title: title,
        description: description
      )

      if record.save
        { success: true, project: record, errors: [] }
      else
        { success: false, project: nil, errors: record.errors.full_messages }
      end
    end
  end
end
