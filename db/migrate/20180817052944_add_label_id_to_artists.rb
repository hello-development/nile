class AddLabelIdToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :label_id, :integer
  end
end
