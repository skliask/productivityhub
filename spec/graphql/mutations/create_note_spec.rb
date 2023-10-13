require 'rails_helper'

module Mutations
  RSpec.describe CreateNote, type: :request do
    fixtures :projects

    describe '.resolve' do
      it 'creates a note' do
        project = projects(:project_1)

        expect do
          post '/graphql', params: { query: query(project_id: project.id) }
        end.to change { Note.count }.by(1)
      end

      it 'returns a note' do
        project = projects(:project_1)

        post '/graphql', params: { query: query(project_id: project.id) }
        json = JSON.parse(response.body)
        data = json['data']['createNote']

        expect(data).to include(
          "success" => true,
          "note" => {
            'title' => 'Yay',
            "projectId" => 1
          }
        )
      end
    end

    def query(project_id:)
      <<~GQL
        mutation{
          createNote(input: {projectId: 1, title: "Yay"}) {
            success
            note{
              title
              projectId
            }
          }
        }
      GQL
    end
  end
end
