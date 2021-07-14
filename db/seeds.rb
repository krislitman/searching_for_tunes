# Clean Database
Artist.destroy_all
Album.destroy_all
ArtistAlbum.destroy_all

# Create Albums
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

# Create Artist Albums
json_data = SpotifyService.new_releases
json_data[:albums][:items].each do |release|
  album = Album.find_by(spotify_id: release[:id])
  release[:artists].each do |artist|
    creator = Artist.find_by(spotify_id: artist[:id])
    if ArtistAlbum.find_by(artist_id: creator.id, album_id: album.id)
      REDIS.get("artist album #{artist[:id]} #{album.id}")
    else
      ArtistAlbum.create(
        artist_id: creator.id,
        album_id: album.id
      )
      REDIS.set("artist album #{artist[:id]} #{album.id}", true)
    end
  end
end


