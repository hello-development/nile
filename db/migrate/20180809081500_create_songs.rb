class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.timestamps
      t.string :song_name
      t.index :song_name
      t.integer :song_order
      t.integer :disk_id
      t.datetime :deleted_at, null: false
    end
  end
end
