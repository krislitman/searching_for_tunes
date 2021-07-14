require "rails_helper"

RSpec.describe "Search Albums by Artist Name", type: :request do
  scenario "Search needs an artist param to work" do
    VCR.use_cassette("requests/search/albums_by_artist_name") do
      get '/api/v1/albums_by_artist'

      data = JSON.parse(response.body, symbolize_names: true)
      expect(response).not_to be_successful
      expect(response.status).to eq(400)
      expect(data[:error]).to eq("Missing artist parameter")
    end
  end

  scenario "Complete Search works" do
    VCR.use_cassette("requests/search/albums_by_artist_name_two") do
      params = { artist: "Justin Bieber" }
      get '/api/v1/albums_by_artist', params: params

      data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(data[:data][0][:type]).to eq("album")
      expect(data[:data][0][:attributes][:name]).to eq("Stay (with Justin Bieber)")
    end
  end

  scenario "Partial Search works" do
    VCR.use_cassette("requests/search/albums_by_artist_name_three") do
      params = { artist: "ieber" }
      get '/api/v1/albums_by_artist', params: params

      data = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(data[:data][0][:type]).to eq("album")
      expect(data[:data][0][:attributes][:name]).to eq("Stay (with Justin Bieber)")
    end
  end
end
