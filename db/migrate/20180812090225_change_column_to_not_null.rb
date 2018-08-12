class ChangeColumnToNotNull < ActiveRecord::Migration[5.2]
  def up
  	change_column :artists, :deleted_at,:datetime, null: true
    change_column :artists, :artist_name,:string, null: false
    change_column :songs, :deleted_at,:datetime, null: true
    change_column :songs, :song_name,:string, null: false
    change_column :songs, :song_order,:integer, null: false

  end

  def down
    change_column :artists, :deleted_at,:datetime, null: false
    change_column :artists, :artist_name,:string, null: true
    change_column :songs, :deleted_at,:datetime, null: false
    change_column :songs, :song_name,:string, null: true
    change_column :songs, :song_order,:integer, null: true
  end


end
