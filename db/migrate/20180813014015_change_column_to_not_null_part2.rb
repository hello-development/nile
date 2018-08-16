class ChangeColumnToNotNullPart2 < ActiveRecord::Migration[5.2]
def up
  	change_column :addresses, :postal_code,:string, null: false
    change_column :addresses, :address,:text, null: false
    change_column :addresses, :user_id,:integer, null: false
    change_column :disks, :disk_number,:integer, null: false
    change_column :disks, :item_id,:integer, null: false
    change_column :items, :item_name,:string, null: false
    change_column :items, :artist_id,:string, null: false
    change_column :items, :price,:integer, null: false
    change_column :items, :inventory,:integer, default: 0, null: false
    change_column :items, :item_image_id,:string, null: false
    change_column :songs, :disk_id,:integer, null: false

  end

  def down
    change_column :addresses, :postal_code,:string, null: true
    change_column :addresses, :address,:text, null: true
    change_column :addresses, :user_id,:integer, null: true
    change_column :disks, :disk_number,:integer, null: true
    change_column :disks, :item_id,:integer, null: true
    change_column :items, :item_name,:string, null: true
    change_column :items, :artist_id,:string, null: true
    change_column :items, :price,:integer, null: true
    change_column :items, :inventory,:integer, null:true
    change_column :items, :item_image_id,:string, null: true
    change_column :songs, :disk_id,:integer, null: true
  end
end
