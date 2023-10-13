require 'rails_helper'

module Mutations
  RSpec.describe CreateSection, type: :request do
    fixtures :projects

    describe '.resolve' do
      it 'creates a section' do
        project = projects(:project_1)

        expect do
          post '/graphql', params: { query: query(project_id: project.id) }
        end.to change { Section.count }.by(1)
      end

      it 'returns a section' do
        project = projects(:project_1)

        post '/graphql', params: { query: query(project_id: project.id) }
        json = JSON.parse(response.body)
        data = json['data']['createSection']

        expect(data).to include(
          "success" => true,
          "section" => {
            'title' => 'Yay',
            "projectId" => 1
          }
        )
      end
    end

    def query(project_id:)
      <<~GQL
        mutation{
          createSection(input: {projectId: 1, title: "Yay"}) {
            success
            section{
              title
              projectId
            }
          }
        }
      GQL
    end
  end
end
