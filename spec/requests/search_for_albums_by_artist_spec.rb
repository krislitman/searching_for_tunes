require "rails_helper"

RSpec.describe "Search Albums by Artist Name", type: :request do
  scenario "Search needs an artist param to work" do
    VCR.use_cassette("requests/search/albums_by_artist_name") do
      get '/api/v1/albums_by_artist'

      expect(response).not_to be_successful
    end
  end


end
