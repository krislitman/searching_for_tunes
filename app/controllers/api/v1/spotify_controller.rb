class Api::V1::SpotifyController < ApplicationController

  def new_releases
    releases = SpotifyFacade.new(:new_releases)
    render json: { 'message': { 'Request': 'Success' }}, status: :ok
  end
end
