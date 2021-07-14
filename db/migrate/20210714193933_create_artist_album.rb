class CreateArtistAlbum < ActiveRecord::Migration[6.1]
  def change
    create_table :artist_albums do |t|
      t.references :artist, null: false, foreign_key: true
      t.references :album, null: false, foreign_key: true

      t.timestamps
    end
  end
end
