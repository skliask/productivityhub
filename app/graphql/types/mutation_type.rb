module Types
  class MutationType < Types::BaseObject
    field :delete_project, mutation: Mutations::DeleteProject
    field :base_delete_mutation, mutation: Mutations::BaseDeleteMutation
    field :base_update_mutation, mutation: Mutations::BaseUpdateMutation
    field :base_create_mutation, mutation: Mutations::BaseCreateMutation
    field :update_project, mutation: Mutations::UpdateProject
    field :create_project, mutation: Mutations::CreateProject
  end
end
