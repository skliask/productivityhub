# frozen_string_literal: true

module Types
  class BlockType < Types::BaseObject
    field :id, ID, null: false
    field :text, String
    field :block_type, Integer
    field :page_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
