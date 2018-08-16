class ChangeDatatypeArtistIdAndLabelIdOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :artist_id, :integer
    change_column :items, :label_id, :integer
  end
end
