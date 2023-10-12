# frozen_string_literal: true

module Types
  class TaskType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :completed, Boolean
    field :due_date, GraphQL::Types::ISO8601DateTime
    field :description, String
    field :text, String
    field :section_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :section, Types::SectionType
  end
end
