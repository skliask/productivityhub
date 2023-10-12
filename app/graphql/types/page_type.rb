# frozen_string_literal: true

module Types
  class PageType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :note_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :note, Types::NoteType
    field :blocks, [Types::BlockType]
    field :full_text, String, null: true

    def full_text
      object.blocks.pluck(:text).join
    end
  end
end
