require 'rails_helper'

module Queries
  RSpec.describe Block, type: :request do
    fixtures :projects
    fixtures :notes
    fixtures :blocks
    fixtures :pages

    describe '.resolve' do
      it 'returns block for provided id' do
        project = projects(:project_1)
        note = notes(:note_1)
        page = pages(:page_1)
        block = blocks(:block_1)

        post '/graphql', params: { query: query(id: block.id) }

        json = JSON.parse(response.body)
        data = json['data']['block']

        expect(data).to include(
          'id'          => "1",
          'text'   => "Quaerat pariatur aut eius.",
          "pageId" => 1
        )
      end
    end

    def query(id:)
      <<~GQL
        query {
          block(id: #{id}) {
            id
            text
            pageId
          }
        }
      GQL
    end
  end
end
