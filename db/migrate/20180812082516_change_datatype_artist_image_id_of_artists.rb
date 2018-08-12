class ChangeDatatypeArtistImageIdOfArtists < ActiveRecord::Migration[5.2]
  def change
  	change_column :artists, :artist_image_id, :text
  end
end
