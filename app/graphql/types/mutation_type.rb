module Types
  class MutationType < Types::BaseObject
    field :delete_block, mutation: Mutations::DeleteBlock
    field :update_block, mutation: Mutations::UpdateBlock
    field :create_block, mutation: Mutations::CreateBlock
    field :delete_page, mutation: Mutations::DeletePage
    field :update_page, mutation: Mutations::UpdatePage
    field :create_page, mutation: Mutations::CreatePage
    field :delete_note, mutation: Mutations::DeleteNote
    field :update_note, mutation: Mutations::UpdateNote
    field :create_note, mutation: Mutations::CreateNote
    field :delete_task, mutation: Mutations::DeleteTask
    field :update_task, mutation: Mutations::UpdateTask
    field :create_task, mutation: Mutations::CreateTask
    field :delete_section, mutation: Mutations::DeleteSection
    field :update_section, mutation: Mutations::UpdateSection
    field :create_section, mutation: Mutations::CreateSection
    field :delete_project, mutation: Mutations::DeleteProject
    field :base_delete_mutation, mutation: Mutations::BaseDeleteMutation
    field :base_update_mutation, mutation: Mutations::BaseUpdateMutation
    field :base_create_mutation, mutation: Mutations::BaseCreateMutation
    field :update_project, mutation: Mutations::UpdateProject
    field :create_project, mutation: Mutations::CreateProject
  end
end
