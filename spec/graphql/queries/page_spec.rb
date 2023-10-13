require 'rails_helper'

module Queries
  RSpec.describe Page, type: :request do
    fixtures :projects
    fixtures :notes
    fixtures :pages

    describe '.resolve' do
      it 'returns pages for provided id' do
        project = projects(:project_1)
        note = notes(:note_1)
        page = pages(:page_1)

        post '/graphql', params: { query: query(id: page.id) }

        json = JSON.parse(response.body)
        data = json['data']['page']

        expect(data).to include(
          'id'          => "1",
          'title'   => "Mars",
          "noteId" => 1
        )
      end
    end

    def query(id:)
      <<~GQL
        query {
          page(id: #{id}) {
            id
            title
            noteId
          }
        }
      GQL
    end
  end
end
