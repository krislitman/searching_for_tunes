class Api::V1::SpotifyController < ApplicationController

  def new_releases
    spotify = SpotifyFacade.new({type: :new_releases, page: params[:page] ? params[:page] : 1})
    render json: AlbumSerializer.new(spotify.new_releases), status: :ok
  end
end
