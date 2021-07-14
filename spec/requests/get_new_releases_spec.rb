require 'rails_helper'

RSpec.describe "/new_releases", type: :request do
  before :each do
    Album.destroy_all
  end

  describe "Endpoint returns 20 new release album objects" do
    it "Should return as expected" do
      VCR.use_cassette("requests/new_releases") do
        get '/api/v1/new_releases'

        attributes = JSON.parse(response.body, symbolize_names: true)

        expect(response).to be_successful
        expect(response.status).to eq(200)
        expect(attributes[:data].length).to eq(20)
      end
    end
  end
end
