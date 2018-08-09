class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|

      t.timestamps
      t.string :artist_name
      t.index :artist_name
      t.string :artist_image_id
      t.text :artist_contents, null: false
      t.datetime :deleted_at, null: false
    end
  end
end
