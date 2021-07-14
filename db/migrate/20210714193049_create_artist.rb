class CreateArtist < ActiveRecord::Migration[6.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :spotify_id
      t.string :artist_type

      t.timestamps
    end
  end
end
