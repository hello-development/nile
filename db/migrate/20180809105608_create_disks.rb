class CreateDisks < ActiveRecord::Migration[5.2]
  def change
    create_table :disks do |t|
    	t.integer :disk_number
    	t.integer :item_id
    	t.datetime :created_at
    	t.datetime :updated_at
    	t.datetime :deleted_at
      t.timestamps
    end
  end
end
