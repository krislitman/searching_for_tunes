require 'rails_helper'

RSpec.describe "/new_releases", type: :request do
  describe "Endpoint returns 20 new release album objects" do
    it "Should return as expected" do
      VCR.use_cassette("requests/new_releases") do
        get '/api/v1/new_releases'

        expect(response).to be_successful
        expect(response.status).to eq(200)
      end
    end
  end
end
