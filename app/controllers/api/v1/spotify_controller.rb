class Api::V1::SpotifyController < ApplicationController

  def new_releases
    spotify = SpotifyFacade.new(:new_releases)
    render json: AlbumSerializer.new(spotify.new_releases), status: :ok
  end
end
