class Album < ApplicationRecord
  validates :name, presence: true
  validates :spotify_id, presence: true, uniqueness: true
  validates :release_date, presence: true
  validates :album_type, presence: true

  has_many :artist_albums
end
