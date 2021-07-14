class Api::V1::SearchController < ApplicationController

  def albums_by_artist
    if !params[:artist]
      render json: {error: "Missing artist parameter"}, status: :bad_request
    else
      albums = Album.by_artist(params[:artist])
      render json: AlbumSerializer.new(albums), status: :ok
    end
  end
end
