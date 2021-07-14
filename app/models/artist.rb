class Artist < ApplicationRecord
  validates :name, presence: true
  validates :spotify_id, presence: true, uniqueness: true
  validates :artist_type, presence: true

  has_many :artist_albums
  has_many :albums, through: :artist_albums
end
