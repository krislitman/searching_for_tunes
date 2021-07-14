class AlbumSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :spotify_id, :release_date, :album_type
end
