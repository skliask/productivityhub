require 'rails_helper'

module Queries
  RSpec.describe Note, type: :request do
    fixtures :projects
    fixtures :notes

    describe '.resolve' do
      it 'returns notes for provided id' do
        project = projects(:project_1)
        note = notes(:note_1)

        post '/graphql', params: { query: query(id: note.id) }

        json = JSON.parse(response.body)
        data = json['data']['note']

        expect(data).to include(
          'id'          => "1",
          'title'   => "Andromeda",
          "projectId" => 1
        )
      end
    end

    def query(id:)
      <<~GQL
        query {
          note(id: #{id}) {
            id
            title
            projectId
          }
        }
      GQL
    end
  end
end
