class SpotifyFacade
  attr_reader :new_releases

  def initialize(input)
    @route = find_route(input)
    @new_releases = new_releases
  end

  def find_route(input)
    case
    when input == :new_releases
      new_releases_route
    end
  end

  def new_releases_route
    json_data = SpotifyService.new_releases
    json_data[:albums][:items].each do |release|
      Album.create(
        name: release[:name],
        spotify_id: release[:id],
        release_date: release[:release_date],
        album_type: release[:type]
      )
    end
  end
end
