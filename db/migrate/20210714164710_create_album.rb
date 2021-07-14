class CreateAlbum < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :name
      t.string :spotify_id
      t.string :release_date
      t.string :album_type

      t.timestamps
    end
  end
end
