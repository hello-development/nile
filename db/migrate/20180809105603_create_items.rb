class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

    	t.string :item_name
        t.index :item_name
    	t.string :artist_id
    	t.integer :genre_id
    	t.integer :price
        t.index :price
    	t.integer :inventory
    	t.text :item_contents
    	t.string :label_id
    	t.string :item_image_id
    	t.datetime :created_at
    	t.datetime :updated_at
    	t.datetime :deleted_at
      t.timestamps
    end
  end
end
