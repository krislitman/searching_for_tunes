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

    it "Should return another 20 albums for page 2" do
      VCR.use_cassette("requests/new_releases_2") do
        get '/api/v1/new_releases'

        attributes_one = JSON.parse(response.body, symbolize_names: true)

        attributes = {'page': 2}
        get '/api/v1/new_releases', params: attributes

        attributes_two = JSON.parse(response.body, symbolize_names: true)

        expect(attributes_one[:data].length).to eq(20)
        expect(attributes_two[:data].length).to eq(20)
        expect(attributes_one[:data][0][:attributes][:name]).not_to eq(attributes_two[:data][0][:attributes][:name])
      end
    end

    it "Page 3 should return only 10 objects" do
      VCR.use_cassette("requests/new_releases_3") do
        attributes = {'page': 3}
        get '/api/v1/new_releases', params: attributes

        attributes = JSON.parse(response.body, symbolize_names: true)

        expect(attributes[:data].length).to eq(10)
      end
    end
  end
end
