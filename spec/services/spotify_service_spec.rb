require 'rails_helper'

RSpec.describe "Spotify API call" do
  describe "Test OAUTH and make sure we receive correct response" do
    it "Should return as expected" do
      VCR.use_cassette("services/spotify_service_spec") do
        response = SpotifyService.new_releases
        
        expect(response).to be_a(Hash)
      end
    end
  end
end
