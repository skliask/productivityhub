require 'rails_helper'

module Queries
  RSpec.describe Project, type: :request do
    fixtures :projects

    describe '.resolve' do
      it 'returns project for provided id' do
        # project = create(:project, title: 'Project')
        project = projects(:project_1)

        post '/graphql', params: { query: query(id: project.id) }

        json = JSON.parse(response.body)
        data = json['data']['project']

        expect(data).to include(
          'id'          => "1",
          'title'   => 'Lagoon Nebula'
        )
      end
    end

    def query(id:)
      <<~GQL
        query {
          project(id: #{id}) {
            id
            title
          }
        }
      GQL
    end
  end
end
