# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create Albums
Album.destroy_all
json_data = SpotifyService.new_releases
json_data[:albums][:items].each do |release|
  if Album.find_by(spotify_id: release[:id])
    REDIS.get("album #{release[:id]}")
  else
    album = Album.create(
      name: release[:name],
      spotify_id: release[:id],
      release_date: release[:release_date],
      album_type: release[:type]
    )
    REDIS.set("album #{album.spotify_id}", album)
  end
end

# Create Artists
json_data = SpotifyService.new_releases
json_data[:albums][:items].each do |release|
  release[:artists].each do |artist|
    if Artist.find_by(spotify_id: artist[:id])
      REDIS.get("artist #{artist[:id]}")
    else
      artist = Artist.create(
        name: artist[:name],
        spotify_id: artist[:id],
        artist_type: artist[:type]
      )
      REDIS.set("artist #{artist.spotify_id}", artist)
    end
  end
end
