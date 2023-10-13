require 'rails_helper'

module Queries
  RSpec.describe Task, type: :request do
    fixtures :projects
    fixtures :sections
    fixtures :tasks

    describe '.resolve' do
      it 'returns task for provided id' do
        project = projects(:project_1)
        section = sections(:section_1)
        tasks = tasks(:task_1)

        post '/graphql', params: { query: query(id: section.id) }

        json = JSON.parse(response.body)
        data = json['data']['task']

        expect(data).to include(
          'id'          => "1",
          'title'   => "Earth",
          "sectionId" => 1,
          "completed" => false,
          "description" => "Voluptas dolorum qui. Consequatur sed soluta. Consequuntur consectetur non."
        )
      end
    end

    def query(id:)
      <<~GQL
        query {
          task(id: #{id}) {
            id
            title
            sectionId
            completed
            description
          }
        }
      GQL
    end
  end
end
